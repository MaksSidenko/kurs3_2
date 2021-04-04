T1=0.7;
T2=2;
T3=1.3;
k=70;
num=k
d=[conv([T1 1],[T2 1])]
den=[conv(d,[T3 1])]
sys=tf(num,den)
bode(sys), grid on, zoom on