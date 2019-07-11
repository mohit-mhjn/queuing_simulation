function [] = initialize()
  
global  Num_of_Events;
Num_of_Events = 2;

global servercount
servercount=2;

global Sim_Clock;
Sim_Clock = 0.0;  

global DatasetVishal;
DatasetVishal = xlsread('Data','E2:F51');

global expon2ticket;
expon2ticket = 1;
global exponticket;
exponticket = 1;

global Num_Delayed;
Num_Delayed = 0;
   
global server_label;

global Server_Status;             
Server_Status {server_label} = 0;  %idle = 0 & busy = 1

global Time_Free
Time_Free{server_label} = Sim_Clock;
    
global Utilization_Time;
Utilization_Time{server_label}=0;
	
global Number_waiting;
Number_waiting{server_label} = 0;
 
global k;
k=1;

global Waiting_Time;
Waiting_Time{server_label} = 0.0;

global Delay;
Delay{server_label} = 0.0;

global   Next_Arrival;         
Next_Arrival = Sim_Clock + expon();

global Next_service;
Next_service = expon2();
 
global Next_Departure;
Next_Departure{server_label} = 10^10;
    
    
    
    
