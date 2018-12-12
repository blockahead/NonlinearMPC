%% C/GMRESÇ≈ÇÃîüêîFÇÃåvéZ
function dF = dFdu( x_current, u, sys, nmpc )

    dF = zeros( nmpc.len_u * nmpc.dv, nmpc.len_u * nmpc.dv );
    diff = 0.01;
    
    for cnt = 1:nmpc.dv*nmpc.len_u
        u_buff_p = u;
        u_buff_n = u;

        u_buff_p(cnt) = u_buff_p(cnt) + diff;
        u_buff_n(cnt) = u_buff_n(cnt) - diff;
        
        dF(:,cnt) = ( CalcF( x_current, u_buff_p, sys, nmpc ) - CalcF( x_current, u_buff_n, sys, nmpc ) ) / ( 2 * diff );
    end
    a = 2;
end