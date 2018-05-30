    % rep-14a
format long % displays values in long fomrat
more off % disables paging of the output in the command window

dataset_jun = csvread ('../workfiles/Jun2017_gen.csv', 1, 0); % loads csv data

ts_udip_jun = dataset_jun(:,5);
ts_usip_jun = dataset_jun(:,4);
ts_bph_jun = dataset_jun(:,2);
ts_pph_jun = dataset_jun(:,3);

ts_udip_jun(ts_udip_jun==0)=NaN;
ts_usip_jun(ts_usip_jun==0)=NaN;
ts_bph_jun(ts_bph_jun==0)=NaN;
ts_pph_jun(ts_pph_jun==0)=NaN;

stat_table = [nansum(ts_udip_jun) nanmean(ts_udip_jun) nanmedian(ts_udip_jun) nanstd(ts_udip_jun);
              nansum(ts_usip_jun) nanmean(ts_usip_jun) nanmedian(ts_usip_jun) nanstd(ts_usip_jun);
              nansum(ts_bph_jun) nanmean(ts_bph_jun) nanmedian(ts_bph_jun) nanstd(ts_bph_jun);
              nansum(ts_pph_jun) nanmean(ts_pph_jun) nanmedian(ts_pph_jun) nanstd(ts_pph_jun)];

% stat_table =
%   1.0e+6 *
%
%     6922.229     9.695      9.937     1.443
%      207.103     0.290      0.241     0.098
%    13157.867    18.428     18.511     4.329
%   719606.146  1007.852    993.364   237.632
          
% rep-14b
dataset_longterm = csvread('../workfiles/global_last10years.csv',1,0);

ts = dataset_longterm(:,1);

start_ts = dataset_jun(1,1);
end_ts   = dataset_jun(length(dataset_jun),1);

dataset_longterm = dataset_longterm(ts>=start_ts&end_ts>=ts,:);

ts_udip_longterm = dataset_longterm(:,5);
ts_usip_longterm = dataset_longterm(:,4);
ts_bph_longterm = dataset_longterm(:,2);
ts_pph_longterm = dataset_longterm(:,3);

ts_udip_longterm(ts_udip_longterm==0)=NaN;
ts_usip_longterm(ts_usip_longterm==0)=NaN;
ts_bph_longterm(ts_bph_longterm==0)=NaN;
ts_pph_longterm(ts_pph_longterm==0)=NaN;

stat_table_longterm = [nansum(ts_udip_longterm) nanmean(ts_udip_longterm) nanmedian(ts_udip_longterm) nanstd(ts_udip_longterm);
              nansum(ts_usip_longterm) nanmean(ts_usip_longterm) nanmedian(ts_usip_longterm) nanstd(ts_usip_longterm);
              nansum(ts_bph_longterm) nanmean(ts_bph_longterm) nanmedian(ts_bph_longterm) nanstd(ts_bph_longterm);
              nansum(ts_pph_longterm) nanmean(ts_pph_longterm) nanmedian(ts_pph_longterm) nanstd(ts_pph_longterm)];
          
% stat_table_longterm =
%   1.0e+6 *
%
%   291.275      9.709       9.996       1.169
%   8.700        0.290       0.254       0.076
%   30268.997 1008.967    1008.526     101.158
%   553.823     18.461      19.124      3.080
