% rep-17
format long
more off

dataset_jun17_proto = csvread('../workfiles/Jun2017_proto.csv',1,0);
dataset_jun17_gen = csvread('../workfiles/Jun2017_gen.csv',1,0);

icmp_data_no_packets = dataset_jun17_proto(:,2);
icmp_data_no_usip = dataset_jun17_proto(:,3);
icmp_data_no_udip = dataset_jun17_proto(:,4);

tcp_data_no_packets = dataset_jun17_proto(:,5);
tcp_data_no_usip = dataset_jun17_proto(:,6);
tcp_data_no_udip = dataset_jun17_proto(:,7);

udp_data_no_packets = dataset_jun17_proto(:,8);
udp_data_no_usip = dataset_jun17_proto(:,9);
udp_data_no_udip = dataset_jun17_proto(:,10);

total_no_packets = dataset_jun17_gen(:,2);
total_no_usip = dataset_jun17_gen(:,4);
total_no_udip = dataset_jun17_gen(:,5);

other_data_no_packets = total_no_packets - (icmp_data_no_packets + tcp_data_no_packets + udp_data_no_packets);
other_data_no_usip = total_no_usip - (icmp_data_no_usip + tcp_data_no_usip + udp_data_no_usip);
other_data_no_udip = total_no_udip - (icmp_data_no_udip + tcp_data_no_udip + udp_data_no_udip);

icmp_data_no_packets(icmp_data_no_packets==0) = NaN;
icmp_data_no_usip(icmp_data_no_usip==0) = NaN;
icmp_data_no_udip(icmp_data_no_udip==0) = NaN;

tcp_data_no_packets(tcp_data_no_packets==0) = NaN;
tcp_data_no_usip(tcp_data_no_usip==0) = NaN;
tcp_data_no_udip(tcp_data_no_udip==0) = NaN;

udp_data_no_packets(udp_data_no_packets==0) = NaN;
udp_data_no_usip(udp_data_no_usip==0) = NaN;
udp_data_no_udip(udp_data_no_udip==0) = NaN;

other_data_no_packets(other_data_no_packets==0) = NaN;
other_data_no_usip(other_data_no_usip==0) = NaN;
other_data_no_udip(other_data_no_udip==0) = NaN;

no_packets_stat =  [nanmean(icmp_data_no_packets) nanmedian(icmp_data_no_packets) std_to_percent_std(icmp_data_no_packets);
                    nanmean(tcp_data_no_packets) nanmedian(tcp_data_no_packets) std_to_percent_std(tcp_data_no_packets);
                    nanmean(udp_data_no_packets) nanmedian(udp_data_no_packets) std_to_percent_std(udp_data_no_packets);
                    nanmean(other_data_no_packets) nanmedian(other_data_no_packets) std_to_percent_std(other_data_no_packets)];

% no_packets_stat =
%   1.0e+07 *
%
%   1.652520354550514   1.632545020833350   0.000002535462566
%   0.174676119956909   0.167392640000000   0.000003969309951
%   0.018423925405332   0.014859826666667   0.000008308647929
%   0.001903965450187   0.001935640000003   0.000003327288837
                
no_usip_stat = [nanmean(icmp_data_no_usip) nanmedian(icmp_data_no_usip) std_to_percent_std(icmp_data_no_usip);
                nanmean(tcp_data_no_usip) nanmedian(tcp_data_no_usip) std_to_percent_std(tcp_data_no_usip);
                nanmean(udp_data_no_usip) nanmedian(udp_data_no_usip) std_to_percent_std(udp_data_no_usip);
                nanmean(other_data_no_usip) nanmedian(other_data_no_usip) std_to_percent_std(other_data_no_usip)];

% no_usip_stat =
%   1.0e+05 *
%
%   2.228585181619532   1.910519000000000   0.000298954446684
%   0.769301632616640   0.501584000000000   0.000592640217135
%   0.118353223787075   0.037579416666667   0.002762797920794
%  -0.209656579029369  -0.051009666666634  -0.001233258638306
           

no_udip_stat = [nanmean(icmp_data_no_udip) nanmedian(icmp_data_no_udip) std_to_percent_std(icmp_data_no_udip);
                nanmean(tcp_data_no_udip) nanmedian(tcp_data_no_udip) std_to_percent_std(tcp_data_no_udip);
                nanmean(udp_data_no_udip) nanmedian(udp_data_no_udip) std_to_percent_std(udp_data_no_udip);
                nanmean(other_data_no_udip) nanmedian(other_data_no_udip) std_to_percent_std(other_data_no_udip)];
            
% no_udip_stat =
%   1.0e+06 *
%
%   9.252954927972858   9.447762675000000   0.000014727847330
%   1.055424784819402   1.049155091666700   0.000035417422485
%   0.154843586815200   0.120220041666665   0.000092408445868
%  -0.743956257690013  -0.724278608333484  -0.000040126297674

% PLOTTING RESULTS
% how to read a boxplot: https://flowingdata.com/2008/02/15/how-to-read-and-use-a-box-and-whisker-plot/

subplot(1,3,1)
boxplot([icmp_data_no_packets,tcp_data_no_packets,udp_data_no_packets,other_data_no_packets],'Labels',{'icmp', 'tcp', 'udp', 'others'})
title('# of packets')

subplot(1,3,2)
boxplot([icmp_data_no_usip,tcp_data_no_usip,udp_data_no_usip,other_data_no_usip],'Labels',{'icmp', 'tcp', 'udp', 'others'})
title('# of unique source ip')

subplot(1,3,3)
boxplot([icmp_data_no_udip,tcp_data_no_udip,udp_data_no_udip,other_data_no_udip],'Labels',{'icmp', 'tcp', 'udp', 'others'})
title('# of unique destination ip')