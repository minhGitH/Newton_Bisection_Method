%Minh Nguyen (301539625) %CA3-MACM 316
format long;
f=@(x) ((1-x).*(3+x).^(1/3))./(x.*sqrt(4-x))-3.06;
fp = @(x) -(x.^3 + 10*x.^2 - 11*x + 72)./(6*(4-x).^(3/2).*x.^2.*((x+3).^(2/3)));
tiledlayout(2,1);
nexttile;
hold on;
xint=-2:0.001:3;
axis([-2 3 -10 10]);
plot(xint, f(xint),'r');
title("f(x)");
yaxis=zeros(length(xint),1);
plot(xint,yaxis,'b');
hold off;
nexttile;
hold on;
plot(xint, fp(xint),'g');
title("fp(x)");
axis([-2 3 -10 10]);
plot(xint,yaxis,'b');
hold off;
%Newton's method
%[xNewton, nNewton, xlNewton] = newton( f, fp, 1, 10^(-6));
%display(xNewton);
%Bisection
[xB2,nB2,rlistB2]=bisect2(f,[0.1,1.0],10^(-6));
fprintf("With %d iterations this is the root obtained from Bisection" + ...
    " method: %.16d for 10^-6 tolerance.\n",nB2,xB2);
%Newtonb
[xNB, nNB, xlNB] = newtonb( f, fp, [0.1,1], 1e-10 );
fprintf("With %d iterations this is the root obtained from hybrid method:%.16d.\n",nNB,xNB);
display(xlNB);
%end here