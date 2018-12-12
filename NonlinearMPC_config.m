close all;
clear;


%% システム定義
sys.a = -1;     % システム変数
sys.b = -1;     % システム変数

%% シミュレーション定義
SimPeriod = 10;                         % シミュレーション時間 (s)
dSamplingPeriod = 0.01;                 % サンプリング周期 (s)

%% C/GMRESのコントローラ定義
nmpc.tf = 1.0;                          % 予測時間の最終値 (s)
nmpc.dv = 5;                            % 予測時間の分割数 (-) （評価函数によって評価するポイントの数）

nmpc.x0 = [2;0];                        % コントローラに与える初期状態
nmpc.u0 = [0.01;0.9;0.03];              % コントローラに与える初期操作量

nmpc.sf = [ 1;10 ];                     % 予測時間の最終状態に対する重み（終端コスト）
nmpc.q = [ 1;10 ];                      % 状態に対する重み（ステージコスト）
nmpc.r = [ 1;0.01 ];                    % 操作量に対する重み

nmpc.umin = -1;                         % 入力上限（下限はゼロに設定している）
nmpc.umax = 1;                          % 入力上限（下限はゼロに設定している）

%% C/GMRESのコントローラ用計算

% 初期入力値の計算（Newton法）
lmd0 = dPhidx( nmpc.x0, nmpc );
u0 = [1;2;3;]; % Newton法の初期値

for cnt = 1:20
    nmpc.u0 = nmpc.u0 - ddHddu( nmpc.x0, nmpc.u0, lmd0, sys, nmpc ) \ dHdu( nmpc.x0, nmpc.u0, lmd0, sys, nmpc );
end

nmpc.len_x = length( nmpc.x0 );     % 状態の数
nmpc.len_u = length( nmpc.u0 );     % 操作量の数
nmpc.len_lmd = nmpc.len_x;          % 随伴変数の数

%% シミュレーションの実行と時間計測
tic;
sim( 'NonlinearMPC', SimPeriod );
toc