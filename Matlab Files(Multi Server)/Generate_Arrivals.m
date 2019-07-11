function [] = Generate_Arrivals()

%data generated for j (th) outer iteration ####
global universal_clock;
global head_count;
global arrivals;
clear arrivals;
arrivals = [];  %Check Max Range in XLS with B's label  ####
local_clock = universal_clock;

while local_clock < adj_time(001000, universal_clock)       %  Reloading Arrivals Interval
    interarrival = exprnd(0.4582);  %can be varied as per the time of the day ####
    head_count = head_count + 1;
    interarrival = floor(interarrival)*100 + round(60*(interarrival-floor(interarrival)));
    arrival_timestamp = adj_time(interarrival,local_clock);
    arrivals(head_count,1) = arrival_timestamp; %Customer_Database_Arrival_Entry
    local_clock = arrival_timestamp;
end
universal_clock = arrival_timestamp;
clear local_clock;
end