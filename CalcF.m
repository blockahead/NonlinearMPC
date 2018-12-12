%% C/GMRESÇ≈ÇÃîüêîFÇÃåvéZ
function F = CalcF( x_current, u, sys, nmpc )
    x = Forward( x_current, u, sys, nmpc );
    lmd = Backward( x, u, sys, nmpc );

    F = zeros( nmpc.len_u * nmpc.dv, 1 );

    for cnt = 1:nmpc.dv
        F((1:nmpc.len_u)+nmpc.len_u*(cnt-1)) = dHdu(x((1:nmpc.len_x)+nmpc.len_x*(cnt-1)), ...
                                                    u((1:nmpc.len_u)+nmpc.len_u*(cnt-1)), ...
                                                    lmd((1:nmpc.len_lmd)+nmpc.len_lmd*(cnt-1)), sys, nmpc );
    end
end