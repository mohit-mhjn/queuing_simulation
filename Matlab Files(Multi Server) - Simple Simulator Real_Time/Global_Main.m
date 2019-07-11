clear global;
global universal_clock;
universal_clock = 123000;
global head_count;
head_count = 0;
global shortlist;
global Number_waiting;
global servercount;
global wait_avg;
global serv_utility_avg;
iter_number = 0;
servercount = 5;
                
shortlist = xlsread('Entry Only','B2:I700');
simulator_main();     
    
%sprintf('Average Waiting Time at checkouts(in min):%f',(mean(cell2mat(avg_wait_time),2)))
%for i=1:servercount 
%sprintf('Expected Utilization of server:%d in the next 30 min. = %f',i,mean(cell2mat())
%end

   