for kdx = 1:length(var_of_interest)    
        meanS_SFE(kdx,1) = meanS.(char(var_of_interest(kdx)))(1);
        meanS_SAA(kdx,1) = meanS.(char(var_of_interest(kdx)))(2);
        meanS_SIER(kdx,1) = meanS.(char(var_of_interest(kdx)))(3);
        meanS_EFE(kdx,1) = meanS.(char(var_of_interest(kdx)))(4);
        meanS_FPS(kdx,1) = meanS.(char(var_of_interest(kdx)))(5);
        meanS_WFE(kdx,1) = meanS.(char(var_of_interest(kdx)))(6);
        meanS_WRUD(kdx,1) = meanS.(char(var_of_interest(kdx)))(7);
end

%% SFE
maxMean_SFE = max(meanS_SFE);
minMean_SFE = min(meanS_SFE);

figure
tlo = tiledlayout(1,4);
h(1) = nexttile(tlo);
imagesc(meanS_SFE(1:27))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(1:27))
set(gca,'XTickLabel',[])
% caxis manual
caxis([minMean_SFE maxMean_SFE])
colormap(jet)

h(2) = nexttile(tlo);
imagesc(meanS_SFE(28:54))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(28:54))
set(gca,'XTickLabel',[])
caxis([minMean_SFE maxMean_SFE])
colormap(jet)

h(3) = nexttile(tlo);
imagesc(meanS_SFE(55:81))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(55:81))
set(gca,'XTickLabel',[])
caxis([minMean_SFE maxMean_SFE])
colormap(jet)

h(4) = nexttile(tlo);
imagesc(meanS_SFE(82:107))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(82:107))
set(gca,'XTickLabel',[])
caxis([minMean_SFE maxMean_SFE])
colormap(jet)

cbh = colorbar(h(end));  
cbh.Layout.Tile = 'east';
ttl = title(tlo,'SFE Mean Sensitivities');
ttl.FontSize = 20;

% Plot top sensitivities
meanS_names_SFE = var_of_interest;
[meanS_ordered_SFE,sortIdx] = sort(meanS_SFE(:),'descend');
meanS_ordered_names_SFE = meanS_names_SFE(sortIdx);

numTop = 20;
figure
imagesc(meanS_ordered_SFE(1:numTop))
set(gca,'XTickLabel',[])
yticks([1:numTop])
yticklabels(meanS_ordered_names_SFE(1:numTop))
ttl = title('Top 20 Mean Sensitivities for SFE');
ttl.FontSize = 20;
colormap(jet)
colorbar

%% SAA
maxMean_SAA = max(meanS_SAA);
minMean_SAA = min(meanS_SAA);

figure
tlo = tiledlayout(1,4);
h(1) = nexttile(tlo);
imagesc(meanS_SAA(1:27))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(1:27))
set(gca,'XTickLabel',[])
% caxis manual
caxis([minMean_SAA maxMean_SAA])
colormap(jet)

h(2) = nexttile(tlo);
imagesc(meanS_SAA(28:54))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(28:54))
set(gca,'XTickLabel',[])
caxis([minMean_SAA maxMean_SAA])
colormap(jet)

h(3) = nexttile(tlo);
imagesc(meanS_SAA(55:81))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(55:81))
set(gca,'XTickLabel',[])
caxis([minMean_SAA maxMean_SAA])
colormap(jet)

h(4) = nexttile(tlo);
imagesc(meanS_SAA(82:107))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(82:107))
set(gca,'XTickLabel',[])
caxis([minMean_SAA maxMean_SAA])
colormap(jet)

cbh = colorbar(h(end));  
cbh.Layout.Tile = 'east';
ttl = title(tlo,'SAA Mean Sensitivities');
ttl.FontSize = 20;

% Plot top sensitivities
meanS_names_SAA = var_of_interest;
[meanS_ordered_SAA,sortIdx] = sort(meanS_SAA(:),'descend');
meanS_ordered_names_SAA = meanS_names_SAA(sortIdx);

numTop = 20;
figure
imagesc(meanS_ordered_SAA(1:numTop))
set(gca,'XTickLabel',[])
yticks([1:numTop])
yticklabels(meanS_ordered_names_SAA(1:numTop))
ttl = title('Top 20 Mean Sensitivities for SAA');
ttl.FontSize = 20;
colormap(jet)
colorbar

%% SIER
maxMean_SIER = max(meanS_SIER);
minMean_SIER = min(meanS_SIER);

figure
tlo = tiledlayout(1,4);
h(1) = nexttile(tlo);
imagesc(meanS_SIER(1:27))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(1:27))
set(gca,'XTickLabel',[])
% caxis manual
caxis([minMean_SIER maxMean_SIER])
colormap(jet)

h(2) = nexttile(tlo);
imagesc(meanS_SIER(28:54))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(28:54))
set(gca,'XTickLabel',[])
caxis([minMean_SIER maxMean_SIER])
colormap(jet)

h(3) = nexttile(tlo);
imagesc(meanS_SIER(55:81))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(55:81))
set(gca,'XTickLabel',[])
caxis([minMean_SIER maxMean_SIER])
colormap(jet)

h(4) = nexttile(tlo);
imagesc(meanS_SIER(82:107))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(82:107))
set(gca,'XTickLabel',[])
caxis([minMean_SIER maxMean_SIER])
colormap(jet)

cbh = colorbar(h(end));  
cbh.Layout.Tile = 'east';
ttl = title(tlo,'SIER Mean Sensitivities');
ttl.FontSize = 20;

% Plot top sensitivities
meanS_names_SIER = var_of_interest;
[meanS_ordered_SIER,sortIdx] = sort(meanS_SIER(:),'descend');
meanS_ordered_names_SIER = meanS_names_SIER(sortIdx);

numTop = 20;
figure
imagesc(meanS_ordered_SIER(1:numTop))
set(gca,'XTickLabel',[])
yticks([1:numTop])
yticklabels(meanS_ordered_names_SIER(1:numTop))
ttl = title('Top 20 Mean Sensitivities for SIER');
ttl.FontSize = 20;
colormap(jet)
colorbar

%% EFE
maxMean_EFE = max(meanS_EFE);
minMean_EFE = min(meanS_EFE);

figure
tlo = tiledlayout(1,4);
h(1) = nexttile(tlo);
imagesc(meanS_EFE(1:27))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(1:27))
set(gca,'XTickLabel',[])
% caxis manual
caxis([minMean_EFE maxMean_EFE])
colormap(jet)

h(2) = nexttile(tlo);
imagesc(meanS_EFE(28:54))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(28:54))
set(gca,'XTickLabel',[])
caxis([minMean_EFE maxMean_EFE])
colormap(jet)

h(3) = nexttile(tlo);
imagesc(meanS_EFE(55:81))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(55:81))
set(gca,'XTickLabel',[])
caxis([minMean_EFE maxMean_EFE])
colormap(jet)

h(4) = nexttile(tlo);
imagesc(meanS_EFE(82:107))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(82:107))
set(gca,'XTickLabel',[])
caxis([minMean_EFE maxMean_EFE])
colormap(jet)

cbh = colorbar(h(end));  
cbh.Layout.Tile = 'east';
ttl = title(tlo,'EFE Mean Sensitivities');
ttl.FontSize = 20;

% Plot top sensitivities
meanS_names_EFE = var_of_interest;
[meanS_ordered_EFE,sortIdx] = sort(meanS_EFE(:),'descend');
meanS_ordered_names_EFE = meanS_names_EFE(sortIdx);

numTop = 20;
figure
imagesc(meanS_ordered_EFE(1:numTop))
set(gca,'XTickLabel',[])
yticks([1:numTop])
yticklabels(meanS_ordered_names_EFE(1:numTop))
ttl = title('Top 20 Mean Sensitivities for EFE');
ttl.FontSize = 20;
colormap(jet)
colorbar

%% FPS
maxMean_FPS = max(meanS_FPS);
minMean_FPS = min(meanS_FPS);

figure
tlo = tiledlayout(1,4);
h(1) = nexttile(tlo);
imagesc(meanS_FPS(1:27))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(1:27))
set(gca,'XTickLabel',[])
% caxis manual
caxis([minMean_FPS maxMean_FPS])
colormap(jet)

h(2) = nexttile(tlo);
imagesc(meanS_FPS(28:54))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(28:54))
set(gca,'XTickLabel',[])
caxis([minMean_FPS maxMean_FPS])
colormap(jet)

h(3) = nexttile(tlo);
imagesc(meanS_FPS(55:81))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(55:81))
set(gca,'XTickLabel',[])
caxis([minMean_FPS maxMean_FPS])
colormap(jet)

h(4) = nexttile(tlo);
imagesc(meanS_FPS(82:107))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(82:107))
set(gca,'XTickLabel',[])
caxis([minMean_FPS maxMean_FPS])
colormap(jet)

cbh = colorbar(h(end));  
cbh.Layout.Tile = 'east';
ttl = title(tlo,'FPS Mean Sensitivities');
ttl.FontSize = 20;

% Plot top sensitivities
meanS_names_FPS = var_of_interest;
[meanS_ordered_FPS,sortIdx] = sort(meanS_FPS(:),'descend');
meanS_ordered_names_FPS = meanS_names_FPS(sortIdx);

numTop = 20;
figure
imagesc(meanS_ordered_FPS(1:numTop))
set(gca,'XTickLabel',[])
yticks([1:numTop])
yticklabels(meanS_ordered_names_FPS(1:numTop))
ttl = title('Top 20 Mean Sensitivities for FPS');
ttl.FontSize = 20;
colormap(jet)
colorbar

%% WFE
maxMean_WFE = max(meanS_WFE);
minMean_WFE = min(meanS_WFE);

figure
tlo = tiledlayout(1,4);
h(1) = nexttile(tlo);
imagesc(meanS_WFE(1:27))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(1:27))
set(gca,'XTickLabel',[])
% caxis manual
caxis([minMean_WFE maxMean_WFE])
colormap(jet)

h(2) = nexttile(tlo);
imagesc(meanS_WFE(28:54))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(28:54))
set(gca,'XTickLabel',[])
caxis([minMean_WFE maxMean_WFE])
colormap(jet)

h(3) = nexttile(tlo);
imagesc(meanS_WFE(55:81))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(55:81))
set(gca,'XTickLabel',[])
caxis([minMean_WFE maxMean_WFE])
colormap(jet)

h(4) = nexttile(tlo);
imagesc(meanS_WFE(82:107))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(82:107))
set(gca,'XTickLabel',[])
caxis([minMean_WFE maxMean_WFE])
colormap(jet)

cbh = colorbar(h(end));  
cbh.Layout.Tile = 'east';
ttl = title(tlo,'WFE Mean Sensitivities');
ttl.FontSize = 20;

% Plot top sensitivities
meanS_names_WFE = var_of_interest;
[meanS_ordered_WFE,sortIdx] = sort(meanS_WFE(:),'descend');
meanS_ordered_names_WFE = meanS_names_WFE(sortIdx);

numTop = 20;
figure
imagesc(meanS_ordered_WFE(1:numTop))
set(gca,'XTickLabel',[])
yticks([1:numTop])
yticklabels(meanS_ordered_names_WFE(1:numTop))
ttl = title('Top 20 Mean Sensitivities for WFE');
ttl.FontSize = 20;
colormap(jet)
colorbar

%% WRUD
maxMean_WRUD = max(meanS_WRUD);
minMean_WRUD = min(meanS_WRUD);

figure
tlo = tiledlayout(1,4);
h(1) = nexttile(tlo);
imagesc(meanS_WRUD(1:27))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(1:27))
set(gca,'XTickLabel',[])
% caxis manual
caxis([minMean_WRUD maxMean_WRUD])
colormap(jet)

h(2) = nexttile(tlo);
imagesc(meanS_WRUD(28:54))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(28:54))
set(gca,'XTickLabel',[])
caxis([minMean_WRUD maxMean_WRUD])
colormap(jet)

h(3) = nexttile(tlo);
imagesc(meanS_WRUD(55:81))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(55:81))
set(gca,'XTickLabel',[])
caxis([minMean_WRUD maxMean_WRUD])
colormap(jet)

h(4) = nexttile(tlo);
imagesc(meanS_WRUD(82:107))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(82:107))
set(gca,'XTickLabel',[])
caxis([minMean_WRUD maxMean_WRUD])
colormap(jet)

cbh = colorbar(h(end));  
cbh.Layout.Tile = 'east';
ttl = title(tlo,'WRUD Mean Sensitivities');
ttl.FontSize = 20;

% Plot top sensitivities
meanS_names_WRUD = var_of_interest;
[meanS_ordered_WRUD,sortIdx] = sort(meanS_WRUD(:),'descend');
meanS_ordered_names_WRUD = meanS_names_WRUD(sortIdx);

numTop = 20;
figure
imagesc(meanS_ordered_WRUD(1:numTop))
set(gca,'XTickLabel',[])
yticks([1:numTop])
yticklabels(meanS_ordered_names_WRUD(1:numTop))
ttl = title('Top 20 Mean Sensitivities for WRUD');
ttl.FontSize = 20;
colormap(jet)
colorbar
