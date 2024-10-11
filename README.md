# Dieelctric function simulation Implementation for Silver (Ag)

This repository contains a MATLAB implementation of the Drude model to calculate the dielectric function of silver (Ag) using both the Lorentz and Drude models. The code compares theoretical models with experimental data (JC data) for silver's dielectric function.

## Overview

The dielectric function is computed using:
1. **Lorentz Model**: A combination of Lorentz oscillators that contribute to the dielectric function of metals.
2. **Drude Model**: Describes the free-electron contribution to the dielectric function of metals, specifically for silver.

The dielectric function has two parts:
- **Real part** (`epsilon_1`): Describes the dispersion of the material.
- **Imaginary part** (\(\epsilon_2\)): Describes the absorption losses in the material.

The results are compared with **JC experimental data** for silver, which includes both real and imaginary parts of the dielectric function.

## Equations

The dielectric function is given by the Drude model equations:

- Real part (\(\epsilon_1(\omega)\)):
  \[
  \epsilon_1(\omega) = \epsilon_\infty - \frac{\omega_p^2}{\omega^2 + \Gamma^2}
  \]
  
- Imaginary part (\(\epsilon_2(\omega)\)):
  \[
  \epsilon_2(\omega) = \frac{\omega_p^2 \Gamma}{\omega (\omega^2 + \Gamma^2)}
  \]

Where:
- \(\omega_p\) is the plasma frequency.
- \(\Gamma\) is the damping constant.
- \(\omega\) is the frequency (in eV).
- \(\epsilon_\infty\) is the high-frequency dielectric constant.

## Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/drude-model-silver.git
   cd drude-model-silver
