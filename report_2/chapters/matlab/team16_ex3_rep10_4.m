
format long % displays values in long fomrat
more off % disables paging of the output in the command window
set (gca, 'fontname', 'Helvetica', 'fontsize', 20); % sets plot font and size

dataset = csvread ('../workfiles/global_last10years.csv', 1, 0); % loads csv data
ts_udip = dataset(:,5); % takes packets_per_day from dataset


y_data  = ts_udip/10^6;
y_label = '#unique destination ips [millions]';
title   = 'number of unique destination ips per hour (daily average)';

plotDarknetData(dataset, y_data, y_label, title);