---
layout: project
title: "Wind Turbine Blade Design — CFD, Testing, and Low-Re Aerodynamics"
year: 2025
description: "End-to-end blade design workflow including airfoil selection, CAD, ANSYS Fluent CFD, and wind-tunnel-informed validation for low Reynolds number operation."
featured: true
image: /assets/images/blade1.png

---

# Wind Turbine Blade Design — CFD, Testing, and Low-Re Aerodynamics

This project documents my work designing and evaluating a **small-scale wind turbine blade** for low Reynolds number flow. The focus was on torque generation, manufacturability, and experimental feasibility, with a strong emphasis on **CFD-driven insight** rather than purely theoretical performance curves.

---

## Project Objectives

- Design a blade optimized for **low-Reynolds-number operation**
- Generate measurable torque at low tip-speed ratios
- Validate aerodynamic behavior using **ANSYS Fluent**
- Integrate modeling decisions with experimental constraints

---

## Design Overview

First Deliverable
Technical Objectives
Our design objective is to generate the maximum torque output for a small-scale wind turbine operating under a Weibull wind-speed distribution (k = 5, c = 5 m/s). We are optimizing for torque and startup performance, rather than peak aerodynamic efficiency, because our low Reynolds number regime (Re ≈ 9×10³–2×10⁴) makes high-efficiency, high-λ operation impractical.
Key technical constraints and design parameters include:
Maximum blade radius: 6 inches (0.152 m)
Attachment hub radius: 1 inch (0.0254 m)
Fixed rotational speed: ≤ 2000 rpm
Operational tip-speed ratio (λ): 3 (≈900 rpm chosen)
Chord length: 2 in (0.0508 m) maximum
Material: Accura 25 (SLA printed)
Target Reynolds number: 9.3×10³ – 2.1×10⁴
Operating wind range: 2.8 – 6.2 m/s (based on Weibull 5–95%)

These parameters directly influence our aerodynamic design choices, twist and pitch distributions, and material stress checks for manufacturability and testing in Big Blue.
3. Team Roles & Timeline: 
Initial Design Parameters (Sarah Grace)
CAD (Marco)
CFD (Josh)
Data Analysis and Iterations (Matthew)
Final Design Decision (All)
Potential Roadblocks:
Ensuring proper twist orientation and...

---

## CAD and Geometry

The blade geometry was modeled parametrically to allow rapid iteration on chord, twist, and airfoil placement. This enabled downstream CFD meshing and ensured compatibility with wind tunnel mounting constraints.

![Blade CAD](/assets/images/mae4272_blade/blade_cad.png)

---

## CFD Methodology (ANSYS Fluent)

### Domain and Mesh

The fluid domain was constructed to match wind tunnel scale effects and to support rotational flow modeling. A refined surface and volume mesh was generated around the blade to capture pressure gradients accurately.

![Fluid Domain](/assets/images/mae4272_blade/fluid_domain.png)
![Volume Mesh](/assets/images/mae4272_blade/volume_mesh.png)

### Turbulence Model

A **k–ω turbulence model** was selected for its reliability in near-wall resolution at low Reynolds numbers.

---

## Results and Post-Processing

Pressure contours confirmed expected stagnation regions and pressure differentials across the blade surfaces, directly contributing to torque generation.

![Pressure Contours](/assets/images/mae4272_blade/pressure_contours.png)
![Torque Report](/assets/images/mae4272_blade/torque_report.png)

---

## Experimental Context

Although the project emphasized CFD, design choices were guided by experimental feasibility. Blade geometry, hub interface, and expected loading were all constrained by wind tunnel testing requirements.

---

## Key Takeaways

- Low-Re airfoil selection is critical for meaningful torque output
- CFD is most valuable when tightly coupled to physical constraints
- Design success was measured by **robust behavior**, not peak efficiency

---

## Conclusion

This project strengthened my ability to connect **aerodynamic theory, CFD simulation, and experimental design** into a single workflow. More importantly, it reinforced my interest in live data collection, validation-driven modeling, and designing components that perform reliably under real constraints.
