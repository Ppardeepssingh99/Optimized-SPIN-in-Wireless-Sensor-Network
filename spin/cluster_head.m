function [head_coordinate,new_mark]=cluster_head(XY,current_rounds)
global old_mark p left_energy threshold_energy_head
rand('state',sum(100*clock));
[m,n]=size(XY);
amount_node=n;
threshod_p=p/(1-p*(current_rounds-1));
head=zeros(1,amount_node);
head=rand(1,amount_node);
j=1;
%head_coordinate=zeros(2,amount_node);
new_mark=zeros(1,amount_node);
amount_head=0;
for i=1:amount_node
    if head(i)<threshod_p&old_mark(i)==0&left_energy(i)>threshold_energy_head
        amount_head=amount_head+1;
    end
end
head_coordinate=zeros(2,amount_head);
for i=1:amount_node
    if head(i)<threshod_p&old_mark(i)==0&left_energy(i)>threshold_energy_head
        head_coordinate(:,j)=XY(:,i);
        old_mark(i)=1; 
        new_mark(i)=1;
        j=j+1; 
    end
end