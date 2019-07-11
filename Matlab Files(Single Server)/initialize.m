function [] = initialize()
  global  Num_of_Events;
  Num_of_Events = 2;
     
 %global Mean_interArrival_Time=1.0;  
 %global Mean_service_Time=0.5;
global DatasetVishal;
DatasetVishal = xlsread('Data','E2:F51');

global expon2ticket;
expon2ticket = 1;
global exponticket;
exponticket = 1;

 global Sim_Clock;
   Sim_Clock = 0.0;  
   global Server_Status;  %idle = 0 & busy = 1
   Server_Status = 0;  %idle = 0 & busy = 1
	global Time_Free
    Time_Free = Sim_Clock;
    global Utilization_Time;
    Utilization_Time=0;
	global Number_waiting;
 Number_waiting = 0;
 global Avg_waiting;
 Avg_waiting = 0;
 global Num_Delayed;
    Num_Delayed = 0;
 global k;
 k=1;
    global Waiting_Time;
    Waiting_Time = 0.0;
    global Delay;
    Delay = 0.0;
 
 global   Next_Arrival;         
     Next_Arrival = Sim_Clock + expon();
   global Next_service;
     Next_service = expon2();
    global Next_Departure;
    Next_Departure = 10^10;
    
    
    
    
