data = load('wave.txt');

plot(data(:,1),data(:,2));

[M,I] = max(data(:,2));

hold on
plot(data(I),M,'or');