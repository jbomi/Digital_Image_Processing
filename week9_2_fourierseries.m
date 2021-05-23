%% Fourier series:periodic signal
% fundamental freq
t=0:0.1:10;
y=sin(t);
figure(1);plot(t,y);

% fundamental + 3rd harmonics
y=sin(t)+sin(3*t)/3;
plot(t,y);

% fundamental +3+5+7th harmonics
y=sin(t)+sin(3*t)/3+sin(5*t)/5+sin(7*t)/7;
plot(t,y);

% demo
t=0:0.02:4*pi;
x=zeros(size(t));
figure(2);hold on;
for k=1:2:19 % harmonics
    x=x+sin(k*t)/k;
    y=x;
    plot(t,y);
    pause(1);
end