clear global;
global universal_clock;
universal_clock = 103000;
global head_count;
head_count = 0;
global shortlist;
global Number_waiting;
global servercount;
global wait_avg;
global serv_utility_avg;
global Store_Data;

iter_number = 0;

while universal_clock < 113000    %% To make sufficient data 
    Generate_Arrivals();
end

Generate_Arrivals();  %%%  Talking on 11:40    

prompt='Enter Online Counters:';
servercount = input(prompt);
prompt='Enter the Queue Status';

for i=1:servercount
    prompt=sprintf('Number Waiting at Server %d =',i);
    Store_Data{i} = input(prompt);
end
   
    out_iter = 1;
    while out_iter <= 30
        predict_shopping();
        in_iter = 1;
        while in_iter <= 30
            shortlisting();
            in_most_iter = 1;
            while in_most_iter <= 30
                predict_service();
                simulator_main();
                iter_number = iter_number + 1; 
                avg_wait_time{iter_number} = wait_avg;
                collect_wait_mean{iter_number} = (mean(cell2mat(avg_wait_time),2));
                for m=1:servercount 
                avg_utilization_serv{iter_number,m}= serv_utility_avg{m};
                end
                in_most_iter  = in_most_iter + 1; 
            end
            in_iter = in_iter + 1;
        end
        out_iter = out_iter + 1;
    end
    
sprintf('Expected Average Waiting Time at checkouts(in min):%f',(mean(cell2mat(avg_wait_time),2)));

for i=1:servercount 
sprintf('Expected Utilization of server:%d in the next 30 min. = %f',i,mean(cell2mat(avg_utilization_serv{:,m}),1));
end

%plot(cell2mat(avg_wait_time))
%plot(cell2mat(avg_wait_time))