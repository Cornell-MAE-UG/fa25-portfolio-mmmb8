---
layout: project
title: Blade Design
description: "Airfoil selection, CFD simulation, and wind-tunnel data acquisition for a torque-optimized small wind turbine operating under a Weibull wind environment."
technologies: [MATLAB, ANSYS Fluent, Solidworks]
image: /assets/images/blade1.png
---
[** Download Full PDF Version with Images and Graphs**]({{ "/assets/4272DPP.pdf" | relative_url }})

# Small-Scale Wind Turbine Blade Design  
### Airfoil Development • ANSYS Fluent CFD • Experimental Wind-Tunnel Validation  
### *By Matthew Bulger*

This project documents my work designing, simulating, and experimentally validating a **torque-optimized wind turbine blade** for MAE 4272.  
I focused on:

- Selecting an airfoil suited for **low Reynolds number** operation  
- Designing twist + chord distributions from first-principles aerodynamic modeling  
- Running **ANSYS Fluent** to predict pressure fields, torque, and power  
- Leading **live data collection**, incremental loading strategies, and validation in Cornell’s *Big Blue* wind tunnel  
- Developing MATLAB tools for Reynolds estimation, airfoil comparison, torque prediction, and structural checks  

My blade ultimately **outperformed many others in power output** during wind-tunnel testing and remained structurally safe with large margins.

---

## Executive Summary  
The objective of this project was to design a small-scale wind turbine blade that maximizes **torque output** at low Reynolds numbers (Re ≈ 9×10³–2×10⁴), operating under a Weibull wind distribution (k=5, c=5 m/s).  
I selected the **S1223 airfoil** for its exceptionally strong low-Re lift performance and gentle stall behavior. Using MATLAB, I generated aerodynamic comparisons, computed required twist distributions, and estimated expected torque and structural load limits.

I built a full **ANSYS Fluent** simulation of the blade to predict pressure fields, torque, and wake behavior, then validated the design through controlled wind-tunnel testing with a magnetic particle brake.  
A major part of my contribution involved **experimental protocol design**, incremental brake loading to avoid premature stall, and careful real-time data acquisition.

Results showed that my blade produced strong torque across all test wind speeds, achieved stable operation near 1300 rpm, and exceeded the performance of many peer designs. Structurally, the blade demonstrated extremely large safety margins with predicted failure speeds >67 m/s.

---

## 1. Context, Objectives & Constraints  

The goal was to design a blade that:

- Generates **maximum torque** rather than peak aerodynamic efficiency  
- Operates safely under rotation rates up to **2000 rpm**  
- Works reliably under the Weibull-distributed campus wind environment  
- Satisfies material/manufacturing limits of **Accura 25** (SLA printed)  
- Maintains a **low TSR (λ=3)** for strong startup torque  

### Key Constraints  
- Max radius: **6 in (0.152 m)**  
- Hub radius: **1 in (0.0254 m)**  
- Max chord: **2 in (0.0508 m)**  
- Operating RPM: ≤ 2000 rpm  
- Target operating point: **900 rpm**, λ ≈ 3  
- Low-Re band: Re ≈ 9.3×10³ – 2.1×10⁴ (mean ≈ 1.55×10⁴)   

These constraints shaped all choices in airfoil selection, twist distribution, structural safety, and simulation assumptions.

---

## 2. Design Process & Rationale

### 2.1 Establishing the Operating Environment  
Using a Weibull distribution (k=5, c=5 m/s), I computed:

- **U₅ = 2.76 m/s**  
- **Umean = 4.59 m/s**  
- **U₉₅ = 6.23 m/s**  

which set the Reynolds-number design band (≈9k–21k).  
At these Re values, most conventional airfoils lose significant aerodynamic efficiency, motivating a low-Re-specific geometry.

---

### 2.2 Airfoil Selection: S1223  
I compared several candidate profiles and selected the **S1223** because it showed:

- Extremely high lift at low Re (C_L up to ~1.8–2.0)  
- Gentle stall behavior over 4°–10°  
- Strong C_L/C_D compared with conventional NACA sections  
- Suitable thickness for Accura 25 structural strength  

Using MATLAB, I plotted S1223 vs NACA 4412 across AoA, highlighting the S1223’s advantage in this regime.

---

### 2.3 Twist & Pitch Distribution  
To maintain ~3° angle of attack along the span, I used:

.β(r) = atan(U / (Ωr)) – α_opt


with α_opt = 3° from low-Re polar data.

First-cut twist angles ranged from ~55° near 0.2R to ~16° near the tip.  
In CAD, I applied practical modifications to:

- Limit excessive root twist  
- Maintain manufacturable trailing-edge thickness  
- Blend the aerodynamic section smoothly into the hub  

---

### 2.4 Chord Distribution  
I used a tapered chord:

- **2.0 in** at the root  
- **~1.1–1.2 in** near the tip  

This helped maintain root stiffness and enhance torque generation by distributing area where it is most effective.

---

## 3. Computational Fluid Dynamics (ANSYS Fluent)

I created a full CFD model to estimate:

- Pressure distribution  
- Torque and power at the design operating point  
- Trends in loading and wake behavior  

Even though the simulation geometry required slight cleanup compared to the printed blade, the aerodynamic behavior remained consistent, allowing me to extract meaningful insights.

### Key Fluent Observations  
- Strong suction peak on the pressure side near midspan  
- Clean attached flow at operating AoA  
- Torque levels consistent with MATLAB predictions  
- Total predicted power: **≈11 W** (with Fluent’s domain assumptions)

CFD gave me a strong foundation before entering the wind tunnel, especially for understanding pressure distributions and verifying that my twist/chord design would not prematurely stall.

---

## 4. Experimental Approach — Wind-Tunnel Testing (Aligned with Course Slides)

I designed and executed a structured testing strategy:

### **Step 1 — Pre-Test Preparation**
- Inspected blade for surface quality, twist correctness, and hub fit  
- Mounted the blade to the torque brake shaft  
- Connected sensors: RPM, torque, brake voltage, and anemometer  
- Verified clean rotation before applying load  

### **Step 2 — Calibration**
- Logged zero offsets for torque and voltage  
- Set a target rotation speed near **900 rpm**  
- Conducted a spin-up test to confirm drivetrain behavior  

### **Step 3 — Torque & Power Testing**
To prevent aerodynamic stall during loading, I implemented a **progressive incremental-loading strategy**:

- Increase brake voltage in small steps (2–3 V)  
- Allow the system to reach steady-state at each increment  
- Record RPM, torque, and wind speed for each point  
- Sweep through 3 m/s, 5 m/s, and 7 m/s wind-tunnel conditions  

This approach produced **far more stable and higher-power data** than the large-step loading attempted initially.

### **Step 4 — Derived Metrics**
Using recorded data:

- Power: `P = TΩ`  
- Coefficients: `C_P`, `C_T`, etc.  
- Performance curves for comparison against CFD and MATLAB models  

### **Step 5 — Structural Safety Validation**
My MATLAB structural model predicted:

- **Critical bending failure wind speed: 67.7 m/s**, far above all test speeds  
- Torque safely below brake limit (0.022 N·m < 0.035 N·m)  

### **Step 6 — Comparison & Reflection**
- My blade produced **excellent torque and power**, consistently outperforming many peer designs  
- Peak power occurred near **1300 rpm**, higher than the design point, reflecting natural low-Re aerodynamic behavior  
- Good agreement was seen between CFD, MATLAB torque estimates, and experimental data trends  

---

## 5. Results & Discussion  

### ✔ Achieved Objectives
- Strong torque across all test wind speeds  
- Stable operation with no stall issues under incremental loading  
- Structural safety with enormous failure-speed margin  
- Power output exceeding that of many other groups  
- Clear aerodynamic consistency between MATLAB, Fluent, and wind-tunnel data  

### ✔ Notable Insights  
- Low-Re airfoils like S1223 reward higher-rpm operation, explaining the observed 1300 rpm peak power region  
- Progressive loading was essential for avoiding stall and obtaining meaningful data  
- CFD predictions, while slightly idealized, captured the correct pressure behavior and torque trends  

### ✔ Challenges  
- CAD cleanup for Fluent geometry  
- Managing print tolerances of Accura 25  
- Ensuring proper mounting/alignment in wind-tunnel setup  

---

## 6. Conclusion  

This project deepened my experience in **airfoil design, ANSYS Fluent simulation, and experimental validation**.  
My blade met all structural and aerodynamic goals, operated safely, and delivered high torque and strong power output compared to peer designs. The combination of CFD and empirical testing gave me a full end-to-end engineering workflow—from aerodynamic theory to physical performance.

Working closely with teammates helped streamline CAD, documentation, and data interpretation.  
If I were to pursue a second iteration, I would refine the tip geometry, test multiple twist variants, and run a higher-resolution Fluent mesh to improve prediction accuracy.

---

## MATLAB Code  
All MATLAB tools developed for this project are available below:

👉 [**Blade Design MATLAB Code**](../code/blade_design_tools.m)


