function []=test()

f=fopen('var.txt','rt');
inaccuracy = 0.001; %погрешность

str1=fgetl(f);             
v1 = eval(str1);
str2=fgetl(f);          
v2 = eval(str2);
str31=fgetl(f);              
v31 = eval(str31);
str32=fgetl(f); 
v32 = eval(str32);


%{
v1 = @(x) 3 * x .^ 4 + 8 * x .^ 3 + 6 * x .^ 2 - 10;
v2 = @(x) log(2 + x) + 2 * x - 3;
v31 = @(x)1 - cos(x - 1);
v32 = @(x)asin(1.6 - 2*x);
%}

v3 = {v31, v32};



R1 = struct('points', 'diap', 'var', 'function');
R2 = struct('points', 'diap', 'var', 'function');
R3 = struct('points', 'diap', 'var', 'function');
R1 = graphik(1);
R2 = graphik(2);
R3 = graphik(3);




w = [];
for i = R1.diap(1):0.3:R1.diap(2)
    x = fzero(v1, i);
    if x >= R1.diap(1) && x <= R1.diap(2)
        w = [w, x];
    end
end

k1 = uniquetol(w, 0.001);
k2 = fzero(v2, 1);

s1 = func2str(R3.function{1});
s2 = func2str(R3.function{2});

s22 = strsplit(s2,'@(x)');


s31 = strcat([s1,'-(',s22{2},')']);
s3 = str2func(s31);

x3 = fzero(s3, 1);
y3 = feval(s3,x3);

k3 = [x3, y3];


a1=fplot(R1.function, R1.diap, 'Color', 'm');
a2=fplot(v1, R1.diap, 'Color', 'm');
b1=fplot(R2.function, R2.diap, 'Color', 'm');
b2=fplot(v2, R2.diap, 'Color', 'm');

R3.function(1);
v3(1);

c11=fplot(R3.function(1), R3.diap, 'Color', 'm');
c21=fplot(v3(1), R3.diap, 'Color', 'm');

c12=fplot(R3.function(2), R3.diap, 'Color', 'm');
c22=fplot(v3(2), R3.diap, 'Color', 'm');

setdiff(a1.XData, a2.XData);
setdiff(c11.XData, c21.XData);
setdiff(c12.XData, c22.XData);

i=[];


setdiff(c11.YData, c21.YData);
setdiff(c12.YData, c22.YData);

if (a1.XData-a2.XData)<inaccuracy
    if (a1.YData-a2.YData)<inaccuracy
    fprintf ('графики одинаковые\n');
    else
    fprintf ('графики разные\n');
    end
else
    fprintf ('графики разные\n');
end

if (b1.XData-b2.XData)<inaccuracy
    if (b1.YData-b2.YData)<inaccuracy
    fprintf ('графики одинаковые\n');
    else
    fprintf ('графики разные\n');
    end
else
    fprintf ('графики разные\n');
end


%if (intersect(c11.XData, c21.XData))
if (c11.XData-c21.XData)<inaccuracy
    if (c11.YData-c21.YData)<inaccuracy
    fprintf ('графики одинаковые\n');
    else
    fprintf ('графики разные\n');
    end
else
    fprintf ('графики разные\n');
end


if (c12.XData-c22.XData)<inaccuracy
    if (c12.YData-c22.YData)<inaccuracy
    fprintf ('графики одинаковые\n');
    else
    fprintf ('графики разные\n');
    end
else
    fprintf ('графики разные\n');
end




if (R1.points-k1)<inaccuracy
    fprintf ('точки на графиках 1 верны\n');
else
    fprintf ('точки на графиках 1 неверны\n');
end

if (R2.points-k2)<inaccuracy
    fprintf ('точки на графиках 2 верны\n');
else
    fprintf ('точки на графиках 2 неверны\n');
end

if (R3.points-k3)<inaccuracy
    fprintf ('точки на графиках 3 верны\n');
else
    fprintf ('точки на графиках 3 неверны\n');
end

end

