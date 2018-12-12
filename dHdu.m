%% ����H�̓��͔���
% x        : [ x;dx ]       �i�ʒu�C���x�j
% u        : [ u;v;mu ]     �i����ʁC�_�~�[����ʁC���O�����W���搔�j
% lmd      : [ lmd1;lmd2 ]  �i�����ϐ�1�C�����ϐ�2�j
% sys      : a              �i�V�X�e���W���j
% sys      : b              �i�V�X�e���W���j
% cgmres   : [ r1;r2 ]      �i����ʂ̏d�݁C�_�~�[����ʂ̏d�݁j
% cgmres   : umax           �i����ʂ̍ő�l�j

function Hu = dHdu( x, u, lmd, sys, nmpc )
%     Hu = [ ...
%         nmpc.r(1) * u(1) + sys.b * lmd(2) * x(2) + u(3) * ( 2 * u(1) - nmpc.umax );
%         2 * u(2) * u(3) - nmpc.r(2);
%         ( u(1) - ( nmpc.umax / 2 ) )^2 + u(2)^2 - ( nmpc.umax / 2 )^2;
%         ];
%     
    Hu = [ ...
        sys.b * lmd(2) * x(2) + 2 * u(3) * ( u(1) - ( nmpc.umin + nmpc.umax ) / 2 ) + nmpc.r(1) * u(1);
		2 * u(2) * u(3) - nmpc.r(2);
		( u(1) - ( nmpc.umin + nmpc.umax ) / 2 )^2 - ( nmpc.umax - nmpc.umin )^2 / 4 + u(2)^2;
    ];
end