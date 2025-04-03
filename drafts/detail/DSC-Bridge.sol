// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// --- Interface Imports ---
// These interfaces would define the structure for interacting with
// external ZKP verifier contracts or libraries.
// In a real deployment, these would point to actual verified implementations.
// import "./interfaces/IPoIIVerifier.sol"; // Interface for the PoII ZKP Verifier
// import "./interfaces/IInteractionAuthenticator.sol"; // Interface for potential interaction-specific ZK auth

// --- Library Imports ---
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol"; // Example utility

/**
 * @title DSCOracleBridge
 * @dev The authoritative Digital Mind Foundation (DMF) Oracle Bridge.
 *      Provides the sole cryptographically secured interface for registered
 *      Mental Smart Chains (MSCs) to interact with verified physical world endpoints.
 *      Enforces Proof of Information Integration (PoII) validity via Zero-Knowledge Proofs
 *      and manages access control and fee collection in International Carbon Coin (ICC).
 *      Interaction requests are authorized based on valid PoII status and fee payment.
 */
contract DSCOracleBridge is Ownable, ReentrancyGuard {
    // --- Structs ---

    // Represents the ZK proof components for PoII verification
    // In a real system, the structure might be specific to the proving system (e.g., Groth16, PLONK)
    struct ZKProof {
        bytes proof; // The core proof data
        uint256[] publicInputs; // Public inputs the proof attests to (e.g., MSC state hash, timestamp)
    }

    // Stores registration and latest verified PoII status for an MSC
    struct MSCInfo {
        bool isRegistered;
        bytes32 verificationKeyHash; // Hash of the ZKP verification key associated with this MSC type/version
        uint256 lastValidPoIITimestamp; // Timestamp derived from the last successfully verified PoII proof
        bytes32 lastProofCommitment; // Commitment (e.g., hash) to the last valid proof data for auditability
    }

    // --- State Variables ---

    IERC20 public immutable iccToken; // The International Carbon Coin (ERC20) contract
    uint256 public oracleFeeICC; // Fee in ICC base units for using the oracle bridge
    uint256 public poiiValidityDuration; // Duration (seconds) a verified PoII status remains valid

    // Placeholder for the address of the deployed PoII ZKP Verifier contract
    // address public poiiVerifierAddress; // Example: IPoIIVerifier public poiiVerifier;

    mapping(address => MSCInfo) public mscRegistry; // MSC address -> Status and PoII info

    // --- Events ---

    event MSCRegistered(
        address indexed mscAddress,
        bytes32 verificationKeyHash
    );
    event MSCUnregistered(address indexed mscAddress);
    event PoIIProofVerified(
        address indexed mscAddress,
        uint256 validUntilTimestamp,
        bytes32 proofCommitment
    );
    event PoIIUpdateFailed(address indexed mscAddress, string reason);
    event OracleFeeUpdated(uint256 newFee);
    event PoIIValidityDurationUpdated(uint256 newDuration);
    // event PoIIVerifierUpdated(address newVerifierAddress); // Example event
    event InteractionAuthorized(
        address indexed mscAddress,
        bytes interactionDataHash,
        uint256 feePaid
    );
    event InteractionDenied(
        address indexed mscAddress,
        bytes interactionDataHash,
        string reason
    );

    // --- Errors ---

    error MSCNotRegistered(address mscAddress);
    error MSCAlreadyRegistered(address mscAddress);
    error PoIINotValidOrExpired(
        address mscAddress,
        uint256 lastValid,
        uint256 currentBlockTimestamp
    );
    error InsufficientICCAllowance(
        address owner,
        address spender,
        uint256 required,
        uint256 allowed
    );
    error InsufficientICCBalance(
        address account,
        uint256 required,
        uint256 balance
    );
    error TransferFailed();
    error InvalidProofData(string reason); // Error for ZKP related issues
    error VerificationFailed(string reason); // Error from the ZKP verifier contract

    // --- Constructor ---

    /**
     * @param _iccTokenAddress Address of the ICC ERC20 token.
     * @param _initialFee Initial oracle usage fee in ICC base units.
     * @param _initialPoiiValidityDuration Initial PoII validity duration (seconds).
     * @param _initialOwner The address designated as the DMF operator.
     * @param _poiiVerifier Address of the deployed PoII ZKP Verifier contract (placeholder).
     */
    constructor(
        address _iccTokenAddress,
        uint256 _initialFee,
        uint256 _initialPoiiValidityDuration,
        address _initialOwner
    )
        // address _poiiVerifier // Pass verifier address during deployment
        Ownable(_initialOwner)
    {
        require(
            _iccTokenAddress != address(0),
            "ICC token address cannot be zero"
        );
        // require(_poiiVerifier != address(0), "PoII verifier address cannot be zero"); // Uncomment when using real verifier

        iccToken = IERC20(_iccTokenAddress);
        oracleFeeICC = _initialFee;
        poiiValidityDuration = _initialPoiiValidityDuration;
        // poiiVerifier = IPoIIVerifier(_poiiVerifier); // Store verifier instance

        emit OracleFeeUpdated(_initialFee);
        emit PoIIValidityDurationUpdated(_initialPoiiValidityDuration);
        // emit PoIIVerifierUpdated(_poiiVerifier);
    }

    // --- DMF (Owner) Functions ---

    /**
     * @dev Registers a new MSC, associating it with a specific ZKP verification key hash.
     * @param _mscAddress The address representing the MSC instance.
     * @param _verificationKeyHash Hash of the verification key for the PoII proofs this MSC will submit.
     */
    function registerMSC(
        address _mscAddress,
        bytes32 _verificationKeyHash
    ) external onlyOwner {
        if (mscRegistry[_mscAddress].isRegistered) {
            revert MSCAlreadyRegistered(_mscAddress);
        }
        require(
            _verificationKeyHash != bytes32(0),
            "Verification key hash cannot be zero"
        );

        mscRegistry[_mscAddress] = MSCInfo({
            isRegistered: true,
            verificationKeyHash: _verificationKeyHash,
            lastValidPoIITimestamp: 0, // Requires explicit PoII verification
            lastProofCommitment: bytes32(0)
        });
        emit MSCRegistered(_mscAddress, _verificationKeyHash);
    }

    /**
     * @dev Unregisters an MSC address, revoking its access.
     * @param _mscAddress The address representing the MSC instance.
     */
    function unregisterMSC(address _mscAddress) external onlyOwner {
        if (!mscRegistry[_mscAddress].isRegistered) {
            revert MSCNotRegistered(_mscAddress);
        }
        delete mscRegistry[_mscAddress];
        emit MSCUnregistered(_mscAddress);
    }

    /**
     * @dev Updates the PoII status for an MSC by verifying a submitted ZK proof.
     *      This function would typically call an external ZKP verifier contract.
     * @param _mscAddress The MSC address submitting the proof.
     * @param _proof The ZKProof struct containing proof data and public inputs.
     * @param _proofTimestamp The timestamp asserted by the proof's public inputs.
     */
    function updatePoIIStatusWithProof(
        address _mscAddress,
        ZKProof calldata _proof,
        uint256 _proofTimestamp // Should be part of _proof.publicInputs ideally
    ) external onlyOwner {
        // Or potentially callable by anyone if proof is self-authenticating
        MSCInfo storage info = mscRegistry[_mscAddress];
        if (!info.isRegistered) {
            emit PoIIUpdateFailed(_mscAddress, "MSC_NOT_REGISTERED");
            revert MSCNotRegistered(_mscAddress);
        }

        // --- ZKP Verification (Simulated) ---
        // 1. Basic sanity checks on proof data (replace with actual verification call)
        if (_proof.proof.length == 0 || _proof.publicInputs.length == 0) {
            emit PoIIUpdateFailed(_mscAddress, "INVALID_PROOF_DATA");
            revert InvalidProofData("Proof or public inputs empty");
        }
        // 2. Construct expected public inputs (example: hash of MSC state + timestamp)
        // bytes32 expectedInputHash = keccak256(abi.encodePacked(info.verificationKeyHash, _proofTimestamp)); // Example construction
        // 3. Call the external verifier contract (replace simulation)
        // bool isValid = poiiVerifier.verifyProof(info.verificationKeyHash, _proof.publicInputs, _proof.proof);
        bool isValid = true; // *** SIMULATION: Assume proof is valid for this mock ***
        // In reality, this requires significant gas and a deployed verifier.
        // We also need to check that _proofTimestamp matches a value within _proof.publicInputs

        if (!isValid) {
            emit PoIIUpdateFailed(_mscAddress, "VERIFICATION_FAILED");
            revert VerificationFailed("PoII ZKP verification failed");
        }
        // --- End ZKP Verification (Simulated) ---

        // Proof is considered valid, update the status
        info.lastValidPoIITimestamp = _proofTimestamp; // Use timestamp from verified proof
        bytes32 proofCommitment = keccak256(
            abi.encodePacked(_proof.proof, _proof.publicInputs)
        ); // Simple commitment
        info.lastProofCommitment = proofCommitment;

        emit PoIIProofVerified(
            _mscAddress,
            info.lastValidPoIITimestamp + poiiValidityDuration,
            proofCommitment
        );
    }

    /**
     * @dev Sets the fee required to use the oracle.
     * @param _newFee The new fee in ICC base units.
     */
    function setOracleFee(uint256 _newFee) external onlyOwner {
        oracleFeeICC = _newFee;
        emit OracleFeeUpdated(_newFee);
    }

    /**
     * @dev Sets how long a verified PoII status remains valid.
     * @param _newDuration The new duration in seconds.
     */
    function setPoIIValidityDuration(uint256 _newDuration) external onlyOwner {
        poiiValidityDuration = _newDuration;
        emit PoIIValidityDurationUpdated(_newDuration);
    }

    /* // Example: Function to update the verifier address
    function setPoIIVerifier(address _newVerifierAddress) external onlyOwner {
        require(_newVerifierAddress != address(0), "Verifier address cannot be zero");
        poiiVerifierAddress = _newVerifierAddress; // Update address
        // poiiVerifier = IPoIIVerifier(_newVerifierAddress); // Update instance
        emit PoIIVerifierUpdated(_newVerifierAddress);
    }
    */

    /**
     * @dev Withdraws collected ICC fees to the DMF (owner) address.
     */
    function withdrawFees() external onlyOwner nonReentrant {
        uint256 balance = iccToken.balanceOf(address(this));
        if (balance > 0) {
            if (!iccToken.transfer(owner(), balance)) {
                revert TransferFailed();
            }
        }
    }

    // --- MSC Interaction Function ---

    /**
     * @dev Public function for registered MSCs to request physical world interaction.
     *      Requires prior approval of ICC tokens to this contract.
     *      Checks registration, PoII validity based on last verified proof timestamp, and collects the fee.
     * @param _interactionData Arbitrary data representing the desired physical interaction.
     *                         Could potentially include its own ZK proof for authentication via IInteractionAuthenticator.
     */
    function requestPhysicalInteraction(
        bytes calldata _interactionData
    ) external nonReentrant {
        address msc = msg.sender;
        MSCInfo storage info = mscRegistry[msc];
        bytes32 dataHash = keccak256(_interactionData); // Use hash for events/logging

        // 1. Verify Registration
        if (!info.isRegistered) {
            emit InteractionDenied(msc, dataHash, "MSC_NOT_REGISTERED");
            revert MSCNotRegistered(msc);
        }

        // 2. Verify PoII Status (based on timestamp from last verified proof)
        uint256 lastValid = info.lastValidPoIITimestamp;
        if (
            block.timestamp > lastValid + poiiValidityDuration || lastValid == 0
        ) {
            emit InteractionDenied(msc, dataHash, "POII_NOT_VALID_OR_EXPIRED");
            revert PoIINotValidOrExpired(msc, lastValid, block.timestamp);
        }

        // 3. Collect Fee (ICC)
        uint256 fee = oracleFeeICC;
        if (fee > 0) {
            uint256 allowance = iccToken.allowance(msc, address(this));
            if (allowance < fee) {
                emit InteractionDenied(
                    msc,
                    dataHash,
                    "INSUFFICIENT_ICC_ALLOWANCE"
                );
                revert InsufficientICCAllowance(
                    msc,
                    address(this),
                    fee,
                    allowance
                );
            }
            // Use transferFrom as the MSC pre-approved the spending
            if (!iccToken.transferFrom(msc, address(this), fee)) {
                emit InteractionDenied(msc, dataHash, "ICC_TRANSFER_FAILED");
                revert TransferFailed();
            }
        }

        // 4. Authorize Interaction (Emit event)
        // Off-chain systems monitor this event, retrieve _interactionData (potentially from calldata or IPFS),
        // perform further checks (e.g., against device registries, interaction-specific ZK proofs if provided),
        // and execute the physical interaction via secure hardware channels.
        emit InteractionAuthorized(msc, dataHash, fee);

        // --- Interaction execution is handled by off-chain infrastructure ---
    }

    // --- View Functions ---

    /**
     * @dev Checks if an MSC's PoII status is currently considered valid based on the last verified proof timestamp.
     * @param _mscAddress The MSC address to check.
     * @return bool True if registered and PoII is within the validity window.
     */
    function isPoIIValid(address _mscAddress) external view returns (bool) {
        MSCInfo storage info = mscRegistry[_mscAddress];
        if (!info.isRegistered || info.lastValidPoIITimestamp == 0) {
            return false;
        }
        return
            block.timestamp <=
            info.lastValidPoIITimestamp + poiiValidityDuration;
    }

    /**
     * @dev Returns the timestamp until which the MSC's current PoII status is valid.
     * @param _mscAddress The MSC address.
     * @return uint256 The Unix timestamp, or 0 if not registered or never verified.
     */
    function getPoIIValidUntil(
        address _mscAddress
    ) external view returns (uint256) {
        MSCInfo storage info = mscRegistry[_mscAddress];
        if (!info.isRegistered || info.lastValidPoIITimestamp == 0) {
            return 0;
        }
        // Defensive check in case duration is massive, prevent overflow
        uint256 validUntil = info.lastValidPoIITimestamp + poiiValidityDuration;
        if (validUntil < info.lastValidPoIITimestamp) {
            // Overflow occurred
            return type(uint256).max;
        }
        return validUntil;
    }

    /**
     * @dev Returns information about a registered MSC.
     * @param _mscAddress The MSC address.
     * @return MSCInfo struct containing registration status, VK hash, last valid timestamp, and proof commitment.
     */
    function getMSCInfo(
        address _mscAddress
    ) external view returns (MSCInfo memory) {
        return mscRegistry[_mscAddress];
    }
}
