function []= serverchoice()

global servercount;
global Number_waiting;
global server_label;

if Number_waiting{1} > Number_waiting{2}      %%Choice of Server numberwaiting{server_label}=minimum
    server_label = 2;
elseif Number_waiting{1} < Number_waiting{2}    
    server_label = 1;
elseif Number_waiting{1} == Number_waiting{2}
    server_label = randperm(servercount,1);      %%%%careful while generalizing that will be equal to equal waiting server array rowid
end