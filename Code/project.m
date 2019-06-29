%用于解决 Project：Job shop scheduling
%文件分为4部分
% 1. read_data.m     数据导入
% 2. build_struct.m  数据预处理
% 3. core.m          可行解计算
% 4. calculate.m     成本计算

clear;clc;

read_data;
build_struct;
core;
calculate
