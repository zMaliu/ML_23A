% ÕâÊÇ²âÊÔº¯Êı
Momments={};
months = 1:12; 
hours = [9, 10, 12, 13, 15]; 
minutes = [0, 30, 0, 30, 0]; 
for month = months
    for i = 1:length(hours)
        Momments{end+1} = [month, hours(i), minutes(i)];
    end
end
Momments{1}=[];
