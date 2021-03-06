% clear;clc;close all;
% load welfare_analysis_thr_moments_10e3.mat;
function [welfare_phi_max adhoc_max_phi optimalPara_phi_welfare optimalPara_phi_adhoc welfare_improvement_phi adhoc_improvement_phi]=...
welfare_analysis_phi();

load  welfare_analysis_thr_moments.mat;


%indices for benchmark calibration
Cyphi_bb=1;
phi_Hs_bb=1;
epsilonH1s_bb=1;

%maximization over epsilonH1s only

welfare_phi=reshape(welfare_(1,:,1),[grid_length 1 1]);
welfare_var_phi=reshape(welfare_var_(1,:,1),[grid_length 1 1]);
adhoc_obj_phi=reshape(adhoc_obj_(1,:,1),[grid_length 1 1]);
adhoc_obj_var_phi=reshape(adhoc_obj_var_(1,:,1),[grid_length 1 1]);

objective=weight_level_welfare*welfare_phi-weight_var_welfare*welfare_var_phi;

welfare_phi_max=max(objective);
max_ind=find(objective==welfare_phi_max);
optimalPara_phi_welfare=[phi_Hs_grid(max_ind)];


objective=weight_level_adhoc*adhoc_obj_phi-weight_var_adhoc*adhoc_obj_var_phi;
adhoc_max_phi=max(objective);
max_ind=find(objective==adhoc_max_phi);
optimalPara_phi_adhoc=[phi_Hs_grid(max_ind)];

%===============================
welfare_improvement_phi=100*abs((welfare_phi_max-welfare_baseline)/welfare_baseline);

adhoc_improvement_phi=100*(adhoc_max_phi-adhoc_baseline)/adhoc_baseline;
