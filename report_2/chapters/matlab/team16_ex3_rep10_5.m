format long % displays values in long fomrat
more off % disables paging of the output in the command window
set (gca, 'fontname', 'Helvetica', 'fontsize', 20); % sets plot font and size

dataset = csvread ('../workfiles/global_last10years.csv', 1, 0); % loads csv data
ts_udip = dataset(:,5); % takes packets_per_day from dataset
ts_usip = dataset(:,4);
ts_bph = dataset(:,2);
ts_pph = dataset(:,3);

y_data_udip = ts_udip;
y_data_udip = y_data_udip/max(y_data_udip);
y_data_udip    = smoothLine(y_data_udip);
y_label_udip   = 'unique destination ips';

y_data_usip = (ts_usip)/max(ts_usip);
y_data_usip = smoothLine(y_data_usip);
y_label_usip = 'unique source ips';

y_data_bph = (ts_bph)/max(ts_bph);
y_data_bph = smoothLine(y_data_bph);
y_label_bph = 'megabytes per hour';

y_data_pph = (ts_pph)/max(ts_pph);
y_data_pph = smoothLine(y_data_pph);
y_label_pph = 'packages per hour';

set_title = 'normalized data';

timestamps = datenum (1970, 1, 1, 0, 0,dataset(:,1)); % transforms epoch into datenum format
stem(timestamps, [y_data_udip,y_data_usip, y_data_bph,y_data_pph], 'marker', 'none') % plots stem graphic
datetick('x', 'mmm/yy'); % sets x-axis display format
xlabel('days of observed time span') % sets x-axis label

legend(y_label_udip,y_label_usip,y_label_bph,y_label_pph);

%ylabel(y_label_udip) % sets y-axis label

title(set_title); % set plot title
grid on % enables grid lines
set(gca,'layer','top'); % places grid lines on the top
xlim([min(timestamps) max(timestamps)])
