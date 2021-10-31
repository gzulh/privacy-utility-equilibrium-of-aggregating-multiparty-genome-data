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
    zero=length(find(C==0));
    S(i)=zero/(n*m);
end
    s=s+S;
end
plot(epsilon,s/len,'-bs','LineWidth',1.5);
hold on;
xlabel(' Desired Privacy Budget (\epsilon)'); ylabel('Data Utility');

%=================================MGDA-RR==================================

n=165;
m=500;
delta=0;
F=D.';
E=F(:);
A=E';
s=0;
len=10;
epsilon=0.1:11;
for k=1:len
for j=1:length(epsilon)
for i=1:length(A)
    a=int16(rand(1,1));
    if A(i)==0&a==1
        B(i)=A(i);
        P(i)=(exp(epsilon(j))+delta)/(1+exp(epsilon(j)));
    else if A(i)==0&a==0
        B(i)=int16(rand(1,1))+1;
        P(i)=(1-delta)/(1+exp(epsilon(j)));
        else if A(i)==1&a==1
                B(i)=A(i);
                P(i)=(exp(epsilon(j))+delta)/(1+exp(epsilon(j)));
            else if A(i)==1&a==0
                    B(i)=mod(A(i)+2,3);
                    P(i)=(1-delta)/(1+exp(epsilon(j)));
            else if A(i)==2&a==1
                    B(i)=A(i);
                    P(i)=(exp(epsilon(j))+delta)/(1+exp(epsilon(j)));
            else if A(i)==2&a==0
                    B(i)=int16(rand(1,1));
                    P(i)=(1-delta)/(1+exp(epsilon(j)));                
                end
                end
                end
            end
        end
    end 
end
C=A-B;
zero=length(find(C==0));
S(j)=zero/(n*m);
end
s=s+S;
end
plot(epsilon,s/len,'-ro','LineWidth',1.5);
hold on;
xlabel(' Desired Privacy Budget (\epsilon)'); ylabel('Data Utility');



xlim([0 10]);
ylim([0.3 1.1]);
legend('MGDA-LM, n=165, m=100, 300, and 500','MGDA-RR, n=165, m=100, 300, and 500');
