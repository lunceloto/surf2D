clc;clear;close all;

A=readmatrix('sourcebz_t.txt');
x=A(:,3);
y=A(:,4);
z=A(:,5);
figure(1);
surfer(x,y,z);
colormap;
title('test');