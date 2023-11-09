
rA = input('Enter the number of rows for matrix A: ');
cA = input('Enter the number of columns for matrix A: ');

A = zeros(rA, cA);
disp('Enter the values for matrix A:');
for i = 1:rA
    for j = 1:cA
        A(i, j) = input('');
    end
end

rB = input('Enter the number of rows for matrix B: ');
cB = input('Enter the number of columns for matrix B: ');

B = zeros(rB, cB);
disp('Enter the values for matrix B:');
for i = 1:rB
    for j = 1:cB
        B(i, j) = input('');
    end
end

max_val_A = max(A(:));
fprintf('The maximum value in matrix A is: %d\n', max_val_A);


if cA == rB
    result = A * B;
    fprintf('Matrix multiplication result:\n');
    disp(result);
else
    fprintf('Matrix multiplication is not possible with the given matrices.\n');
end

