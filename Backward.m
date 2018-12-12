%% Œ»İ‚©‚çT•b–¢—ˆ‚Ü‚Å‚Ì”º•Ï”‚Ì—\‘ªiEuler‹ß—j
function lmd = Backward( x, u, sys, nmpc )
    dt = nmpc.tf / nmpc.dv;
    
    lmd = zeros( nmpc.len_lmd * nmpc.dv, 1 );
    lmd((1:nmpc.len_lmd)+nmpc.len_lmd*(nmpc.dv-1)) = dPhidx( x((1:nmpc.len_x)+nmpc.len_x*(nmpc.dv-1)), nmpc );
    
    for cnt = nmpc.dv-1:-1:1
        lmd((1:nmpc.len_lmd)+nmpc.len_lmd*(cnt-1)) = lmd((1:nmpc.len_lmd)+nmpc.len_lmd*(cnt)) ...
                                                            + dHdx( x((1:nmpc.len_x)+nmpc.len_x*(cnt)), u, lmd((1:nmpc.len_lmd)+nmpc.len_lmd*(cnt)), sys, nmpc ) * dt;
    end
end