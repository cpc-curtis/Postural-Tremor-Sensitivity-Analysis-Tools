clear; close all;

% Load partial output files
file2Load_P_without = 'TwobyTwo_Sensitivity_No_Impedance_Coupling_Correct_C.mat';
file2Load_P_with = 'TwobyTwo_Sensitivity_Correct_C.mat';

% Load total output files
file2Load_T_without = 'TwobyTwo_Sensitivity_No_Impedance_Coupling_Outputs_Correct_C.mat';
file2Load_T_with = 'TwobyTwo_Sensitivity_Outputs_Correct_C.mat';

% Parse files
data_P_without = load(file2Load_P_without,'Seval3_norm');
data_P_with = load(file2Load_P_with,'Seval3_norm');
data_T_without = load(file2Load_T_without,'Seval3_norm');
data_T_with = load(file2Load_T_with,'Seval3_norm');

S_P_without = data_P_without.Seval3_norm;
S_P_with = data_P_with.Seval3_norm;
S_T_without = data_T_without.Seval3_norm;
S_T_with = data_T_with.Seval3_norm;

% Define frequency vector
w = 0.1:0.1:15;

myvars = fieldnames(S_T_without);

var_of_interest = myvars;
trem_idx = find(w >= 4 & w<=8);

for kdx = 1:length(var_of_interest)     
    for idx = 1:size(S_T_without,1)
        for jdx = 1:size(S_T_without,2)
            % Pull out mean of each file
            meanS_P_without.(char(var_of_interest(kdx)))(idx,jdx) = abs(mean(S_P_without(idx,jdx).(char(var_of_interest(kdx))).data(trem_idx)));
            meanS_P_with.(char(var_of_interest(kdx)))(idx,jdx) = abs(mean(S_P_with(idx,jdx).(char(var_of_interest(kdx))).data(trem_idx)));
            meanS_T_without.(char(var_of_interest(kdx)))(idx,jdx) = abs(mean(S_T_without(idx,jdx).(char(var_of_interest(kdx))).data(trem_idx)));
            meanS_T_with.(char(var_of_interest(kdx)))(idx,jdx) = abs(mean(S_T_with(idx,jdx).(char(var_of_interest(kdx))).data(trem_idx)));
            
            % Pull out stdDev of each file
            stdDevS_P_without.(char(var_of_interest(kdx)))(idx,jdx) = std((S_P_without(idx,jdx).(char(var_of_interest(kdx))).data(trem_idx)));
            stdDevS_P_with.(char(var_of_interest(kdx)))(idx,jdx) = std((S_P_with(idx,jdx).(char(var_of_interest(kdx))).data(trem_idx)));
            stdDevS_T_without.(char(var_of_interest(kdx)))(idx,jdx) = std((S_T_without(idx,jdx).(char(var_of_interest(kdx))).data(trem_idx)));
            stdDevS_T_with.(char(var_of_interest(kdx)))(idx,jdx) = std((S_T_with(idx,jdx).(char(var_of_interest(kdx))).data(trem_idx)));
        end
    end
end

%% Plot grid of figures for partial, total, without impedance coupling, with impedance coupling
% Organize mean sensitivities by variable
for idx = 1:length(var_of_interest)
    meanS_P_without_tot(idx,:) = meanS_P_without.(char(var_of_interest(idx)));
    meanS_P_with_tot(idx,:) = meanS_P_with.(char(var_of_interest(idx)));
    meanS_T_without_tot(idx,:) = meanS_T_without.(char(var_of_interest(idx)));
    meanS_T_with_tot(idx,:) = meanS_T_with.(char(var_of_interest(idx)));
end

% Mean
figure
tlo = tiledlayout(2,2);

% Plot partial outputs without impedance coupling
h(1) = nexttile(tlo,1);
imAlpha = ones(17,2);
imAlpha(find(meanS_P_without_tot == 0)) = 0;
imagesc(meanS_P_without_tot','AlphaData',imAlpha');
colormap(jet)
xticks([1:17])
set(gca,'XTickLabel',var_of_interest)
for idx = 1:length(var_of_interest)
    if idx == 1; yline(idx + 0.5,'k','LineWidth',2); end
    xline(idx + 0.5,'k','LineWidth',2)
end
yticks([1:2])
yticklabels({'WFE','WRUD'})
ttl = title('(a) Partial Sensitivities Without Impedance Coupling');
ttl.FontSize = 20;
colorbar

% Plot partial outputs with impedance coupling
h(2) = nexttile(tlo,3);
imAlpha = ones(17,2);
imAlpha(find(meanS_P_with_tot == 0)) = 0;
imagesc(meanS_P_with_tot','AlphaData',imAlpha');
colormap(jet)
xticks([1:17])
set(gca,'XTickLabel',var_of_interest)
for idx = 1:length(var_of_interest)
    if idx == 1; yline(idx + 0.5,'k','LineWidth',2); end
    xline(idx + 0.5,'k','LineWidth',2)
end
yticks([1:2])
yticklabels({'WFE','WRUD'})
ttl = title('(c) Partial Sensitivities With Impedance Coupling');
ttl.FontSize = 20;
colorbar

% Plot total outputs without impedance coupling
h(3) = nexttile(tlo,2);
imAlpha = ones(17,2);
imAlpha(find(meanS_T_without_tot == 0)) = 0;
imagesc(meanS_T_without_tot','AlphaData',imAlpha');
colormap(jet)
xticks([1:17])
set(gca,'XTickLabel',var_of_interest)
for idx = 1:length(var_of_interest)
    if idx == 1; yline(idx + 0.5,'k','LineWidth',2); end
    xline(idx + 0.5,'k','LineWidth',2)
end
yticks([1:2])
yticklabels({'WFE','WRUD'})
ttl = title('(b) Total Sensitivities Without Impedance Coupling');
ttl.FontSize = 20;
colorbar

% Plot total outputs with impedance coupling
h(4) = nexttile(tlo,4);
imAlpha = ones(17,2);
imAlpha(find(meanS_T_with_tot == 0)) = 0;
imagesc(meanS_T_with_tot','AlphaData',imAlpha');
colormap(jet)
xticks([1:17])
set(gca,'XTickLabel',var_of_interest)
for idx = 1:length(var_of_interest)
    if idx == 1; yline(idx + 0.5,'k','LineWidth',2); end
    xline(idx + 0.5,'k','LineWidth',2)
end
yticks([1:2])
yticklabels({'WFE','WRUD'})
ttl = title('(d) Total Sensitivities With Impedance Coupling');
ttl.FontSize = 20;
colorbar

% ttl = title(tlo,'Two-Input Two-Output Mean Total Output Sensitivities For All DOF');
% ttl.FontSize = 20;

%% Plot frequency plot for partial with and without impedance coupling
DOF = 1;
muscle = 1;
trem_idx = find(w >= 4 & w<=8);

% figure('Units','normalized','Position',[0 0 1 1])
figure
tlo = tiledlayout(2,2);
myMap = colormap(flipud(jet));
% Plot without impedance coupling
h2(1) = nexttile(tlo);
hold on
for kdx = 1:length(var_of_interest)     
    for idx = DOF
        for jdx = muscle
            plot_color = myMap(kdx*15,:);
            plot(w,S_P_without(idx,jdx).(char(var_of_interest(kdx))).data,'LineWidth',2,'DisplayName',char(var_of_interest(kdx)),'Color',plot_color)
        end
    end
end
h1 = get(gca);
grid on
patch([4,8,8,4],[h1.YLim(1),h1.YLim(1),h1.YLim(2),h1.YLim(2)],'b','LineStyle','none','DisplayName','Tremor Band')
alpha(0.1)
ylabel('Sensitivity')
xlabel('Frequency (Hz)')
ttl = title('(a) Partial Sensitivities WITHOUT Impedance Coupling');
ttl.FontSize = 15;

% Plot with impedance coupling
h2(1) = nexttile(tlo,3);
hold on
for kdx = 1:length(var_of_interest)     
    for idx = DOF
        for jdx = muscle
            plot_color = myMap(kdx*15,:);
            plot(w,S_P_with(idx,jdx).(char(var_of_interest(kdx))).data,'LineWidth',2,'DisplayName',char(var_of_interest(kdx)),'Color',plot_color)
        end
    end
end
h1 = get(gca);
grid on
patch([4,8,8,4],[h1.YLim(1),h1.YLim(1),h1.YLim(2),h1.YLim(2)],'b','LineStyle','none','DisplayName','Tremor Band')
alpha(0.1)
ylabel('Sensitivity')
xlabel('Frequency (Hz)')
ttl = title('(b) Partial Sensitivities WITH Impedance Coupling');
ttl.FontSize = 15;

% Create axis labels
ylab = ylabel(tlo,'Sensitivity');
xlab = xlabel(tlo,'Frequency (Hz)');
ylab.FontSize = 20;
xlab.FontSize = 20;
% ttl = title(tlo,'Two-Input Two-Output Partial Sensitivities Over Frequency (ECRB/ECRL to WFE)');
% ttl.FontSize = 20;

% % Plot common legend
% leg = legend(h2(end));  
% leg.Layout.Tile = 'east';

% figure;
% plot(w,[S_P_with(1,1).M11.data;S_P_with(1,1).M21.data],'LineWidth',2)
% hold on;
% plot(w,S_P_with(1,1).M11.data + S_P_with(1,1).M21.data,'LineWidth',2)
% ylab = ylabel('Sensitivity');
% xlab = xlabel('Frequency (Hz)');
% ylab.FontSize = 20;
% xlab.FontSize = 20;
% h1 = get(gca);
% grid on
% patch([4,8,8,4],[h1.YLim(1),h1.YLim(1),h1.YLim(2),h1.YLim(2)],'b','LineStyle','none','DisplayName','Tremor Band')
% alpha(0.1)
% legend('M11','M21','M11 + M21')
% ttl = title('Two-Input Two-Output Partial Sensitivities of M Without Impedence Coupling');
% ttl.FontSize = 20;


%% Plot frequency plot for total with and without impedance coupling
DOF = 1;
muscle = 1;
trem_idx = find(w >= 4 & w<=8);

% figure('Units','normalized','Position',[0 0 1 1])
% tlo = tiledlayout(2,1);
myMap = colormap(flipud(jet));
% Plot without impedance coupling
h(3) = nexttile(tlo,2);
hold on
for kdx = 1:length(var_of_interest)     
    for idx = DOF
        for jdx = muscle
            plot_color = myMap(kdx*15,:);
            plot(w,S_T_without(idx,jdx).(char(var_of_interest(kdx))).data,'LineWidth',2,'DisplayName',char(var_of_interest(kdx)),'Color',plot_color)
        end
    end
end
h1 = get(gca);
grid on
patch([4,8,8,4],[h1.YLim(1),h1.YLim(1),h1.YLim(2),h1.YLim(2)],'b','LineStyle','none','DisplayName','Tremor Band')
alpha(0.1)
ylabel('Sensitivity')
xlabel('Frequency (Hz)')
ttl = title('(a) Total Sensitivities WITHOUT Impedance Coupling');
ttl.FontSize = 15;

% Plot with impedance coupling
h(4) = nexttile(tlo,4);
hold on
for kdx = 1:length(var_of_interest)     
    for idx = DOF
        for jdx = muscle
            plot_color = myMap(kdx*15,:);
            plot(w,S_T_with(idx,jdx).(char(var_of_interest(kdx))).data,'LineWidth',2,'DisplayName',char(var_of_interest(kdx)),'Color',plot_color)
        end
    end
end
h1 = get(gca);
grid on
patch([4,8,8,4],[h1.YLim(1),h1.YLim(1),h1.YLim(2),h1.YLim(2)],'b','LineStyle','none','DisplayName','Tremor Band')
alpha(0.1)
ylabel('Sensitivity')
xlabel('Frequency (Hz)')
ttl = title('(b) Total Sensitivities WITH Impedance Coupling');
ttl.FontSize = 15;

% Create axis labels
ylab = ylabel(tlo,'Sensitivity');
xlab = xlabel(tlo,'Frequency (Hz)');
ylab.FontSize = 20;
xlab.FontSize = 20;
% ttl = title(tlo,'Two-Input Two-Output Total Sensitivities Over Frequency (ECRB/ECRL to WFE)');
% ttl.FontSize = 20;

% Plot common legend
leg = legend(h2(end));  
leg.Layout.Tile = 'east';

% figure;
% plot(w,[S_T_with(1,1).M11.data;S_T_with(1,1).M21.data],'LineWidth',2)
% hold on;
% plot(w,[S_T_with(1,1).M12.data;S_T_with(1,1).M22.data],'LineWidth',2)
% plot(w,S_T_with(1,1).M11.data + S_T_with(1,1).M21.data,'LineWidth',2)
% plot(w,S_T_with(1,1).M12.data + S_T_with(1,1).M22.data,'LineWidth',2)
% plot(w,S_T_with(1,1).C11.data,'--','LineWidth',2)
% plot(w,S_T_with(1,1).C22.data,'--','LineWidth',2)
% ylab = ylabel('Sensitivity');
% xlab = xlabel('Frequency (Hz)');
% ylab.FontSize = 20;
% xlab.FontSize = 20;
% h1 = get(gca);
% grid on
% patch([4,8,8,4],[h1.YLim(1),h1.YLim(1),h1.YLim(2),h1.YLim(2)],'b','LineStyle','none','DisplayName','Tremor Band')
% alpha(0.1)
% legend('M11','M21','M12','M22','M11 + M21','M12 + M22','C11','C11')
% ttl = title('Two-Input Two-Output Partial Sensitivities of M Without Impedence Coupling');
% ttl.FontSize = 20;