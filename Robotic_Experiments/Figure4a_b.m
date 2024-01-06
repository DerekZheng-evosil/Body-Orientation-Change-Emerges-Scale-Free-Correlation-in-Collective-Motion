%% Draw the heading and polarization of BOC-based interaction in Robotic experiments
clear;clc;
addpath("../Utility/")
addpath("../Data/Robots Data/")
load("robots_experiment_BOC_example.mat")
all_heading = [];
for k = 1:length(G.memory)
    memory_tmp = G.memory{k};
    for id = 1:G.expNum
        all_heading(id, k) = rad2deg(atan2(memory_tmp(4,id), memory_tmp(3,id)));
    end
end
figure
figSize_L = 14;
figSize_W = 6;
set(gcf, 'Units', 'centimeter','Position', [5 5 figSize_L figSize_W])
infoheading = atan2(G.turnDir_list(2,:), G.turnDir_list(1,:));
totalTime = [1:G.maxSimSteps];
Color = jet(G.maxSimSteps);
cf = [uint8(Color*255) uint8(ones(size(Color,1),1))]';
p1 = plot(totalTime, all_heading,'LineWidth',1,'Color',[127,127,127]./255);
hold on 
p2 = plot(totalTime([100:150]), ones(length([100:150])) * rad2deg(infoheading(1)),'r','LineWidth',4);
hold on 
p3 = plot(totalTime([150,200]), ones(length([150,200])) * rad2deg(infoheading(2)),'r','LineWidth',4);
xlabel("time (step)")
ylabel("heading")
legend(p2, "informed direction",'box','off')
set(gca, 'Fontname', 'helvetica', 'FontSize', 15)
figure
figSize_L = 14;
figSize_W = 6;
set(gcf, 'Units', 'centimeter','Position', [5 5 figSize_L figSize_W])
plot(totalTime, G.op, 'k', 'LineWidth',2)
xlabel("time (step)")
%% Draw the heading and polarization of Vicsek interaction in Robotic experiments
clear;clc;
addpath("../Utility/")
addpath("../Data/Robots Data/")
load("robots_experiment_Vicsek_example.mat")
all_heading = [];
for k = 1:length(G.memory)
    memory_tmp = G.memory{k};
    for id = 1:G.expNum
        all_heading(id, k) = rad2deg(atan2(memory_tmp(4,id), memory_tmp(3,id)));
    end
end
figure
figSize_L = 14;
figSize_W = 6;
set(gcf, 'Units', 'centimeter','Position', [5 5 figSize_L figSize_W])
infoheading = atan2(G.turnDir_list(2,:), G.turnDir_list(1,:));
totalTime = [1:G.maxSimSteps];
Color = jet(G.maxSimSteps);
cf = [uint8(Color*255) uint8(ones(size(Color,1),1))]';
p1 = plot(totalTime, all_heading,'LineWidth',1,'Color',[127,127,127]./255);
hold on 
p2 = plot(totalTime([100:150]), ones(length([100:150])) * rad2deg(infoheading(1)),'r','LineWidth',4);
hold on 
p3 = plot(totalTime([150,200]), ones(length([150,200])) * rad2deg(infoheading(2)),'r','LineWidth',4);
xlabel("time (step)")
ylabel("heading")
legend(p2, "informed direction",'box','off')
set(gca, 'Fontname', 'helvetica', 'FontSize', 15)
figure
figSize_L = 14;
figSize_W = 6;
set(gcf, 'Units', 'centimeter','Position', [5 5 figSize_L figSize_W])
plot(totalTime, G.op, 'k', 'LineWidth',2)
xlabel("time (step)")