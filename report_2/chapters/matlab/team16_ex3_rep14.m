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
%   1.0e+11 *
%
%   0.069222289834149   0.000096949985762   0.000099368031750   0.000014432664374
%   0.002071026026069   0.000002900596675   0.000002409368583   0.000000979586678
%   0.131578670037833   0.000184283851594   0.000185113704750   0.000043293617448
%   7.196061463190421   0.010078517455449   0.009933641137500   0.002376319611509
          
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
%   1.0e+10 *
%
%   0.029127520136559   0.000970917337885   0.000999594002569   0.000116940721152
%   0.000869961946634   0.000028998731554   0.000025440177533   0.000007628066401
%   3.026899742254127   0.100896658075138   0.100852601456600   0.010115785378086
%   0.055382274294682   0.001846075809823   0.001912394187535   0.000307961207980
