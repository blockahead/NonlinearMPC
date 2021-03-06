%% 函数Hの状態微分
% x        : [ x;dx ]       （位置，速度）
% u        : [ u;v;mu ]     （操作量，ダミー操作量，ラグランジュ乗数）
% lmd      : [ lmd1;lmd2 ]  （随伴変数1，随伴変数2）
% sys      : a              （システム係数）
% sys      : b              （システム係数）
% cgmres   : [ q1;q2 ]      （位置の重み，速度の重み）

function Hx = dHdx( x, u, lmd, sys, nmpc )
%     Hx = [ ...
%         sys.a * lmd(2) + nmpc.q(1) * x(1); ...
%         sys.b * lmd(2) * u(1) + nmpc.q(2) * x(2) + lmd(1); ...
%         ];
  
    Hx = [ ...
		nmpc.q(1) * x(1) + sys.a * lmd(2);
		nmpc.q(2) * x(2) + sys.b * lmd(2) * u(1) + lmd(1);
	];
end