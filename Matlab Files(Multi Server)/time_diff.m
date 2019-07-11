function diff = time_diff(t1,t2)

f = max(t1,t2);
p = t1 + t2 - f;

hour_diff = floor(f./10000)-floor(p./10000);
f = mod(f,10000);
p = mod(p,10000);

min_diff = floor(f./100)-floor(p./100);
if min_diff < 0
    hour_diff = hour_diff - 1;
    min_diff = 60 + min_diff;
end

f = mod(f,100);
p = mod(p,100);

sec_diff = f - p;
if sec_diff < 0
    min_diff = min_diff - 1;
    sec_diff = 60 + sec_diff; 
end
diff = 10000*hour_diff + 100*min_diff + sec_diff;
end

