%=================================MGDA-LM==================================

n=165;
m=500;
A=D.';
s=0;
len=10;
epsilon=0.1:11;
for j=1:len
for i=1:length(epsilon)
    mu=0;
    b(i)=2/epsilon(i);
    a=rand(n,m)-0.5;
    Y1=mu-b(i)*sign(a).*log(1-2*abs(a));
    P1=0.5*(1+sign(Y1-mu).*(1-exp(-abs(Y1-mu)/b(i))));
    B=mod(A+round(Y1),3);
    C=A-B;
    S(i)=sum(sum(P1.*abs(C)))/(n*m);
end
    s=s+S;
end
plot(epsilon,s/len,'-bs','LineWidth',1.5);
hold on;
xlabel('Desired Privacy Budget (\epsilon)'); ylabel('Normalized Expected Estimation Error');

%=================================MGDA-RR==================================

n=165;
m=500;
D1=D.';
D2=D1(:);
C=D2.';
delta=0;
epsilon=0.1:11;
A=ones(1,n*m);
len=10;
s=0;
for t=1:len
for j=1:length(epsilon)
for i=1:length(A)
    a=int16(rand(1,1));
    if A(i)==0&a==0
        F(i)=C(i);
        P(i)=(exp(epsilon(j))+delta)/(1+exp(epsilon(j)));
    else if A(i)==0&a==1
        F(i)=round(rand(1,1)*2);
        P(i)=(1-delta)/(1+exp(epsilon(j)));
        else if A(i)==1&a==0
                F(i)=round(rand(1,1)*2);
                P(i)=(1-delta)/(1+exp(epsilon(j)));
            else if A(i)==1&a==1
                    F(i)=C(i);
                    P(i)=(exp(epsilon(j))+delta)/(1+exp(epsilon(j)));
                end
            end
        end
    end 
end
S(j)=sum(P.*abs(F-C))/(n*m);
end
s=s+S;
end
plot(epsilon,s/len,'-ro','LineWidth',1.5);
hold on;
xlabel('Desired Privacy Budget (\epsilon)'); ylabel('Normalized Expected Estimation Error');



xlim([0 10]);
ylim([0 0.6]);
legend('MGDA-LM, n=165, m=100, 300, and 500','MGDA-RR, n=165, m=100, 300, and 500');
