%% Draw the snapshots of collective spin, corresponding to Figure2-(a) in the main text
clear;clc;
addpath("../Data/Simulation Data/collective spin/")
addpath("../Utility/")
Nc = 200; % Nc =100 or 200
load("collective_spin_example_N" + num2str(Nc) + ".mat")
figure
figSize_L = 18;
figSize_W = 18;
set(gcf, 'Units', 'centimeter','Position', [5 5 figSize_L figSize_W])
id=find(tracks(:,4)==T(end)); %% T(1), T(60), T(120, T(180), T(240), T(300)
xyz=tracks(id,2:3);
u=tracks(id,5:6);
u=u./sqrt(sum(u.*u,2));
phi = atan2(u(:,2), u(:,1));
a = 4; %
b = 1.2;
colormap(cmap);
% 将start_time映射到colormap的索引
start_time_normalized = (start_time - min(start_time)) / (max(start_time) - min(start_time)); % 将start_time归一化到 [0, 1] 范围内
colormap_index = round(start_time_normalized * (size(cmap, 1) - 1)) + 1; % 计算归一化后的索引
mapped_colors = zeros(G.expNum, 3);
for c_i = 1:G.expNum
    mapped_colors(c_i, :) = interp1(1:size(cmap, 1), cmap, colormap_index(c_i));
end
hs = scatter(xyz(:,1),xyz(:,2),300,start_time,'o','filled', 'LineWidth',1.5,'MarkerFaceAlpha', 0);
scatter_colors = get(hs, 'CData');
for p = 1:size(xyz,1)
    [ellipse_X(:,p), ellipse_Y(:,p)] = ellipsepatch(a/2, b/2, xyz(p,1), xyz(p,2), phi(p));
end
patch(ellipse_X, ellipse_Y, scatter_colors)
hold on
%     quiver(xyz(:,1),xyz(:,2),u(:,1),u(:,2),...
%         'color',[0.2 0.2 0.2],'linewidth',2,'AutoScaleFactor',0.2)
%     text(xyz(:,1),xyz(:,2),num2str([1:G.expNum]'),'HorizontalAlignment','center','Color', 'w','FontWeight', 'bold')
colormap(cmap);
grid off;box on
color_h=colorbar;
set(get(color_h,'Title'),'string','spinning lag(step)','interpreter','latex');
set(gca, 'XTick', []);
set(gca, 'YTick', []);
set(gca, 'Fontname', 'helvetica', 'FontSize', 20)
xlabel("$x$",'interpreter','latex')
ylabel("$y$",'interpreter','latex')
set(gca,'linewidth',3)

figure
figSize_L = 18;
figSize_W = 18;
set(gcf, 'Units', 'centimeter','Position', [5 5 figSize_L figSize_W])
id=find(tracks(:,4)==T(1)); %% T(1), T(60), T(120, T(180), T(240), T(300)
xyz=tracks(id,2:3);
u=tracks(id,5:6);
u=u./sqrt(sum(u.*u,2));
phi = atan2(u(:,2), u(:,1));
a = 4; %
b = 1.2;
colormap(cmap);
% 将start_time映射到colormap的索引
start_time_normalized = (start_time - min(start_time)) / (max(start_time) - min(start_time)); % 将start_time归一化到 [0, 1] 范围内
colormap_index = round(start_time_normalized * (size(cmap, 1) - 1)) + 1; % 计算归一化后的索引
mapped_colors = zeros(G.expNum, 3);
for c_i = 1:G.expNum
    mapped_colors(c_i, :) = interp1(1:size(cmap, 1), cmap, colormap_index(c_i));
end
hs = scatter(xyz(:,1),xyz(:,2),300,start_time,'o','filled', 'LineWidth',1.5,'MarkerFaceAlpha', 0);
scatter_colors = get(hs, 'CData');
for p = 1:size(xyz,1)
    [ellipse_X(:,p), ellipse_Y(:,p)] = ellipsepatch(a/2, b/2, xyz(p,1), xyz(p,2), phi(p));
end
patch(ellipse_X, ellipse_Y, scatter_colors)
hold on
colormap(cmap);
grid off;box on
color_h = colorbar;
set(get(color_h,'Title'),'string','spinning lag(step)','interpreter','latex');
set(gca, 'XTick', []);
set(gca, 'YTick', []);
set(gca, 'Fontname', 'helvetica', 'FontSize', 20)
xlabel("$x$",'interpreter','latex')
ylabel("$y$",'interpreter','latex')
set(gca,'linewidth',3)

