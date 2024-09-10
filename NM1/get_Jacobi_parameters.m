function [G, c] = get_Jacobi_parameters(Link)

    G = Link(1 : rows(Link) - 2, 1 : columns(Link) - 2);
    c = Link(1 : rows(Link) - 2, columns(Link) - 1);

endfunction
