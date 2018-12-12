close all;
clear;


%% �V�X�e����`
sys.a = -1;     % �V�X�e���ϐ�
sys.b = -1;     % �V�X�e���ϐ�

%% �V�~�����[�V������`
SimPeriod = 10;                         % �V�~�����[�V�������� (s)
dSamplingPeriod = 0.01;                 % �T���v�����O���� (s)

%% C/GMRES�̃R���g���[����`
nmpc.tf = 1.0;                          % �\�����Ԃ̍ŏI�l (s)
nmpc.dv = 5;                            % �\�����Ԃ̕����� (-) �i�]�������ɂ���ĕ]������|�C���g�̐��j

nmpc.x0 = [2;0];                        % �R���g���[���ɗ^���鏉�����
nmpc.u0 = [0.01;0.9;0.03];              % �R���g���[���ɗ^���鏉�������

nmpc.sf = [ 1;10 ];                     % �\�����Ԃ̍ŏI��Ԃɑ΂���d�݁i�I�[�R�X�g�j
nmpc.q = [ 1;10 ];                      % ��Ԃɑ΂���d�݁i�X�e�[�W�R�X�g�j
nmpc.r = [ 1;0.01 ];                    % ����ʂɑ΂���d��

nmpc.umin = -1;                         % ���͏���i�����̓[���ɐݒ肵�Ă���j
nmpc.umax = 1;                          % ���͏���i�����̓[���ɐݒ肵�Ă���j

%% C/GMRES�̃R���g���[���p�v�Z

% �������͒l�̌v�Z�iNewton�@�j
lmd0 = dPhidx( nmpc.x0, nmpc );
u0 = [1;2;3;]; % Newton�@�̏����l

for cnt = 1:20
    nmpc.u0 = nmpc.u0 - ddHddu( nmpc.x0, nmpc.u0, lmd0, sys, nmpc ) \ dHdu( nmpc.x0, nmpc.u0, lmd0, sys, nmpc );
end

nmpc.len_x = length( nmpc.x0 );     % ��Ԃ̐�
nmpc.len_u = length( nmpc.u0 );     % ����ʂ̐�
nmpc.len_lmd = nmpc.len_x;          % �����ϐ��̐�

%% �V�~�����[�V�����̎��s�Ǝ��Ԍv��
tic;
sim( 'NonlinearMPC', SimPeriod );
toc