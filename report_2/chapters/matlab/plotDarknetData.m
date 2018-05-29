function plotDarknetData(dataset, y_data, y_label, set_title,date_format)
    if nargin <= 4
        date_format = 'mmm/yy';
    end
    timestamps = datenum (1970, 1, 1, 0, 0,dataset(:,1)); % transforms epoch into datenum format
    stem(timestamps, y_data, 'marker', 'none') % plots stem graphic
    datetick('x', date_format); % sets x-axis display format
    xlabel('days of observed time span') % sets x-axis label
    ylabel(y_label) % sets y-axis label
    title(set_title) % set plot title
    grid on % enables grid lines
    set(gca,'layer','top'); % places grid lines on the top
    xlim([min(timestamps) max(timestamps)])
end
