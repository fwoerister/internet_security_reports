dataset = csvread ('../workfiles/global_last10years.csv', 1, 0); % loads csv data
ts_udip = dataset(:,5); % takes packets_per_day from dataset
ts_usip = dataset(:,4);

ts_udip(ts_udip==0)=NaN;
ts_usip(ts_usip==0)=NaN;

ratio = nanmean(ts_udip)/nanmean(ts_usip);
