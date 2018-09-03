function [var] = laba()



var = 6;

R1 = struct('points', 'diap', 'var', 'function');
R2 = struct('points', 'diap', 'var', 'function');
R3 = struct('points', 'diap', 'var', 'function');


figure('Position', [50 50 1280 200], 'Name', 'Lab1.2', 'Color', 'c')
subplot(1, 3, 1)
R1 = graphik(1);
fplot(R1.function, R1.diap, 'Color', 'm');
axis([-3 2 -15 15])
grid on
hold on 

for i=1:length(R1.points)           
    plot(R1.points(i), 0, 'Marker', 'o', 'MarkerSize', 5) 
end        

title('$3x ^ 4 + 8x ^ 3 + 6x ^ 2 - 10 = 0$', 'Interpreter', 'latex')

xlabel('x')
ylabel('y')


subplot(1, 3, 2)
R2 = graphik(2);
fplot(R2.function, R2.diap, 'Color', 'm');
axis([-3 10 -15 20])
grid on
hold on
for i=1:length(R2.points)           
    plot(R2.points(i), 0, 'Marker', 'o', 'MarkerSize', 5) 
end        

title('$lg(2+x)+2x=3$', 'Interpreter', 'latex')

xlabel('x')
ylabel('y')



subplot(1, 3, 3)
R3 = graphik(3);
fplot(R3.function, R3.diap, 'Color', 'm')
%fplot(R3.function(1), R3.diap, 'Color', 'm');
%fplot(R3.function(2), R3.diap, 'Color', 'm');
axis([0 2 -2 2])
grid on
hold on

plot(R3.points, 0, 'Marker', 'o', 'MarkerSize', 5) 


title('$cos(x-1)+y=1;  sin(y)+2x=1.6$', 'Interpreter', 'latex')


xlabel('x')
ylabel('y')



end