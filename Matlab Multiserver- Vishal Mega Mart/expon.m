%Arrival Time Function
%exprnd(mean)= Random Numbers that follow exponential distribution
%poissrnd(lamda)= Random Numbers that follow poisson distribution
%Mean Arrival time = 1


function x1= expon()  
	%prompt= 'Enter next inter-arrival time';
	%x1=input(prompt);
global exponticket;
global DatasetVishal;
	%prompt= 'Enter next inter-arrival time';
	%x1=input(prompt);
x1 = DatasetVishal(exponticket,2);
    exponticket = exponticket + 1;

