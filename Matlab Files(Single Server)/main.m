clc;

global Num_Delayed;
global next_event_type;
global Waiting_Time;
global Sim_Clock;
global Utilization_Time;
global Server_Status;
global Number_waiting;
global Event;
global k;


 prompt='Single server Simulation mm1 model'
        initialize(); 
    while Num_Delayed<30
           timing();  
      switch next_event_type
        case 1
        Arrival();
      B{k-1}=Server_Status; 
      Q{k-1}=Number_waiting;
        %break
        case 2
        Departure();
      B{k-1}=Server_Status; 
      Q{k-1}=Number_waiting;
        %break
        end;   
     
    end
    
     sprintf('Total Waiting Time in Queue(in min):%f',Waiting_Time)
     sprintf('Number of Delayed Customers:%d',Num_Delayed)
     sprintf('Average Waiting Time in Queue (in min):%f',Waiting_Time / Num_Delayed)
     sprintf('Clock Status(min): %f',Sim_Clock)
     Area_Utilization = Sim_Clock - Utilization_Time;
     sprintf('Utilization Percentage:%f',(Area_Utilization/Sim_Clock)*100 )
    
    figure
    stairs(cell2mat(Event),cell2mat(B))
    
    figure
    stairs(cell2mat(Event),cell2mat(Q))
    
  
     