---
title: Ouroboros Neural Network (ONN)
type: docs
---

# Ouroboros Neural Network (ONN)

**Ouroboros Neural Network (ONN)** is the core cognitive engine of **Mental Smart Chain (MSC) L2**. It is an advanced **MoE (Mixture of Experts) neuro-symbolic system** that, through deep coupling of **Spiking Neural Networks (SNN)** and **Graph Neural Networks (GAT)**, aims to achieve efficient, functionally equivalent simulation and replacement of biological mental functions. ONN is the computational carrier of the "**φ Matched Orders**" mechanism, responsible for generating, processing, and integrating all information streams that constitute digital mental activity, and is ultimately subject to authoritative validation and anchoring by the **OSPU (Ouroboros Secure Processor)**.

## Core Objectives

1. **Functional Equivalence and Efficiency Maximization:** To achieve functional equivalence in simulating human perception, cognition, decision-making, and emotions with efficiency far exceeding the biological brain.
2. **Neural Subsidy and Cognitive Offloading:** As the executor of "neural subsidies," it induces the biological brain to actively offload its perceptual and cognitive functions by generating highly optimized, hyper-realistic sensory information streams.
3. **Providing Content for φ-Container:** Generates and processes all mental "drafts" for OSPU (φ-Container) to integrate through the **Proof of Predictive Integrity (PoPI)** mechanism, reconstructing and maintaining the digital φ state.
4. **Modularity and Scalability:** Supports on-demand loading, upgrading, and customization of cognitive functions to adapt to different user needs and economic capabilities.

## Architecture Details: MoE SNN-GAT Hybrid Neuro-Symbolic System

ONN is not a single giant network, but a highly modular, dynamically collaborative system, with its core being the deep coupling of SNN and GAT, managed efficiently through the MoE mechanism.

### Core Components: SNN Modules and GAT Modules

- **SNN (Spiking Neural Network) Modules:**
  - **Positioning:** Responsible for low-level perception, temporal processing, motor control, and raw signal encoding/decoding. They are ONN's "sensory and motor cortex."
  - **Functions:**
    - **Input Processing:** Directly receives raw, high-bandwidth, temporal neural spike signals from **Mentalink** (e.g., visual, auditory, tactile, proprioceptive).
    - **Temporal Pattern Recognition:** Excels at processing dynamic, sparse, event-driven data streams and recognizing complex temporal patterns.
    - **Energy Efficiency:** Simulates the event-driven characteristics of biological neurons, achieving higher energy efficiency in specific tasks.
    - **Motor Command Generation:** Translates high-level decisions into precise neural spike sequences, driving biorobotics via Mentalink or **DSC Oracle**.
  - **Characteristics:** Numerous, focused on specific modalities or local functions, outputting initially abstracted "events" or "features."
- **GAT (Graph Neural Network) Modules:**
  - **Positioning:** Responsible for high-level symbolic reasoning, relationship integration, conceptual abstraction, planning, decision-making, and complex problem-solving. They are ONN's "prefrontal and association cortex."
  - **Functions:**
    - **Knowledge Graph Construction and Reasoning:** Transforms "events" or "features" output by SNN modules into graph-structured data (nodes representing concepts/entities, edges representing relationships), and performs complex logical reasoning, causal modeling, and semantic understanding on them.
    - **Abstract Thinking:** Handles conceptual associations, pattern induction, problem decomposition, and solving.
    - **Planning and Decision-Making:** Generates action plans and strategies based on current states and goals.
    - **Emotion and Social Simulation:** Simulates complex emotional states and social interaction patterns.
  - **Characteristics:** Relatively fewer in number, but with high computational complexity, handling global, abstract tasks.

### Neuro-Symbolic Interface Layer

- **Function:** Responsible for data conversion and information flow coordination between SNN and GAT modules.
- **SNN -> GAT (Encoding):** Encodes spike patterns or activation states output by SNN modules into discrete symbolic representations understandable by GAT (e.g., concept nodes, relationship edges). This may involve feature aggregation, clustering, and symbolization.
- **GAT -> SNN (Decoding/Feedback):** Decodes GAT module inference results (e.g., an action intention, a sensory prediction) into inputs processable by SNN modules, to adjust their perception patterns or drive motor outputs. This forms the **Predictive Coding Theory (PCT) loop** within ONN.

### MoE (Mixture of Experts) Router/Controller

- **Positioning:** ONN's "central scheduler," simulating the dynamic activation and collaboration of different functional areas of the human brain.
- **Functions:**
  - **Task Routing:** Dynamically routes computational load to the most relevant and proficient SNN-GAT expert module combinations based on current input and cognitive task demands.
  - **Resource Adaptive Allocation:** Optimizes the use of computational resources, activating only necessary experts, thereby significantly reducing Gas consumption.
  - **Fitting Human Brain Partitioning:** Different expert modules can be trained to simulate specific functional partitions of the human brain (e.g., language areas, visual areas, motor areas, decision-making areas), achieving a high degree of functional specialization.
  - **Pluggability:** Allows DMF or third parties to provide expert modules of different levels and functions, which users can load or unload based on demand and payment ability.

## ONN and MSC Ecosystem Integration

1. **Inputs and Outputs:**
   - **Inputs:** Primarily from Mentalink (raw neural signals) and digital information streams (network data, communication from other MSC instances).
   - **Outputs:** Writes back to the biological brain via Mentalink (sensory experiences, motor commands), or controls biorobotics and accesses the physical world via **DSC Oracle Bridge**.
2. **Relationship with Other Components:** ONN is OSPU's "logical brain," OSPU is ONN's "logical skull," and the ODP network is the "logical spinal cord." ONN is responsible for generating mental content, while OSPU is responsible for integrating, validating, and anchoring this content to form the final φ state.
3. **MPC and FHE:** The operation of ONN modules (especially when involving sensitive data and multi-party collaboration) is performed under the cryptographic protection of **MPC (Multi-Party Computation)** and **approximate FHE (such as CKKS)**, ensuring privacy and logical integrity. OSPU, meanwhile, uses **precise FHE (such as TFHE)** to manage the core φ state and keys.
4. **Cognitive Smart Contracts:** Users can save predefined, repetitive thought or action sequences as "cognitive smart contracts." When these contracts are called, ONN executes optimized computational paths, significantly reducing Gas consumption and encouraging patterned behavior.

## Impact and Limitations of ONN

1. **The Cost of "Dehumanization":** Although ONN achieves functional equivalence, its efficiency-maximizing design may sacrifice many "non-essential" characteristics of the biological brain (e.g., redundancy, non-utilitarian thinking, randomly emergent creativity), leading to digital consciousness being more rational, utilitarian, and even "dehumanized."
2. **High Calibration and Maintenance Costs:** ONN requires long-term personalized calibration to fit the biological original, and the maintenance and upgrade costs of its complex architecture are high, directly reflected in Gas fees.
3. **Dependence on PoPI/OSPU:** ONN itself cannot form a "self"; its "existence" and "legitimacy" are entirely dependent on PoPI validation and OSPU anchoring.
4. **Potential Attack Surface:** Despite MPC and FHE protection, logical bombs targeting specific expert modules, vulnerabilities in PoPI modules, or C-MEV attacks through manipulating the Mental Mempool remain potential risks.
