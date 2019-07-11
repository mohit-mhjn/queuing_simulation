function[] = timing() 
 
global next_event_type;
 global Next_Arrival;
 global Next_Departure;
 global Sim_Clock;
global Event;
global k;

 next_event_type = 0;
    if Next_Arrival < Next_Departure     
        next_event_type = 1;
        Sim_Clock= Next_Arrival; 
    else
        next_event_type = 2;
        Sim_Clock = Next_Departure;
    end
    
    Event{k}=Sim_Clock;
    k=k+1;
    
    if next_event_type == 0
       sprintf('Event List Empty at Time:%d',Sim_Clock)
    end    
        
         
 

