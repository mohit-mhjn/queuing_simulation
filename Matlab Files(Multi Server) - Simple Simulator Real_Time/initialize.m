function [] = initialize()
  
global  Num_of_Events;
Num_of_Events = 2;

global servercount
global Num_Delayed ;
Num_Delayed = 0;

global Sim_Clock;
Sim_Clock = 0.0;  

global customer_number;
customer_number = 1;
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:servercount
    
      
global Server_Status;             
Server_Status {i} = 0;  %idle = 0 & busy = 1


global Time_Free
Time_Free{i} = Sim_Clock;
    
global Utilization_Time;
Utilization_Time{i}=0;
	
global Number_waiting;
Number_waiting{i} = 0;
 
global Waiting_Time;
Waiting_Time{i} = 0.0;

global Delay;
Delay{i} = 0.0;
 
global Next_Departure;
Next_Departure{i} = 10^10;

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global   Next_Arrival;         
Next_Arrival = Sim_Clock + interarrival_gen();

global Next_service;
Next_service = service_time_generator();

end

    
