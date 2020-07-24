

clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Field Dimensions - x and y maximum (in meters)
xm=100;
ym=100;

%x and y Coordinates of the Sink
sink.x=0.5*xm;
sink.y=0.5*ym;

%Number of Nodes in the field
n=100;

dead=0;
%Optimal Election Probability of a node
%to become cluster head
p=0.1;

%Energy Model (all values in Joules)
%Initial Energy 
Eo=0.5;
%Eelec=Etx=Erx
ETX=50*0.000001;
ERX=50*0.000000001;
%Transmit Amplifier types
Efs=10*0.000000000001;
Emp=0.0013*0.000000000001;

%maximum number of rounds
rmax=50;

%%%%%%%%%%%%%%%%%%%%%%%%% END OF PARAMETERS %%%%%%%%%%%%%%%%%%%%%%%%

%Computation of do
do=sqrt(Efs/Emp);


q=0;


%Creation of the random Sensor Network
figure(1);
for i=1:1:n
    S(i).xd=rand(1,1)*xm;
    XR(i)=S(i).xd;
    S(i).yd=rand(1,1)*ym;
    YR(i)=S(i).yd;
    S(i).G=0;
    %initially there are no cluster heads only nodes
    S(i).type='N';
   
    temp_rnd0=i;
        S(i).name=i;
        S(i).E=Eo;
        S(i).ENERGY=0;
        plot(S(i).xd,S(i).yd,'o');
        hold on;
   
    
end

S(n+1).xd=sink.x;
S(n+1).yd=sink.y;
plot(S(n+1).xd,S(n+1).yd,'x');
    
        
%First Iteration
figure(1);

advertiser=1;

for r=0:1:rmax
    r;
    
    round_counter=1;

hold off;

dead=0;
figure(1);
for i=1:1:n
    %checking if there is a dead node
    if (S(i).E<=0)
        plot(S(i).xd,S(i).yd,'red .');
        dead=dead+1;
        hold on;    
    end
    if S(i).E>0
        if (S(i).ENERGY==0)  
        plot(S(i).xd,S(i).yd,'o');
        end
        hold on;
    end
end
plot(S(n+1).xd,S(n+1).yd,'x');



X=S();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% an advertizer is sending the adv packets to all the nodes that comes in its sensing range
disp('calling adv function');
[bal_energy,bal_energy_rec,nodes_inrange,q,requesters,rand_val,d,S]= adv(advertiser,X,n);

if(bal_energy<=0)
  advertiser=advertiser+1;  
end
disp('requesters are:');
for c=1:1:rand_val
disp(requesters(c));
end
S(advertiser).E = bal_energy;
 
    for i=1:1:q
        S(nodes_inrange(i)).E= bal_energy_rec(i);
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% calling dead count function %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
        
        
  %  disp('calling dead count function');
 %X=S();   

 %[dead_r,dead_nodes]=dead_count(X,n);

 %dead=dead+dead_r;

 %disp('dead nodes per round');
 %disp(dead_r);

 %disp('dead nodes in this round');
  %   for i=1:1:dead_r
   %    disp(dead_nodes(i));
   %  end


disp('total dead nodes after advertisement');
disp(dead);

figure(1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% calling request function %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('calling request function');
for e=1:1:rand_val
    requester=requesters(e);
    disp('requester');disp(requester);disp('sending request to advertiser'); disp(advertiser);
    
    [bal_energy_requester,bal_energy_advertiser]= request(requester,advertiser,X,d);
    S(requester).E = bal_energy_requester;
    S(advertiser).E = bal_energy_advertiser;
    
    if(S(advertiser).E<=0)
        advertiser=advertiser+1;  
    end
    disp('bal_energy_requester');
    disp(bal_energy_requester);
    bal_energy_req(e)=S(requester).E;
    disp('bal_energy_advertiser');
    disp(bal_energy_advertiser);
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% calling dead count function %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(1);

X=S();


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% an advertizer is sending the data packets to all the nodes that comes in its sensing range
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%calling data_send function %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('calling data_send function');
[bal_energy_requester,bal_energy_advertiser]= data_send(advertiser,requesters,rand_val,X,d);


S(advertiser).E = bal_energy_advertiser;
 
    if(S(advertiser).E<=0)
        advertiser=advertiser+1; 
        if(advertiser>=100)
            advertiser=20;
        end 
    end
    
    for i=1:1:rand_val
        S(requesters(i)).E= bal_energy_requester(i);
    end
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%% calling dead count function %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


disp('total dead nodes after data send');
disp(dead);
figure(1);
    
end

disp('balance energy of adv');
disp(bal_energy);

disp('balance energy of in range nodes');
 for t=1:1:q
    disp(nodes_inrange(t));
  disp(bal_energy_rec(t));    
 end
 



disp('dead nodes');
disp(dead);


%disp(S(n+1).xd);
%disp(S(n+1).yd);
%disp(S(1));
%disp(S(2));
%disp(S(3));
%a=S(2).xd;
%b=S(2).yd;
%display_val(a,b);



