%% Draw the polarization in collective spin, corresponding to Figure2-(b1) in the main text
clear;clc;
addpath("../Data/Simulation Data/collective spin/")
addpath("../Utility/")
load("polarization.mat")
figure
figSize_L = 12;
figSize_W = 12;
set(gcf, 'Units', 'centimeter','Position', [5 5 figSize_L figSize_W])
errorbar(N_list, mean_op,std_op, "^", 'Color', 'k','MarkerEdgeColor','k','MarkerFaceColor',[239 52 61]/255,'MarkerSize', 15,'LineWidth',2)
xlabel("$N$",'Interpreter','latex')
ylabel("$\phi$",'Interpreter','latex')
set(gca, 'Fontname', 'helvetica', 'FontSize', 15)
%% Draw the distribution of max spinning lag in collective spin, corresponding to Figure2-(b2) in the main text
clear;clc;
addpath("../Data/Simulation Data/collective spin/")
addpath("../Utility/")
load("max spinning lag.mat")
figure;
figSize_L = 18;
figSize_W = 8;
violin_data = [];
violin_label = [];
N_list = [30, 50, 75, 100, 150, 200];
N_label = cell(length(N_list), 1);
% 使用循环生成字符串列表
for i = 1:length(N_list)
    N_label{i} = "N=" + num2str(N_list(i));
end
set(gcf, 'Units', 'centimeter','Position', [5 5 figSize_L figSize_W])
for N_idx = 1:length(N_list)
    violin_data = [violin_data mean_asc_delay(N_idx,:)*5];
    violin_label = [violin_label reshape(repmat(N_label{N_idx}, 1, size(mean_asc_delay(N_idx,:), 2)), 1, [])];
end
vs = violinplot(violin_data, violin_label, 'ShowMean', true, 'ShowMedian', false);
ylabel("max spinning lag(step)", 'Interpreter','latex')
xlabel("$N$", 'Interpreter','latex')
set(gca, 'Fontname', 'helvetica', 'FontSize', 15)
%% Draw the distribution of information transfer distance in collective spin, corresponding to Figure2-(b3) in the main text
clear;clc;
addpath("../Data/Simulation Data/")
addpath("../Utility/")
load("information_transfer_direction.mat")
figure;
figSize_L = 18;
figSize_W = 6;
set(gcf, 'Units', 'centimeter','Position', [5 5 figSize_L figSize_W])
vs = violinplot(violin_data, violin_label, 'ShowMean', true, 'ShowMedian', false);
% title("angular velocity = " + num2str(one_wheel_vel_list(k)*2/body_length) + "rad/s")
ylabel("$\theta_s$",'interpreter','latex')
set(gca, 'Fontname', 'helvetica', 'FontSize', 15)