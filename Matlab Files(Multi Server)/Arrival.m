function[] = Arrival() 

global Server_Status;
global Number_waiting;
global Sim_Clock;
global Num_Delayed;
global Next_service;
global  Next_Arrival;
global Next_Departure;
global Time_Busy;
global Utilization_Time;
global Time_Free;
global server_label;
global customer_number;
Queue_Limit = 10;

serverchoice();    

if Server_Status{server_label} == 1 % already busy
   Number_waiting{server_label}=Number_waiting{server_label}+1;	 
  
  global Time_Arrival;
  global Service_Time;
        
  Time_Arrival{Number_waiting{server_label},server_label} = Sim_Clock;	%array declaration global
  Service_Time{Number_waiting{server_label},server_label} = Next_service;
  
elseif Number_waiting{server_label} > Queue_Limit       
     sprintf('Overflow of the array time_arrival at: %d',Sim_Clock)
      exit;

else
        Server_Status{server_label} = 1; %set server status busy
        Time_Busy{server_label} = Sim_Clock;
        Num_Delayed=Num_Delayed+1;
        Next_Departure{server_label} = Sim_Clock + Next_service;
  		Utilization_Time{server_label} = Utilization_Time{server_label} + (Time_Busy{server_label} - Time_Free{server_label});
end;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
customer_number = customer_number+1;
Next_Arrival = Sim_Clock + interarrival_gen(); 
Next_service = service_time_generator();
end

    