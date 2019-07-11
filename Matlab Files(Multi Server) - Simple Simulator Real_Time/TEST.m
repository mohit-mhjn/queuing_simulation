
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Initilaize %%%%%%%%%%%555
if Number_waiting{i} > 0
        Server_Status = 1
    end
    
    for n=1:Number_waiting{i}
      Time_Arrival{n,i} = 0;	
      Service_Time{n,i} = exprnd(2.19);
    end
 
    
    %%%%%%%%%%%%%%5  Global Main %%%%%%%%%%5
    
    prompt='Enter Online Counters:';
servercount = input(prompt);
prompt='Enter the Queue Status';
for i=1:servercount
    prompt=sprintf('Number Waiting at Server %d =',i);
    Number_waiting{i} = input(prompt);
end


%%%%%%%%%%% SIM MAIN
sprintf('Total Waiting Time in Queue(in min):%f', total_waiting_time)
sprintf('Number of Delayed Customers:%d',Num_Delayed)
sprintf('Average Waiting Time in Queue (in min):%f',total_waiting_time/Num_Delayed)   

for i=i:servercount
sprintf('Percentage Utilization Server Number - %d:%f',i,(Area_Utilization{1}/Sim_Clock)*100 )
end
%%%%%%%%%%%%%%%%%%%%%%%%
plot(cell2mat(avg_wait_time))
  x=0;
for i=1:8000
   x=x+(avg_utilization_serv(i,1));
   avg_collect(1,i)=x/i;
end
 





iter_number = iter_number + 1; 
                avg_wait_time{iter_number} = wait_avg;
                collect_mean{iter_number} = (mean(cell2mat(avg_wait_time),2));
                for m=1:servercount 
                avg_utilization_serv{iter_number,m}= serv_utility_avg{m}; 