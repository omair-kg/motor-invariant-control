% Walkin Simulation Example - INItialization
%     for Matlab 5.2 and up
%
%
% This file initializes the variables that are used during a simulation
%
%
% Created by Martijn Wisse, Delft Bio-robotics Laboratory, August 2003
% Delft University of Technology

clear all
%close all

global parsim parworld parhip parleg1 parleg2 footholds q_t qd_t xf_t g_t t_t f_t current mode impacts
% set parameters and initial conditions
wse_par;
wse_ic;

% set counter
current = 1;

[q,qd]=wse_dep(q,qd); % adjust initial conditions to meet boundary conditions


totallength = parsim(3);
% prepare state storage matrices
q_t  = zeros(totallength, 4);
qd_t = zeros(totallength, 4);
t_t  = zeros(totallength, 1);
g_t  = zeros(totallength, 4);
f_t  = zeros(totallength, 4);
xf_t = zeros(totallength, 2);
impacts = [];

q_t(1, :)  = q;
qd_t(1, :) = qd;
xf_t(1,:) = footholds;
g_t(1,:) = [wse_mat('g1',q_t(1,:), qd_t(1,:)); wse_mat('g1',q_t(1,:), qd_t(1,:))].';

