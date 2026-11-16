x = [1 1 1 1];
n = 0:length(x)-1;

w = linspace(-pi,pi,1000);
X = x * exp(-1j*(n.'*w));

X4 = fft(x,4);
X64 = fft(x,64);

w4 = (2*pi/4)*(-2:1);
w64 = (2*pi/64)*(-32:31);

figure
plot(w,abs(X),'LineWidth',1.5)
hold on
plot(w64,abs(fftshift(X64)),'.','MarkerSize',12)
stem(w4,abs(fftshift(X4)),'d','LineWidth',1.2)
grid on
xlim([-pi pi])
xticks([-pi -pi/2 0 pi/2 pi])
xticklabels({'-\pi','-\pi/2','0','\pi/2','\pi'})
xlabel('Angular frequency (rad/sample)')
ylabel('Magnitude')
title('DTFT and DFT Comparison')
legend('DTFT','DFT (64 points)','DFT (4 points)')
hold off