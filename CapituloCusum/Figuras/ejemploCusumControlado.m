N = 161;
sigma = 0.5;
mu    = 10;

x = [0:N-1];
y = mu + sigma*randn(1,N);
z = zeros(1,N);

z(1) = y(1)-mu;
for i=2:N
	z(i) = z(i-1) + (y(i) - mu);
end

graphics_toolkit gnuplot

h = figure(1);
set(h,'Visible','off')
set(h,'PaperType','A4')

hold on
grid on
plot(x,y,'color','blue','LineWidth',4)
plot(x,z,'color','green','LineWidth',4);
plot([0,N-1],[0,0],'color','black')
axis([0,N-1])

t = ['C_i y x_i a lo largo del tiempo en un proceso de \mu_0 = ', num2str(mu), "\n",'y \sigma = ', num2str(sigma), ' bajo control'];
title(t);
xlabel('Time (t)')
legend({'x_i','C_i'})

%orient tall
%orient landscape

FN = findall(h,'-property','FontName');
set(FN,'FontName','/usr/share/fonts/TTF/DejaVuSerifCondensed.ttf');
FS = findall(h,'-property','FontSize');
set(FS,'FontSize',16);

print(h,'-dpdf','-color','cusum.pdf')
