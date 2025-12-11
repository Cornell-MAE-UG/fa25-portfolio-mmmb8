% ========================================================================
%  blade_design_tools.m
%  MATLAB tools for low-Re turbine blade design, CFD preparation,
%  torque prediction, and structural safety analysis.
%
%  Author: Matthew Bulger
%  Date: 2025
%
%  Includes:
%    1. Weibull wind-speed & Reynolds-number estimator
%    2. Airfoil comparison: S1223 vs NACA 4412
%    3. Blade-element torque model
%    4. Structural bending / failure-speed estimator
% ========================================================================

%% ========================================================================
% 1. WEIBULL WIND-SPEED & REYNOLDS ESTIMATION
% ========================================================================
function reynolds_report = reynolds_tools()
    k = 5; c = 5;                        % Weibull parameters
    chord = 0.0508;                      % 2 in chord (m)
    nu = 1.5e-5;                         % kinematic viscosity (m^2/s)

    U = linspace(0, 20, 2000);
    pdf = (k/c) .* (U./c).^(k-1) .* exp(-(U./c).^k);

    q5  = c * (-log(1-0.05))^(1/k);
    q95 = c * (-log(1-0.95))^(1/k);
    Umean = c * gamma(1+1/k);

    Re5 = q5*chord/nu;
    Re95 = q95*chord/nu;
    Remean = Umean*chord/nu;

    reynolds_report = struct( ...
        "U5", q5, ...
        "U95", q95, ...
        "Umean", Umean, ...
        "Re5", Re5, ...
        "Re95", Re95, ...
        "Remean", Remean);

    figure; hold on; grid on;
    plot(U,pdf,'LineWidth',1.6);
    title('Weibull Wind-Speed Distribution');
    xlabel('U [m/s]'); ylabel('pdf');
end

%% ========================================================================
% 2. AIRFOIL COMPARISON: S1223 vs NACA 4412
% ========================================================================
function airfoil_comparison()
    alpha = 0:1:15;

    % Approximate low-Re data:
    Cl_s = [0 0.3 0.6 0.9 1.2 1.45 1.65 1.8 1.85 1.88 1.85 1.75 1.6 1.3 1.0 0.5];
    Cd_s = [0.015 0.016 0.017 0.018 0.020 0.022 0.025 0.029 0.033 0.038 0.045 0.055 0.065 0.075 0.085 0.10];

    Cl_n = [0 0.25 0.5 0.7 0.85 0.95 1.0 1.05 1.05 1.0 0.95 0.85 0.7 0.5 0.3 0.1];
    Cd_n = [0.018 0.019 0.021 0.023 0.026 0.03 0.035 0.04 0.045 0.05 0.055 0.065 0.075 0.085 0.095 0.11];

    figure; hold on; grid on;
    plot(alpha,Cl_s,'LineWidth',1.8);
    plot(alpha,Cl_n,'LineWidth',1.8);
    legend('S1223','NACA 4412'); xlabel('\alpha [deg]'); ylabel('C_L');
    title('Lift Curve Comparison');

    figure; hold on; grid on;
    plot(alpha, Cl_s./Cd_s,'LineWidth',1.8);
    plot(alpha, Cl_n./Cd_n,'LineWidth',1.8);
    legend('S1223','NACA 4412');
    xlabel('\alpha [deg]'); ylabel('C_L/C_D');
    title('Aerodynamic Efficiency');
end

%% ========================================================================
% 3. TORQUE PREDICTOR — SIMPLE BLADE ELEMENT MODEL
% ========================================================================
function torque_report = torque_predictor()
    lambda = 3;
    rpm = 900;
    omega = rpm/60*2*pi;

    rho = 1.225;
    N = 3;

    U = [2.76 4.59 6.23];

    CL = 1.1; CLmax = 1.3; CD = 0.03;

    cr = 0.0508; ct = 0.010;             % root/tip chord in m
    rfrac = linspace(0.25,1,200);
    R = lambda*U/omega;

    torque_report = struct();

    for k = 1:length(U)
        Uk = U(k);
        Rk = R(k);
        r = rfrac*Rk;
        c = cr + (ct-cr)*(rfrac);

        phi = atan(Uk./(omega*r));
        Vrel = sqrt(Uk^2 + (omega*r).^2);

        dL = 0.5*rho*Vrel.^2 .* c .* CL;
        dD = 0.5*rho*Vrel.^2 .* c .* CD;

        dFt = dL.*sin(phi) - dD.*cos(phi);
        dT = r .* dFt;

        T = 3*trapz(r,dT);
        P = T*omega;

        torque_report(k).U = Uk;
        torque_report(k).Torque = T;
        torque_report(k).Power = P;
    end
end

%% ========================================================================
% 4. STRUCTURAL FAILURE / BENDING STRESS
% ========================================================================
function failure_report = bending_safety()
    % geometric assumption for solid rectangular cross section:
    chord = 0.0508;
    t = 0.12*chord;
    b = chord;

    I = b*t^3/12;
    Z = I/(t/2);

    sigma_allow = 38e6;
    M_limit = sigma_allow * Z;

    % linear scaling: M ~ U^2 at constant TSR
    Uref = 4.59;
    Mref = 0.002; % placeholder moment [N*m], replace with actual BEM value

    Ucrit = Uref * sqrt(M_limit/Mref);

    failure_report = struct("Mlimit",M_limit,"Ucrit",Ucrit);
end
