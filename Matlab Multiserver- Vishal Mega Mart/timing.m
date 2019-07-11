function[] = timing() 
 
global next_event_type;
 global Next_Arrival;
 global Next_Departure;
 global Sim_Clock;
global server_label;
global servercount;

server_label=0;
 next_event_type = 0;
 first_departure = 10^20;
 first_departure_at = 0;

 for i=1:servercount %No of Servers departure array

 if first_departure >= Next_Departure{i}
    first_departure= Next_Departure{i};
    first_departure_at = i;  
 end
 
 end

 
if Next_Arrival <= first_departure      
       next_event_type = 1;
       Sim_Clock= Next_Arrival; 
    
elseif Next_Arrival > first_departure
       next_event_type = 2;
       server_label = first_departure_at;
       Sim_Clock = Next_Departure{server_label};
end
    
 if next_event_type == 0
 sprintf('Event List Empty at Time:%d',Sim_Clock)
 end    
        
 
 

