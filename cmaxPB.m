function [sol,alpha_c]=cmaxPB(Rat,Da)
 %fp=fopen('growthrate(R=10,Pr=1,Le=10,Ras=50,,RI=10000,Ra=1000).txt','w');
n=50;
phi=0.0174533*30;
Rac=-10;
Q=2;
%Da=0.0001;
Le=1;
alp=0.1:0.1:4;
alpha=zeros(1,50);

for N=1:length(alp)
     a=alp(N);
     [A,B]=matrixPB_DDC(a,n,Rat,Rac,Da,phi,Q,Le);
     lambda=eig(A,B);
     lambda(imag(lambda) == inf | imag(lambda) == -inf | real(lambda) == inf | real(lambda) == -inf)=[];
    [~,is]=sort(lambda);
     c=lambda(is);
%      SReal=real(c);
%      SImg=imag(c);
     grow(N)=max(real(c));
    alpha(N)=a;
%    table=[a,grow(N)];
%    fprintf(fp,'%f\t%f\n',table);
end    
 [sol]=max(grow);
 alpha_c=alpha(N);


%if imag(mid(d))~=0, 'flag', end
end   