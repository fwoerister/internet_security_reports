
format long % displays values in long fomrat
more off % disables paging of the output in the command window

dataset = csvread ('../workfiles/global_last10years.csv', 1, 0); % loads csv data
ts_udip = dataset(:,5); % takes packets_per_day from dataset
ts_usip = dataset(:,4);
ts_bph = dataset(:,2);
ts_pph = dataset(:,3);

min(min(corrcoef(dataset))) %= 0.588568377562657 between usip and udip

% correlation matrix:
%
% 1.000000000000000   0.855921546277600   0.834883365718598   0.674170569066529   0.863398621644262
% 0.855921546277600   1.000000000000000   0.965464188007304   0.720254105856209   0.934013733948946
% 0.834883365718598   0.965464188007304   1.000000000000000   0.610489716427586   0.973228424913565
% 0.674170569066529   0.720254105856209   0.610489716427586   1.000000000000000   0.588568377562657
% 0.863398621644262   0.934013733948946   0.973228424913565   0.588568377562657   1.000000000000000

% What could be the reason why the drop in the number of unique IP sources
% after Jan/16 does not cause a proportional drop in the other signals?
%
% The remaining source addresses are sending more data