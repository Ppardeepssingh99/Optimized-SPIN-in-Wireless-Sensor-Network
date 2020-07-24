%energy_transmit=energy_elec*k+energy_amp*d^2
%���п�kΪ�����ֽ���,d����뾶
function waste_energy= commoAndhead_node_energy(XY,distance,member)
[m,n]=size(XY);
k=n;
waste_energy=zeros(1,k);
bits=2000;
energy_trans_elec=50*10^(-9);
energy_receive_elec=50*10^(-9);
energy_amp=100*10^(-12);
energy_fuse=5*10^(-9);%�ں�ÿ����Ϣÿ��������������
base_coordinate=[25,150];%��վλ��
for i=1:k
    if distance(i)~=0
        waste_energy(i)=energy_trans_elec*bits+energy_amp*bits*distance(i)^2;
    else
        distance2base=distance_two_node(XY(:,i)',base_coordinate);
        waste_energy(i)=energy_receive_elec*bits*member(i)+bits*energy_fuse*member(i);%�������ݼ��ں�������������
        waste_energy(i)=waste_energy(i)+energy_trans_elec*bits+energy_amp*bits*distance2base^2;%�ں����ݺ�,���䵽��վ��������
    end
end

