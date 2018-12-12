%% ����H�̏�Ԕ���
% x        : [ x;dx ]       �i�ʒu�C���x�j
% u        : [ u;v;mu ]     �i����ʁC�_�~�[����ʁC���O�����W���搔�j
% lmd      : [ lmd1;lmd2 ]  �i�����ϐ�1�C�����ϐ�2�j
% sys      : a              �i�V�X�e���W���j
% sys      : b              �i�V�X�e���W���j
% cgmres   : [ q1;q2 ]      �i�ʒu�̏d�݁C���x�̏d�݁j

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