function retval = task4_NewtonRaphsan(input1, input2)
     f = @(x) x.^3 -4;
    df = @(x) 2*x ;

    x = input1;

    tolerance = 1e-6;

    iterations = 0;
    root = x;

    x_values = [];
    y_values = [];


    while abs(f(root)) > tolerance
        tangent = df(root) * (input2 - root) + f(root);

        root = root - f(root) / df(root);

        iterations = iterations + 1;
        x_values = [x_values, iterations];
        y_values = [y_values, root];

        x = linspace(min(y_values) - 1, max(y_values) + 1, 1000);
        y = f(x);

        figure;
        plot(x, y, 'LineWidth', 2);
        hold on;
        scatter(y_values, f(y_values), 50, 'k', 'filled');
        plot([input2, root], [f(input2), tangent], '--','LineWidth', 2);
        xlabel('x');
        ylabel('f(x)');
        title(['Newton-Raphson Method ', num2str(iterations)]);
        legend('Function', 'Roots', 'Tangent Line');
        grid on;
        hold off;
    end

    fprintf('Root found after %d iterations: %f\n', iterations, root);
    fprintf('Roots Matrix:\n');
    disp(y_values);

    retval = root;
endfunction
