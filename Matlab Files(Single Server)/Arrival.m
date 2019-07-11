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


Queue_Limit = 100;
    if Server_Status == 1 % already busy
     Number_waiting=Number_waiting+1;	 
  global Time_Arrival;
  global Service_Time;
        Time_Arrival{Number_waiting} = Sim_Clock;	%array declaration global
        Service_Time{Number_waiting} = Next_service;
    elseif Number_waiting > Queue_Limit       
     sprintf('Overflow of the array time_arrival at: %d',Sim_Clock)
      exit;
    else
        Server_Status = 1; %set server status busy
        Time_Busy = Sim_Clock;
        Num_Delayed=Num_Delayed+1;
        Next_Departure = Sim_Clock + Next_service;
  		Utilization_Time = Utilization_Time + (Time_Busy - Time_Free);
    end;
    Next_Arrival = Sim_Clock + expon(); 
    Next_service = expon2();

    