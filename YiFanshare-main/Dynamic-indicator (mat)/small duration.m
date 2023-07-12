listname=dir('D*_paramatrix.mat');%HC subject
yi=0;
for i=1:length(listname);
    name = listname(i,1);
    name = name.name;
    C = strsplit(name,{'N','_','_','_paramatrix.mat'},'CollapseDelimiters',true);
    subject_block_speed(i,1) = str2double(C{2});  
    subject_block_speed(i,3) = str2double(C{4});   
end

listnumber=size(listname);
for k=1:listnumber(1);
    load([listname(k).name]);
 
 
    small_duration = []; 
    conditions = [1,5];
    small_duration1 = paramatrix(find(  paramatrix(1:160,3)==conditions(1) & paramatrix(1:160,2) == 1),7);
    small_duration2 = paramatrix(find(paramatrix(1:160,3)==conditions(1) & paramatrix(1:160,2) == 2),7);
    %large_duration = paramatrix(find(paramatrix(1:160,3)==conditions(2)),7);
    small_duration = [ small_duration1 small_duration2]
    
    %small_duration_correct = [];
    %large_duration_correct=[];
    %conditions = [1,5];
    %small_duration_correct = paramatrix(find(paramatrix(1:160,3)==conditions(1)),8);
    %large_duration_correct = paramatrix(find(paramatrix(1:160,3)==conditions(2)),8);
    
    
    yi=yi+1;
    for j1 = 1:length(small_duration)
      small(yi,j1) = small_duration(j1,1);
      small(yi,j1+40) = small_duration(j1,2);   
    end
   %for j2 = 1:length(large_duration)
   %     large(k,j2) = large_duration(j2);
   %     large_correct(k,j2) = large_duration_correct(j2);
   % end
    
end