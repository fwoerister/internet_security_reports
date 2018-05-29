
format long % displays values in long fomrat
more off % disables paging of the output in the command window

dataset = csvread ('../workfiles/global_last10years.csv', 1, 0); % loads csv data
ts_udip = dataset(:,5); % takes packets_per_day from dataset
ts_usip = dataset(:,4);


timestamps = datenum (1970, 1, 1, 0, 0,dataset(:,1));

[m,i] = max(ts_usip);
result = datestr(timestamps(i, 1));

% result = 14-Dec-2015
% There is only one measuring point with the max value