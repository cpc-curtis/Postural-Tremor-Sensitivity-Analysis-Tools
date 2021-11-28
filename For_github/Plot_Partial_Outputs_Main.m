if exist('file2Load')
    data = load(file2Load,'Seval3_norm');
    S = data.Seval3_norm;
else
    S = Seval3_norm;
end
w = 0.1:0.1:15;

myvars = fieldnames(S);

var_of_interest = myvars;
trem_idx = find(w >= 4 & w<=8);
iFig = length(get(0,'Children'));

for idx = 1:length(var_of_interest)     
    for jdx = 1:size(S,1)
        for kdx = 1:size(S,2)
            meanS.(char(var_of_interest(idx)))(jdx,kdx) = abs(mean(S(jdx,kdx).(char(var_of_interest(idx))).data(trem_idx)));    
            stdDevS.(char(var_of_interest(idx)))(jdx,kdx) = std((S(jdx,kdx).(char(var_of_interest(idx))).data(trem_idx)));
        end
    end
end

%% Plot each matrix sensitivity
Plot_Partial_Outputs_Sensitivity_Mean_By_Matrix
% Plot_Partial_Outputs_Sensitivity_Mean_By_Matrix_Single_Figure

%% Plot Total sensitivity
Plot_Partial_Outputs_Sensitivity_Total_and_Max
