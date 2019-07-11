function [] = Generate_Arrivals()

%data generated for j (th) outer iteration ####
global universal_clock;
universal_clock = 123000
global head_count;
global arrivals;
clear global arrivals
%arrivals = [];  %Check Max Range in XLS with B's label  ####
while universal_clock < 190000    %  Reloading Arrivals Interval
    if universal_clock < 143000
        mean = 0.4582;
    elseif universal_clock > 143000 && universal_clock < 163000 
        mean = 0.43;
    elseif universal_clock > 163000 && universal_clock < 173000 
        mean = 0.40;
    elseif universal_clock > 173000 
        mean = 0.30;
    end
    interarrival = exprnd(mean);  %can be varied as per the time of the day ####
    head_count = head_count + 1;
    interarrival = floor(interarrival)*100 + round(60*(interarrival-floor(interarrival)));
    arrival_timestamp = adj_time(interarrival,universal_clock);
    arrivals(head_count,1) = arrival_timestamp; %Customer_Database_Arrival_Entry
    universal_clock = arrival_timestamp;
end

end


