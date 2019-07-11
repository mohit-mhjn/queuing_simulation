function[] = timing() 
 
global next_event_type;
global Next_Arrival;
global Next_Departure;
global Sim_Clock;
global server_label;

server_label=0;
next_event_type = 0;

[M,I]=min(cell2mat(Next_Departure)); 
  
if Next_Arrival <= M      
       next_event_type = 1;
       Sim_Clock= Next_Arrival; 
    
else 
       next_event_type = 2;
       server_label = I;
       Sim_Clock = Next_Departure{I};
end
    
 if next_event_type == 0
 sprintf('Event List Empty at Time:%d',Sim_Clock)
 end    
        
 
 

