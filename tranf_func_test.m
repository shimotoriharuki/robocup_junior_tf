clear

% モータの電流についての伝達関数
% 入力：電圧[V]
% 出力：電流[A]
J = 1e-3; % タイヤのイナーシャ
c = 1e-3; % 軸の粘性摩擦係数
L = 1e-3; % モータのインダクタンス
R = 1e-3; % モータの端子間抵抗
Ke = 1e-3; % 起電力定数
Kt = 1e-3; % トルク定数

drive_unit.num = [J c 0];
drive_unit.den = [L*J (R*J + L*c) R*c Ke*Kt];

drive_unit.sys = tf(drive_unit.num, drive_unit.den);
figure(1)
stepplot(drive_unit.sys);


% ロボットの角度についての伝達関数
% 入力：タイヤの駆動力[V]
% 出力：ロボットの角度[rad]

I = 100e-3; % ロボットのイナーシャ
D = 1e-3; % 回転方向に対する粘性係数（空気抵抗とかタイヤのグリップとか）
r = 10e-3; % トレッドの半分

robot.num = 4*r;
robot.den = [I D 0];

robot.sys = tf(robot.num, robot.den);
figure(2)
stepplot(robot.sys);

% ロボットのタイヤの半径
h = 10e-3;