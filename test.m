    % Calculate the "volume" of the unit hypersphere.
   xmin = -1;
   xmax = 1;
   ymin = @(x)-sqrt(1 - x.*x);
   ymax = @(x) sqrt(1 - x.*x);
   zmin = @(x,y)-sqrt(1 - x.*x - y.*y);
   zmax = @(x,y) sqrt(1 - x.*x - y.*y);
   wmin = @(x,y,z)-sqrt(1 - x.*x - y.*y - z.*z);
   wmax = @(x,y,z) sqrt(1 - x.*x - y.*y - z.*z);

f4 = @(x,y,z,w)ones(size(x));
 q4 = integral4(f4,xmin,xmax,ymin,ymax,zmin,zmax,wmin,wmax,'AbsTol',1e-5,'RelTol',1e-3);
 error = q4 - pi^2/2