# Dielctric function simulation Implementation for Silver (Ag)

This repository contains a MATLAB implementation of the Drude model to calculate the dielectric function of silver (Ag) using both the Lorentz and Drude models. The code compares theoretical models with experimental data (JC data) for silver's dielectric function.

## Overview

The dielectric function is computed using:
1. **Lorentz Model**: A combination of Lorentz oscillators that contribute to the dielectric function of metals.
2. **Drude Model**: Describes the free-electron contribution to the dielectric function of metals, specifically for silver.

The dielectric function has two parts:
- **Real part** : Describes the dispersion of the material.
- **Imaginary part** : Describes the absorption losses in the material.

The results are compared with **JC experimental data** for silver, which includes both real and imaginary parts of the dielectric function.

## Equations

The dielectric function is given by the Drude model equations:


![drude equations](https://github.com/user-attachments/assets/0629d74a-ef98-473e-b522-25a31061af7d)


The dielectric functinon is given by the L4 model equations: 


![qu](https://github.com/user-attachments/assets/444ea375-f186-4bf3-b4e3-274103f94b29)

using the table:
![table of lorientz terms](https://github.com/user-attachments/assets/892791a6-9894-484a-9d6f-dd09056e6f34)



## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/drude-model-silver.git
   cd drude-model-silver






![lorentz-drude simulation1](https://github.com/user-attachments/assets/4e46315e-4a08-4567-a692-50e0d7250fa7)


