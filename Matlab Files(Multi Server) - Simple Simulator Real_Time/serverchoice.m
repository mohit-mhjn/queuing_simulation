function []= serverchoice()

global Number_waiting;
global server_label;

[M,I]=min(cell2mat(Number_waiting));
server_label = I;
end
