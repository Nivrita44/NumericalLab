function retval = test(input1, input2)

  f = @(x) x.^2-3;
  a = 0;
  b = 10;
  tol = 1e-6;
  iterations = 0;
  root=0;
  x_vals = [];
  y_vals = [];

 while f(a) * f(b) < 0 && a<b

     x = b-((b-a)/(f(b)-f(a)))*f(b);
     if abs(f(x))<tol
       break
     end
     if f(a)*f(x) <0
       b=x;
     else
       a=x;
     end
     iterations = iterations + 1;
      x_vals = [x_vals, iterations];
      y_vals = [y_vals, x];
      root = b-((b-a)/(f(b)-f(a)))*f(b);

 end

  fprintf('Root found after %d iterations: %f\n', iterations, root);
  fprintf('y_vals = [');
  for i = 1:length(y_vals)
    fprintf('%f\n', y_vals(i));
  end
  fprintf(']\n');


 endfunction

