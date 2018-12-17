clc;
clear all;
close all;
%question1
dataset=load('C:\Users\Imen\Desktop\MIT\TP-Machine learning\dd_tools\Gauss1.mat');
figure(1);
plot(dataset.c1(:,1),dataset.c1(:,2),'r*',dataset.c2(:,1),dataset.c2(:,2),'g*');
%question2
%rbf
%question3
C1=dataset.c1;
C2=dataset.c2;
Train=gendatoc(C1(1:333,:),[]);
Test=gendatoc(C1(334:end,:),C2);
y_test=[ones(167,1);zeros(500,1)];
tic;
w1=incsvdd([],0.1,'r',25);
wtr=Train*w1;
timeisvdd=toc
E=Test*wtr*dd_roc1;
AUC_isvdd=dd_auc(E)
plotc(wtr,'b');
figure(2)
isvdd=plotroc(E,'b');
[Cisvdd,metric]=dd_confmat(Test,wtr);
Train1=gendatoc(C1(1:333,:),C2(1:2,:));
tic;
w2 = incsvc([],'r',0.1,25);
wtr2 =Train1*w2;
timeiOSVM=toc
E2= Test*wtr2*dd_roc;
%plotc(wtr2,'b')
hold on
iosvm=plotroc(E2,'r');
AUC_iosvm = dd_auc(E2)
[Ciosvm,metric]=dd_confmat(Test,wtr2);
tic
w3 = svdd([],0.1,1);  
wtr3 = Train * w3 ; 
timeSvdd=toc
E3= Test*wtr3*dd_roc;
hold on
svdd=plotroc(E3,'g');
AUC_svdd = dd_auc(E3)
[Csvdd,metric]=dd_confmat(Test,wtr3)
nu =0.3;
kernel ='gaussian';
kerneloption =0.33;
verbose =1;
Train2=C1(1:333,:);
Test2=[C1(334:end,:);C2];
tic
[xsup,alpha,rho,pos,Ksup]= svmoneclass ( Train2, kernel , kerneloption, nu , 0,1) ;
timeosvm=toc
ypred = svmoneclassval1 ( Test2 , xsup , alpha , rho , kernel ,kerneloption ) ;
[X,Y,~,AUC_osvm]=perfcurve(y_test,ypred,1);
osvm=plot(X,Y);
legend([isvdd,iosvm,svdd,osvm],{'isvdd','iosvm','svdd','osvm'})