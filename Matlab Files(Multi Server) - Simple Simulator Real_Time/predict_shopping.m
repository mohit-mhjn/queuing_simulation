function []= predict_shopping()

global head_count;
global arrivals;
i = 1;
%predict_shop = arrivals; %read arrivals timestamp data  ## MIND RANGE ##
while i <= head_count
    shopping_time = normrnd(33.24,19.12); % MEAN:30 min. STD_DEV:6 min. ####
    shopping_time_conv = floor(shopping_time)*100 + round(60*(shopping_time-floor(shopping_time))); %conversion in the required format
    arrivals(i,2)= shopping_time;
    arrivals(i,3)= adj_time(shopping_time_conv,arrivals(i,1));   
    i = i+1;
end

%xlswrite('Customer_Database',predict_shop,'A2:C2000')  %recording the shopping times
clear i;
%clear predict_shop;

end
