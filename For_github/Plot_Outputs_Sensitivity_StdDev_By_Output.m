for kdx = 1:length(var_of_interest)    
        stdDevS_SFE(kdx,1) = stdDevS.(char(var_of_interest(kdx)))(1);
        stdDevS_SAA(kdx,1) = stdDevS.(char(var_of_interest(kdx)))(2);
        stdDevS_SIER(kdx,1) = stdDevS.(char(var_of_interest(kdx)))(3);
        stdDevS_EFE(kdx,1) = stdDevS.(char(var_of_interest(kdx)))(4);
        stdDevS_FPS(kdx,1) = stdDevS.(char(var_of_interest(kdx)))(5);
        stdDevS_WFE(kdx,1) = stdDevS.(char(var_of_interest(kdx)))(6);
        stdDevS_WRUD(kdx,1) = stdDevS.(char(var_of_interest(kdx)))(7);
end

%% SFE
maxStdDev_SFE = max(stdDevS_SFE);
minStdDev_SFE = min(stdDevS_SFE);

figure
tlo = tiledlayout(1,4);
h(1) = nexttile(tlo);
imagesc(stdDevS_SFE(1:27))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(1:27))
set(gca,'XTickLabel',[])
% caxis manual
caxis([minStdDev_SFE maxStdDev_SFE])
colormap(jet)

h(2) = nexttile(tlo);
imagesc(stdDevS_SFE(28:54))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(28:54))
set(gca,'XTickLabel',[])
caxis([minStdDev_SFE maxStdDev_SFE])
colormap(jet)

h(3) = nexttile(tlo);
imagesc(stdDevS_SFE(55:81))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(55:81))
set(gca,'XTickLabel',[])
caxis([minStdDev_SFE maxStdDev_SFE])
colormap(jet)

h(4) = nexttile(tlo);
imagesc(stdDevS_SFE(82:107))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(82:107))
set(gca,'XTickLabel',[])
caxis([minStdDev_SFE maxStdDev_SFE])
colormap(jet)

cbh = colorbar(h(end));  
cbh.Layout.Tile = 'east';
ttl = title(tlo,'SFE Standard Deviation of Sensitivities');
ttl.FontSize = 20;

%% SAA
maxStdDev_SAA = max(stdDevS_SAA);
minStdDev_SAA = min(stdDevS_SAA);

figure
tlo = tiledlayout(1,4);
h(1) = nexttile(tlo);
imagesc(stdDevS_SAA(1:27))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(1:27))
set(gca,'XTickLabel',[])
% caxis manual
caxis([minStdDev_SAA maxStdDev_SAA])
colormap(jet)

h(2) = nexttile(tlo);
imagesc(stdDevS_SAA(28:54))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(28:54))
set(gca,'XTickLabel',[])
caxis([minStdDev_SAA maxStdDev_SAA])
colormap(jet)

h(3) = nexttile(tlo);
imagesc(stdDevS_SAA(55:81))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(55:81))
set(gca,'XTickLabel',[])
caxis([minStdDev_SAA maxStdDev_SAA])
colormap(jet)

h(4) = nexttile(tlo);
imagesc(stdDevS_SAA(82:107))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(82:107))
set(gca,'XTickLabel',[])
caxis([minStdDev_SAA maxStdDev_SAA])
colormap(jet)

cbh = colorbar(h(end));  
cbh.Layout.Tile = 'east';
ttl = title(tlo,'SAA Standard Deviation of Sensitivities');
ttl.FontSize = 20;

%% SIER
maxStdDev_SIER = max(stdDevS_SIER);
minStdDev_SIER = min(stdDevS_SIER);

figure
tlo = tiledlayout(1,4);
h(1) = nexttile(tlo);
imagesc(stdDevS_SIER(1:27))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(1:27))
set(gca,'XTickLabel',[])
% caxis manual
caxis([minStdDev_SIER maxStdDev_SIER])
colormap(jet)

h(2) = nexttile(tlo);
imagesc(stdDevS_SIER(28:54))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(28:54))
set(gca,'XTickLabel',[])
caxis([minStdDev_SIER maxStdDev_SIER])
colormap(jet)

h(3) = nexttile(tlo);
imagesc(stdDevS_SIER(55:81))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(55:81))
set(gca,'XTickLabel',[])
caxis([minStdDev_SIER maxStdDev_SIER])
colormap(jet)

h(4) = nexttile(tlo);
imagesc(stdDevS_SIER(82:107))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(82:107))
set(gca,'XTickLabel',[])
caxis([minStdDev_SIER maxStdDev_SIER])
colormap(jet)

cbh = colorbar(h(end));  
cbh.Layout.Tile = 'east';
ttl = title(tlo,'SIER Standard Deviation of Sensitivities');
ttl.FontSize = 20;

%% EFE
maxStdDev_EFE = max(stdDevS_EFE);
minStdDev_EFE = min(stdDevS_EFE);

figure
tlo = tiledlayout(1,4);
h(1) = nexttile(tlo);
imagesc(stdDevS_EFE(1:27))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(1:27))
set(gca,'XTickLabel',[])
% caxis manual
caxis([minStdDev_EFE maxStdDev_EFE])
colormap(jet)

h(2) = nexttile(tlo);
imagesc(stdDevS_EFE(28:54))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(28:54))
set(gca,'XTickLabel',[])
caxis([minStdDev_EFE maxStdDev_EFE])
colormap(jet)

h(3) = nexttile(tlo);
imagesc(stdDevS_EFE(55:81))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(55:81))
set(gca,'XTickLabel',[])
caxis([minStdDev_EFE maxStdDev_EFE])
colormap(jet)

h(4) = nexttile(tlo);
imagesc(stdDevS_EFE(82:107))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(82:107))
set(gca,'XTickLabel',[])
caxis([minStdDev_EFE maxStdDev_EFE])
colormap(jet)

cbh = colorbar(h(end));  
cbh.Layout.Tile = 'east';
ttl = title(tlo,'EFE Standard Deviation of Sensitivities');
ttl.FontSize = 20;

%% FPS
maxStdDev_FPS = max(stdDevS_FPS);
minStdDev_FPS = min(stdDevS_FPS);

figure
tlo = tiledlayout(1,4);
h(1) = nexttile(tlo);
imagesc(stdDevS_FPS(1:27))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(1:27))
set(gca,'XTickLabel',[])
% caxis manual
caxis([minStdDev_FPS maxStdDev_FPS])
colormap(jet)

h(2) = nexttile(tlo);
imagesc(stdDevS_FPS(28:54))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(28:54))
set(gca,'XTickLabel',[])
caxis([minStdDev_FPS maxStdDev_FPS])
colormap(jet)

h(3) = nexttile(tlo);
imagesc(stdDevS_FPS(55:81))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(55:81))
set(gca,'XTickLabel',[])
caxis([minStdDev_FPS maxStdDev_FPS])
colormap(jet)

h(4) = nexttile(tlo);
imagesc(stdDevS_FPS(82:107))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(82:107))
set(gca,'XTickLabel',[])
caxis([minStdDev_FPS maxStdDev_FPS])
colormap(jet)

cbh = colorbar(h(end));  
cbh.Layout.Tile = 'east';
ttl = title(tlo,'FPS Standard Deviation of Sensitivities');
ttl.FontSize = 20;

%% WFE
maxStdDev_WFE = max(stdDevS_WFE);
minStdDev_WFE = min(stdDevS_WFE);

figure
tlo = tiledlayout(1,4);
h(1) = nexttile(tlo);
imagesc(stdDevS_WFE(1:27))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(1:27))
set(gca,'XTickLabel',[])
% caxis manual
caxis([minStdDev_WFE maxStdDev_WFE])
colormap(jet)

h(2) = nexttile(tlo);
imagesc(stdDevS_WFE(28:54))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(28:54))
set(gca,'XTickLabel',[])
caxis([minStdDev_WFE maxStdDev_WFE])
colormap(jet)

h(3) = nexttile(tlo);
imagesc(stdDevS_WFE(55:81))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(55:81))
set(gca,'XTickLabel',[])
caxis([minStdDev_WFE maxStdDev_WFE])
colormap(jet)

h(4) = nexttile(tlo);
imagesc(stdDevS_WFE(82:107))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(82:107))
set(gca,'XTickLabel',[])
caxis([minStdDev_WFE maxStdDev_WFE])
colormap(jet)

cbh = colorbar(h(end));  
cbh.Layout.Tile = 'east';
ttl = title(tlo,'WFE Standard Deviation of Sensitivities');
ttl.FontSize = 20;

%% WRUD
maxStdDev_WRUD = max(stdDevS_WRUD);
minStdDev_WRUD = min(stdDevS_WRUD);

figure
tlo = tiledlayout(1,4);
h(1) = nexttile(tlo);
imagesc(stdDevS_WRUD(1:27))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(1:27))
set(gca,'XTickLabel',[])
% caxis manual
caxis([minStdDev_WRUD maxStdDev_WRUD])
colormap(jet)

h(2) = nexttile(tlo);
imagesc(stdDevS_WRUD(28:54))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(28:54))
set(gca,'XTickLabel',[])
caxis([minStdDev_WRUD maxStdDev_WRUD])
colormap(jet)

h(3) = nexttile(tlo);
imagesc(stdDevS_WRUD(55:81))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(55:81))
set(gca,'XTickLabel',[])
caxis([minStdDev_WRUD maxStdDev_WRUD])
colormap(jet)

h(4) = nexttile(tlo);
imagesc(stdDevS_WRUD(82:107))
yticks([1:27])
set(gca,'YTickLabel',var_of_interest(82:107))
set(gca,'XTickLabel',[])
caxis([minStdDev_WRUD maxStdDev_WRUD])
colormap(jet)

cbh = colorbar(h(end));  
cbh.Layout.Tile = 'east';
ttl = title(tlo,'WRUD Standard Deviation of Sensitivities');
ttl.FontSize = 20;
