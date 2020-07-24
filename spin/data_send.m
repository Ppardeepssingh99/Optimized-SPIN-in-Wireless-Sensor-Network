function [bal_energy_requester,bal_energy_advertiser]=data_send(advertiser,requesters,rand_val,S,d)

bal_energy_req(20)=0;
bal_energy_requester=0;
disp('********************************************************');
if(S(advertiser).E>0)

disp('in function data_send display advertiser');
disp(advertiser);
 
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
  
bal_energy_advertiser = S(advertiser).E-energy_loss; 

  disp('balance energy of adv node is');
disp(bal_energy_advertiser); 
        

disp('energy loss of recievers in receiving the adv packet');
    
        energy_loss_rec=( (ERX)*(4000)  + Efs*4000*(d*d*d*d));
        disp(energy_loss_rec);
    
    
    for i=1:1:rand_val
        bal_energy_req(i)=S(requesters(i)).E;
    end
    for i=1:1:rand_val
        bal_energy_req(i)=bal_energy_req(i)-energy_loss_rec;
    end
   bal_energy_requester=bal_energy_req();
end 
if(S(advertiser).E<=0)
   disp('advertiser has no energy');
   % if(requesters==0)
        for i=1:1:rand_val
         bal_energy_req(i)=S(requesters(i)).E;
        end
       bal_energy_requester=bal_energy_req();   
   bal_energy_advertiser=0;
   
end
end