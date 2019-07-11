function [] =  predict_service()
global shortlist;
i = 1;
while i <= size(shortlist,1)
    service_time = exprnd(1.5);  %or dependency to shopping time 
    %service_time = floor(service_time)*100 + round(60*(service_time-floor(service_time)));
    shortlist(i,4)=service_time;
    i = i+1;
end

end

