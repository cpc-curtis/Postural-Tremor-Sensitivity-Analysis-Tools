%% 15-in 7-out system
if length(var_of_interest) == 107
    %% I
    S_I_mean = [  meanS.I11, zeros(7,15), zeros(7,15),   meanS.I41, zeros(7,15), zeros(7,15),   meanS.I71;
                zeros(7,15),   meanS.I22,   meanS.I32, zeros(7,15),   meanS.I52,   meanS.I62, zeros(7,15);
                zeros(7,15),   meanS.I32,   meanS.I33, zeros(7,15), zeros(7,15),   meanS.I63, zeros(7,15);
                  meanS.I41, zeros(7,15), zeros(7,15),   meanS.I44, zeros(7,15), zeros(7,15),   meanS.I74;
                zeros(7,15),   meanS.I52, zeros(7,15), zeros(7,15),   meanS.I55, zeros(7,15), zeros(7,15);
                zeros(7,15),   meanS.I62,   meanS.I63, zeros(7,15), zeros(7,15),   meanS.I66, zeros(7,15);
                  meanS.I71, zeros(7,15), zeros(7,15),   meanS.I74, zeros(7,15), zeros(7,15),   meanS.I77];
    
    imAlpha = ones(7*7,7*15);
    imAlpha(find(S_I_mean == 0)) = 0;
    figure;
    imagesc(S_I_mean,'AlphaData',imAlpha)
    hold on;
    for idx = 1:6
        yline(idx*7 + 0.5,'k','LineWidth',2)
        xline(idx*15 + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Inertia Matrix Mean Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% D
    S_D_mean = [  meanS.D11,   meanS.D21,   meanS.D31,   meanS.D41, zeros(7,15), zeros(7,15), zeros(7,15);
                  meanS.D21,   meanS.D22,   meanS.D32, zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15);
                  meanS.D31,   meanS.D32,   meanS.D33, zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15);
                  meanS.D41, zeros(7,15), zeros(7,15),   meanS.D44, zeros(7,15), zeros(7,15), zeros(7,15);
                zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15),   meanS.D55,   meanS.D65,   meanS.D75;
                zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15),   meanS.D65,   meanS.D66,   meanS.D76;
                zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15),   meanS.D75,   meanS.D76,   meanS.D77];
    
    imAlpha = ones(7*7,7*15);
    imAlpha(find(S_D_mean == 0)) = 0;
    figure;
    imagesc(S_D_mean,'AlphaData',imAlpha)
    hold on;
    for idx = 1:14
        yline(idx*7 + 0.5,'k','LineWidth',2)
        xline(idx*15 + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Damping Matrix Mean Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% K
    S_K_mean = [  meanS.K11,   meanS.K21,   meanS.K31,   meanS.K41, zeros(7,15), zeros(7,15), zeros(7,15);
                  meanS.K21,   meanS.K22,   meanS.K32, zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15);
                  meanS.K31,   meanS.K32,   meanS.K33, zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15);
                  meanS.K41, zeros(7,15), zeros(7,15),   meanS.K44, zeros(7,15), zeros(7,15), zeros(7,15);
                zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15),   meanS.K55,   meanS.K65,   meanS.K75;
                zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15),   meanS.K65,   meanS.K66,   meanS.K76;
                zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15),   meanS.K75,   meanS.K76,   meanS.K77];
    
    imAlpha = ones(7*7,7*15);
    imAlpha(find(S_K_mean == 0)) = 0;
    figure;
    imagesc(S_K_mean,'AlphaData',imAlpha)
    hold on;
    for idx = 1:14
        yline(idx*7 + 0.5,'k','LineWidth',2)
        xline(idx*15 + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Stiffness Mean Matrix Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
    
    %% C
    S_C_mean = [                        meanS.C11,  zeros(7,15*15-1*15);
                zeros(7,15*15-14*15),   meanS.C22,  zeros(7,15*15-2*15);
                zeros(7,15*15-13*15),   meanS.C33,  zeros(7,15*15-3*15);
                zeros(7,15*15-12*15),   meanS.C44,  zeros(7,15*15-4*15);
                zeros(7,15*15-11*15),   meanS.C55,  zeros(7,15*15-5*15);
                zeros(7,15*15-10*15),   meanS.C66,  zeros(7,15*15-6*15);
                 zeros(7,15*15-9*15),   meanS.C77,  zeros(7,15*15-7*15);
                 zeros(7,15*15-8*15),   meanS.C88,  zeros(7,15*15-8*15);
                 zeros(7,15*15-7*15),   meanS.C99,  zeros(7,15*15-9*15);
                 zeros(7,15*15-6*15), meanS.C1010, zeros(7,15*15-10*15);
                 zeros(7,15*15-5*15), meanS.C1111, zeros(7,15*15-11*15);
                 zeros(7,15*15-4*15), meanS.C1212, zeros(7,15*15-12*15);
                 zeros(7,15*15-3*15), meanS.C1313, zeros(7,15*15-13*15);
                 zeros(7,15*15-2*15), meanS.C1414, zeros(7,15*15-14*15);
                 zeros(7,15*15-1*15), meanS.C1515             ];
    
    imAlpha = ones(7*15,15*15);
    imAlpha(find(S_C_mean == 0)) = 0;
    figure;
    imagesc(S_C_mean,'AlphaData',imAlpha)
    hold on;
    for idx = 1:14
        yline(idx*7 + 0.5,'k','LineWidth',2)
        xline(idx*15 + 0.5,'k','LineWidth',2)
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
    S_M_mean = [  meanS.M11,   meanS.M12,   meanS.M13,   meanS.M14,   meanS.M15,   meanS.M16,   meanS.M17, zeros(7,15), zeros(7,15),  zeros(7,15),  zeros(7,15),  zeros(7,15),  zeros(7,15),  zeros(7,15),  zeros(7,15);
                  meanS.M21,   meanS.M22,   meanS.M23,   meanS.M24,   meanS.M25,   meanS.M26,   meanS.M27, zeros(7,15), zeros(7,15),  zeros(7,15),  zeros(7,15),  zeros(7,15),  zeros(7,15),  zeros(7,15),  zeros(7,15);
                  meanS.M31,   meanS.M32,   meanS.M33,   meanS.M34,   meanS.M35,   meanS.M36,   meanS.M37, zeros(7,15), zeros(7,15),  zeros(7,15),  zeros(7,15),  zeros(7,15),  zeros(7,15),  zeros(7,15),  zeros(7,15);
                zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15),   meanS.M45,   meanS.M46,   meanS.M47,   meanS.M48,   meanS.M49,   meanS.M410,   meanS.M411,   meanS.M412,   meanS.M413,   meanS.M414,   meanS.M415;
                zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15),   meanS.M55,   meanS.M56, zeros(7,15), zeros(7,15), zeros(7,15),   meanS.M410,   meanS.M511,   meanS.M512,   meanS.M513,   meanS.M514,   meanS.M515;
                zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15),  zeros(7,15),  zeros(7,15),   meanS.M612,   meanS.M613,   meanS.M614,   meanS.M615;
                zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15), zeros(7,15),  zeros(7,15),  zeros(7,15),   meanS.M712,   meanS.M713,   meanS.M714,   meanS.M715];
    
    imAlpha = ones(7*7,15*15);
    imAlpha(find(S_M_mean == 0)) = 0;
    figure;
    imagesc(S_M_mean,'AlphaData',imAlpha)
    hold on;
    for idx = 1:14
        if idx < 7
            yline(idx*7 + 0.5,'k','LineWidth',2)
        end
        xline(idx*15 + 0.5,'k','LineWidth',2)
    end
    colormap(jet)
    colorbar
    ttl = title('Moment Arm Matrix Mean Sensitivity');
    ttl.FontSize = 20;
    set(gca,'YTickLabel',[])
    set(gca,'XTickLabel',[])
end