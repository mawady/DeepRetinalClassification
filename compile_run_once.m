%% Run only once in the first time to compile mex files
%%
clc; close all; clear all; warning off;
%%
addpath(genpath(fullfile('./libs/','matconvnet-1.0-beta24')));
addpath('./libs/libsvm-3.22');
%% Compiling MatConvNet
vl_compilenn;
%% Compiling LibSVM
run('./libs/libsvm-3.22/make.m');