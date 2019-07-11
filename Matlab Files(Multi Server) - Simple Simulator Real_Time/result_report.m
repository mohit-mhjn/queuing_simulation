total_waiting_time = 0;

for j=1:servercount
 total_waiting_time =total_waiting_time+ Waiting_Time{j};
end

     sprintf('Total Waiting Time in Queue(in min):%f', total_waiting_time)
     sprintf('Number of Delayed Customers:%d',Num_Delayed)
     sprintf('Average Waiting Time in Queue (in min):%f',total_waiting_time/Num_Delayed)
     sprintf('Clock Status(min): %f',Sim_Clock)
     
     Area_Utilization{1} = Sim_Clock - Utilization_Time{1};
     Area_Utilization{2} = Sim_Clock - Utilization_Time{2};
     
     sprintf('Percentage Utilization of First Server:%f',(Area_Utilization{1}/Sim_Clock)*100 )
     sprintf('Percentage Utilization of Second Server:%f',(Area_Utilization{2}/Sim_Clock)*100 )
     
%------------------------------------------ PLOTTING ------------------------------------   
    %figure
    %stairs(cell2mat(Event),cell2mat(Q))
    
   figure('name','Server Utilization vs Time : First Server')
   stairs(cell2mat(Event),cell2mat(B1)) 
  xlabel('Simulation Clock');
    ylabel('Server Status: 1=BUSY and 0=IDLE ');
    
    figure('name','Server Utilization vs Time : Second Server')
    stairs(cell2mat(Event),cell2mat(B2),'--r')
    xlabel('Simulation Clock');
    ylabel('Server Status: 1=BUSY and 0=IDLE ');

   figure('name','Number Waiting vs Time : First Server')
   stairs(cell2mat(Event),cell2mat(Q1))
   xlabel('Simulation Clock');
   ylabel('Number in Queue');
   
   figure('name','Number Waiting vs Time : Second Server')
   stairs(cell2mat(Event),cell2mat(Q2),'--r')
   xlabel('Simulation Clock');
   ylabel('Number in Queue');
    