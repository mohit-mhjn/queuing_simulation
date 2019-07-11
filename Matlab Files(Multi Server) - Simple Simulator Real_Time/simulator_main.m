
global shortlist
global Num_Delayed;
global server_label;
global next_event_type;
global Waiting_Time;
global Sim_Clock;
global Utilization_Time;
global Server_Status;
global Number_waiting;
global Event;
global k;
global servercount;
global wait_avg;
global serv_utility_avg;
global customer_number;
%%%%%% change service time and arrival generator %%%%%555

%----------------------------INITIALIZATION---------------------------------------------
initialize(); 
k = 1;
%-------------------------------------------------------------------------
 while customer_number<size(shortlist,1);
    timing();  
Event{k}= Sim_Clock;   %%%%   Record Server Status at each event %%%%%%
switch next_event_type
    case 1     
      Arrival();
    case 2
      Departure();
end

 for i=1:servercount
    Server_Status_record{k,i}=Server_Status{i};
    Number_waiting_record{k,i}=Number_waiting{i};
 end                             
k = k+1;
 end
 total_waiting_time = 0;
 
for j=1:servercount
 total_waiting_time =total_waiting_time+ Waiting_Time{j};
 Area_Utilization = Sim_Clock - Utilization_Time{j};
 serv_utility_avg{j} = (Area_Utilization/Sim_Clock)*100;
end
wait_avg = total_waiting_time/Num_Delayed;

Server_Status_record = cell2mat(Server_Status_record);

for m = 1:servercount

figure('name','Server Utilization vs Time for Server')
stairs(cell2mat(Event),Server_Status_record(:,m).') 
  xlabel('Simulation Clock');
  ylabel('Server Status: 1=BUSY and 0=IDLE ');
  
figure('name','Number Waiting vs Time for Server')
   stairs(cell2mat(Event),Number_waiting_record(:,m).')
   xlabel('Simulation Clock');
   ylabel('Number in Queue'); 

end

