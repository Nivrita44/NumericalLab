  function retval = task3_regularFalsi(input1, input2)
  f = @(x) x.^2 - 4;

  a = 0;
  b = 6;
  tol = 1e-6;
  M=[];


  iterations = 0;
  root=0;
  x_vals = [];
  y_vals = [];

 while f(a) * f(b) < 0 && a<b

     c= b-((b-a)/(f(b)-f(a)))*f(b);
     M=[M;c];
     if abs(f(c))<tol
       break
     end
     if f(a)*f(c) <0
       b=c;
     else
       a=c;
     end
     iterations = iterations + 1;
      %x_vals = [x_vals, iterations];
     % y_vals = [y_vals, x];

end
  root = M(end);

  fprintf('Root found after %d iterations: %f\n', iterations, root);
  fprintf('y_vals = [');
  for i = 1:length(y_vals)
    fprintf('%f\n', y_vals(i));
  end
  fprintf(']\n');
  x=linspace(1,2,50);
  y=f(x);
  figure;
  plot (x, y, 'LineWidth',2);
  hold on;
  scatter(M, f(M), 40, 'r', 'filled');
  xlabel('x');
  ylabel('f(x)');
  title('False-Position Method: Finding Roots');
  legend('Function', 'Roots');
  grid on;
  hold off;


  retval = root;
endfunction

