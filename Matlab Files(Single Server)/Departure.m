function[]= Departure()

global Number_waiting;
global Server_Status;
global Next_Departure;
global Time_Free;
global Sim_Clock;
global Num_Delayed;
global Service_Time;
global Time_Arrival;
global Waiting_Time;
global Delay;


    if Number_waiting == 0    
        Server_Status= 0; % 0=idle
        Next_Departure = 1.0e+10;      
        Time_Free = Sim_Clock;
    else
        
 		Num_Delayed=Num_Delayed+1;
        Delay= Sim_Clock - Time_Arrival{1};
        Waiting_Time=Waiting_Time + Delay;
        Next_Departure = Sim_Clock + Service_Time{1}; 
        Number_waiting=Number_waiting-1;
    end;       
    for  i=1:Number_waiting
        Time_Arrival{i} = Time_Arrival{i + 1};  
        Service_Time{i} = Service_Time{i + 1};
    end;
        
         
    