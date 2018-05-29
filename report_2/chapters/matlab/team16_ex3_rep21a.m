% rep-21a
format long % displays values in long fomrat
more off % disables paging of the output in the command window
set (gca, 'fontname', 'Helvetica', 'fontsize', 20); % sets plot font and size

dataset = csvread ('../workfiles/Jun2017_proto.csv', 1, 0); % loads csv data
ts_packets = dataset(:,2); % takes packets_per_day from dataset
ts_usip = dataset(:,3);

y_label_packets = '#packets';
y_label_usip = '# unqiue source ip';

title_packets   = '# of packets';
title_usip = '# of unique source ip';

subplot(2,1,1)
plotDarknetData(dataset, ts_packets, y_label_packets, title_packets, 'mm/dd');

subplot(2,1,2)
plotDarknetData(dataset, ts_usip, y_label_usip, title_usip, 'mm/dd');
