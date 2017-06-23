clc; close all; clear all; warning off;
%% Normal sample cases
fPath = './input/normal/sample1.jpg';
% fPath = './input/normal/sample2.jpg';
% fPath = './input/normal/sample3.tif';
%% Exudates sample cases
% fPath = './input/exudates/sample1.bmp';
% fPath = './input/exudates/sample2.jpg';
% fPath = './input/exudates/sample3.jpg';
%% Drusen sample cases
% fPath = './input/drusen/sample1.jpg';
% fPath = './input/drusen/sample2.jpg';
% fPath = './input/drusen/sample3.jpg';
%%
getRetinalClass_CnnSvm(fPath);