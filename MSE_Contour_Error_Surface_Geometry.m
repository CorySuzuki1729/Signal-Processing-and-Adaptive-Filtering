w0 = -3:0.05:3;
w1 = -3:0.05:3;
[x, y] = meshgrid(w0, w1);
j = 0.8416 + 0.972*x-0.773*y+1.0647*x.^2+1.064*y.^2+0.985*x.*y;
contour(x,y,j,30);