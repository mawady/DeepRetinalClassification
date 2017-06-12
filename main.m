clc; close all; clear all; warning off;
%%
% fPath = './input/normal/20051021_59589_0100_PP.jpg';
% fPath = './input/Exudates/20051020_57761_0100_PP.jpg';
fPath = './input/Drusen/IMG000001125.jpg';

getRetinalClass_CnnSvm(fPath);