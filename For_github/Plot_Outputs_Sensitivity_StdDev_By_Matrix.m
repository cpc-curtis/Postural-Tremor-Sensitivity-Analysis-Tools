%% 2-in 2-out
if length(var_of_interest) == 17
    %% I
    S_I_stdDev = [stdDevS.I11', stdDevS.I12';
                  stdDevS.I12', stdDevS.I22'];
    
    imAlpha = ones(4,2);
    imAlpha(find(S_I_stdDev == 0)) = 0;
    figure;
    imagesc(S_I_stdDev,'AlphaData',imAlpha)
    hold on;
    for idx = 1
        yline(idx*2 + 0.5,'k','LineWidth',2)
        xline(idx + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Inertia Matrix Standard Deviation of Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% D
    S_D_stdDev = [stdDevS.D11', stdDevS.D12';
                  stdDevS.D12', stdDevS.D22'];
    
    imAlpha = ones(4,2);
    imAlpha(find(S_D_stdDev == 0)) = 0;
    figure;
    imagesc(S_D_stdDev,'AlphaData',imAlpha)
    hold on;
    for idx = 1
        yline(idx*2 + 0.5,'k','LineWidth',2)
        xline(idx + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Damping Matrix Standard Deviation of Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% K
    S_K_stdDev = [stdDevS.K11', stdDevS.K12';
                  stdDevS.K12', stdDevS.K22'];
    
    imAlpha = ones(4,2);
    imAlpha(find(S_K_stdDev == 0)) = 0;
    figure;
    imagesc(S_K_stdDev,'AlphaData',imAlpha)
    hold on;
    for idx = 1
        yline(idx*2 + 0.5,'k','LineWidth',2)
        xline(idx + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Stiffness Matrix Standard Deviation of Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% C
    S_C_stdDev = [stdDevS.C11',    zeros(2,1);
                    zeros(2,1),  stdDevS.C22'];
    
    imAlpha = ones(4,2);
    imAlpha(find(S_C_stdDev == 0)) = 0;
    figure;
    imagesc(S_C_stdDev,'AlphaData',imAlpha)
    hold on;
    for idx = 1
        yline(idx*2 + 0.5,'k','LineWidth',2)
        xline(idx + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Max Muscle Force Matrix Standard Deviation of Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% t1
    S_t1_stdDev = stdDevS.t1';
    figure;
    imagesc(S_t1_stdDev)
    colormap(jet)
    colorbar
    ttl = title('t_1 Stadard Deviation of Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% t2
    S_t2_stdDev = stdDevS.t2';
    figure;
    imagesc(S_t2_stdDev)
    colormap(jet)
    colorbar
    ttl = title('t_2 Standard Deviation of Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% M
    S_M_stdDev = [stdDevS.M11', stdDevS.M12';
                  stdDevS.M12', stdDevS.M22'];
    
    imAlpha = ones(4,2);
    imAlpha(find(S_M_stdDev == 0)) = 0;
    figure;
    imagesc(S_M_stdDev,'AlphaData',imAlpha)
    hold on;
    for idx = 1
        yline(idx*2 + 0.5,'k','LineWidth',2)
        xline(idx + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Moment Arm Matrix Standard Deviation of Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
end

%% 15-in 7-out
if length(var_of_interest) == 107
    %% I
    S_I_stdDev = [stdDevS.I11',   zeros(7,1),   zeros(7,1), stdDevS.I41',   zeros(7,1),   zeros(7,1), stdDevS.I71';
        zeros(7,1), stdDevS.I22', stdDevS.I32',   zeros(7,1), stdDevS.I52', stdDevS.I62',   zeros(7,1);
        zeros(7,1), stdDevS.I32', stdDevS.I33',   zeros(7,1),   zeros(7,1), stdDevS.I63',   zeros(7,1);
        stdDevS.I41',   zeros(7,1),   zeros(7,1), stdDevS.I44',   zeros(7,1),   zeros(7,1), stdDevS.I74';
        zeros(7,1), stdDevS.I52',   zeros(7,1),   zeros(7,1), stdDevS.I55',   zeros(7,1),   zeros(7,1);
        zeros(7,1), stdDevS.I62', stdDevS.I63',   zeros(7,1),   zeros(7,1), stdDevS.I66',   zeros(7,1);
        stdDevS.I71',   zeros(7,1),   zeros(7,1), stdDevS.I74',   zeros(7,1),   zeros(7,1), stdDevS.I77'];
    
    imAlpha = ones(49,7);
    imAlpha(find(S_I_stdDev == 0)) = 0;
    figure;
    imagesc(S_I_stdDev,'AlphaData',imAlpha)
    hold on;
    for idx = 1:6
        yline(idx*7 + 0.5,'k','LineWidth',2)
        xline(idx + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Inertia Matrix Standard Deviation of Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% D
    S_D_stdDev = [stdDevS.D11', stdDevS.D21', stdDevS.D31', stdDevS.D41',   zeros(7,1),   zeros(7,1),   zeros(7,1);
        stdDevS.D21', stdDevS.D22', stdDevS.D32',   zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1);
        stdDevS.D31', stdDevS.D32', stdDevS.D33',   zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1);
        stdDevS.D41',   zeros(7,1),   zeros(7,1), stdDevS.D44',   zeros(7,1),   zeros(7,1),   zeros(7,1);
        zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1), stdDevS.D55', stdDevS.D65', stdDevS.D75';
        zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1), stdDevS.D65', stdDevS.D66', stdDevS.D76';
        zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1), stdDevS.D75', stdDevS.D76', stdDevS.D77'];
    
    imAlpha = ones(49,7);
    imAlpha(find(S_D_stdDev == 0)) = 0;
    figure;
    imagesc(S_D_stdDev,'AlphaData',imAlpha)
    hold on;
    for idx = 1:6
        yline(idx*7 + 0.5,'k','LineWidth',2)
        xline(idx + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Damping Matrix Standard Deviation of Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% K
    S_K_stdDev = [stdDevS.K11', stdDevS.K21', stdDevS.K31', stdDevS.K41',   zeros(7,1),   zeros(7,1),   zeros(7,1);
        stdDevS.K21', stdDevS.K22', stdDevS.K32',   zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1);
        stdDevS.K31', stdDevS.K32', stdDevS.K33',   zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1);
        stdDevS.K41',   zeros(7,1),   zeros(7,1), stdDevS.K44',   zeros(7,1),   zeros(7,1),   zeros(7,1);
        zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1), stdDevS.K55', stdDevS.K65', stdDevS.K75';
        zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1), stdDevS.K65', stdDevS.K66', stdDevS.K76';
        zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1), stdDevS.K75', stdDevS.K76', stdDevS.K77'];
    
    imAlpha = ones(49,7);
    imAlpha(find(S_K_stdDev == 0)) = 0;
    figure;
    imagesc(S_K_stdDev,'AlphaData',imAlpha)
    hold on;
    for idx = 1:6
        yline(idx*7 + 0.5,'k','LineWidth',2)
        xline(idx + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Stiffness Matrix Standard Deviation of Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% C
    S_C_stdDev = [                stdDevS.C11', zeros(7,14);
        zeros(7,1),    stdDevS.C22', zeros(7,13);
        zeros(7,2),    stdDevS.C33', zeros(7,12);
        zeros(7,3),    stdDevS.C44', zeros(7,11);
        zeros(7,4),    stdDevS.C55', zeros(7,10);
        zeros(7,5),    stdDevS.C66',  zeros(7,9);
        zeros(7,6),    stdDevS.C77',  zeros(7,8);
        zeros(7,7),    stdDevS.C88',  zeros(7,7);
        zeros(7,8),    stdDevS.C99',  zeros(7,6);
        zeros(7,9),  stdDevS.C1010',  zeros(7,5);
        zeros(7,10),  stdDevS.C1111',  zeros(7,4);
        zeros(7,11),  stdDevS.C1212',  zeros(7,3);
        zeros(7,12),  stdDevS.C1313',  zeros(7,2);
        zeros(7,13),  stdDevS.C1414',  zeros(7,1);
        zeros(7,14),  stdDevS.C1515'             ];
    
    imAlpha = ones(7*15,15);
    imAlpha(find(S_C_stdDev == 0)) = 0;
    figure;
    imagesc(S_C_stdDev,'AlphaData',imAlpha)
    hold on;
    for idx = 1:14
        yline(idx*7 + 0.5,'k','LineWidth',2)
        xline(idx + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Max Muscle Force Matrix Standard Deviation of Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% t1
    S_t1_stdDev = stdDevS.t1';
    figure;
    imagesc(S_t1_stdDev)
    colormap(jet)
    colorbar
    ttl = title('t_1 Stadard Deviation of Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% t2
    S_t2_stdDev = stdDevS.t2';
    figure;
    imagesc(S_t2_stdDev)
    colormap(jet)
    colorbar
    ttl = title('t_2 Standard Deviation of Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% M
    S_M_stdDev = [stdDevS.M11', stdDevS.M12', stdDevS.M13', stdDevS.M14', stdDevS.M15', stdDevS.M16', stdDevS.M17',   zeros(7,1),   zeros(7,1),    zeros(7,1),    zeros(7,1),    zeros(7,1),    zeros(7,1),    zeros(7,1),    zeros(7,1);
        stdDevS.M21', stdDevS.M22', stdDevS.M23', stdDevS.M24', stdDevS.M25', stdDevS.M26', stdDevS.M27',   zeros(7,1),   zeros(7,1),    zeros(7,1),    zeros(7,1),    zeros(7,1),    zeros(7,1),    zeros(7,1),    zeros(7,1);
        stdDevS.M31', stdDevS.M32', stdDevS.M33', stdDevS.M34', stdDevS.M35', stdDevS.M36', stdDevS.M37',   zeros(7,1),   zeros(7,1),    zeros(7,1),    zeros(7,1),    zeros(7,1),    zeros(7,1),    zeros(7,1),    zeros(7,1);
        zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1), stdDevS.M45', stdDevS.M46', stdDevS.M47', stdDevS.M48', stdDevS.M49', stdDevS.M410', stdDevS.M411', stdDevS.M412', stdDevS.M413', stdDevS.M414', stdDevS.M415';
        zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1), stdDevS.M55', stdDevS.M56',   zeros(7,1),   zeros(7,1),   zeros(7,1), stdDevS.M410', stdDevS.M511', stdDevS.M512', stdDevS.M513', stdDevS.M514', stdDevS.M515';
        zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1),    zeros(7,1),    zeros(7,1), stdDevS.M612', stdDevS.M613', stdDevS.M614', stdDevS.M615';
        zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1),   zeros(7,1),    zeros(7,1),    zeros(7,1), stdDevS.M712', stdDevS.M713', stdDevS.M714', stdDevS.M715'];
    
    imAlpha = ones(7*7,15);
    imAlpha(find(S_M_stdDev == 0)) = 0;
    figure;
    imagesc(S_M_stdDev,'AlphaData',imAlpha)
    hold on;
    for idx = 1:14
        if idx < 7
            yline(idx*7 + 0.5,'k','LineWidth',2)
        end
        xline(idx + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Moment Arm Matrix Standard Deviation of Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
end