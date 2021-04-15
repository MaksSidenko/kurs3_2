% ������ ����������� ����������� �������� ������� ���� 
% ��� �������� ��'���� ��������� 
clc
clear all

%=================== ������� ���� =======================================
%________________________________________________________________

% %                    128
% % WOBJ = ----------------------------
% %        s(0.02s+1)(0.04s+1)(0.15s+1)

tr=1.6;       % ������� ��� �����������
kob=128;     % ��������� ����. �������� ��'���� ��������� (��)
kv=192;      % kv ������� ����. �������� ����������� ������� ���
kreg=kv/kob; % ����. �������� ����������
klan=4;      % ������� ����� � ������������� ������� ��'���� ���������

% arn 1...arn klan  ������ ���������� ����� ��
% ard 1...ard klan  ������ ���������� ����� ��
arn1=[1 1]; 
ard1=[1 1];

arn2=[0 1]; 
ard2=[0.02 1]; 

arn3=[0 1];
ard3=[0.04 1];

arn4=[0 1];
ard4=[0.12 1];

% arn4=[0 1];
% ard4=[0.12 1];

% zapsv=16;   
% zapsn=16;  
%________________________________________________________________


% %                             162
% % WOBJ = ---------------------------------------
% %        s(0.016s+1)(0.042^2s^2+2*0.03*0.042s+1)
% 
% tr=1.4;      % ��� �����������
% kob=1624;    % ��������� ����. �������� ��'���� ��������� (��)
% kv=162;      % kv ������� ����. �������� ����������� ������� ���
% kreg=kv/kob; % ����. �������� ����������
% klan=3;      % ������� ����� � ������������� ������� ��'���� ���������
% 
% arn1=[0 1]; % arn 1...arn klan  ������ ���������� ����� ��
% ard1=[1 0]; % ard 1...ard klan  ������ ���������� ����� ��
%  
% arn2=[0 1];
% ard2=[0.016 1];
% 
% arn3=[0 1];
% ard3=[0.042^2 2*0.03*0.042 1];
% 
% zapsv=16.7;  
% zapsn=18.;    
% wzr=10;      
 
% %____________________________________________________________________
% 
% %                  200(0.01s^2+0.03*2*0.1s+1)(0.1s+1)
% % WOBJ = --------------------------------------------------------
% %        s(0.012s+1)(0.012^2s^2+2*0.07*0.012s+1)(0.08s+1)(0.2s+1)
% 
% tr=0.5;      % ��� �����������
% wzr=4*pi/tr;  % ������� ������� ����
% 
% kob=1000;    % ��������� ����. �������� ��'���� ��������� (��)
% kv=200;      % kv ������� ����. �������� ����������� ������� ���
% kreg=kv/kob; % ����. �������� ����������
% klan=7;      % ������� ����� � ������������� ������� ��'���� ���������
% 
% arn1=[0 1]; % arn 1...arn klan  ������ ���������� ����� ��
% ard1=[1 0]; % ard 1...ard klan  ������ ���������� ����� ��
% 
% arn2=[0 1];
% ard2=[0.012 1];
% 
% arn3=[0.01 0.03*2*0.1 1];
% ard3=[0 1];
% 
% arn4=[0.1 1];
% ard4=[0 1];
% 
% arn5=[0 1];
% ard5=[0.012^2 2*0.07*0.012 1];
% 
% arn6=[0 1];
% ard6=[0.008 1];
% 
% arn7=[0 1];
% ard7=[0.2 1];
% 
% zapsv=20;   
% zapsn=16;  
% wzr=95;


%____________________________________________________________________


% %                       2(5s+1)
% % WOBJ = ----------------------------------  ������ �
% %         s^2(s+1)(6^2 s^2 + 2*0.5*6 s + 1)
% 
% tr=100;      % ��� ����������� tr=40
% kob=1624;    % ��������� ����. �������� ��'���� ��������� (��)
% kv=40;      % kv ������� ����. �������� ����������� ������� ���
% kreg=kv/kob; % ����. �������� ����������
% klan=5;      % ������� ����� � ������������� ������� ��'���� ���������
% 
% arn1=[0 1]; % arn 1...arn klan  ������ ���������� ����� ��
% ard1=[1 0]; % ard 1...ard klan  ������ ���������� ����� ��
%  
% arn2=[0 1];
% ard2=[1 1];
% 
% arn3=[0 1];
% ard3=[6^2 2*0.5*6 1];
% 
% arn4=[5 1];
% ard4=[0 1];
% 
% arn5=[0 1]; 
% ard5=[1 0];
% 
% zapsv=27;  
% zapsn=20;    
% wzr=0.35;
% hw=0.00001; 
% wpr=10;
% nahn=80;
% nahv=20;
%=========================================================================

zapsv=16;   % �������� ����� ���� ���������������� ���������
              % ������ ����, ��
zapsn=16;
% wzr=round(9.54);    % ����� �������, ��       % ������� ������� ���� 
wzr=39.54;
kbb=1;  % ���� ������ ����: 0 - ��������, 1- ��������
% ���� ��������� � �������� ������ wlv...wpr ���/� �  ������ hw ���/�
hw=0.01; 
wpr=1000;
wlv=hw;
w=wlv:hw:wpr;
nahn=40; % ����� �������������� �'���������� ��������� bc. �� �������
         % Ln-nahn*log10(w)
nahv=40; % ����� �������������� �'���������� ��������� aan. �� �������
         % Lv-nahv*log10(w)
         
         
% ----- ���������� �����, ������������ ������� �� ������������ ����
%    --------- ��'���� ��������� 
WOBJ=kv;
bv=20*log10(kv); % ����� � ������������� ���� ��'���� ���������

for r=1:klan
    nom=eval(['arn' num2str(r)]); % ����� ����. ���������� r-�� ����� ��
    den=eval(['ard' num2str(r)]); % ����� ����. ���������� r-�� ����� ��
    
    if (length(nom)==2)&&(nom(1)) % �������� �����
        asn=(20*log10(nom(1).*w)).*(w>=1./nom(1));
        else
        asn=0;           
    end
    if length(nom)==3 % ����� ������� ������� � ���������� �� ��
        asn=(40*log10(sqrt(nom(1)).*w)).*(w>=1./sqrt(nom(1)));
    end
    if length(den)==2 % ���������� ��� ��������� �����
        if (den(1)==1)&&(den(2)==0) % ���������� 
            asd=-20*log10(w);
        else
            if den(1)&&den(2)
              asd=(-20*log10(den(1).*w)).*(w>=1./den(1)); % ��������� �����
            end
        end
    end
     if length(den)==3 % ����� ������� ������� � ���������� ��
        asd=(-40*log10(sqrt(den(1)).*w)).*(w>=1./sqrt(den(1)));
        ksid=den(2)./(2*sqrt(den(1)));
     end
    bv=bv+asn+asd;
    disp(['����� ' num2str(r)])
    W=tf(nom,den)
    WOBJ=WOBJ*W;
    
end
% -------------------------------------------------------------------------

WOBJ
WOBJ=minreal(WOBJ)
zpk_WOBJ=zpk(WOBJ)
[nob,dob]=tfdata(WOBJ,'v'); % ������ ����������� ������� ���������� nob
                            % � ���������� dob �� ��
rn=roots(nob); % ������ ������� ���������� �� ��
rd=roots(dob); % ������ ������� ���������� �� ��
wsn=abs(rn); % ������� ������� ���������� �� ��
wsd=abs(rd); % ������� ������� ���������� �� ��
%ksid=-real(rd)./wsd;
ksin=-real(rn)./wsn;
pas=find(wsd==0, 1, 'last' ); % ������� ��������� ������� �������

if isempty(pas)
    pas=0;
end
zsn(1:length(w))=-zapsn;
zsv(1:length(w))=zapsv;
plot(log10(w),zsn,'g',log10(w),zsv,'g')% ���� ����� ������ �������

[mag] = bode(WOBJ,w);
hold on
plot(log10(w),20*log10(mag(:)))% ������  ����  ������� �������
hold on
figure(1)

bv=20*log10(kv)-pas*20*log10(w); % ����� � ������������� ���� ��
for r=1:length(wsn)
    bv=bv+(20*log10(1./wsn(r).*w)).*(w>=wsn(r));
end
 for r=pas+1:length(wsd)
    bv=bv+(-20*log10((1./wsd(r)).*w)).*(w>=wsd(r));
end

plot(log10(w),bv,'r') % ������ ������������ ����  ������� �������
hold on
grid on
% ______________�������� ������ ������������ ����________________________
if ~kbb % ���� kbb =0, ��������������� �������� �������� �������� ������
        % ����, ���� kbb �� 0 - �������� �������� ����    
 
        % ������ ���� ��������

% ����� � ��������� �������� ������� wa � ����� �, �� ��� �������������
% ������������ ���� ��������� ������� ������� � ����� -zapsn. ����� wa
% ������ � ����������� ������� �������� ������ bv, ���� ��������� �� 
% ������� ����������� �� ���� -zapsn. ³���� �� �����, �� ������
% ������ bv, bb, b� ���'������ � �������� w �������������
% �������=hw*������
[m,wa]=min(abs(bv+zapsn));
wa=hw*wa;                      
wan=wa;
% ������ ������������ ���� ��������� � ����� bb.  �� ���������
% �������������� ������� ������ ���� ������� � �������� ����,
% ��������� � ����� �, ����� � ������� wa. ���� �������� ������ bb,
% ��������� � �������� � �������� round(1/hw*wa)
%(������=���������(1/hw*�������) ���  ����� �� ������ hw ���/�), ���������
% �������� ��������� �������� ������ bv.
bb(round(1/hw*wa):length(w))=bv(round(1/hw*wa):length(w));

% ��� �������� ������� ���������������� ������ ������ ����
% ��� ���������� ������ bb �� ��� ���������� ��������� ����� ����
% ���������������� ������ ������ ���� - ����� b. 
Ls=-zapsn+20*log10(wa); % �������� ����� ���������� �����������
% ���������������� ��������� ab � ���� ������� L.
% ������� wb � ����� b  ����������� � ������� L0s-20*log10(wb)=zaps,
% �����
wb=10.^((Ls-zapsv)/20);
bb(round(1/hw*wb):round(1/hw*wa))=...
    Ls-20*log10(w(round(1/hw*wb):round(1/hw*wa)));

%plot(log10(w(round(1/hw*wb):round(1/hw*wa))),...
    %bb(round(1/hw*wb):round(1/hw*wa)),'r','LineWidth',2)
% �������� � ��� �� �������� �� � ��� ��������� ������� ����������������
% ��������� ������ ����, �������� ������� ��������� bc, �� �'����
% ���������������� ������ ������ ���� � �������� ����. ��������� bc ��
% ����� -40��/��� (���� ���� -60��/���).
Ln=zapsv+nahn*(log10(wb));  % �������� ����� �������� �����������
% �'���������� ��������� bc � ���� ������� L. 
wc=10.^((20*log10(kv)-Ln)/(pas*20-nahn));
bb(round(1/hw*wc):round(1/hw*wb))=...
    Ln-nahn*log10(w(round(1/hw*wc):round(1/hw*wb)));
% ��������� ������ ����  �� ������� wc ������� � ��������, ����
bb(1:round(1/hw*wc))=bv(1:round(1/hw*wc)); 
%plot(log10(w),L0c-40*log10(w),'--')
plot(log10(w),bb,'black','LineWidth',1.2)

else
% ������ ���� ��������

Ls=20*log10(wzr); % �������� ����� ���������� �����������
                  % ���������������� ��������� ab � ���� ������� L.
wa=10.^((Ls+zapsn)./20); % �������,�� ��� ���������������� ���������
                        % �������� ����� zapsn (����� �)
wb=10.^((Ls-zapsv)./20);  % �������,�� ��� ���������������� ���������
                         % ������� ����� zapsv (����� b)
bb(round(1/hw*wb):round(1/hw*wa))=... % ���������������� ���������
    Ls-20*log10(w(round(1/hw*wb):round(1/hw*wa))); % ������ ����                     
% nahv ����� �������������� �'���������� ��������� aan. �� �������
         % Lv-nahv*log10(w)
Lv=nahv*log10(wa)-zapsn; % �������� ����� ���������� �����������
                        % �������������� ��������� aan � ���� ������� L
                     
[dfr,iwan]=min(abs(bv(round(1/hw*wa):round(1/hw*wpr))-...   % ������� min 
(Lv-nahv*log10(w(round(1/hw*wa):round(1/hw*wpr))))));   % ������� ������
  % ������� iwan, �� ��� ������������ �������������� ��������� ������
  % ����  � ��������������� ���������� ��'���� ��������� - ����� an
iwan=iwan+round(1/hw*wa); % ������� ��������� ������� iwan ����������
                          % � 1, � �� � ������� round(1/hw*wa), �� �����
%plot(log10(w(round(1/hw*wa):round(1/hw*wpr))),...
 %Lv-nahv*log10(w(round(1/hw*wa):round(1/hw*wpr))),'magenta','LineWidth',2)
wan=hw*iwan;
bb(round(1/hw*wa):round(1/hw*wan))=...
    Lv-nahv*log10(w(round(1/hw*wa):round(1/hw*wan)));
bb(round(1/hw*wan):round(1/hw*wpr))=bv(round(1/hw*wan):round(1/hw*wpr));

% nahn ����� �������������� �'���������� ��������� bc. �� �������
         % Ln-nahn*log10(w)
Ln=zapsv+nahn*(log10(wb));  % �������� ����� �������� �����������
                          % �'���������� �������������� ��������� bc �
                          % ���� ������� L. 
%wc=10.^((Ln-20*log10(kv))/20);

wc=10.^((20*log10(kv)-Ln)/(pas*20-nahn));

[dfr,iwc]=min(abs(bv(round(1/hw*wlv):round(1/hw*wb))-...   % ������� min 
(Ln-nahn*log10(w(round(1/hw*wlv):round(1/hw*wb))))));   % ������� ������
  % ������� iwan, �� ��� ������������ �������������� ��������� ������
  % ����  � ��������������� ���������� ��'���� ��������� - ����� an
%wc=hw*iwc              

bb(round(1/hw*wc):round(1/hw*wb))=...
    Ln-nahn*log10(w(round(1/hw*wc):round(1/hw*wb)));

% ��������� ������ ����  �� ������� wc ������� � ��������, ����
bb(1:round(1/hw*wc))=bv(1:round(1/hw*wc));
%bb(round(1/hw*wan):length(w))=bv(round(1/hw*wan):length(w));
end % if ~kbb
plot(log10(w),bb,'black','LineWidth',1.)
wc
wb
wa
wan
 
%_______________�������� ������ ���� ���������_____________________________

bc=bb-bv; % ����� � ������������� ���� ����������� �������������� ��������
plot(log10(w),bc,'magenta')
wall=[wsn; wsd; wa; wb; wc; wan];    

%=========��������� ������������ ������� ����������� ��������������
% �������� (����������) �� ����� ������ ���� ������������ ���� =======

% ���������� ��������� ������������ ������� ���������� ������
% ����������� ������ � ������ ���������� �������� �� ���� �� ������.
%�����  ��������� ����������� �� ��������� ������ ������� ������� bc �
% ������� �+1-��� �� �-�� ������ �� ��������� ������� �� ���� �������
% (�� ��� �� ����������� �������  ������� ��������� �� �������) �
% ����������� ������������� ��������.  ���������, �� ��������
% ������������� ��������, ������ ������� �� �������� �+1-���
% �� �-��� ������ �� � ������. �� ������ ���������� ���������� �������
% ������ ������ ��� ����� ���� ���� �����.
Lhw=log10(wlv+hw)-log10(wlv);% ���� �� ������ �� ������ �� ������
% ���������� ������ bc 
nahp=round((bc(2)-bc(1))./Lhw); % ���������� (����������) ����� �����
% ��������� ������������ ���� �������������� ��������, ��� �� ����� 
% ���������� ���������.
nah=nahp; % ����� �����  ��������� ���� �������������� ��������
kd=0; % ������� ����� � ���������� ������������ ������� ����������
kn=0; % ������� ����� � ���������� ������������ ������� ����������
dreg=1; % ��������� �������� �������� �� ������������ �������  ����������
nreg=1; % ��������� �������� ���������� ������������ �������  ����������
Td=[];
Tn=[];
for k=1:length(w)-1 % ������� ������ (w=k*hw) � ����� bc � ������
                    % ���� ������ �������� � ������ �� �'�������
    Lhw=(log10((k+1)*hw)-log10(k*hw));
    if round(((bc(k+1)-bc(k))/Lhw))~=nahp % ���� ����� �������.
        % ����� round(((bc(k+1)-bc(k))/Lhw)) �������� ���� ������
        % ���������, ��� �� �������� ��������� ���� ����� ����� ������ 
        % �������� ������ �������, �� ������� ���� ������. �����
        % �������� ������ ����������� �� ����� �������� ������� �+3 ��
        % �+2, �� ����������� �������� �� ����� ���� ������
        Lhw=(log10((k+3)*hw)-log10((k+2)*hw)); 
        nah=round(((bc(k+3)-bc(k+2))/Lhw));% ����� ���������� ������ ������
        [difw,iwall]=min(abs(wall-k*hw)); % ��������� �������, �� ���
                                          % ����� �������
        fric= wall(iwall); %  - ����� �������� ������� ���� ������
        if nah-nahp<0 % ���� ���� ������ ���������,������ ������ ���������
                      % ����� � ��������� �� ����������
             pldd=abs(nah-nahp)/20; % ������� ������� ����� (������� ��
                                    % �������)  � ��������� �� ����������
             irn=find(abs(wsn-fric)<1e-10); % ��������� �������
                         % ������� (������� ���� ��) �  ���������� ��
                         % �� ������ ���� ������
             if isreal(rn(irn)) % ���� ��� ����� ��� �������
                 Td(kd+1:kd+pldd)=1./fric; % ������� ����
                 % ������������ �����,�� �������� � ��������� �� ����������
                 tfidrr=1;
                 for pow=1:pldd
                     tfidrr=tfidrr*tf([0 1],[Td(kd+1) 1]);
                 end
                 dreg=dreg*tfidrr;
                 kd=kd+pldd;
             else % ������ (���) ���������� ��� ������, ����� �
                  % ���������� �� � �� ���� ��� ���� ���������� ����� ��
                  % ������ ���� ������ fric
                  icrn=find(imag(rn(irn))); % ������� ����������� �������
                         % ���������� �� ������ ���� ������ fric
                  kcrn=length(icrn); % ������� ����������� �������
                                 % ���������� �� ������ ���� ������ fric      
                  krrn=length(irn)-kcrn;  % ������� ������
                              % ������� (������� ���������� �����, ��
                              % ���������� � ��������� ��)
                              % �� ������ ���� ������ fric
                  Td(kd+1:kd+krrn+kcrn/2)=1./fric;  % ������� ���� ���
                                               %  �����,�� ���������
                                               % � ��������� �� ����������
                   ksi=ksin(icrn(1));
                   tfkd=1;
                   for pow=1:kcrn/2
                       tfkd=tfkd*tf(1,[Td(kd+1).^2 2*ksi*Td(kd+1) 1]);
                   end
                   dreg=dreg*tfkd;
                   tfid=1;
                   for pow=1:krrn
                       tfid=tfid*tf([0 1],[Tn(kd+1) 1]);
                   end
                   dreg=dreg*tfid;
                   kd=kd+ krrn+kcrn/2;                           
             end
        end %if nah-nahp<0 % ���� ���� ������ ���������
        
        if nah-nahp>0 % ���� ���� ������ ���������,������ ������
                      % ������������ ����� � ��������� �� ����������
             pldn=abs(nah-nahp)/20; % ������� ����� (������� �� �������), 
                                  % �� ���������  � ��������� �� ����������
             ird=find(abs(wsd-fric)<1e-10); % ��������� �������
                         % ������� (������� ������ ��) �  ���������� ��
                         % �� ������ ���� ������
             if isreal(rd(ird)) %���� ������ ����� ��� �������
                 Tn(kn+1:kn+pldn)=1./fric; % ������� ���� ������������
                           % �����,�� �������� � ��������� �� ����������
                 tffnrr=1;
                 for pow=1:pldn
                     tffnrr=tffnrr*tf([Tn(kn+1) 1],[0 1]);
                 end
                 nreg=nreg*tffnrr;
                 kn=kn+pldn;
             else % ������ (������) ���������� ��� ������, ����� �
                  % ���������� �� � �� ���� ��� ���� ���������� ����� ��
                  % ������ ���� ������ fric
                  icrd=find(imag(rd(ird))); % ������� ����������� �������
                         % ���������� �� ������ ���� ������ fric
                  kcrd=length(icrd); % ������� ����������� �������
                         % ���������� �� ������ ���� ������ fric      
                  krrd=length(ird)-kcrd;  % ������� ������
                              % ������� (������� ���������� �����, ��
                              % ���������� � ��������� ��)
                              % �� ������ ���� ������ wall(iwall)
                  Tn(kn+1:kn+krrd+kcrd/2)=1./fric;  % ������� ���� ���
                                               %  �����,�� ���������
                                               % � ��������� �� ����������
                   ksi=ksid(icrd(1));
                   tfk=1;
                   for pow=1:kcrd/2
                       tfk=tfk*tf([Tn(kn+1).^2 2*ksi*Tn(kn+1) 1],1);
                   end
                   nreg=nreg*tfk;
                   tff=1;
                   for pow=1:krrd
                       tff=tff*tf([Tn(kn+1) 1],[0 1]);
                   end
                   nreg=nreg*tff;
                   kn=kn+ krrd+kcrd/2;                           
             end
        end % if nah-nahp>0 % ���� ���� ������ ���������
    end % if round(((bc(k+1)-bc(k))/Lhw))~=nahp % ���� ����� �������
    nahp=nah;
end % �������� ������ bc � ������������� ���� ����������
        
%nreg
%dreg
Tn
Td
Wreg=nreg*dreg % ������������ ������� ����������
Wreg_zpk=zpk(Wreg)
[nr,dr]=tfdata(Wreg,'v');
preg=length(roots(dr));
disp(['������� ���������� ' num2str(preg)]) 
%============== ������������ ������� ���������� �������� =================

% ++++++++++++++++++++���������� �������++++++++++++++++++++++++

for n=1:kd
    text(log10(1./Td(n)),-50-6*(n-1),...
        ['1/Td' num2str(n) '=' num2str(1/Td(n))],'FontSize',8,...
    'HorizontalAlignment', 'left','BackgroundColor','white')
    plot([log10(1./Td(n)) log10(1./Td(n))],...
    [bc(round(1/(hw*Td(n))))-40-6*n bc(round(1/(hw*Td(n))))],'--')
end

for n=1:kn
    text(log10(1./Tn(n)),-35-6*(n-1),...
        ['1/Tn' num2str(n) '=' num2str(1/Tn(n))],'FontSize',8,...
    'HorizontalAlignment', 'right','BackgroundColor','white')
 plot([log10(1./Tn(n)) log10(1./Tn(n))],...
    [-35-5*(n-1) bc(round(1/(hw*Tn(n))))],'--')
end

if ~isempty(wsn)
    text(log10(wsn(1:length(wsn))), bv(round(1/hw*wsn(1:length(wsn)))),...
    '\color[rgb]{0.9 .2 .2}\bullet')
end

text(log10(wsd(pas+1:length(wsd))), bv(round(1/hw*wsd(pas+1:length(wsd)))),...
    '\color[rgb]{0.9 .2 .2}\bullet')

figure(1)
wzr=10.^(Ls/20) % ���������� ������� ���� � ������� L0s-20*log10(w)=0
text(log10(wzr), 0,'\color[rgb]{0.9 .2 .2}\bullet') % ���������� ������
%  bullet � � ����� � ������������ (log10(wz), 0)
text(log10(wzr), -5,['wzr=' num2str(wzr)],'HorizontalAlignment',...
    'right','BackgroundColor','white')
Lmax=ceil(1+bv(1/hw*10.^floor(log10(wc)))/10)*10;
% axis([floor(log10(wc)) round(log10(wpr))...
%     ceil(bv(1/hw*wpr)./10)*10 ceil(1+bv(1/hw*10.^floor(log10(wc)))/10)*10])
% ��������� ���� �� �������

plot([0 0],[-60 Lmax-20],'cyan','LineWidth',1) % �������� �� L
text(0, 70,'L(w),��','HorizontalAlignment',...
    'right','BackgroundColor','white')

%  bullet � circ  \uparrow   \downarrow 
text(log10(wc), bb(round(1/hw*wc)),'\color[rgb]{0.2 .2 .9}\bullet')       
text(log10(wb), bb(round(1/hw*wb)),'\color[rgb]{0.2 .2 .9}\bullet')
text(log10(wa), -zapsn,'\color[rgb]{0.2 .2 .9}\bullet')
text(log10(wan), bb(round(1/hw*wan)),'\color[rgb]{0.2 .2 .9}\bullet')

text(log10(wan)+0.02, bb(round(1/hw*wan))+3,'an','FontSize',11)
text(log10(wa)+0.02, -zapsn+3,'a','FontSize',11) 
text(log10(wb)+0.02, bb(round(1/hw*wb))+3,'b','FontSize',11)       
text(log10(wc)+0.02, bb(round(1/hw*wc))+3,'c','FontSize',11)

text(log10(wb)-0.001, bv(round(1/hw*wb))+3,'L��','FontSize',11,'color','red')
text(log10(wb)-0.02, bv(round(1/hw*wb))-5,'L�','FontSize',11,'color','blue')       
text(log10(wb)-0.2, bb(round(1/hw*wb))+3,'L�','FontSize',11,'color','black')
text(0.5*(log10(wc)+log10(wb)), -7,'Lc','FontSize',11,'color','magenta')

xlabel('lg(w), ���/c','FontSize',12,'Color','black')% ������
ylabel('L, ��','FontSize',12,'Color','black')       % �� ����

text(log10(wpr)-0.6, -zapsn+2,'\downarrow','color', 'black') % ���� ������
text(log10(wpr)-0.6, -3,'\uparrow','color', 'black')         % �������  
text(log10(wpr)-0.65, -zapsn*0.5,[' ����� ������� ' num2str(zapsn) ' ��'],...
    'HorizontalAlignment','left','BackgroundColor','white')

text(log10(wpr)-0.6, zapsv-3,'\uparrow','color', 'black') % ��������
text(log10(wpr)-0.6, 2,'\downarrow','color', 'black')     % ����� b  
text(log10(wpr)-0.6, zapsv*0.5,['   ' num2str(zapsv) ' ��'],...
    'HorizontalAlignment','left','BackgroundColor','white')

%+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

%<<<<<<<<<<<<<< ����������� (�������� �������) ������������ ������� <<<<
%<<<<<<<<<<<<<<<<<<<<<<<<<<<    ����������   <<<<<<<<<<<<<<<<<<<<<<<<<<<<

[h,bd]=hsvd(Wreg); % ���������� ����������� ����� �������
sys_balredp_1 = balred(Wreg,preg-1,bd) % ����������� ����������
                                       % �� preg-1 ������� 
sys_balredp_2 = balred(Wreg,preg-2,bd) % ����������� ����������
                                       % �� preg-2 �������
figure(1)
[mag] = bode(sys_balredp_2*WOBJ,w); 
%plot(log10(w),20*log10(mag(:)),'r') % ���� ��������� ������� 
hold on                             % � ����������� preg-2 �������

Wk=Wreg*WOBJ % ������������ ������� �����������
% ���������  ������� � ������������ ����������� 
Wk_min=minreal(Wk)
figure(1)
[mag] = bode(Wk,w);
plot(log10(w),20*log10(mag(:)),'magenta--','LineWidth',1) %���� ���������
                                  % ������� � ������������ �����������
[mag,phaze] = bode(Wk,wzr);
grid on
zphaze=round(180+phaze)
wz=feedback(Wk,1);
[y,t]=step(wz,0:0.01:2*tr);
ytr=y(round(tr/0.01)+1)-1 % ³�������� ����������� �������� � ��� tr
sigma_reg=max(y)-1        % ���������������
text(log10(wpr)-1,...
Lmax-20,['��������������� ' num2str(round(sigma_reg*1000)/10) ' %'],...
    'HorizontalAlignment','left','BackgroundColor','white')
text(log10(wpr)-1, Lmax-30,...
['³�������� ��� tr=' num2str(tr) 'c  ' num2str(round(ytr*10000)/100) ' %'],...
    'HorizontalAlignment','left','BackgroundColor','white')
text(log10(wpr)-1, Lmax-40,...
['����� �� ��� '  num2str(zphaze) ' ����'],...
    'HorizontalAlignment','left','BackgroundColor','white')

figure(3)
step(wz,2*tr,'r')   % ��������� ������� ������� � ������������ �����������
text(0.8*tr,...
0.3,['��������������� ' num2str(round(sigma_reg*1000)/10) ' %'],...
    'HorizontalAlignment','left','BackgroundColor','white')
text(0.8*tr, 0.4,...
['³�������� ��� tr=' num2str(tr) 'c  ' num2str(round(ytr*10000)/100) ' %'],...
    'HorizontalAlignment','left','BackgroundColor','white')
hold on             
grid on

figure(5)
wz=feedback(sys_balredp_1*WOBJ,1);
step(wz,2*tr)       % ��������� ������� ������� � ����������� �����������
grid on                    % �� ������� �����
[y,t]=step(wz,0:0.01:2*tr);
ytr=y(round(tr/0.01)+1)-1 % ³�������� ����������� �������� � ��� tr
sigma_balredp_1=max(y)-1    % ���������������

figure(7)
wz=feedback(sys_balredp_2*WOBJ,1);
step(wz,2*tr,'black') % ��������� ������� ������� � ����������� �����������
                      % ������� �������
[y,t]=step(wz,0:0.01:2*tr);
ytr=y(round(tr/0.01)+1)-1 % ³�������� ����������� �������� � ��� tr
sigma_balredp_2=max(y)-1    % ���������������
grid on


