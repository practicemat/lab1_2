function [R] = graphik(number)


R = struct('points', 'diap', 'var', 'function');


R.var = 6;

functionOne = @(x) 3 * x .^ 4 + 8 * x .^ 3 + 6 * x .^ 2 - 10;
diapOne = [-3 2];

x1 = fzero(functionOne, [-3 -1]);
x2 = fzero(functionOne, [0 1]); 

pointsOne = [x1, x2];


functionTwo = @(x) log(2 + x) + 2 * x - 3;
diapTwo = [-3 10];

x1 = fzero(functionTwo, [0 2]);

pointsTwo = x1;



functionThree1 = @(x)1 - cos(x - 1);
functionThree2 = @(x)asin(1.6 - 2*x);
functionThree = {functionThree1, functionThree2};

diapThree = [0 2];

grid on
hold on


x1 = [0.7889, 0.00001];


pointsThree = x1; 



if number == 1


R.function = functionOne;
R.diap = diapOne;
R.points = pointsOne;

end;

if number == 2


R.function = functionTwo;
R.diap = diapTwo;
R.points = pointsTwo;

end;


if number == 3


R.function = functionThree;
R.diap = diapThree;
R.points = pointsThree;

end;




end

