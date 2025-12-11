---
layout: project
title: "Instrumented Torque Wrench — FEA, Material Selection, and Generative Design"
year: 2025
description: "A complete mechanical engineering workflow including analytical beam-theory calculations, ANSYS FEA validation, material & geometry optimization, strain-gauge instrumentation, and Fusion 360 generative design exploration."
image: /assets/images/image_018.png
featured: true
---



This project presents a full design workflow for a **600 in·lbf instrumented torque wrench**, beginning with classical hand calculations and progressing through ANSYS simulation, material selection, sensitivity analysis, and finally a Fusion 360 generative design study.  
The work integrates principles of mechanics of materials, structural simulation, instrumentation engineering, and modern computational design.

It demonstrates:

- Analytical hand calculations (MATLAB)
- ANSYS finite element analysis
- Material and safety-factor evaluation (yield, fracture, fatigue)
- Strain-gauge selection and sensitivity computation
- CAD modeling in Fusion 360
- **Generative Design exploration** with multiple candidate structures

---

##  Project Summary

The wrench was designed to:

- Withstand ±600 in·lbf repeatedly  
- Avoid yielding, crack growth, and fatigue failure  
- Provide at least **1.0 mV/V** sensor output at full-scale torque  
- Fit a strain gauge within a **0.45 in width constraint**  
- Increase sensitivity relative to the baseline design  
- Explore lightweight topology-optimized alternatives

I modeled and simulated **three designs**:

---

### **1. Baseline Design**

The baseline design is a , rectangular beam-style wrench. Hand calculations using simple beam theory were used to estimate:

- Maximum bending stress  
- Tip deflection  
- Strain at the strain-gauge location  

These predictions were then compared with a 3D ANSYS model under a 600 in·lbf torque.

- Hand-calculated max stress: **12.8 ksi**  
- Strain at gauge: **375 με**  
- Deflection: **0.091 in**  
- FEA strain at gauge: **375 με** (exact match to the hand calculation)  
- FEA deflection at the load point: **0.135 in**

**Representative figures from the baseline analysis:**

Baseline hand-calculation MATLAB output:  
![Baseline Hand Calculations](/assets/images/2025-torquewrench/image_045.png)

Baseline deflection from ANSYS:  
![Baseline Deflection](/assets/images/2025-torquewrench/image_046.png)

Baseline strain at gauge location:  
![Baseline Strain at Gauge](/assets/images/2025-torquewrench/image_047.png)

Baseline maximum normal stress with clamp-induced concentration:  
![Baseline Max Stress](/assets/images/2025-torquewrench/image_048.png)

Deformed mesh visualization for beam-theory validity check:  
![Baseline Deformed Mesh](/assets/images/2025-torquewrench/image_049.png)

Zoom on stress near the clamped drive region:  
![Baseline Clamp Stress Zoom](/assets/images/2025-torquewrench/image_050.png)

---

### **2. Improved Final Engineering Design**

To improve sensitivity and still satisfy strength and durability constraints, I redesigned the wrench using:

- **Material:** AISI 1080 Steel, oil-quenched and tempered at 315 °C  
- Locally reduced cross-section near the gauge to increase strain  
- Updated dimensions:
  - h = 0.52 in  
  - b = 0.45 in  
  - c = 0.25 in  

The improved design was modeled in Fusion 360 and imported into ANSYS for FEA.

Improved CAD geometry and dimensions:  
![Improved CAD Overview](../assets/images/2025-torquewrench/image_051.png)  
![Improved CAD Detail](../assets/images/2025-torquewrench/image_031.png)

Strain-gauge placement and cross-section:  
![Gauge Coordinates](../assets/images/2025-torquewrench/image_033.png)  
![Gauge Region Detail](../assets/images/2025-torquewrench/image_034.png)

Loading and boundary conditions:  
![Loading Diagram](../assets/images/2025-torquewrench/image_035.png)

FEA of the improved design showed:

- Max principal stress: **≈ 51 ksi**  
- Strain at gauge: **9.07e–4 in/in**  
- Load-point deflection: **≈ 0.371 in**  
- Full-bridge output with GF ≈ 2.1: **1.91 mV/V** (almost 2× the required sensitivity)

Strain distribution at the probe location:  
![Improved Strain Probe Overview](../assets/images/2025-torquewrench/image_036.png)  
![Improved Strain Probe Zoom](../assets/images/2025-torquewrench/image_037.png)

Maximum principal stress:  
![Improved Max Principal Stress](../assets/images/2025-torquewrench/image_038.png)  
![Improved Stress Distribution](../assets/images/2025-torquewrench/image_039.png)

Load-point deflection and gauge strain values:  
![Improved Deflection](../assets/images/2025-torquewrench/image_040.png)  
![Improved Strain Values](../assets/images/2025-torquewrench/image_041.png)

---

### **3. Strain-Gauge Selection and Sensitivity**

To instrument the wrench, I selected a compact, full-bridge strain-gauge configuration that fits within the <0.45 in width constraint and aligns with the principal bending strain.

Example candidate and gauge-factor detail from vendor listing:  
![Gauge Listing](../assets/images/2025-torquewrench/image_042.png)  
![Gauge Factor Detail](../assets/images/2025-torquewrench/image_043.png)

Datasheet for a manufacturer-recommended alternative:  
![Gauge Datasheet](../assets/images/2025-torquewrench/image_044.png)

Using the FEA strain at the gauge location for the improved design:

- ε_full-scale ≈ 9.07e–4 in/in  
- GF ≈ 2.1  

Predicted outputs:

- Full bridge: **1.91 mV/V**  
- Half bridge: **0.95 mV/V**  
- Quarter bridge: **0.48 mV/V**

The full-bridge configuration easily meets the 1.0 mV/V requirement and provides improved signal-to-noise ratio and temperature compensation.

---

##  Generative Design Concept (Fusion 360)

To go beyond a traditional  wrench design, I used Fusion 360’s **Generative Design** tool to create topology-optimized versions of the wrench that follow load paths and remove non-critical material.

Generative setup and parameters:  
![Generative Setup](../assets/images/2025-torquewrench/image_015.png)

Example generative design trials:  
![Generative Trial 1](../assets/images/2025-torquewrench/image_016.png)  
![Generative Trial 2](../assets/images/2025-torquewrench/image_017.png)  
![Generative Trial 3 (Final)](../assets/images/2025-torquewrench/image_018.png)

These concepts preserve the drive and gauge regions while aggressively removing material along the handle.

---

##  Generative Design FEA Results

The final generative design candidate was brought back into ANSYS for evaluation.

Deformation under 600 in·lbf:  
![Generative Deformation](../assets/images/2025-torquewrench/image_019.png)

- Generative design deformation: **0.61 in**  
- Improved  design deformation: **0.371 in**

This shows that the generative geometry is significantly more compliant, which is expected given its lightweight nature.

Normal stress distribution:  
![Generative Normal Stress](../assets/images/2025-torquewrench/image_020.png)

Although peak normal stresses are higher (around 75 ksi), they are conservative because:

- The load is modeled as a concentrated force at the very end of the handle  
- Real users apply force over a finite grip length, which distributes the load  
- Small radii and internal features in generative designs tend to produce local stress spikes in FEA

Principal stress visualization:  
![Generative Principal Stress 1](../assets/images/2025-torquewrench/image_021.png)  
![Generative Principal Stress 2](../assets/images/2025-torquewrench/image_022.png)

---

##  Volume & Mass Comparison

A key outcome of the generative workflow is the dramatic reduction in volume (and thus mass) relative to the original solid wrench.

Volume comparison:  
![Generative Volume](../assets/images/2025-torquewrench/image_023.png)

- Original  beam design volume: **4.071 in³**  
- Generative design volume: **1.155 in³**  
- Volume (and mass) reduction: **> 70%**

This illustrates the trade-off between structural efficiency (lower mass, material savings) and stiffness (higher deflection) when adopting generative topologies.

---

##  Tools Used

- **ANSYS Workbench** — Structural FEA  
- **MATLAB** — Hand-calculation script for beam and fracture mechanics  
- **Autodesk Fusion 360** — CAD modeling + Generative Design  
- **Micro-Measurements / similar CEA series gauges** — Strain-gauge implementation concept  
- **Granta / Materials database** — Material property selection and verification  

---

##  Full Project Repository

The complete set of scripts, CAD models, FEA result exports, and generative design files is available in the GitHub repository:

👉 **GitHub Repository:**  
https://github.com/Cornell-MAE-UG/fa25-portfolio-mmmb8  


