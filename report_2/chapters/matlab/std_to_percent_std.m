function result = std_to_percent_std( dataset )
%STD_TO_PERCENT_STD Summary of this function goes here
%   Detailed explanation goes here

std = nanstd(dataset);
mean = nanmean(dataset);

result = (std/mean) * 100;

end

