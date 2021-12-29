function m_mat = RealMassMatrixbuilder(m, Ix,Iy,Iz)
%its from a to b

m_mat= [ m 0 0 0 0 0;
      0 m 0 0 0 0;
      0 0 m 0 0 0;
      0 0 0 Ix 0 0;
      0 0 0 0 Iy 0;
      0 0 0 0 0 Iz];
      
     

