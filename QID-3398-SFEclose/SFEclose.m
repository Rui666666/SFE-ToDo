clear all
close all
clc

x1 = load('BAYER_close_0012.dat');
x2 = load('BMW_close_0012.dat');
x3 = load('SIEMENS_close_0012.dat');
x4 = load('VW_close_0012.dat');

hold on
plot(x1, 'k', 'LineStyle', '--', 'LineWidth', 2)
plot(x2, 'r', 'LineStyle', ':', 'LineWidth', 2)
plot(x3, 'b', 'LineStyle', '-', 'LineWidth', 2)
plot(x4, 'g', 'LineStyle', '-.', 'LineWidth', 2)
title('Closing Prices for German Companies', 'FontSize', 16, 'FontWeight', 'Bold')
t  = [1 : 522 : length(x1)];
t1 = [2000 : 2 : 2013];
set(gca, 'XTick', t)
set(gca, 'XTickLabel', t1)
xlim([0 length(x1)])
box on
set(gca, 'FontSize', 16, 'LineWidth', 2, 'FontWeight', 'bold');
hold off