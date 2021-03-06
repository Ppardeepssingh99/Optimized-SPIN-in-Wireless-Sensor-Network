function [bal_energy,bal_energy_rec,nodes_inrange,q,requesters,rand_val,d,S]=adv(advertiser,S,n)

bal_energy_receiver=0;
disp('********************************************************');
if(S(advertiser).E>0)

disp('in function adv & display advertiser');
disp(advertiser);

d1=0;
radius=20;
q=0;
   
           
       for j=1:1:n
            distance=sqrt( (S(advertiser).xd-(S(j).xd) )^2 + (S(advertiser).yd-(S(j).yd) )^2 ); %Finding nodes in advertiser's range
            if(j~=advertiser)    
            if (distance<=radius)
                   q=q+1; 
                   S(advertiser).in_range(q)=j;   %Storing in range nodes in array in_range()
                   S(advertiser).dist(q)=distance;  %Storing distances of  in range nodes in array dist()
            end
            end    
       end         
  

  nodes_inrange= S(advertiser).in_range();
 disp('Total number of nodes in range'); 
 disp(q);
   
disp('in function adv & display in range');
for t=1:1:q
            disp(S(advertiser).in_range(t));    
end
 
% Average Distance of advertised nodes
disp('average distance');
    for i=1:1:q
      d1=d1+S(advertiser).dist(i);
    end
    d=d1/q;
    disp(d);
    
% Finding request nodes    
rand_val=round(rand(1,1)*10);

disp('rand_val');
disp(rand_val);
      if(rand_val>q)
          rand_val=q;
      end;
    for i=1:1:rand_val
    S(advertiser).request(i)=S(advertiser).in_range(i);
    end
   
    disp('request nodes');
    for i=1:1:rand_val
       disp(S(advertiser).request(i));
    end
    
   requesters=S(advertiser).request();
    %req=S(advertiser).request();
%Eelec=Etx=Erx
ETX=50*0.000001;
%ETX=50*0.000000001;
ERX=50*0.0000000001;
%Transmit Amplifier types
Efs=0.015*0.00000000001;
Emp=0.0013*0.000000000001;
%Data Aggregation Energy
EDA=5*0.000000001;

              
energy_loss =( (ETX)*(4000) + Emp*4000*( d*d*d*d )); 
disp('energy_loss of advertiser node is');
disp(energy_loss);

   
    
bal_energy = S(advertiser).E-energy_loss; 

  disp('balance energy of adv node is');
disp(bal_energy); 
        

disp('energy loss of recievers in receiving the adv packet');
    
        energy_loss_rec=( (ERX)*(4000)  + Efs*4000*(d*d*d*d));
        disp(energy_loss_rec);
    
    
    for i=1:1:q
        bal_energy_receiver(i)=S(S(advertiser).in_range(i)).E;
    end
    for i=1:1:q
        bal_energy_receiver(i)=bal_energy_receiver(i)-energy_loss_rec;
    end
   bal_energy_rec=bal_energy_receiver();
end 
if(S(advertiser).E<=0)
   disp('advertiser has no energy');
  bal_energy=0;
 bal_energy_rec=0;
  nodes_inrange=0;
  q=0;requesters=0;rand_val=0;d=0;
end

end