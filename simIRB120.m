abb=loadrobot('abbIrb120','DataFormat','column');

qinit=zeros(6,1);
qdotinit=zeros(6,1);
fext=zeros(6,8);
tau = zeros(6,1);
abb.Gravity = 9.81*[0;0;-1];

qdes=[1;0;0;0;0;0];

qdes=(rand(6,1)-.5)*2*pi;


kp=[500;480;450;185;125;130];%increse OS  decrese E
ki=[5;10;30;5;.8;0.05]; %increase OS  increase ST  Eliminte SS-E
kd=[100;125;250;15;20;10]; %decrease OS  decrease ST
simout=sim('robotsimulation','ReturnWorkspaceOutputs', 'on');

n=length(simout.tout);
%figure(1);for i=1:300;show(abb,simout.q(i,:)');pause(1);end

qdes = repmat(qdes, [1,length(simout.tout)]);

t = simout.tout;

clear figure(10);

figure(10);
plot(simout.tout,simout.q,'LineWidth',2);
hold on
plot(0,0)
plot(simout.tout, qdes,'LineWidth', 1)
legend('q_1','q_2','q_3','q_4','q_5','q_6','','qdes_1','qdes_2','qdes_3','qdes_4','qdes_5','qdes_6');

