%% 画出二维空间中以点 X 和点 Y 为端点的直线
function y=drawline(x,y)
%x(1)=10;y(1)=20;
%x(2)=5;y(2)=30;
delx=y(1)-x(1);
dely=y(2)-x(2);
if delx==0
    if dely==0
        error('the same point!');
    elseif dely>0
        t=x(2):dely/100:y(2);
        s=x(1)*ones(size(t));
        plot(s,t);
    else
        t=y(2):abs(dely/100):x(2);
        s=x(1)*ones(size(t));
        plot(s,t);
    end
elseif delx>0
    if dely==0
        s=x(1):delx/100:y(1);
        t=x(2)*ones(size(s));
        plot(s,t);
        
    else
        s=x(1):delx/100:y(1);
        t=dely/delx.*(s-x(1))+x(2);
        plot(s,t);
    end
else
    if dely==0
        s=y(1):delx/100:x(1);
        t=x(2)*ones(size(s));
        plot(s,t);
    else
        s=y(1):abs(delx/100):x(1);
        t=dely/delx.*(s-x(1))+x(2);
        plot(s,t);
    end
end

