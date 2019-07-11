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
global server_label;

    if Number_waiting{server_label} == 0    
        Server_Status{server_label}= 0; % 0=idle
        Next_Departure{server_label} = 1.0e+10;      
        Time_Free{server_label} = Sim_Clock;
    else
        
 		Num_Delayed=Num_Delayed+1;
        Delay{server_label}= Sim_Clock - Time_Arrival{1,server_label};
        Waiting_Time{server_label}=Waiting_Time{server_label} + Delay{server_label};
        Next_Departure{server_label} = Sim_Clock + Service_Time{1,server_label}; 
        Number_waiting{server_label}=Number_waiting{server_label}-1;
    end;       
   
    for  i=1:Number_waiting{server_label}
        Time_Arrival{i,server_label} = Time_Arrival{i + 1,server_label};  
        Service_Time{i, server_label} = Service_Time{i + 1,server_label};
    end;
    
    %jockeying(); 
         
    