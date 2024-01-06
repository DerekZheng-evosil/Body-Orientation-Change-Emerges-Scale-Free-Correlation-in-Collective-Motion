%% Draw the information transfer speed as a function of N, corresponding to Figure2-(c2) in the main text
clear;clc;
addpath("../Data/Simulation Data/collective spin/")
addpath("../Utility/")
load("information_transfer_speed.mat")
figure;
figSize_L = 18;
figSize_W = 6;
set(gcf, 'Units', 'centimeter','Position', [5 5 figSize_L figSize_W])
errorbar(N_list, mean_slope, std_slope, "^", 'Color', 'k', 'MarkerEdgeColor', 'k','MarkerFaceColor', ...
                        [239 52 61]/255, 'MarkerSize', 15,'LineWidth',2)
hold on
[xData, yData] = prepareCurveData(N_list, mean_slope);
% Set up fittype and options.
ft = fittype( 'power2' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [2.76284081529424 0.482165172368064 -0.358059417250643];
% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );
x_fit = [N_list(1)-10:N_list(end)+50];
y_fit = feval(fitresult, x_fit);
h = plot(x_fit, y_fit,'color','r', 'linewidth',2.5);
xlabel("$N$",'interpreter','latex')
ylabel("$V_s$",'Interpreter','latex')
legend(h, "$V_s$",'Interpreter','latex','box','off') %  = 0.1864 * N^{0.7347} + 19.29
set(gca, 'Fontname', 'helvetica', 'FontSize', 15)

%% Draw the Correlation Length as a function of Flock Size, corresponding to Figure2-(c4) in the main text
clear;clc;
addpath("../Data/Simulation Data/collective spin/")
addpath("../Utility/")
load("Correlation_length.mat")
figure
figSize_L = 18;
figSize_W = 7;
set(gcf, 'Units', 'centimeter','Position', [5 5 figSize_L figSize_W])
errorbar(SZ, CorL, yneg, ypos, xneg, xpos, "o", "color",[238 0 9]./255, "MarkerSize", 10,...
    "MarkerEdgeColor", [238 0 9]./255, "MarkerFaceColor", [238 0 9]./255,'LineWidth',1.5)
hold on
[xData, yData] = prepareCurveData( SZ, CorL );
% Set up fittype and options.
ft = fittype( 'poly1' );
% Fit model to data.
[fitresult, gof] = fit(xData, yData, ft);
x_fit = [xData(1)-5:xData(end)+10];
y_fit = feval(fitresult, x_fit);
h = plot(x_fit, y_fit,'color','k', 'linewidth',2.5);
xlabel("Flock Size")
ylabel("Correlation Length")
set(gca, 'Fontname', 'helvetica', 'FontSize', 15)