function XY= create(k ,d)
rand('state',sum(100*clock));
XY=zeros(2,k);
XY=d*rand(2,k);

