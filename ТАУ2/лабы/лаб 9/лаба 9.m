T1=0.7;
T2=2;
k=70;
num=k
den=[conv([T1 1],[T2 1])]
sys=tf(num,den)
bode(sys), grid on, zoom on