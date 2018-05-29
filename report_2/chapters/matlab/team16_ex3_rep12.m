
format long % displays values in long fomrat
more off % disables paging of the output in the command window

dataset = csvread ('../workfiles/global_last10years.csv', 1, 0); % loads csv data
ts_udip = dataset(:,5); % takes packets_per_day from dataset
ts_usip = dataset(:,4);

ts_udip(ts_udip==0)=NaN;
ts_usip(ts_usip==0)=NaN;

ratio = nanmean(ts_udip)/nanmean(ts_usip);
% ratio = 9.309649530942099

% answer: 
% The results makes sense -> horizontal scans in darkspace