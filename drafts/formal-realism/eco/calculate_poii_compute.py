import math
import datetime
from decimal import Decimal, getcontext

# --- Constants and Assumptions ---
SECONDS_PER_DAY = 24 * 60 * 60
YEARS_TO_PROJECT = 70

# --- User Defined ---
TARGET_PHI_VALUE_Y70_ICC = Decimal('100') # Target value of 1 phi in Year 70 ICC

# --- Fixed Parameters (from previous report) ---
COST_PER_EFLOPS_Y0 = Decimal('6.944444444444445') # ICC (USD) per EFLOPS-second (H100 based)
DEPRECIATION_FACTOR_70_YEARS = Decimal('268435456') # Dimensionless factor (2^28)

# --- Calculation Functions ---

def calculate_cost_per_eflops_y70(cost_y0, df_70):
    """Calculates the cost per EFLOPS-second after 70 years."""
    cost_y0_dec = Decimal(cost_y0)
    df_70_dec = Decimal(df_70)
    if df_70_dec <= 0:
        raise ValueError("Depreciation factor must be positive.")
    return cost_y0_dec / df_70_dec

def calculate_total_compute_per_phi_per_day(phi_value_y70_icc, cost_per_eflops_y70_dec):
    """Calculates the total EFLOPS-seconds needed to sustain 1 phi for a day,
       given the target phi value in ICC and the cost per EFLOPS-second in Year 70."""
    phi_value_y70_icc_dec = Decimal(phi_value_y70_icc)
    cost_per_eflops_y70_dec = Decimal(cost_per_eflops_y70_dec)
    if cost_per_eflops_y70_dec <= 0:
        raise ValueError("Cost per EFLOPS-second must be positive.")
    return phi_value_y70_icc_dec / cost_per_eflops_y70_dec

def calculate_compute_per_poii(total_compute_phi_per_day_dec):
    """Calculates the compute per PoII verification,
       given the total EFLOPS-seconds needed to sustain 1 phi for a day."""
    seconds_per_day_dec = Decimal(SECONDS_PER_DAY)
    if seconds_per_day_dec <= 0:
        raise ValueError("Seconds per day must be positive.")
    return total_compute_phi_per_day_dec / seconds_per_day_dec

# --- Main Execution ---
if __name__ == "__main__":
    print(f"反向计算 70 年后 (Year {datetime.datetime.now().year + YEARS_TO_PROJECT}) 1 φ (MSCoin) 价值为 {TARGET_PHI_VALUE_Y70_ICC} ICC 时的 PoII 单次计算量...")
    print("-" * 30)

    try:
        # --- Step 1: Calculate Future Cost per EFLOPS ---
        cost_y70 = calculate_cost_per_eflops_y70(COST_PER_EFLOPS_Y0, DEPRECIATION_FACTOR_70_YEARS)
        print(f"Year {YEARS_TO_PROJECT} Cost per EFLOPS-second (ICC): {cost_y70:.4E}")

        # --- Step 2: Calculate Total Compute for 1 Phi per Day ---
        total_compute_phi = calculate_total_compute_per_phi_per_day(TARGET_PHI_VALUE_Y70_ICC, cost_y70)
        print(f"Total Compute for 1 φ per Day (EFLOPS-seconds): {total_compute_phi:.4E}")

        # --- Step 3: Calculate Compute per PoII Verification ---
        compute_poii = calculate_compute_per_poii(total_compute_phi)
        print("-" * 30)
        print(f"反向计算得到的单次 PoII 验证所需算力 (EFLOPS-seconds): {compute_poii:.4E} EFLOPS-秒")
        print("-" * 30)

    except ValueError as e:
        print(f"\nError: {e}")
    except Exception as e:
        print(f"\nAn unexpected error occurred: {e}")
