%Arrival Time Function
%exprnd(mean)= Random Numbers that follow exponential distribution
%poissrnd(lamda)= Random Numbers that follow poisson distribution
%Mean Arrival time = 1


function x1= interarrival_gen() 
    global shortlist;
    global customer_number;
	%prompt= 'Enter next inter-arrival time';
	%x1=input(prompt);
    if customer_number == 1
        x1 = time_diff(0,shortlist(customer_number,3));
    else
        x1 = time_diff(shortlist(customer_number,3),shortlist(customer_number-1,3));
    end
    x1 = floor(x1./100)+ (mod(x1,100)/60);
end
