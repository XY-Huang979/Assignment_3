function x=Accuracy(y,Y,k)
for i=1:k
    F=find(y==i);
    g(i)=length(find(Y(F)==(round(sum(Y(F))/(length(y(F)))))));
end
x=sum(g)/(length(y));
end
