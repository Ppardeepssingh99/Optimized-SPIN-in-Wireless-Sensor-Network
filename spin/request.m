function [bal_energy_requester,bal_energy_advertiser]=request(requester,advertiser,S,d)

disp('********************************************************');
disp('********************************************************');

if(S(requester).E>0)
if(S(advertiser).E>0)

disp('in function  request & display requester');
disp(requester);
  
%req=S(advertiser).request();
%Eelec=Etx=Erx
ETX=50*0.000001;
ERX=50*0.0000000001;
%Transmit Amplifier types
Efs=0.015*0.00000000001;
Emp=0.0013*0.000000000001;
%Data Aggregation Energy
EDA=5*0.000000001;

              
energy_loss =( (ETX)*(4000) + Emp*4000*( d*d*d*d )); 
disp('energy_loss of requester node is');
disp(energy_loss);
  
bal_energy_requester = S(requester).E-energy_loss; 

  disp('balance energy of requester node is');
disp(bal_energy_requester); 
        

disp('energy loss of advertiser in receiving the request packet');
    
        energy_loss_rec=( (ERX)*(4000)  + Efs*4000*(d*d*d*d));
        disp(energy_loss_rec);
    
       bal_energy_advertiser=S(advertiser).E-energy_loss_rec;
     
end 
end
if(S(advertiser).E<=0)
   disp('advertiser has no energy');
   bal_energy_requester=S(requester).E;
   bal_energy_advertiser=0;
end
if(S(requester).E<=0)
   disp('requester has no energy'); 
   bal_energy_requester=0;
   bal_energy_advertiser=S(advertiser).E;
end
end