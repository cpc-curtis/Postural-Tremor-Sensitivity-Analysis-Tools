%% Get Mean Sensitivities
% Organize mean sensitivities by variable
for kdx = 1:length(var_of_interest)     
        meanS_tot(kdx,:) = meanS.(char(var_of_interest(kdx)));    
end

% Find Max Sensitivity for each parameter
for idx = 1:length(var_of_interest)
    maxMeanS_tot(idx) = max(meanS.(char(var_of_interest(idx))));
end
[maxMeanS_tot_ordered,sortIdx] = sort(maxMeanS_tot(:),'ascend');
maxMeanS_tot_ordered_names = var_of_interest(sortIdx)';
% Find 0.1 cut-off for max sensitivities
maxMeanThresh = find(maxMeanS_tot_ordered <= 0.1,1,'last');

%% Get Standard Deviation of Sensitivities
% Organize standard deviation of sensitivities by variable
for kdx = 1:length(var_of_interest)     
        stdDevS_tot(kdx,:) = stdDevS.(char(var_of_interest(kdx)));
end

% Find Max Standard Deviation of Sensitivities for each parameter
for idx = 1:length(var_of_interest)
    maxStdDevS_tot(idx) = max(stdDevS.(char(var_of_interest(idx))));
end
[maxStdDevS_tot_ordered,sortIdx] = sort(maxStdDevS_tot(:),'ascend');
maxStdDevS_tot_ordered_names = var_of_interest(sortIdx)';

%% Plot Total Output Sensitivities
% Mean
figure
tlo = tiledlayout(2,1);
h(1) = nexttile(tlo);
imagesc(meanS_tot');
colormap(jet)
xticks([1:107])
set(gca,'XTickLabel',var_of_interest)
yticks([1:7])
yticklabels({'SFE','SAA','SIER','EFE','FPS','WFE','WRUD'})
ttl = title('Mean Total Output Sensitivities For All DOF');
ttl.FontSize = 20;
colorbar

% Standard Deviation
h(2) = nexttile(tlo);
imagesc(stdDevS_tot')
colormap(jet)
colorbar
xticks([1:107])
set(gca,'XTickLabel',var_of_interest)
yticks([1:7])
yticklabels({'SFE','SAA','SIER','EFE','FPS','WFE','WRUD'})
ttl = title('Standard Deviation of Total Output Sensitivities For All DOF');
ttl.FontSize = 20;
colorbar

%% Plot Max Output Sensitivies
figure
tlo = tiledlayout(2,1);
% Mean
h(1) = nexttile(tlo);
myh = imagesc(maxMeanS_tot_ordered');
xticks([1:107])
set(gca,'XTickLabel',maxMeanS_tot_ordered_names)
set(gca,'YTickLabel',[])
colormap(jet)
colorbar
ttl = title('Max Mean Sensitivities In Order');
ttl.FontSize = 20;
hold on;
% Uncomment the lines below to get the 0.1 threshold to plot
% myPatch = patch([0.5,maxMeanThresh+0.5,maxMeanThresh+0.5,0.5],[0.5,0.5,1.5,1.5],'g','LineStyle','none','DisplayName','Below 0.1 Sensitivity');
% myPatch.FaceAlpha = 0.3;
% % xline(maxMeanThresh+0.5,'g','LineWidth',2)
% % legend('Location','northwest')
% p1 = [maxMeanThresh+0.5,1.0];
% p2 = [maxMeanThresh-round(length(var_of_interest)*0.1),1.0];
% dp = p2-p1;
% myArrow = annotation('textarrow','String','Below 0.1 Sensitivity','LineWidth',2);
% myArrow.TextColor = 'w';
% myArrow.Color = 'w';
% myArrow.FontSize = 20;
% myArrow.TextMargin = 100;
% myArrow.HeadLength = 15;
% myArrow.HeadWidth = 15;
% myArrow.HeadStyle = 'cback1';
% myArrow.Parent = gca;
% myArrow.HorizontalAlignment = 'left';
% myArrow.Position = [maxMeanThresh+0.5,1.0,dp(1),dp(2)];


% Standard Deviation
h(1) = nexttile(tlo);
imagesc(maxStdDevS_tot_ordered')
xticks([1:107])
set(gca,'XTickLabel',maxStdDevS_tot_ordered_names)
set(gca,'YTickLabel',[])
colormap(jet)
colorbar
ttl = title('Max Standard Deviation of Sensitivities In Order');
ttl.FontSize = 20;

%% Sort mean sensitivities by value
% meanS_tot_names = [var_of_interest,var_of_interest,var_of_interest,var_of_interest,var_of_interest,var_of_interest,var_of_interest];
% 
% [meanS_tot_ordered,sortIdx] = sort(meanS_tot(:),'descend');
% meanS_tot_ordered_names = meanS_tot_names(sortIdx);
% 
% numTop = 20;
% figure
% imagesc(meanS_tot_ordered(1:numTop))
% set(gca,'XTickLabel',[])
% yticks([1:numTop])
% yticklabels(meanS_tot_ordered_names(1:numTop))
% ttl = title('Top 20 Mean Sensitivities');
% ttl.FontSize = 20;
% colormap(jet)
% colorbar
    