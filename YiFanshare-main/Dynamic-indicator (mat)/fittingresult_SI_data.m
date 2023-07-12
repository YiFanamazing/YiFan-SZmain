function output=fittingresult(subjectid,gratingsize)

load([subjectid]);

rawdata=[];
StrthRsp=[];

if gratingsize=='s'
   conditions=[1 2];
   curvecolor='r'; %%small grating
elseif gratingsize=='l'
   conditions=[3 4];
   curvecolor='b'; %%large grating
end

rawdata(:,1)=paramatrix(find(paramatrix(:,2)==conditions(1)|paramatrix(:,2)==conditions(2)),7);%stim strength
rawdata(:,2)=paramatrix(find(paramatrix(:,2)==conditions(1)|paramatrix(:,2)==conditions(2)),8);%response

rawdata=round(rawdata*100000)/100000;
StrthRsp(:,1)= unique(rawdata(:,1)); %�̼��ĵȼ���

for i=1:length(StrthRsp(:,1))
    StrthRsp(i,2)=length(find(rawdata(:,1)==StrthRsp(i,1)&rawdata(:,2)==1));%corret trials
    StrthRsp(i,3)=length(find(rawdata(:,1)==StrthRsp(i,1)));%total trials
end

StrthRsp(:,4)=StrthRsp(:,2)./StrthRsp(:,3);

StimStrength=StrthRsp(:,1);
RespAccuracy=StrthRsp(:,4);
TrialCount=StrthRsp(:,3);

linestyle='-';
output=fittingsigmoid(StimStrength,RespAccuracy,TrialCount,curvecolor,linestyle);



%%�ú�������s���������
%%StimStrength �̼�ǿ��
%%RespAccuracy ��Ӧ��ȷ��
%%TrialCount ÿ���̼����trial��
%%curvecolor ������ɫ r g b k������ɫѡ��
function output=fittingsigmoid(StimStrength,RespAccuracy,TrialCount,curvecolor,linestyle)
%StimStrength
%%%%%%%%%%%%%%���s������%%%%%%%%%%%%%%%%
x = log10(min(StimStrength)):0.001:log10(max(StimStrength));

%Threshold0= (log10(min(StrthRsp(:,1)))+ log10(max(StrthRsp(:,1))))/2;
tempindex=find(TrialCount==max(TrialCount));
Threshold0=log10(StimStrength(tempindex(1)));%��trial������ǿ����Ϊ�����ʼ����
%Threshold0=log10(4);%��trial������ǿ����Ϊ�����ʼ����
slope0=0.3;
beta0 = [Threshold0 slope0];
%fun = @(beta,x)(1+erf(((x-beta(1))/beta(2))/sqrt(2)))/2; %%chancelevel=0���
fun = @(beta,x)((1+erf(((x-beta(1))/beta(2))/sqrt(2)))/2)*0.5+0.5; %%chance level=0.5���
%fun = @(beta,x)((1+erf(((x-beta(1))/beta(2))/sqrt(2)))/2)*0.75+0.25; %%chance level=0.25���

% %2014�汾matlab�������
% wnlm = fitnlm(log10(StimStrength),RespAccuracy,fun,beta0,'weight',TrialCount);
% yfit = predict(wnlm,x');

%%2011��֮ǰ�汾matlab�������
[wnlm r2] = nlinfit(log10(StimStrength),RespAccuracy,fun,beta0);
% StimStrength
% RespAccuracy
% TrialCount
yfit=fun(wnlm,x');


% %%%%%%%%%%%%%%�� ͼ%%%%%%%%%%%%%%%%%%%%%%%%%
% %ͼ�ε���ɫ
% if curvecolor=='r'
%    linecolorr=[1 0 0];
%    dotcolorr=[0.8 0.4 0.4];
%  elseif curvecolor=='g'
%    linecolorr=[0 1 0];
%    dotcolorr=[0.4 0.8 0.4];
%  elseif curvecolor=='b'
%     linecolorr=[0 0 1];
%     dotcolorr=[0.5 0.5 0.8];
%  else
%     linecolorr=[0 0 0];
%     dotcolorr=[0.4 0.4 0.4];
% end
% 
% hold on
% plot(10.^x,yfit,'LineWidth',2,'Color',linecolorr,'LineStyle',linestyle)
% scatter(StimStrength,RespAccuracy,TrialCount*5,'ro','MarkerFaceColor',dotcolorr,'MarkerEdgeColor','none')

ThreP=0.75;%��ֵ������ȷ��
    ThreP85=0.85;
ThreIndex=find(abs(yfit-ThreP)==min(abs(yfit-ThreP)));
    ThreIndex85=find(abs(yfit-ThreP85)==min(abs(yfit-ThreP85)));
Threshold=10^x(ThreIndex);%�ҵ���Ӧ����ֵ
    Threshold85=10^x(ThreIndex85);
% line([min(StimStrength) Threshold],[ThreP ThreP],'color',[0.5 0.5 0.5])
% line([Threshold Threshold],[ThreP 0],'color',dotcolorr)
% text(Threshold,0.05,num2str(Threshold,'%4.3g'))

% line([0.3 0.3],[0 1],'color',[0.5 0.5 0.5])

% xlabel('Duration (SD of Gaussian Envelop)')
% ylabel('% of Correct Response')

output=[Threshold wnlm Threshold85];

%plot(exp(x),yfit1,'r',exp(x),yfit2,'k',exp(x),yfit3,'b','LineWidth',2);
%legend('test cued','center cued','ref cued');

