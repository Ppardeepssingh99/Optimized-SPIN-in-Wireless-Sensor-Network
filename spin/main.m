global old_mark p threshold_energy left_energy threshold_energy_common threshold_energy_head
threshold_energy_common=0.00005;%普通节点最底能量
threshold_energy_head=0.0001;%簇头节点最底能量
k=100;%节点数目
d=50;%区域半径
p=0.077;%成簇概率
load   XY_initial_energy_02.mat  XY_initial_energy_02   -ASCII;
XY=XY_initial_energy_02(1:2,:);
initial_energy=XY_initial_energy_02(3,:);
% initial_energy=0.45+(0.5-0.45)*rand(1,k);%初始化节点能量
left_energy=initial_energy;%开始时剩余能量跟初始能量相等
threshold_energy=0.00005;%当剩余能量低于该能量时,认为节点死亡
mother_rounds=110;
sub_rounds=floor(1/p);%取整数
rounds_timer=1;
rounds=mother_rounds*sub_rounds;
% XY=create(k,d);
for  i=1:mother_rounds
    old_mark=zeros(1,k);
    for j=1:sub_rounds
       [head_array,new_mark]=cluster_head(XY,j);
       [distance,member_amount]=join_cluster(XY,new_mark);
       waste_energy=commonAndhead_energy(XY,distance(1,:),member_amount);
       left_energy=left_energy-waste_energy;
       [m,n]=size(find(left_energy>threshold_energy));
       alive_nodes(rounds_timer)=n;
       rounds_timer=rounds_timer+1;
   end
end
sign=equal(1,1,rounds);
plot(sign(:,1:1000),alive_nodes(:,1:1000),'-')
xlabel('rounds')
ylabel('alive nodes')
 

