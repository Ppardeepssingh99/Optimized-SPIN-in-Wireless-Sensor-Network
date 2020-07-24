function draw_cluster(XY,head_coordinate)
 [m,n]=size(XY);
 k=n;
 for i=1:k
     if head_coordinate(i)~=0
         drawline(XY(:,i),XY(:,head_coordinate(i)));
         hold on
     end
 end