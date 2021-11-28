for kdx = 1:length(var_of_interest)     
        stdDevS_tot(kdx,:) = stdDevS.(char(var_of_interest(kdx)));
end

figure
imagesc(stdDevS_tot')
colormap(jet)
colorbar

xticks([1:107])
set(gca,'XTickLabel',var_of_interest)
yticklabels({'SFE','SAA','SIER','EFE','FPS','WFE','WRUD'})
ttl = title('Total Standard Deviation of Sensitivities');
ttl.FontSize = 20;