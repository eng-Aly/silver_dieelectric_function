% Parameters for Ag (Silver)
epsilon_inf = 1.0;  % High-frequency dielectric constant
sigma_epsilon0 = 3157.56;  % Conductivity over epsilon_0
A_p = [-1.160e5, -4.252, -0.4960, -2.118];  % Ap [eV]
B_p = [-3050, -0.8385, -13.85, -10.23];     % Bp [eV^2]
C_p = [3.634e8, 112.2, 1.815, 14.31];       % Cp [eV^2]

% Drude model parameters
omega_p = 9.17;  % Plasma frequency in eV for silver
gamma = 0.021;   % Damping factor (collision frequency) in eV

% Energy (eV) and Angular Frequency (omega)
energy = linspace(0.5, 10, 1000);  % Energy range from 0.5 to 10 eV
omega = energy;  % Assume h-bar omega ≈ energy in eV

% Initialize real and imaginary parts of the dielectric function
epsilon_real = epsilon_inf * ones(size(omega));
epsilon_imag = -sigma_epsilon0 ./ omega;  % Conductivity term

% Calculate the dielectric function using the Lorentz model
for p = 1:4
    denom = (omega.^2 + B_p(p)).^2 + (A_p(p) .* omega).^2;
    epsilon_real = epsilon_real + C_p(p) .* (omega.^2 + B_p(p)) ./ denom;
    epsilon_imag = epsilon_imag - C_p(p) .* (A_p(p) .* omega) ./ denom;
end

% Drude model calculation
epsilon_real_drude = epsilon_inf - (omega_p^2 ./ (omega.^2 + gamma^2));
epsilon_imag_drude = (omega_p^2 .* gamma) ./ (omega .* (omega.^2 + gamma^2));

% Johnson-Christy (JC) Data
eV = [0.64, 0.77, 0.89, 1.02, 1.14, 1.26, 1.39, 1.51, 1.64, 1.76, ...
      1.88, 2.01, 2.13, 2.26, 2.38, 2.50, 2.63, 2.75, 2.88, 3.00, ...
      3.12, 3.25, 3.37, 3.50, 3.62, 3.74, 3.87, 3.99, 4.12, 4.24, ...
      4.36, 4.49, 4.61, 4.74, 4.86, 4.98, 5.11, 5.23, 5.36, 5.48, ...
      5.60, 5.73, 5.85, 5.98, 6.10, 6.22, 6.35, 6.47, 6.60];

n = [0.24, 0.15, 0.13, 0.09, 0.04, 0.04, 0.04, 0.04, 0.04, 0.04, ...
     0.05, 0.06, 0.05, 0.06, 0.05, 0.05, 0.05, 0.05, 0.04, 0.05, ...
     0.05, 0.05, 0.07, 0.10, 0.14, 0.17, 0.81, 1.13, 1.34, 1.39, ...
     1.41, 1.41, 1.38, 1.35, 1.33, 1.31, 1.30, 1.28, 1.28, 1.26, ...
     1.25, 1.22, 1.20, 1.18, 1.15, 1.14, 1.12, 1.10, 1.07];

k = [14.08, 11.85, 10.10, 8.828, 7.795, 6.992, 6.312, 5.727, 5.242, ...
     4.898, 4.483, 4.152, 3.858, 3.586, 3.324, 3.093, 2.869, 2.657, ...
     2.462, 2.275, 2.070, 1.864, 1.657, 1.419, 1.142, 0.829, 0.392, ...
     0.616, 0.964, 1.161, 1.264, 1.331, 1.372, 1.387, 1.393, 1.389, ...
     1.378, 1.367, 1.357, 1.344, 1.342, 1.336, 1.325, 1.312, 1.296, ...
     1.277, 1.255, 1.232, 1.212];

% Calculate complex refractive index N = n + ik
N = n + 1i * k;

% Calculate Johnson-Christy dielectric function e_jc = N^2
e_jc = N .* N;
e_real_jc = real(e_jc);
e_imag_jc = imag(e_jc);

% Plotting the results
figure;

% Real part plot
subplot(2, 1, 1);
plot(energy, epsilon_real, 'r', 'LineWidth', 2);
hold on;
plot(energy, epsilon_real_drude, 'g', 'LineWidth', 2);  % Drude real part
plot(eV, e_real_jc, 'bo-', 'LineWidth', 1.5);  % JC real part
xlabel('Energy (eV)');
ylabel('Re[\epsilon(\omega)]');
title('Real part of Dielectric Function (\epsilon) for Silver (Ag)');
legend('Lorentz Model', 'Drude Model', 'JC Data');
grid on;
xlim([0.5, 10]);
ylim([-300, 2]);

% Imaginary part plot
subplot(2, 1, 2);
plot(energy, epsilon_imag * -1, 'r', 'LineWidth', 2);
hold on;
plot(energy, epsilon_imag_drude, 'g', 'LineWidth', 2);  % Drude imaginary part
plot(eV, e_imag_jc, 'bo-', 'LineWidth', 1.5);  % JC imaginary part
xlabel('Energy (eV)');
ylabel('Im[\epsilon(\omega)]');
title('Imaginary part of Dielectric Function (\epsilon) for Silver (Ag)');
legend('Lorentz Model', 'Drude Model', 'JC Data');
grid on;
xlim([0.5, 10]);
