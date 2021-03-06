%% Readme, clearing workspace, closing figures
% This will calculate single input excitation (SIE) sensitivities for a
% 2-input 2-output system or a 15-input 7-output system. In the "System
% size selection" section choose the size system you want by uncommenting
% the appropriate line for "mysys" and comment out the other one. For the
% 2-input 2-ouput system you can choose to run with or without impedance
% coupling by toggling the "noImpedanceCoupling" variable between 1 (WITH
% impedance coupling) and 0 (WITHOUT impedance coupling). Choose whether to
% calculate sensitivities or just plot by toggling "plotOnly" between 1
% (load previously calculated sensitivities and plot) and 0 (calculate new
% sensitivities and plot). Choose to calculate new transfer function matrix
% or load a previously calculated matrix by toggling "calcT2" (1 =
% calculate new transfer function matrix, 0 = load previously calculated
% transfer function. The Seval3_norm structure that is created is the main
% sensitivity result we care about. It is saved as a structure where the
% elements of the structure are the parameter names (e.g.
% Seval3_norm(1,1).I11.data would give you a 150 element vector which is
% the sensitivity of output 1 to I11 with only input 1 active for SIE
% sensitivities and would be the sensitivity of output 1 to I11 with all
% inputs active for AIE sensitivities.

clear; close all;

%% Get default parameters
default_params

%% System size selection
plotOnly = 0; % 1 to skip calculations and just plot
calcT2 = 0; % 1 would calculate new transfer function matrix rather than load previously calculated transfer functions
AIE_Sens = 1; % 1 calculates all input excitation sensitivities (sums rows of transfer function matrix)

% mysys = '2x2'; % 2-input 2-output model
noImpedanceCoupling = 0; % 1 to eliminate cross terms in I,D,K (only for 2-input 2-output system)

mysys = '15x7'; % 15-input 7-output model

%% Mimo 2x2
if strcmp(mysys,'2x2')
    % Grab muscle for wrist flexion
    t1val = t1_full(14,14);
    t2val = t2_full(14,14);
    C2temp  = C_full(14:15,14:15);
    C2val = [C2temp(1,1),C2temp(2,2)];
    
    % Grab moment arms for wrist flexion
    M2temp = M_full(6:7,14:15);
    M2val = [M2temp(1,1),M2temp(1,2),...
             M2temp(2,1),M2temp(2,2)];
    
    % Grab I, D, K for wrist flexion - extension
    I2temp = I_full(6:7,6:7);
    I2val = [I2temp(1,1),I2temp(1,2),I2temp(2,2)];
    D2temp = D_full(6:7,6:7);
    D2val = [D2temp(1,1),D2temp(1,2),D2temp(2,2)];
    K2temp = K_full(6:7,6:7);
    K2val = [K2temp(1,1),K2temp(1,2),K2temp(2,2)];
    if noImpedanceCoupling == 1
        I2val = [I2val(1),0,I2val(3)];
        D2val = [D2val(1),0,D2val(3)];
        K2val = [K2val(1),0,K2val(3)];
    end
    
    % Define symbolic variables
    t1 = sym('t1','real');
    t2 = sym('t2','real');

    syms I11 I12 I22
    I2 = [I11, I12;
          I12, I22];
    I2var = [I11, I12, I22];
    syms D11 D12 D22
    D2 = [D11, D12;
          D12, D22];
    D2var = [D11,D12,D22];
    syms K11 K12 K22
    K2 = [K11, K12;
          K12, K22];
    K2var = [K11,K12,K22];
    syms M11 M12 M21 M22
    M2 = [M11, M12;
          M21, M22];
    M2var = [M11,M12,...
             M21,M22];
    syms C11 C22
    C2 = [C11,   0;
            0, C22];
    C2var = [C11,C22];
    w2 = sym('w2','real');
    
    % Define values to replace symbolic variables
    myvals = [t1val t2val M2val C2val I2val D2val K2val w2];
    myvars = [t1 t2 M2var C2var I2var D2var K2var w2];
end

%% MIMO 15x7
if strcmp(mysys,'15x7')
    % Grab muscle for wrist flexion
    t1val = t1_full(14,14);
    t2val = t2_full(14,14);
    C2val  = [C_full(1,1), C_full(2,2), C_full(3,3), C_full(4,4), C_full(5,5), C_full(6,6), C_full(7,7), C_full(8,8), C_full(9,9), C_full(10,10), C_full(11,11), C_full(12,12), C_full(13,13), C_full(14,14), C_full(15,15)];
    
    % Grab moment arms for wrist flexion
    M2val = [M_full(1,1), M_full(1,2), M_full(1,3), M_full(1,4), M_full(1,5), M_full(1,6), M_full(1,7),...
             M_full(2,1), M_full(2,2), M_full(2,3), M_full(2,4), M_full(2,5), M_full(2,6), M_full(2,7),...
             M_full(3,1), M_full(3,2), M_full(3,3), M_full(3,4), M_full(3,5), M_full(3,6), M_full(3,7),...
             M_full(4,5), M_full(4,6), M_full(4,7), M_full(4,8), M_full(4,9), M_full(4,10), M_full(4,11), M_full(4,12), M_full(4,13), M_full(4,14), M_full(4,15),...
             M_full(5,5), M_full(5,6), M_full(5,10), M_full(5,11), M_full(5,12), M_full(5,13), M_full(5,14), M_full(5,15),...
             M_full(6,12), M_full(6,13), M_full(6,14), M_full(6,15),...
             M_full(7,12), M_full(7,13), M_full(7,14), M_full(7,15)];
    
    % Grab I, D, K for wrist flexion - extension
    I2val = [I_full(1,1), I_full(2,2), I_full(3,2), I_full(3,3), I_full(4,1), I_full(4,4), I_full(5,2), I_full(5,5), I_full(6,2), I_full(6,3), I_full(6,6), I_full(7,1), I_full(7,4), I_full(7,7)];
    D2val = [D_full(1,1), D_full(2,1), D_full(2,2), D_full(3,1), D_full(3,2), D_full(3,3), D_full(4,1), D_full(4,4), D_full(5,5), D_full(6,5), D_full(6,6), D_full(7,5), D_full(7,6), D_full(7,7)];
    K2val = [K_full(1,1), K_full(2,1), K_full(2,2), K_full(3,1), K_full(3,2), K_full(3,3), K_full(4,1), K_full(4,4), K_full(5,5), K_full(6,5), K_full(6,6), K_full(7,5), K_full(7,6), K_full(7,7)];
    
    % Define frequency vector
    w2val = (0.1:0.1:15)*2*pi;
    
    % Define symbolic variables
    t1 = sym('t1','real');
    t2 = sym('t2','real');
    syms I11 I22 I32 I33 I41 I44 I52 I55 I62 I63 I66 I71 I74 I77 real
    I2 = [I11,   0,   0, I41,   0,   0, I71;
            0, I22, I32,   0, I52, I62,   0;
            0, I32, I33,   0,   0, I63,   0;
          I41,   0,   0, I44,   0,   0, I74;
            0, I52,   0,   0, I55,   0,   0;
            0, I62, I63,   0,   0, I66,   0;
          I71,   0,   0, I74,   0,   0, I77];
    
    I2var = [I11, I22, I32, I33, I41, I44, I52, I55, I62, I63, I66, I71, I74, I77];
    
    syms K11 K21 K22 K31 K32 K33 K41 K44 K55 K65 K66 K75 K76 K77 real
    K2 = [K11, K21, K31, K41,   0,   0,   0;
          K21, K22,   0,   0,   0,   0,   0;
          K31, K32, K33,   0,   0,   0,   0;
          K41,   0,   0, K44,   0,   0,   0;
            0,   0,   0,   0, K55, K65, K75;
            0,   0,   0,   0, K65, K66, K76;
            0,   0,   0,   0, K75, K76, K77];
    
    K2var = [K11, K21, K22, K31, K32, K33, K41, K44, K55, K65, K66, K75, K76, K77];
    
    syms D11 D21 D22 D31 D32 D33 D41 D44 D55 D65 D66 D75 D76 D77 real
    D2 = [D11, D21, D31, D41,   0,   0,   0;
          D21, D22,   0,   0,   0,   0,   0;
          D31, D32, D33,   0,   0,   0,   0;
          D41,   0,   0, D44,   0,   0,   0;
            0,   0,   0,   0, D55, D65, D75;
            0,   0,   0,   0, D65, D66, D76;
            0,   0,   0,   0, D75, D76, D77];
    D2var = [D11, D21, D22, D31, D32, D33, D41, D44, D55, D65, D66, D75, D76, D77];  

    syms M11 M12 M13 M14 M15 M16 M17 M21 M22 M23 M24 M25 M26 M27 M31 M32 M33 M34 M35 M36 M37 real
    syms M45 M46 M47 M48 M49 M410 M411 M412 M413 M414 M415 M55 M56 M510 M511 M512 M513 M514 M515 M612 M613 M614 M615 real
    syms M712 M713 M714 M715 real
    
    M2 = [ M11, M12, M13, M14, M15, M16, M17,   0,   0,    0,    0,    0,    0,    0,    0;
           M21, M22, M23, M24, M25, M26, M27,   0,   0,    0,    0,    0,    0,    0,    0;
           M31, M32, M33, M34, M35, M36, M37,   0,   0,    0,    0,    0,    0,    0,    0;
             0,   0,   0,   0, M45, M46, M47, M48, M49, M410, M411, M412, M413, M414, M415;
             0,   0,   0,   0, M55, M56,   0,   0,   0, M510, M511, M512, M513, M514, M515;
             0,   0,   0,   0,   0,   0,   0,   0,   0,    0,    0, M612, M613, M614, M615;
             0,   0,   0,   0,   0,   0,   0,   0,   0,    0,    0, M712, M713, M714, M715];
    
    M2var = [ M11,  M12,  M13,  M14,  M15,  M16,  M17,...
              M21,  M22,  M23,  M24,  M25,  M26,  M27,...
              M31,  M32,  M33,  M34,  M35,  M36,  M37,...
              M45,  M46,  M47,  M48,  M49, M410, M411, M412, M413, M414, M415...
              M55,  M56, M510, M511, M512, M513, M514, M515...
             M612, M613, M614, M615...
             M712, M713, M714, M715];
         
    syms C11 C22 C33 C44 C55 C66 C77 C88 C99 C1010 C1111 C1212 C1313 C1414 C1515
    C2 = [C11,   0,   0,   0,   0,   0,   0,   0,   0,    0,      0,     0,     0,     0,     0;
        0, C22,   0,   0,   0,   0,   0,   0,   0,    0,      0,     0,     0,     0,     0;
        0,   0, C33,   0,   0,   0,   0,   0,   0,    0,      0,     0,     0,     0,     0;
        0,   0,   0, C44,   0,   0,   0,   0,   0,    0,      0,     0,     0,     0,     0;
        0,   0,   0,   0, C55,   0,   0,   0,   0,    0,      0,     0,     0,     0,     0;
        0,   0,   0,   0,   0, C66,   0,   0,   0,    0,      0,     0,     0,     0,     0;
        0,   0,   0,   0,   0,   0, C77,   0,   0,    0,      0,     0,     0,     0,     0;
        0,   0,   0,   0,   0,   0,   0, C88,   0,    0,      0,     0,     0,     0,     0;
        0,   0,   0,   0,   0,   0,   0,   0, C99,    0,      0,     0,     0,     0,     0;
        0,   0,   0,   0,   0,   0,   0,   0,   0, C1010,     0,     0,     0,     0,     0;
        0,   0,   0,   0,   0,   0,   0,   0,   0,     0, C1111,     0,     0,     0,     0;
        0,   0,   0,   0,   0,   0,   0,   0,   0,     0,     0, C1212,     0,     0,     0;
        0,   0,   0,   0,   0,   0,   0,   0,   0,     0,     0,     0, C1313,     0,     0;
        0,   0,   0,   0,   0,   0,   0,   0,   0,     0,     0,     0,     0, C1414,     0;
        0,   0,   0,   0,   0,   0,   0,   0,   0,     0,     0,     0,     0,     0, C1515];
    
    C2var = [C11, C22, C33, C44, C55, C66, C77, C88, C99, C1010, C1111, C1212, C1313, C1414, C1515];
    
    w2 = sym('w2','real');
    
    % Define values to replace symbolic variables
    myvals = [t1val t2val M2val C2val I2val D2val K2val w2];
    myvars = [t1 t2 M2var C2var I2var D2var K2var w2];
end

%% Define frequency vector and create transfer function matrix
w3 = (0.1:0.1:15.0)*2.0*pi;
if plotOnly
    % Do nothing, just skip to plotting
else
    tic
    if calcT2
        T2 = inv(-I2.*w2.^2 + D2*1i.*w2 + K2)*M2*inv(-(t1*t2).*w2.^2 + (t1+t2).*1i.*w2 + 1)*C2;
    else
        disp('Loading Transfer Function Matrix')
        load('T2.mat','T2')
    end
    toc
end

if AIE_Sens
    tempT2 = T2;
    clear T2
    for ii = 1:size(tempT2,1)
        T2(ii,1) = sum(tempT2(ii,:));
    end
end

%% Loop to run through transfer function matrix and calculate single input excitation (SIE) sensitivity for each parameter
if plotOnly
    % Do nothing, just skip to plotting
else
    tic
    f1 = waitbar(0,'Please wait...','Name','Calculating Sensitivities...');
    f1.Position = [237.0000  443.2500  270.0000   56.2500];
    for idx = 1:length(myvars)-1 % Index for the number of parameters
        f2 = waitbar(0,'Please wait...','Name','Working on Rows...');
        f2.Position = [508.5000  443.2500  270.0000   56.2500];
        for jdx = 1:size(T2,1) % Index for rows in Transfer function matrix (# of outputs)
            f3 = waitbar(0,'Please wait...','Name','Working on Columns...');
            f3.Position = [780.0000  443.2500  270.0000   56.2500];
            for kdx = 1:size(T2,2) % Index for columns in Transfer function matrix (# of inputs)
                % Define temporary vectors of parameters and their values, then
                % sub the values into the transfer function for all parameters
                % except the parameter of interest.
                tempmyvars = [myvars(1:idx-1) myvars(idx+1:end)];
                tempmyvals = [myvals(1:idx-1) myvals(idx+1:end)];
                tempT2 = subs(T2(jdx,kdx),tempmyvars,tempmyvals);
                
                % Find the numerator and denominator of the transfer function,
                % then take the magnitude.
                [num,den] = numden(tempT2);
                absT2num = sqrt(real(num).^2 + imag(num).^2);
                absT2den = sqrt(real(den).^2 + imag(den).^2);
                absT2 = absT2num./absT2den;
                
                % Take the derivative with respect to the parameter of
                % interest, calculate the normalized sensitivity, then sub in
                % value for parameter of interest and the frequency vector.
                S2_norm = diff(absT2,myvars(idx))*myvars(idx)/absT2;
                Seval2_norm = subs(S2_norm,myvars(idx),myvals(idx));
                Seval3_norm(jdx,kdx).(char(myvars(idx))).data = double(subs(Seval2_norm,w2,single(w3)));
                
                waitbar(kdx/size(T2,2),f3,[num2str(kdx/size(T2,2)*100),'% Complete (',num2str(kdx),' of ',num2str(size(T2,2)),')'])
            end
            close(f3)
            waitbar(jdx/size(T2,1),f2,[num2str(jdx/size(T2,1)*100),'% Complete (',num2str(jdx),' of ',num2str(size(T2,1)),')'])
        end
        close(f2)
        waitbar(idx/length(myvars),f1,[num2str(idx/length(myvars)*100),'% Complete (',num2str(idx),' of ',num2str(length(myvars)),')'])
    end
    close(f1)
    toc
end

%% Load or Save sensitivity matrix
if plotOnly
    % Load sensitivity data
    if strcmp(mysys,'2x2')
        if noImpedanceCoupling == 1
            file2Load = 'TwobyTwo_SIE_Sensitivity_No_Impedance_Coupling.mat';
        else
            file2Load = 'TwobyTwo_SIE_Sensitivity.mat';
        end
    elseif strcmp(mysys,'15x7')
        file2Load = 'Full_SIE_Sensitivity_S_Only.mat';
    else
        disp('No matching system size, and no file loaded.')
    end
else    
    if strcmp(mysys,'2x2')
        if noImpedanceCoupling == 1
            save('TwobyTwo_SIE_Sensitivity_No_Impedance_Coupling.mat','Seval3_norm','T2')
        else
            save('TwobyTwo_SIE_Sensitivity.mat','Seval3_norm','T2')
        end
    elseif strcmp(mysys,'15x7')
        save('Full_SIE_Sensitivity.mat','Seval3_norm','T2')
        save('Full_SIE_Sensitivity_S_Only.mat','Seval3_norm')
    else
        disp('No matching system size, and no file saved.')
    end
end

%% Plotting - Not currently functioning in conjuction with this script, use Plot_Outputs_2by2_Main and Plot_Outputs_Main instead
% if strcmp(mysys,'2x2')
%     Plot_Outputs_2by2_Main
% elseif strcmp(mysys,'15x7')
%     Plot_Outputs_Main
% else
%     disp('No matching system size, and nothing plotted')
% end