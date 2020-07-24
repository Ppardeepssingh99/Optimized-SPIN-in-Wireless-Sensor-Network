function TAODV 
%This function simulate the concepts of Ad Hoc On-demand Distance Vector 
routing protocol  
%The function finds path from source node(node1) to destination node(node10) 
%The output of this function is the figure displaying network topology and 
%the selected path from source to destination,the average trust value of 
%the selected path and the number of hops 
clc; 
noOfNodes  =10; 
figure(1); 
clf; 
hold on; 
sor =1;%source node 
des=10;%destination node 
  
R =5; %node transmission range 
X = [1 2 4 4 8 6 7 9 10 10];%nodes' x coordinates 
Y = [6 2 5 8 5 1 10 2 8 5 ];%nodes' y coordinates 
Z =[1 0.1 0.6 0.8 0.6 0 0.1 1 1 1];%nodes' trust values 
  
%plotting network topology 
for i = 1:noOfNodes 
 plot(X(i), Y(i), '.'); 
    text(X(i), Y(i), num2str(i)); 
    for j = 1:noOfNodes 
        distance = sqrt((X(i) - X(j))^2 + (Y(i) - Y(j))^2); 
        if distance <= R 
            matrix(i, j) =1; 
            trust(i,j)=(Z(i)+ Z(j))/2; 
            line([X(i) X(j)], [Y(i) Y(j)], 'LineStyle', ':'); 
            matriz(i,j)=distance; 
        else 
            matrix(i,j) = inf; 
            trust(i,j)= inf; 
            matriz(i,j)=inf; 
        end 
         
    end 
end 
grid 
  
  
[path,cost]=hopbyhop(sor,des,trust);%finding the path from source to destination 
%cost =0; 
trusted_path=path 
hopbyhop_cost=cost 
trusted_path_hops=length(path)-1 
trusted_path_distance=0; 
for d=2:length(path) 
     
    trusted_path_distance= trusted_path_distance + matriz(path(d-1),path(d)); 
end 
trusted_path_distance 
  
for p =1:(length(path)-1) 
     line([X(sor) X(path(1))],[Y(sor) Y(path(1))],'Color','r','LineWidth', 1, 'LineStyle', '-') 
     line([X(path(p)) X(path(p+1))], [Y(path(p)) Y(path(p+1))], 'Color','r','LineWidth', 1, 'LineStyle','-') 
      
end 
return 