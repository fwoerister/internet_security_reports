% rep-21b
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

subplot(1,2,1);
N_pkt=length(ts_packets); % gives vector length
ts_packets(ts_packets==0)=median(ts_packets); % in case of gaps (0-values), replace with the median
pkt_fft=fft(ts_packets); % calculates the fft
pkt_amp=abs(pkt_fft); % returns absolute values
k_pkt=(0:N_pkt-1); % creates an array from 0 to N-1
stem(k_pkt(2:(floor(N_pkt/2)+1)),pkt_amp(2:(floor(N_pkt/2)+1)),'marker', 'none') % plots stem graph
xlim([1 floor(N_pkt/2)]);
xlabel('k')
ylabel('Amplitude')
title('Amp. Spectrum for #pkts') %displays title
[max_amp_pkt, max_k_pkt]=sort(pkt_amp(2:(floor(N_pkt/2)+1)),'descend'); % finds maximum value and index

% max fft = 9.137220827459206 * 10^8 (first entry of max_amp_pkt)
% corresponding k = 3                (first entry of max_k_pkt)


subplot(1,2,2);
N=length(ts_usip); % gives vector length
ts_usip(ts_usip==0)=median(ts_usip); % in case of gaps (0-values), replace with the median
usip_fft=fft(ts_usip); % calculates the fft
usip_amp=abs(usip_fft); % returns absolute values
k=(0:N-1); % creates an array from 0 to N-1
stem(k(2:(floor(N/2)+1)),usip_amp(2:(floor(N/2)+1)),'marker', 'none') % plots stem graph
xlim([1 floor(N/2)]);
xlabel('k')
ylabel('Amplitude #usip')
title('Amp. Spectrum for #usip') %displays title
[max_amp_usip, max_k_usip]=sort(usip_amp(2:(floor(N/2)+1)),'descend'); % finds maximum value and index

% max fft = 2.159647426896751 * 10^7 (first entry of max_amp_usip)
% corresponding k = 1                (first entry of max_k_usip)

