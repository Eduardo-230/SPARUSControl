function Trans_M = Translation(dx,dy,dz, M)
%its from a to b

S = [ 0 -dz dy;
    dz 0 -dx;
    -dy dx 0];

I = eye(3);

H = [I transpose(S);
    zeros(3) I];
Ht = transpose(H);

Trans_M = Ht*M*H;

