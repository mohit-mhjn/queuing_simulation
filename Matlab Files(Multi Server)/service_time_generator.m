%Service Time Function
%exprnd(mean)= Random Numbers that follow exponential distribution
%poissrnd(lamda)= Random Numbers that follow poisson distribution
%Mean Service time = 0.5

function y1 = service_time_generator() 
    global shortlist
    global customer_number
    
    y1 = shortlist(customer_number,4);
end
