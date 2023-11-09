function retval = task2_bisection(input1, input2)
  f = @(x) x.^2 - 4;

  a = 0;
  b = 6;

  tol = 1e-6;

  iterations = 0;
  root = 0;

  x_vals = [];
  y_vals = [];

  while (b - a) / 2 > tol
      x = (a + b) / 2;
      if f(a) * f(x) < 0
          b = x;
      else
          a = x;
      end

      iterations = iterations + 1;
      x_vals = [x_vals, iterations];
      y_vals = [y_vals, x];

      root = (a + b) / 2;
  end

  fprintf('Root found after %d iterations: %f\n', iterations, root);
  fprintf('y_vals = [');
  for i = 1:length(y_vals)
    fprintf('%f\n', y_vals(i));
  end
  fprintf(']\n');

    x = linspace(min(y_vals) - 1, max(y_vals) + 1, 1000);
    y = f(x);

    figure;
    plot(x, y, 'LineWidth', 2);
    hold on;
    scatter(y_vals, zeros(size(y_vals)), 50, 'k','filled');
    xlabel('x');
    ylabel('f(x)');
    title('Bisection Method: Finding Roots');
    legend('Function', 'Roots');
    grid on;
    hold off;

    retval = root;
endfunction



