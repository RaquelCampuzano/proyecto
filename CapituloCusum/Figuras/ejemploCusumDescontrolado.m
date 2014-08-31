N     = 161;    % Número de muestras
M     = 30;     % Instante en el que se aplica el descontrol
sigma = 0.5;
mu    = 10;
k     = 0.3;    % Desviación sobre la media del descontrol

x = [0:N-1];
y = mu + sigma*[randn(1,M) k+randn(1,N-M)];
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
plot([M,N],[z(M),(z(M)+k*(N-M))],'color','red','LineWidth',2);
axis([0,N-1])

t = ['C_i y x_i a lo largo del tiempo en un proceso de \mu_0=', num2str(mu), "\n",'y \sigma=', num2str(sigma), ' descontrolado por k=',num2str(k)];
title(t);
xlabel('Time (t)')
legend({'x_i','C_i','t \cdot k'},'Location','SouthEast')

%orient tall
%orient landscape

FN = findall(h,'-property','FontName');
set(FN,'FontName','/usr/share/fonts/TTF/DejaVuSerifCondensed.ttf');
FS = findall(h,'-property','FontSize');
set(FS,'FontSize',16);

print(h,'-dpdf','-color','cusumDescontrolado.pdf')
