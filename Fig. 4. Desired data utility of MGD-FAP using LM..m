%============================MGD-FAP-LM, U=0.4=============================

U=0.4;
n=165;
m=500;
D1=D.';
D2=D1(:);
T=D2.';
M=U*n*m;
N=n*m-M;
s=0;
len=10;
epsilon=0.1:11;
for j=1:len
for i=1:length(epsilon)
    mu=0;
    b(i)=2/epsilon(i);
    a=rand(10*n,10*m)-0.5;
    Y1=mu-b(i)*sign(a).*log(1-2*abs(a));
        
    Y2=Y1(find(mod(round(Y1),3)==0));
    T1=Y2(1:M);
    Y3=Y1(find(mod(round(Y1),3)~=0));
    T2=Y3(1:N);
    T3=[T1.' T2.'];
       
    C=T3(randperm(n*m));
    P1=0.5*(1+sign(C-mu).*(1-exp(-abs(C-mu)/b(i))));
    G=mod(T+round(C),3);
    F=G-T;
    zero=length(find(F==0));
    S(i)=zero/(n*m);
end
    s=s+S;
end
plot(epsilon,s/len,'-bs','LineWidth',1.5);
hold on;
xlabel('Desired Privacy Budget (\epsilon)'); ylabel('Desired Data Utility');

%============================MGD-FAP-LM, U=0.6=============================

U=0.6;
n=165;
m=500;
D1=D.';
D2=D1(:);
T=D2.';
M=U*n*m;
N=n*m-M;
s=0;
len=10;
epsilon=0.1:11;
for j=1:len
for i=1:length(epsilon)
    mu=0;
    b(i)=2/epsilon(i);
    a=rand(10*n,10*m)-0.5;
    Y1=mu-b(i)*sign(a).*log(1-2*abs(a));
        
    Y2=Y1(find(mod(round(Y1),3)==0));
    T1=Y2(1:M);
    Y3=Y1(find(mod(round(Y1),3)~=0));
    T2=Y3(1:N);
    T3=[T1.' T2.'];
       
    C=T3(randperm(n*m));
    P1=0.5*(1+sign(C-mu).*(1-exp(-abs(C-mu)/b(i))));
    G=mod(T+round(C),3);
    F=G-T;
    zero=length(find(F==0));
    S(i)=zero/(n*m);
end
    s=s+S;
end
plot(epsilon,s/len,'-ro','LineWidth',1.5);
hold on;
xlabel('Desired Privacy Budget (\epsilon)'); ylabel('Desired Data Utility');

%============================MGD-FAP-LM, U=0.8=============================

U=0.8;
n=165;
m=500;
D1=D.';
D2=D1(:);
T=D2.';
M=U*n*m;
N=n*m-M;
s=0;
len=10;
epsilon=0.1:11;
for j=1:len
for i=1:length(epsilon)
    mu=0;
    b(i)=2/epsilon(i);
    a=rand(10*n,10*m)-0.5;
    Y1=mu-b(i)*sign(a).*log(1-2*abs(a));
        
    Y2=Y1(find(mod(round(Y1),3)==0));
    T1=Y2(1:M);
    Y3=Y1(find(mod(round(Y1),3)~=0));
    T2=Y3(1:N);
    T3=[T1.' T2.'];
       
    C=T3(randperm(n*m));
    P1=0.5*(1+sign(C-mu).*(1-exp(-abs(C-mu)/b(i))));
    G=mod(T+round(C),3);
    F=G-T;
    zero=length(find(F==0));
    S(i)=zero/(n*m);
end
    s=s+S;
end
plot(epsilon,s/len,'-gd','LineWidth',1.5);
hold on;
xlabel('Desired Privacy Budget (\epsilon)'); ylabel('Desired Data Utility');



xlim([0 10]);
ylim([0.3 1.1]);
legend('MGD-FAP-LM, U=0.4, n=165, m=100, 300, and 500','MGD-FAP-LM, U=0.6, n=165, m=100, 300, and 500','MGD-FAP-LM, U=0.8, n=165, m=100, 300, and 500');
