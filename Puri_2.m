clc; clear all;

pc = linspace(0,30,100);
pf = linspace(1,4,100);
Ma=.75;
t4a=5.78;
gamma=1.4;
alpha=4;
taa=1+(gamma-1)/2*Ma*Ma;
tc=pc.^((gamma-1)/gamma);
tf=pf.^((gamma-1)/gamma);
[Pc, Pf] = meshgrid(pc,pf);
[Tc, Tf] = meshgrid(tc,tf);
A = (t4a./(taa.*(taa-1).*Tc)).*(taa.*Tc.*(1-(taa./t4a).*((Tc-1) + alpha.*(Tf-1)))-1);
Fnorm = Ma.*(sqrt(A)-1) + alpha.*Ma.*(sqrt((taa.*Tf-1)./(taa-1))-1);
for i = 1:size(Fnorm,1)*size(Fnorm,2)
    if imag(Fnorm(i)) ~= 0
        Fnorm(i) = NaN;
    end
end
surf(Pc,Pf,Fnorm/(1+alpha));
 
xlabel('Compressor Pressure ratio');
ylabel('Fan Pressure ratio');
zlabel('F/(m_ta_a)');
