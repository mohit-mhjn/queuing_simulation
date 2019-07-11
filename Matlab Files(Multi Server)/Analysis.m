shop_mat = xlsread('Entry_Fitting_Data','A2:G701');
i = 1;
%entry_start = 131453;
%exit_start = 133326;
while i < 700
    %shop_mat(i,5) = adj_time(shop_mat(i,1),entry_start);
    %shop_mat(i,6) = adj_time(shop_mat(i,2),exit_start);
    %shop_mat(i,7) = adj_time(shop_mat(i,3),exit_start);
    %shop_mat(i,8) = adj_time(shop_mat(i,4),exit_start);
    %t = time_diff(shop_mat(i+1,1),shop_mat(i,1));
    %shop_mat(i,9) = floor(t./100) + (mod(t,100)/60)  ;
    %t = time_diff(shop_mat(i,2),shop_mat(i,3));
    %shop_mat(i,12) = floor(t./100) + (mod(t,100)/60);
    %t = time_diff(shop_mat(i,8),shop_mat(i,7));
    %shop_mat(i,11) = floor(t./100) + (mod(t,100)/60);
    %shop_mat = sortrows(shop_mat,3);
    %shop_mat(i,8) = time_diff(shop_mat(i+1,3),shop_mat(i,3)) ;
    
    t = time_diff(shop_mat(i+1,1),shop_mat(i,1));
    shop_mat(i,8) = floor(t./100) + (mod(t,100)/60)  ;
    
    i = i+1;
end
%shop_mat(109,9) = 0;
%shop_mat(109,8) = 0;
%shop_mat(109,6) = time_diff(shop_mat(109,2),shop_mat(109,1));
%shop_mat(109,7) = time_diff(shop_mat(109,4),shop_mat(109,3));
 

xlswrite('Entry_Fitting_Data',shop_mat,'A2:H701')

