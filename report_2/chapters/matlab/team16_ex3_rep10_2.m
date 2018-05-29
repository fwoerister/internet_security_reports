
format long % displays values in long fomrat
more off % disables paging of the output in the command window
set (gca, 'fontname', 'Helvetica', 'fontsize', 20); % sets plot font and size

dataset = csvread ('../workfiles/global_last10years.csv', 1, 0); % loads csv data
ts_bytes = dataset(:,2); % takes packets_per_day from dataset


y_data  = ts_bytes/10^6;
y_label = '#megabytes';
title   = 'number of bytes per hour (daily average)';

plotDarknetData(dataset, y_data, y_label, title);