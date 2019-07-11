clc;
clear global;

global Num_Delayed; 
global server_label;
global next_event_type;
global Waiting_Time; 
global Sim_Clock;
global Utilization_Time;
global Server_Status;
global Number_waiting;
global Event;
global k;
global servercount;

prompt='Multi Server Simulation mmc model'
 
 
 server_label = 1;
 initialize(); 
 server_label = 2;
 initialize();
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 while Num_Delayed<30
    timing();  
Event{k}=Sim_Clock;
switch next_event_type
    case 1     
      Arrival();
    case 2
      Departure();
    end;   
  B1{k}=Server_Status{1};
  B2{k}=Server_Status{2};
  Q1{k}=Number_waiting{1};
  Q2{k}=Number_waiting{2};
  k=k+1;
 end
   
 %%%%%%%%%%%%%%%%%%%%% Report Simualation %%%%%%%%%%%%%%%%%%%%%%%%%%%
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
    
    