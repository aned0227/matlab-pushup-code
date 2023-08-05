clear
load('MobileSensorData/steadyRep0.mat');
% Assuming you have already loaded the data into 'data' variable

threshold = 0.125;

Xacc = Acceleration.X;
Yacc = Acceleration.Y;
Zacc = Acceleration.Z - 9.81;
accelDatetime=Acceleration.Timestamp;

% We use the following to obtain linear time data in seconds from a datetime array
accelTime=timeElapsed(accelDatetime);

plot(accelTime,Zacc);
%hold on;
%plot(accelTime,Yacc); 
%plot(accelTime,Xacc);
xlim([0 50])
legend('X Acceleration','Y Acceleration','Z Acceleration');
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
title('Acceleration Data Vs. Time');
hold off

%calc pushup
count = 0;

for t = 1:length(accelTime) % Using the array index instead of time value
    if abs(Zacc(t)) <= threshold
        count = count + 1;
    end
end
pushup = count / 2;
disp(pushup);