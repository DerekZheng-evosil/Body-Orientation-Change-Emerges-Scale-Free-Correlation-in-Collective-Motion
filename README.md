In our submission, we have included code repositories capable of replicating the primary content found in both the main text and supplementary information. 
Additionally, all requisite data sets have been provided for reference and verification. We divide the code into five parts: 1) results of Empirical analysis; 
2) results of Collective spin; 3) results of Collective turn; 4) results of robotic experiments; 5) requisite data. 6) Utility;
## 1. Empirical analysis 
By using the code "empirical_analysis.m" and "draw_distribution_of_rho", we can reproduce the results as follow: For a given U-turn trajectory and the time 𝑇 = 2.82 and time delay 𝜏 = 0.6, we could construct the BOC matrix (b1) and 
the leader-follower network within this period trajectory [2.22s, 2.82s]. The analyzed part of the trajectory is drawn with a gradient color.
Consequently, we derived the average BOC and leadership of each individual, respectively. Interestingly, two vectors composed of  and  show highly positive correlation. 
Finally, we performed the Spearman correlation (𝜌) between two vectors over the diﬀerent combinations of 𝑇 and 𝜏. The distribution of 𝜌 over diﬀerent combinations of 𝑇 and 𝜏 for BOC, distance and bearing change with 𝛼 = 0, 𝛼 = 1 and 𝛼 = 10, respectively. 
By using the code "draw_spatial_distribution_turning_rank.m", we can reproduce the front-to-back information transfer direction during U-turn.
By using the code "draw_effect_aspect_ratio.m", we can validate the effect of aspect ratio on the empirical analysis.
By using the code "draw_corr_Lt_turning_rank.m", we can validate the effectiveness of L_t in empirical anlysis.
## 2. Collective_spin 
By using the code "Figure2_a.m", "Figure2_b.m" and "Figure2_c.m", we can reproduce all the results in Figure2;
## 3. Collective_turn
By using the code "Figure3_a.m", "Figure3_b.m" and "Figure3_c.m", we can reproduce all the results in Figure3;
## 4. Robotic_Experiments
By using the code "Figure4a_b.m", "FIgure4c_f.m" and "Figure3_c.m", we can reproduce all the results in Figure4.
By using the code "DrawRobotsEXPTraj", we can visualize the trajectory of each the robotic experiments. 
## 5. Data
In the Data Folder, we provide all the requisite data needed by above codes. Paritucularly, In the "Data/Robots Data", we provide all the trajectory data recorded in 
robotic experiments, named as "trajectory_cell_BOC.mat" and "trajectory_cell_Vicsek.mat".
## 6. Utility
All the tool codes can be found in the folder of Utility.
