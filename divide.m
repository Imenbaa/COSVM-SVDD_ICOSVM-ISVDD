function [train,test]=divide(data)
[m,n]=size(data)
p=2/3
index=randperm(m)
train= data(index(1:round(p*m)),:)
test= data(index(round(p*m)+1:end),:)
end