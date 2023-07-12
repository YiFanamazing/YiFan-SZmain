clear;
listname=dir('D*_paramatrix.mat');%HC subject

for i=1:length(listname);
    name = listname(i,1);
    name = name.name;
    C = strsplit(name,{'N','_','_','_paramatrix.mat'},'CollapseDelimiters',true);
    subject_block_speed(i,1) = str2double(C{2});  
    subject_block_speed(i,3) = str2double(C{4});   
end

listnumber=size(listname);
small_duration=[];
large_duration=[];
 
for k=1:listnumber(1);
    try
        small_duration(k,:)=fittingresult_SS_data(listname(k).name,'s');
    catch
        small_duration(k,:)= nan;
    end
end
for k=1:listnumber(1);
    try
        large_duration(k,:)=fittingresult_SS_data(listname(k).name,'l');
    catch
        large_duration(k,:)= nan 
    end
end
duration(:,1)=large_duration(:,1)
duration(:,2)=small_duration(:,1)
try
    duration(:,3)=duration(:,1)./duration(:,2)     % SI
catch
    duration(:,3)= nan 
end  
duration(:,4)=large_duration(:,2);
duration(:,5)=large_duration(:,3);
duration(:,6)=small_duration(:,2);
duration(:,7)=small_duration(:,3);
duration(:,8)=abs(duration(:,7)-duration(:,5));
% duration(:,9)=abs((large_duration(:,4)-large_duration(:,1))-(small_duration(:,4)-small_duration(:,1)));
duration(:,9)=(large_duration(:,4)-large_duration(:,1))-(small_duration(:,4)-small_duration(:,1));