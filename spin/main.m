global old_mark p threshold_energy left_energy threshold_energy_common threshold_energy_head
threshold_energy_common=0.00005;%��ͨ�ڵ��������
threshold_energy_head=0.0001;%��ͷ�ڵ��������
k=100;%�ڵ���Ŀ
d=50;%����뾶
p=0.077;%�ɴظ���
load   XY_initial_energy_02.mat  XY_initial_energy_02   -ASCII;
XY=XY_initial_energy_02(1:2,:);
initial_energy=XY_initial_energy_02(3,:);
% initial_energy=0.45+(0.5-0.45)*rand(1,k);%��ʼ���ڵ�����
left_energy=initial_energy;%��ʼʱʣ����������ʼ�������
threshold_energy=0.00005;%��ʣ���������ڸ�����ʱ,��Ϊ�ڵ�����
mother_rounds=110;
sub_rounds=floor(1/p);%ȡ����
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
 

