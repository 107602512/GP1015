n = 1000;
u1 = zeros (1,n);
u2 = zeros (1,n);

for i = 1:n
tic;  
A = randn(1,i);
b = bubblesort(A);

u1(i) = toc;

tic;
A = randn(1,i);
c = heapsort(A);
u2(i) = toc;

end

plot(u1)
hold on
plot(u2)