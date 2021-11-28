%% 2-in 2-out system
if length(var_of_interest) == 17
    
    %% I
    S_I_mean = [meanS.I11', meanS.I12';
                meanS.I12', meanS.I22'];
    
    imAlpha = ones(4,2);
    imAlpha(find(S_I_mean == 0)) = 0;
    figure;
    imagesc(S_I_mean,'AlphaData',imAlpha)
    hold on;
    for idx = 1
        yline(idx*2 + 0.5,'k','LineWidth',2)
        xline(idx + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Inertia Matrix Mean Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% D
    S_D_mean = [meanS.D11', meanS.D12';
                meanS.D12', meanS.D22'];
    
    imAlpha = ones(4,2);
    imAlpha(find(S_D_mean == 0)) = 0;
    figure;
    imagesc(S_D_mean,'AlphaData',imAlpha)
    hold on;
    for idx = 1
        yline(idx*2 + 0.5,'k','LineWidth',2)
        xline(idx + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Damping Matrix Mean Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% K
    S_K_mean = [meanS.K11', meanS.K12';
                meanS.K12', meanS.K22'];
    
    imAlpha = ones(4,2);
    imAlpha(find(S_K_mean == 0)) = 0;
    figure;
    imagesc(S_K_mean,'AlphaData',imAlpha)
    hold on;
    for idx = 1
        yline(idx*2 + 0.5,'k','LineWidth',2)
        xline(idx + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Stiffness Mean Matrix Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% C
    S_C_mean = [meanS.C11', zeros(2,1);
                zeros(2,1), meanS.C22'];
    
    imAlpha = ones(2*2,2);
    imAlpha(find(S_C_mean == 0)) = 0;
    figure;
    imagesc(S_C_mean,'AlphaData',imAlpha)
    hold on;
    for idx = 1
        yline(idx*2 + 0.5,'k','LineWidth',2)
        xline(idx + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Max Muscle Force Matrix Mean Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% t1
    S_t1_mean = meanS.t1';
    figure;
    imagesc(S_t1_mean)
    colormap(jet)
    colorbar
    ttl = title('T_1 Mean Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% t2
    S_t2_mean = meanS.t2';
    figure;
    imagesc(S_t2_mean)
    colormap(jet)
    colorbar
    ttl = title('T_2 Mean Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% M
    S_M_mean = [meanS.M11', meanS.M12';
                meanS.M12', meanS.M22'];
    
    imAlpha = ones(4,2);
    imAlpha(find(S_M_mean == 0)) = 0;
    figure;
    imagesc(S_M_mean,'AlphaData',imAlpha)
    hold on;
    for idx = 1
        yline(idx*2 + 0.5,'k','LineWidth',2)
        xline(idx + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Moment Arm Matrix Mean Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
end

%% 15-in 7-out system
if length(var_of_interest) == 107
    %% I
    S_I_mean = [meanS.I11', zeros(7,1), zeros(7,1), meanS.I41', zeros(7,1), zeros(7,1), meanS.I71';
        zeros(7,1), meanS.I22', meanS.I32', zeros(7,1), meanS.I52', meanS.I62', zeros(7,1);
        zeros(7,1), meanS.I32', meanS.I33', zeros(7,1), zeros(7,1), meanS.I63', zeros(7,1);
        meanS.I41', zeros(7,1), zeros(7,1), meanS.I44', zeros(7,1), zeros(7,1), meanS.I74';
        zeros(7,1), meanS.I52', zeros(7,1), zeros(7,1), meanS.I55', zeros(7,1), zeros(7,1);
        zeros(7,1), meanS.I62', meanS.I63', zeros(7,1), zeros(7,1), meanS.I66', zeros(7,1);
        meanS.I71', zeros(7,1), zeros(7,1), meanS.I74', zeros(7,1), zeros(7,1), meanS.I77'];
    
    imAlpha = ones(49,7);
    imAlpha(find(S_I_mean == 0)) = 0;
    figure;
    imagesc(S_I_mean,'AlphaData',imAlpha)
    hold on;
    for idx = 1:6
        yline(idx*7 + 0.5,'k','LineWidth',2)
        xline(idx + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Inertia Matrix Mean Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% D
    S_D_mean = [meanS.D11', meanS.D21', meanS.D31', meanS.D41', zeros(7,1), zeros(7,1), zeros(7,1);
        meanS.D21', meanS.D22', meanS.D32', zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1);
        meanS.D31', meanS.D32', meanS.D33', zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1);
        meanS.D41', zeros(7,1), zeros(7,1), meanS.D44', zeros(7,1), zeros(7,1), zeros(7,1);
        zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1), meanS.D55', meanS.D65', meanS.D75';
        zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1), meanS.D65', meanS.D66', meanS.D76';
        zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1), meanS.D75', meanS.D76', meanS.D77'];
    
    imAlpha = ones(49,7);
    imAlpha(find(S_D_mean == 0)) = 0;
    figure;
    imagesc(S_D_mean,'AlphaData',imAlpha)
    hold on;
    for idx = 1:6
        yline(idx*7 + 0.5,'k','LineWidth',2)
        xline(idx + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Damping Matrix Mean Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% K
    S_K_mean = [meanS.K11', meanS.K21', meanS.K31', meanS.K41', zeros(7,1), zeros(7,1), zeros(7,1);
        meanS.K21', meanS.K22', meanS.K32', zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1);
        meanS.K31', meanS.K32', meanS.K33', zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1);
        meanS.K41', zeros(7,1), zeros(7,1), meanS.K44', zeros(7,1), zeros(7,1), zeros(7,1);
        zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1), meanS.K55', meanS.K65', meanS.K75';
        zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1), meanS.K65', meanS.K66', meanS.K76';
        zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1), meanS.K75', meanS.K76', meanS.K77'];
    
    imAlpha = ones(49,7);
    imAlpha(find(S_K_mean == 0)) = 0;
    figure;
    imagesc(S_K_mean,'AlphaData',imAlpha)
    hold on;
    for idx = 1:6
        yline(idx*7 + 0.5,'k','LineWidth',2)
        xline(idx + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Stiffness Mean Matrix Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% C
    S_C_mean = [                meanS.C11', zeros(7,14);
        zeros(7,1),    meanS.C22', zeros(7,13);
        zeros(7,2),    meanS.C33', zeros(7,12);
        zeros(7,3),    meanS.C44', zeros(7,11);
        zeros(7,4),    meanS.C55', zeros(7,10);
        zeros(7,5),    meanS.C66',  zeros(7,9);
        zeros(7,6),    meanS.C77',  zeros(7,8);
        zeros(7,7),    meanS.C88',  zeros(7,7);
        zeros(7,8),    meanS.C99',  zeros(7,6);
        zeros(7,9),  meanS.C1010',  zeros(7,5);
        zeros(7,10),  meanS.C1111',  zeros(7,4);
        zeros(7,11),  meanS.C1212',  zeros(7,3);
        zeros(7,12),  meanS.C1313',  zeros(7,2);
        zeros(7,13),  meanS.C1414',  zeros(7,1);
        zeros(7,14),  meanS.C1515'             ];
    
    imAlpha = ones(7*15,15);
    imAlpha(find(S_C_mean == 0)) = 0;
    figure;
    imagesc(S_C_mean,'AlphaData',imAlpha)
    hold on;
    for idx = 1:14
        yline(idx*7 + 0.5,'k','LineWidth',2)
        xline(idx + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Max Muscle Force Matrix Mean Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% t1
    S_t1_mean = meanS.t1';
    figure;
    imagesc(S_t1_mean)
    colormap(jet)
    colorbar
    ttl = title('T_1 Mean Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% t2
    S_t2_mean = meanS.t2';
    figure;
    imagesc(S_t2_mean)
    colormap(jet)
    colorbar
    ttl = title('T_2 Mean Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% M
    S_M_mean = [meanS.M11', meanS.M12', meanS.M13', meanS.M14', meanS.M15', meanS.M16', meanS.M17', zeros(7,1), zeros(7,1),  zeros(7,1),  zeros(7,1),  zeros(7,1),  zeros(7,1),  zeros(7,1),  zeros(7,1);
        meanS.M21', meanS.M22', meanS.M23', meanS.M24', meanS.M25', meanS.M26', meanS.M27', zeros(7,1), zeros(7,1),  zeros(7,1),  zeros(7,1),  zeros(7,1),  zeros(7,1),  zeros(7,1),  zeros(7,1);
        meanS.M31', meanS.M32', meanS.M33', meanS.M34', meanS.M35', meanS.M36', meanS.M37', zeros(7,1), zeros(7,1),  zeros(7,1),  zeros(7,1),  zeros(7,1),  zeros(7,1),  zeros(7,1),  zeros(7,1);
        zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1), meanS.M45', meanS.M46', meanS.M47', meanS.M48', meanS.M49', meanS.M410', meanS.M411', meanS.M412', meanS.M413', meanS.M414', meanS.M415';
        zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1), meanS.M55', meanS.M56', zeros(7,1), zeros(7,1), zeros(7,1), meanS.M410', meanS.M511', meanS.M512', meanS.M513', meanS.M514', meanS.M515';
        zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1),  zeros(7,1),  zeros(7,1), meanS.M612', meanS.M613', meanS.M614', meanS.M615';
        zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1), zeros(7,1),  zeros(7,1),  zeros(7,1), meanS.M712', meanS.M713', meanS.M714', meanS.M715'];
    
    imAlpha = ones(7*7,15);
    imAlpha(find(S_M_mean == 0)) = 0;
    figure;
    imagesc(S_M_mean,'AlphaData',imAlpha)
    hold on;
    for idx = 1:14
        if idx < 7
            yline(idx*7 + 0.5,'k','LineWidth',2)
        end
        xline(idx + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Moment Arm Matrix Mean Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
end