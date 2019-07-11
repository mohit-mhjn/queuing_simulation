
for i=1:servercount                    %determining min max waiting
   
  if min_waiting > Number_waiting{i}
       min_waiting=Number_waiting{i}; 
  end
  
  if max_waiting < Number_waiting{i}
       max_waiting = Number_waiting{i};
       max_waiting;
  end
end

    
while max_waiting > min_waiting+1      %jockeying repetition
    
count_to_line=1;
count_from_line=1;

for i=1:servercount                    % to_line and from_line  
    
    if Number_waiting{i}==min_waiting
        to_line{count_to_line}=i;
        count_to_line=count_to_line+1;
    end
    
    if Number_waiting{i}==max_waiting
       from_line{count_from_line}= i;
       count_from_line=count_from_line+1;
    end
    
end

count_to_line=count_to_line-1;
count_from_line=count_from_line-1;

   %%%%%%%%%%%%%%%%%%%%%%%%% exchange between queues %%%%%%%%%%%%
   if count_to_line > count_from_line
    
       random_selection = randperm(count_to_line,count_from_line);
       random_selection=random_selection(randperm(length(random_selection)));
       
  for j=1:count_from_line     
  
      %to_line{random_selection(j)}= %joining server_label
      %from_line{1}=   %leaving  server_label    
  
  if Server_Status{to_line{random_selection(j)}} == 1 % already busy
      Number_waiting{to_line{random_selection(j)}}=Number_waiting{to_line{random_selection(j)}}+1;	 
    
  Time_Arrival{Number_waiting{to_line{random_selection(j)}},to_line{random_selection(j)}} = Time_Arrival{Number_waiting{from_line{j}},from_line{j}};	%array declaration global
  Service_Time{Number_waiting{to_line{random_selection(j)}},to_line{random_selection(j)}} = Service_Time{Number_waiting{from_line{j}},from_line{j}}; 
else
        Server_Status{to_line{random_selection(j)}} = 1; %set server status busy
        Time_Busy{to_line{random_selection(j)}} = Sim_Clock;
        Num_Delayed=Num_Delayed+1;
        Next_Departure{to_line{random_selection(j)}} = Service_Time{Number_waiting{from_line{j}},from_line{j}};
  		Utilization_Time{to_line{random_selection(j)}} = Utilization_Time{to_line{random_selection(j)}} + (Time_Busy{to_line{random_selection(j)}} - Time_Free{to_line{random_selection(i)}});
end;
Number_waiting{from_line{1}}=Number_waiting{from_line{1}}-1;
 end

  elseif count_to_line < count_from_line
       
    random_selection = randperm(count_from_line,count_to_line);
    random_selection=random_selection(randperm(length(random_selection)));
  
   for j=1:count_to_line     
  
      %to_line{random_selection(j)}= %joining server_label
      %from_line{1}=   %leaving  server_label    
  
  if Server_Status{to_line{random_selection(j)}} == 1 % already busy
      Number_waiting{to_line{random_selection(j)}}=Number_waiting{to_line{random_selection(j)}}+1;	 
    
  Time_Arrival{Number_waiting{to_line{random_selection(j)}},to_line{random_selection(j)}} = Time_Arrival{Number_waiting{from_line{j}},from_line{j}};	%array declaration global
  Service_Time{Number_waiting{to_line{random_selection(j)}},to_line{random_selection(j)}} = Service_Time{Number_waiting{from_line{j}},from_line{j}}; 
else
        Server_Status{to_line{random_selection(j)}} = 1; %set server status busy
        Time_Busy{to_line{random_selection(j)}} = Sim_Clock;
        Num_Delayed=Num_Delayed+1;
        Next_Departure{to_line{random_selection(j)}} = Service_Time{Number_waiting{from_line{j}},from_line{j}};
  		Utilization_Time{to_line{random_selection(j)}} = Utilization_Time{to_line{random_selection(j)}} + (Time_Busy{to_line{random_selection(j)}} - Time_Free{to_line{random_selection(i)}});
end;
Number_waiting{from_line{1}}=Number_waiting{from_line{1}}-1;
  end
   end
   max_waiting = max_waiting -1 ;
   min_waiting = min_waiting +1 ;
end

   
   
   
  
  