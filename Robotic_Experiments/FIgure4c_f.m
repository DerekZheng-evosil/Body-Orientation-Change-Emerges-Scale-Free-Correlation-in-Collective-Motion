%% Compare the response accuracy for the BOC-based interaction and Vicsek interaction, corresponding to the Fig4-c
clear;clc;
addpath("../Utility/")
addpath("../Data/Robots Data/")
load("mean_accuracy.mat")
figure
figSize_L = 8;
figSize_W = 10;
set(gcf, 'Units', 'centimeter','Position', [5 5 figSize_L figSize_W])
vs = violinplot(violin_data, violin_label, 'ShowMean', true, 'ShowMedian', false);
ylabel("accuracy")
set(gca, 'Fontname', 'helvetica', 'FontSize', 15)
%% Compare the response accuracy as a function of time for the BOC-based interaction and Vicsek interaction, corresponding to the Fig4-e
clear;clc;
addpath("../Utility/")
addpath("../Data/Robots Data/")
load("dynamic_accuracy.mat")
type_list_draw = ["BOC", "Vicsek"];
figure
figSize_L = 35;
figSize_W = 8;
set(gcf, 'Units', 'centimeter','Position', [5 5 figSize_L figSize_W])
shadedErrorBar(time_x, proj_acc(:,time_x), {@mean,@std}, 'lineProps', ...
                                                    {'-ob','markerfacecolor',[11, 92, 175]./255},'patchSaturation',0.1)
hold on
shadedErrorBar(time_x, ave_acc(:,time_x), {@mean,@std}, 'lineprops', ...
                                                    {'-or','markerfacecolor',[242, 41, 79]./255 }, 'patchSaturation',0.1)
xlabel("time(step)")
ylabel("accuracy")
box on
legend(type_list_draw,'Box','off')
set(gca, 'Fontname', 'helvetica', 'FontSize', 15)
%% Compare the responsiveness for the BOC-based interaction and Vicsek interaction, corresponding to the Fig4-d
clear;clc;
addpath("../Utility/")
addpath("../Data/Robots Data/")
load("mean_responsiveness.mat")
figure
figSize_L = 8;
figSize_W = 10;
set(gcf, 'Units', 'centimeter','Position', [5 5 figSize_L figSize_W])
vs = violinplot(violin_data, violin_label, 'ShowMean', true, 'ShowMedian', false);
ylabel("responsiveness")
set(gca, 'Fontname', 'helvetica', 'FontSize', 15)
%% Compare the information transfer distance for the BOC-based interaction and Vicsek interaction, corresponding to the Fig4-f
clear;clc;
addpath("../Utility/")
addpath("../Data/Robots Data/")
load("information_transfer_distance.mat")
figure
figSize_L = 35;
figSize_W = 8;
set(gcf, 'Units', 'centimeter','Position', [5 5 figSize_L figSize_W])
N = 50;
Type_list = ["BOC", "AVE"];
slope_cell = {};
slope = [];
for Type = Type_list
    Type_idx = find(Type == Type_list);
    for idx = 1:2
        ascend_delay = ascend_delay_all{idx, Type_idx};
        ascend_trans_dis = ascend_trans_dis_all{idx, Type_idx};
        x = nanmean(ascend_delay,1)';
        y = nanmean(ascend_trans_dis, 1)';
        linear_start = floor(1);
        linear_end = floor(2);
        % 定义线性模型
        linearModel = fit(x(linear_start:linear_end), y(linear_start:linear_end), 'poly1');  % 'poly1' 表示线性模型
        % 提取拟合的系数
        coefficients = coeffvalues(linearModel);
        % 提取斜率和截距
        slope(Type_idx, idx) = coefficients(1);
        intercept = coefficients(2);
        % 生成拟合的直线
        x_fit = linspace(min(x), max(x), 100);  % 生成用于绘制直线的 x 值
        y_fit = polyval(coefficients, x_fit);    % 计算对应的 y 值
        % 创建散点图
        if Type_idx == 1
            draw_x_idx = find(x>0&x<30);
            if idx == 1
                plot(x(draw_x_idx),y(draw_x_idx),'ko', 'LineWidth',2,'MarkerEdgeColor',[11,92,175]./255, ...
                                                            'MarkerFaceColor',[11,92,175]./255,'MarkerSize',10)
            else
                plot(x(draw_x_idx),y(draw_x_idx),'k^', 'LineWidth',2,'MarkerEdgeColor',[11,92,175]./255, ...
                                                            'MarkerFaceColor',[11,92,175]./255,'MarkerSize',10)
            end
        else
            draw_x_idx = find(x>0&x<30);
            if idx == 1
                plot(x(draw_x_idx),y(draw_x_idx),'ko', 'LineWidth',2,'MarkerEdgeColor',[205,62,21]./255, ...
                                                            'MarkerFaceColor',[205,62,21]./255,'MarkerSize',10)
            else
                plot(x(draw_x_idx),y(draw_x_idx),'k^', 'LineWidth',2,'MarkerEdgeColor',[205,62,21]./255, ...
                                                            'MarkerFaceColor',[205,62,21]./255,'MarkerSize',10)
            end
        end
        hold on;  % 保持图形以便后续添加直线
    end
end
xlabel("turning delay (step)")
ylabel("$d_{trans}$(mm)",'Interpreter','latex')
legend_list_1 = "slope = " + round(slope(1,:)',1);
legend_list_2 = "slope = " + round(slope(2,:)',1);
legend([legend_list_1;legend_list_2],'Box','off')
set(gca, 'Fontname', 'helvetica', 'FontSize', 15)




