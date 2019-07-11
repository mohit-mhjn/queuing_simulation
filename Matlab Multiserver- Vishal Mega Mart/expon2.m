%Service Time Function
%exprnd(mean)= Random Numbers that follow exponential distribution
%poissrnd(lamda)= Random Numbers that follow poisson distribution
%Mean Service time = 0.5

function y1 = expon2() 
    %prompt= 'Enter next service time';
	%y1=input(prompt);
    global expon2ticket;
global DatasetVishal;
    %prompt= 'Enter next service time';
	%y1=input(prompt);
    y1 = DatasetVishal(expon2ticket,1);
    expon2ticket = expon2ticket + 1;
    