%% ヘッセ行列の状態微分
% x        : [ x;dx ]       （位置，速度）
% cgmres   : [ sf1;sf2 ]    （時刻Tでの位置の重み，時刻Tでの速度の重み）

function Phix = dPhidx( x, cgmres )
    Phix = [ x(1) * cgmres.sf(1);x(2) * cgmres.sf(2) ];
end