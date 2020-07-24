%"Ammlan Ghosh" <ammlan@yahoo.com  wrote in message <h0vklh$631$1@fred.mathworks.com ...
%  "Shamsad " <sumi.ice@gmail.com  wrote in message <gqfj0i$5ek$1@fred.mathworks.com ...
%    hello everyone
%    
%    I am doing some research on routing protocol for wireless mesh network. I need the matlab source code of AODV routing protocol. If any one have this source code , please send me....i nedd it urgently....please please ....help me....
%    
%    sharmeen.
%  
%  Dear Sharmeen,
%  
%  You can try this out. (Not yet ploted in the graph.)
%  
%  %Code : AODV Routing.
  x=1:20;
  s1=x(1);
  d1=x(20);
  clc;
  A=randint(20);
  % Making matrix all diagonals=0 and A(i,j)=A(j,i),i.e. A(1,4)=a(4,1),
  % A(6,7)=A(7,6)
  for i=1:20
  for j=1:20
  if i==j
  A(i,j)=0;
  else
  A(j,i)=A(i,j);
  end
  end
  end
  disp(A);
  t=1:20;
  disp(t);
  
  
  
  disp(A);
  status(1)='!';
  dist(1)=0;
  next(1)=0;
  
  for i=2:20
  
  status(i)='?';
  dist(i)=A(i,1);
  next(i)=1;
  disp(['i== ' num2str(i) ' A(i,1)=' num2str(A(i,1)) ' status:=' status(i) ' dist(i)=' num2str(dist(i))]);
  end
  
  flag=0;
  for i=2:20
  if A(1,i)==1
  disp([' node 1 sends RREQ to node ' num2str(i)])
  if i==20 && A(1,i)==1
  flag=1;
  end
  end
  end
  disp(['Flag= ' num2str(flag)]);
  while(1)
  
  if flag==1
  break;
  end
  
  temp=0;
  for i=1:20
  if status(i)=='?'
  min=dist(i);
  vert=i;
  break;
  end
  end
  
  for i=1:20
  if min dist(i) && status(i)=='?'
  min=dist(i);
  vert=i;
  end
  end
  status(vert)='!';
  
  for i=1:20
  if status()=='!'
  temp=temp+1;
  end
  end
  
  if temp==20
  break;
  end
  end
  
  i=20;
  count=1;
  route(count)=20;
  
  while next(i) ~=1
  disp([' Node ' num2str(i) 'sends RREP message to node ' num2str(next(i))])
  i=next(i);
  %disp(i);
  count=count+1;
  route(count)=i;
  route(count)=i;
  end
  
  disp([ ' Node ' num2str(i) 'sends RREP to node 1'])
  disp(' Node 1 ')
  for i=count: -1:1
  disp([ ' Sends message to node ' num2str(route(i))])
  end
  



%I have run this aodv code but there is no simulation of aodv protocol , can any one send me code for aodv simulation 
%Tags for this Thread
%Everyone's Tags:
%aodv(2), dsr routing pro... 
%Add a New Tag:
 
%Separated by commas
%Ex.: root locus, bode 
%What are tags?
%A tag is like a keyword or category label associated with each thread. Tags make it easier for you to find threads of interest.
%Anyone can tag a thread. Tags are public and visible to everyone.
%Tag Activity for This Thread
%Tag	Applied By	Date/Time
%dsr routing pro...
%Sudhakar Kumar	14 Feb, 2011 15:24:49
%aodv
%nasser	30 Jul, 2009 06:02:49
%aodv
%Ammlan Ghosh	13 Jun, 2009 03:34:03
 %Feed for this Thread 
%Contact us at files@mathworks.com

