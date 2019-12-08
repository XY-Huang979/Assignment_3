%% Initialization
clear ; close all;clc

% Load Data

load('Iris.mat');
x(:,4)=10*x(:,4);
k=max(y)-min(y)+1;
m=length(y);
A=0;
for h=1:10
r=randi([1 m],1,k);
K=x(r,:);%%Center point
C=zeros(1,k);
while C~=ones(1,k)   
    for i=1:m
        D=10000000*ones(1,k);%%distance
        for j=1:k
            D(j)=sum((x(i,:)-K(j,:)).^2);
            if min(D)==D(j)
                Y(i,1)=j;
            end
        end
    end
    for i=1:k
        F=find(Y==i);
        K1(i,:)=sum(x(F,:))./(length(F));
        if K1(i,:)~=K(i,:)
            K(i,:)=K1(i,:);
            C(i)=0;
        else
            C(i)=1;
        end
    end
end
A0=Accuracy(y,Y,k);
if A0>A
    A=A0;
    yY=[y,Y];
end
end
plot(x(find(yY(:,1)==1),1),x(find(yY(:,1)==1),4),'b+',x(find(yY(:,1)==2),1)...
    ,x(find(yY(:,1)==2),4),'ro',x(find(yY(:,1)==3),1),x(find(yY(:,1)==3),4),'mx');

% Put some labels 

hold on;
xlabel('sepal length in cm')
ylabel('petal width in cm')

hold off;
yY=1*yY
fprintf('\nThe accuracy rate is: %f %%\n',...
    100*A);
    
        
        
        