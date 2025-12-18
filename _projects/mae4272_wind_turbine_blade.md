---
layout: project
title: "Torque-Optimized Wind Turbine Blade — Low-Re Aerodynamics, CFD, and Testing"
year: 2025
description: "End-to-end design of a small-scale wind turbine blade optimized for torque at extremely low Reynolds numbers using blade element theory, ANSYS Fluent CFD, structural validation, and wind tunnel testing."
featured: true
image: /assets/images/blade1.png
---

# Torque-Optimized Wind Turbine Blade  
### Low-Re Aerodynamics, CFD, and Experimental Validation

This project documents my work designing, analyzing, and testing a **small-scale wind turbine blade optimized for torque production** in an extremely low Reynolds number regime. The design emphasizes **startup torque, low-speed operation, and experimental feasibility**, rather than peak aerodynamic efficiency, reflecting real-world constraints encountered in small-scale energy systems.

The workflow integrates **blade element momentum theory, CAD modeling, CFD simulation in ANSYS Fluent, structural safety analysis, and physical wind tunnel testing**, with iterative refinement driven by both modeling insight and experimental limitations.

---

## Design Context and Objectives

The blade was designed for operation in the **Big Blue wind tunnel**, characterized by a Weibull wind distribution with a mean wind speed of approximately 4.6 m/s. Given a maximum chord of 2 inches and air kinematic viscosity of 1.5×10⁻⁵ m²/s, the blade operates in a **Reynolds number range of roughly 9,300–21,000**, where conventional NACA airfoils perform poorly due to laminar separation.

**Primary objectives:**
- Maximize **torque output** across the expected wind distribution  
- Achieve reliable **startup and low-speed operation**  
- Remain within **geometric, structural, and testing constraints**  
- Validate aerodynamic behavior using **CFD and experiment**

---

## Airfoil Selection and Aerodynamic Rationale

A comparative evaluation of low-Re airfoils identified the **S1223 airfoil** as the optimal choice. Unlike conventional sections, the S1223 achieves **exceptionally high lift coefficients (CL ≈ 1.8–2.0)** in the relevant Reynolds range and exhibits **gentle stall behavior**, which is critical for stable torque production during startup and off-design operation.

![Lift Coefficient Comparison](/assets/images/mae4272_blade/figure_1_lift_coefficient_vs_aoa.png)
*Figure 1: Lift coefficient vs. angle of attack comparison at low Reynolds number.*

![Lift-to-Drag Comparison](/assets/images/mae4272_blade/figure_2_lift_to_drag_vs_aoa.png)
*Figure 2: Lift-to-drag ratio comparison highlighting S1223 efficiency at low Re.*

![CL/CD vs AOA](/assets/images/mae4272_blade/figure_3_cl_cd_vs_aoa.png)
*Figure 3: Aerodynamic efficiency of S1223 across Reynolds numbers.*

---

## Blade Geometry and Torque Optimization

The blade was designed around a **low tip-speed ratio (λ = 3)** to intentionally rotate the lift vector toward the tangential direction, increasing torque at the expense of peak efficiency. Blade element momentum theory guided the geometry:

- **Linear chord taper:** 2.0 in (root) → 0.4 in (tip)  
- **Strong twist distribution:** ~60° at root → ~14° near tip  
- **Target angle of attack:** ≈ 3° across the span  

This geometry prioritizes torque generation while maintaining structural robustness and manufacturability.

---

## Structural Validation

Structural safety was assessed using MATLAB-based bending moment calculations derived from distributed aerodynamic loads. Accura 25 SLA material properties were used to verify that stresses remained well below allowable limits.

![Rotor Torque vs Wind Speed](/assets/images/mae4272_blade/figure_4_rotor_torque_vs_wind_speed.png)
*Figure 4: Predicted rotor torque across wind speeds.*

![Root Bending Moment](/assets/images/mae4272_blade/figure_5_root_bending_moment_vs_wind_speed.png)
*Figure 5: Root bending moment and structural safety margin.*

The predicted **failure wind speed of ~68 m/s** provides more than a **10× safety margin** over expected operating conditions.

---

## CAD Modeling and Manufacturing Challenges

The blade was modeled in **SolidWorks** using multiple airfoil cross-sections lofted along the span. Early CAD iterations revealed practical issues related to **trailing edge closure, STL integrity, and hub geometry**, which affected both printing and CFD usability.

![Closed CAD Model](/assets/images/mae4272_blade/figure_8_closed_cad_model.png)
*Figure 8: Final closed CAD geometry used for CFD analysis.*

These challenges required manual airfoil data cleanup and segmented lofting, introducing minor geometric discontinuities that were deemed negligible for aerodynamic analysis.

---

## CFD Methodology (ANSYS Fluent)

### Geometry and Domain
The CFD model used a **120° periodic wedge domain** to reduce computational cost while capturing rotational flow physics.

![Fluid Domain Geometry](/assets/images/mae4272_blade/figure_9_fluid_domain_geometry.png)
*Figure 9: CFD fluid domain.*

### Meshing
A refined surface and polyhedral volume mesh balanced near-wall resolution with manageable runtime.

![Surface Mesh](/assets/images/mae4272_blade/figure_10_fluid_domain_surface_mesh.png)
*Figure 10: Fluid domain surface mesh.*

![Blade Surface Mesh](/assets/images/mae4272_blade/figure_11_blade_surface_mesh.png)
*Figure 11: Blade surface mesh.*

![Volume Mesh](/assets/images/mae4272_blade/figure_12_volume_mesh_cross_section.png)
*Figure 12: Volume mesh cross-section.*

### Solver Setup
- **Turbulence model:** k–ω  
- **Air density:** 1.2 kg/m³  
- **Inlet velocity:** 6 m/s  
- **Iterations:** 1500  

---

## CFD Results and Post-Processing

Pressure contours show the expected **high-pressure stagnation region** on the blade front and low-pressure suction region behind the blade, producing the torque-driving pressure differential.

![Pressure Front](/assets/images/mae4272_blade/figure_13_pressure_contour_blade_front.png)
*Figure 13: Pressure contour on blade front.*

![Pressure Back](/assets/images/mae4272_blade/figure_14_pressure_contour_blade_back.png)
*Figure 14: Pressure contour on blade back.*

![Midspan Pressure](/assets/images/mae4272_blade/figure_15_pressure_contour_midspan.png)
*Figure 15: Pressure contour through blade midspan.*

![Torque Report](/assets/images/mae4272_blade/figure_16_torque_report.png)
*Figure 16: CFD torque report.*

CFD predicted approximately **11 W total power**, significantly higher than measured values, highlighting limitations in turbulence modeling, mesh fidelity, and boundary condition assumptions at very low Reynolds numbers.

---

## Experimental Testing and Reflection

Wind tunnel testing confirmed **strong startup behavior and robust torque generation**, but revealed that peak power consistently occurred near **1300 rpm**, rather than the designed 900 rpm. Testing was limited by **magnetic brake capacity and maximum wind speed**, preventing full characterization of the blade’s performance envelope.

Despite data collection challenges, the blade **outperformed initial expectations**, suggesting untapped aerodynamic potential beyond the test constraints.

---

## Key Takeaways

- Low-Re airfoil selection is critical for meaningful torque output  
- Low tip-speed ratio operation can outperform expectations when torque-limited  
- CFD is most valuable when paired with experimental reality  
- Manufacturing and CAD fidelity strongly influence downstream analysis  

---

## Conclusion

This project demonstrates a complete **aerodynamic design workflow** under real constraints, integrating theory, CFD, structures, and testing. It strengthened my interest in **validation-driven modeling, low-Re aerodynamics, and experimental feedback loops**, and highlighted how design intent must continuously adapt to physical and operational limits.

