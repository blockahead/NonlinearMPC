%% Œ»İ‚©‚çT•b–¢—ˆ‚Ü‚Å‚Ìó‘Ô‚Ì—\‘ªiEuler‹ß—j
function x = Forward( x0, u, sys, nmpc )
    dt = nmpc.tf / nmpc.dv;
    
    x = zeros( nmpc.len_x * nmpc.dv, 1 );
    x(1:nmpc.len_x) = x0;

    for cnt = 1 : nmpc.dv-1
       x((1:nmpc.len_x)+nmpc.len_x*(cnt)) = x((1:nmpc.len_x)+nmpc.len_x*(cnt-1)) ...
                                                + Func( x((1:nmpc.len_x)+nmpc.len_x*(cnt-1)), u((1:nmpc.len_u)+nmpc.len_u*(cnt-1)), sys ) * dt; 
    end
end