%% ����H��2�K���͔���
% x        : [ x;dx ]       �i�ʒu�C���x�j
% u        : [ u;v;mu ]     �i����ʁC�_�~�[����ʁC���O�����W���搔�j
% lmd      : [ lmd1;lmd2 ]  �i�����ϐ�1�C�����ϐ�2�j
% sys      : a              �i�V�X�e���W���j
% sys      : b              �i�V�X�e���W���j
% cgmres   : [ r1;r2 ]      �i����ʂ̏d�݁C�_�~�[����ʂ̏d�݁j
% cgmres   : umax           �i����ʂ̍ő�l�j

function Huu = ddHddu( x, u, lmd, sys, nmpc )
%     Huu = [ ...
%         nmpc.r(1)+u(3)*2.0, 0, -nmpc.umax+u(1)*2.0;
%         0, u(3)*2.0, u(2)*2.0;
%         -nmpc.umax+u(1)*2.0, u(2)*2.0, 0;
%     ];

    Huu = [ ...
		2 * u(3) + nmpc.r(1), 0, 2 * ( u(1) - ( nmpc.umin + nmpc.umax ) / 2 );
		0, 2 * u(3), 2 * u(2);
		2 * ( u(1) - ( nmpc.umin + nmpc.umax ) / 2 ), 2 * u(2), 0;
	];
end