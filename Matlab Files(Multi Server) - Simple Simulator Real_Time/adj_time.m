function new_time = adj_time(x,current_time)

new_time = current_time;
hours = floor(x./10000);
x = mod(x,10000);
min = floor(x./100);
sec = mod(x,100);

adj1 = 60-rem(new_time,100);

if sec >= adj1
    new_time = new_time + 0100 - (60-adj1);
    sec = sec - adj1;
end

adj2 = 60-((rem(new_time,10000)- rem(new_time,100))/100);
 
if min >= adj2
    new_time = new_time + 010000 - 100*(60-adj2);
    min = min - adj2 ;  
end
new_time = new_time+hours*10000+100*min+sec;
end

