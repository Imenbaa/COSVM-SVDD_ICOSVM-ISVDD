function [ypred]= svmoneclassval1(x,xsup,alpha,rho,kernel,kerneloption)


K=normalizekernel(x,kernel,kerneloption,xsup);
ypred=K*alpha+rho;
%   [n1,n2]=size(ypred);
% ypred1=zeros(n1,1);
%  [A3 Z3]=MinMax(ypred);
%    ypredNew=mat2gray(ypred,[A3 Z3]); 
   
%  pred=zeros(n1,1);
%  pred(1:n1,1)=-2;
% %  
%  pred(ypred>0 ) =  1;
%  pred(ypred<=0) = 0;

end
