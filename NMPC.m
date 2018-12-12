function MV = NMPC( x_current, sys, nmpc )
    %#codegen
    persistent u; % 操作量（前回値）

    if ( isempty( u ) )
        u = repmat( nmpc.u0, nmpc.dv, 1 );
    end
            
    for cnt = 1:10
        u = u - ( dFdu( x_current, u, sys, nmpc ) \ CalcF( x_current, u, sys, nmpc ) );
    end
        
    MV = u(1:nmpc.len_u);

end