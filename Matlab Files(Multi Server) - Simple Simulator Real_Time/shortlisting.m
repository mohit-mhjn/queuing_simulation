function [] = shortlisting()

global universal_clock;
global head_count;
global shortlist;
global arrivals;
shortlist = arrivals; %xlsread('Customer_Database','A2:C2000');
prob_shopping = 0.92; %out of total customer how many actually bought ####
i = 1;
checkout = head_count;
while i <= checkout
    is_shopping = rand;
    if is_shopping > prob_shopping
        shortlist(i,:) = [];
        checkout = checkout - 1;
        i=i+1;
        continue
    else
        if shortlist(i,3) <= universal_clock  %30 min. is the planning period 
           shortlist(i,:) = [];
           checkout = checkout - 1;
        end
    end
    i=i+1;
end
shortlist = sortrows(shortlist,3);
end
