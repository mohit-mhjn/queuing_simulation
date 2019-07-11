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

global Number_waiting;
global Store_Data
Number_waiting = Store_Data;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:servercount
      
global Server_Status;

global Time_Arrival;
global Service_Time;
global Time_Free
global Utilization_Time;
global Next_Departure;




for n=1:Number_waiting{i}
    Time_Arrival{n,i} = 0;	
    Service_Time{n,i} = exprnd(2.19);
end

if Number_waiting{i} > 0
   Server_Status{i} = 1;
   Time_Free{i} = 0;
   Utilization_Time{i}=Sim_Clock;
   Next_Departure{i} = Sim_Clock + Service_Time{1,i}  ;
else
    Server_Status{i} = 0;
    Next_Departure{i} = 10^10  ;
    Time_Free{i} = Sim_Clock;
Utilization_Time{i}=0;
end


	
global Waiting_Time;
Waiting_Time{i} = 0.0;

global Delay;
Delay{i} = 0.0;
 

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global   Next_Arrival;         
Next_Arrival = Sim_Clock + interarrival_gen();

global Next_service;
Next_service = service_time_generator();

end


    
    
    
