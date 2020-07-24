function [distance,member_amount]=join_cluster( XY,mark)
[m,n]=size(XY);
node_amount=n;
member_amount=zeros(1,node_amount);
distance=zeros(2,n);
position=find(mark==1);
[m,n]=size(position);
head_amount=n;
current_head=1;
[m,n]=size(find(mark==0));
if n==node_amount
    distance=zeros(2,node_amount);
    member_amount=zeros(1,node_amount);
    return
end    
for i=1:node_amount
    min_distance=1000;
    if mark(1,i)==0
        for j=1:head_amount
            
            if distance_two_node(XY(:,i)',XY(:,position(j))')<min_distance
                min_distance=distance_two_node(XY(:,i)',XY(:,position(j))');
                current_head=position(j);
            end
        end
        distance(1,i)=min_distance;
        distance(2,i)=current_head;
        member_amount(current_head)=member_amount(current_head)+1;
    end
end
                
        