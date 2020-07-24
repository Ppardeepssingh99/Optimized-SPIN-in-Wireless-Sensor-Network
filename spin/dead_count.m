function [dead_r, dead_nodes]=dead_count(X,n)

disp('************************************************************');
disp('in dead node count function');

  dead_n=0;
dead_r=0;
p=1;
    
     
    for j=1:1:n
    if(X(j).E<=0)
        plot(X(j).xd,X(j).yd,'red .');
        dead_r=dead_r+1;   
        dead_n(p)=j;
        p=p+1;
    end
    end
   
    dead_nodes=dead_n();
    
  disp('dead_r');
  disp(dead_r);  
    
  disp('dead nodes');
  for i=1:1:dead_r
  disp(dead_nodes(i));  
  end  
  
end