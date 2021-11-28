clear; %close all;

file2Load = 'Full_Sensitivity_Outputs_Correct_C_Sonly.mat';
% file2Load = 'TwobyTwo_Sensitivity_No_Impedance_Coupling_Outputs_Correct_C.mat';
% file2Load = 'TwobyTwo_Sensitivity_Outputs_Correct_C.mat';

if strcmp(file2Load,'Full_Sensitivity_Stot.mat')
    S = data.Stot;
    w = 0.1:0.1:15;
elseif strcmp(file2Load,'Full_Sensitivity_Full_Dmatrix_Sonly.mat') || strcmp(file2Load,'Full_Sensitivity_Full_Dmatrix_Fine_Outputs_Sonly.mat')
    S = data.S;
    w = 0.1:0.1:15;
elseif strcmp(file2Load,'TwobyTwo_Sensitivity_No_Impedance_Coupling_Outputs.mat') || strcmp(file2Load,'TwobyTwo_Sensitivity_Outputs.mat') || strcmp(file2Load,'Full_Sensitivity_Full_Dmatrix_Fine_Outputs_Correct_M_Sonly.mat')...
        || strcmp(file2Load,'Full_Sensitivity_Outputs_neg1_2ndrow_nonzero_1strow_Sonly.mat') || strcmp(file2Load,'Full_Sensitivity_Outputs_nonzero_1strow_no_neg1_2ndrow_Sonly.mat') || strcmp(file2Load,'Full_Sensitivity_Outputs_nonzero_1strow_neg1_2ndrow_Sonly.mat')...
        || strcmp(file2Load,'TwobyTwoTest_Sensitivity_No_Impedance_Coupling_Outputs.mat') || strcmp(file2Load,'Full_Sensitivity_Outputs_Correct_C_Sonly.mat')...
        || strcmp(file2Load,'TwobyTwo_Sensitivity_No_Impedance_Coupling_Outputs_Correct_C.mat') || strcmp(file2Load,'TwobyTwo_Sensitivity_Outputs_Correct_C.mat')
    data = load(file2Load,'Seval3_norm');
    S = data.Seval3_norm;
    w = 0.1:0.1:15;
else    
    S = data.Seval3;
    w = 0:0.1:15;
end

myvars = fieldnames(S);

var_of_interest = myvars;
trem_idx = find(w >= 4 & w<=8);
iFig = length(get(0,'Children'));

for kdx = 1:length(var_of_interest)     
    for idx = 1:size(S,1)
        meanS.(char(var_of_interest(kdx)))(idx) = abs(mean(S(idx).(char(var_of_interest(kdx))).data(trem_idx)));    
        stdDevS.(char(var_of_interest(kdx)))(idx) = std((S(idx).(char(var_of_interest(kdx))).data(trem_idx)));
    end
end

%% Plot each matrix sensitivity
% Plot_Outputs_Sensitivity_Mean_By_Matrix
% Plot_Outputs_Sensitivity_StdDev_By_Matrix
Plot_Outputs_Sensitivity_Mean_By_Matrix_Single_Figure

%% Plot total Sensitivity
Plot_Outputs_Sensitivity_Total_and_Max

%% Plot Sensitivity by Output
% Plot_Outputs_Sensitivity_Mean_By_Output
% Plot_Outputs_Sensitivity_StdDev_By_Output


