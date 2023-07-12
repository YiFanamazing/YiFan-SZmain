clear;
%listname=dir('N*2_paramatrix.mat');%HC subject
%listname=dir('S*2_paramatrix.mat');%SCHZ subject
listnumber=size(listname);
a_t_dynamic_mean=[];
a_t_dynamic_SD=[];
a_t_dynamic_CV=[];
for k=1:listnumber(1);
    load(listname(k).name);
    stair=paramatrix(:,3);
    duration_time=paramatrix(:,7);
    small=[];
    large=[];
    k1=1;
    k2=1;

    
    for i=1:160
        switch stair(i)
            case 1
                small(k1,:)=duration_time(i)
                k1=k1+1;
            case 5
                large(k2,:)=duration_time(i)
                k2=k2+1;
        end
    end
    temp1=[small(1);small];
    temp2=[small;small(80)];
    trial_dynamic_temp=temp2-temp1;
    nargin=0;
    %verson 1 :delete 40 or 3 line.
    for i=1:81
        if (temp2(i)==3 && temp1(i)==3) || (temp2(i)==40 && temp1(i)==40) 
            trial_dynamic_temp(i-nargin,:)=[];
            nargin=nargin+1;
        end
    end
              
    if (~isempty(trial_dynamic_temp));
        deletedtnumber=size(trial_dynamic_temp);
        trial_dynamic_temp(deletedtnumber(1),:)=[];
    end
    
    a_t_dynamic_mean(k).s=mean(abs(trial_dynamic_temp));
    a_t_dynamic_SD(k).s=std(abs(trial_dynamic_temp));
    a_t_dynamic_CV(k).s=std(abs(trial_dynamic_temp))/mean(abs(trial_dynamic_temp));
    %for large
    temp1=[large(1);large];
    temp2=[large;large(80)];
    trial_dynamic_temp=temp2-temp1;
    nargin=0;
    %verson 1 :delete 40 or 3 line.
    for i=1:81
        if (temp2(i)==3 && temp1(i)==3) || (temp2(i)==40 && temp1(i)==40)
           trial_dynamic_temp((i-nargin),:)=[];
           nargin=nargin+1;
        end
    end
             
    if (~isempty(trial_dynamic_temp));
        deletedtnumber=size(trial_dynamic_temp);
        trial_dynamic_temp(deletedtnumber(1),:)=[];
    end
    
    a_t_dynamic_mean(k).l=mean(abs(trial_dynamic_temp));
    a_t_dynamic_SD(k).l=std(abs(trial_dynamic_temp));
     a_t_dynamic_CV(k).l=std(abs(trial_dynamic_temp))/mean(abs(trial_dynamic_temp));
   
end




