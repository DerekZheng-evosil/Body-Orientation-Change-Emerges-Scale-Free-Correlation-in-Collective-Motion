%% Draw the trajectory of collective turn, corresponding to Figure3-(a-b) in the main text
clear;clc;
addpath("../Data/Simulation Data/collective turn/")
addpath("../Utility/")
turning_angle = "180"; % turning_angle = 180 ot 90
load("collective_turn_" + turning_angle + "_N100_example.mat")
figure;
figSize_L = 8;
figSize_W = 8;
set(gcf, 'Units', 'centimeter','Position', [5 5 figSize_L figSize_W])
axis equal
hold on;box on;
traj = savingData;
x = squeeze(traj(1:G.total_step,:,1));
y = squeeze(traj(1:G.total_step,:,2));
%     plot(x(:,1:end),y(:,1:end),'color',hex2rgb('BBBDBF'),'LineWidth',2)
end_step = G.total_step;
for p = 1:size(x,2)
    patch([x(1:end_step,p)' NaN], [y(1:end_step,p)' NaN], [[1:end_step]/(end_step - 1)  NaN], ...
                                'EdgeColor','interp','MarkerFaceColor','flat','LineWidth',2)
    colormap(turbo)
    hold on
end
h = colorbar('FontSize',15);
t=get(h,'YTickLabel');
t=strcat(t,'step');
set(h,'YTickLabel',t);
set(h,'Ticks',[1:10]')
set(h, 'TickLabels', num2cell(floor(linspace(1, G.total_step-1,5))))
set(h,'TicksMode','auto')
set(get(h,'Title'),'string','time');

end_step = G.total_step;
hold on 
plot(x(1:end_step,informed_id), y(1:end_step,informed_id),'k', 'LineWidth',3)
xlabel('x(BL)');
ylabel('y(BL)');
%     title("$\tau=$" + num2str(tau) + " $\alpha=$" + num2str(mu) + " $R_{visual}=$" + ...
%                     num2str(distTH),'Interpreter','latex')
set(gca, 'Fontname', 'helvetica', 'FontSize', 15)

figure;
figSize_L = 8;
figSize_W = 4;
set(gcf, 'Units', 'centimeter','Position', [5 5 figSize_L figSize_W])
draw_sec = 1;
%     plot([1:draw_sec:G.total_step]*0.2, r_acc(1:draw_sec:G.total_step), "LineWidth",2)
plot([1:draw_sec:G.total_step]*cyctime, r_acc(1:draw_sec:G.total_step), "LineWidth",2)
hold on
plot([1:draw_sec:G.total_step]*cyctime, informed_r_acc(1:draw_sec:G.total_step),'Color','k', "LineWidth",3)
hold on
%     scatter(turning_act_list, ones(1, size(turning_act_list,2)));
%     title("$r=$" + num2str(r_area),'Interpreter','latex')
legend(["uninfo. robots", "info. robot"],'box','off')
ylabel("accuracy")
xlabel("time (step)")
set(gca, 'Fontname', 'helvetica', 'FontSize', 15)

figure;
figSize_L = 8;
figSize_W = 4;
set(gcf, 'Units', 'centimeter','Position', [5 5 figSize_L figSize_W])
draw_sec = 1;
plot([1:draw_sec:G.total_step]*cyctime, op(1:draw_sec:G.total_step), "LineWidth",2.5)
ylabel("\phi")
xlabel("time (step)")
set(gca, 'Fontname', 'helvetica', 'FontSize', 15)