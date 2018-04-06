% String array generation for all datasets of class A
s1=strings(1,100);
for i=1:1:100
    if(i<10)
        num = num2str(i);
        str= ['00',num];
    end
    if(i<100 && i>=10)
        num = num2str(i);
        str=['0',num];
    end
    if(i>=100 )
        num = num2str(i);
        str= num;
    end
    s1(i)= ['/home/sanchit/6th Semester/Digital Signal/Project/Code/A/Z',str,'.txt'];
end

% String array generation for all datasets of class B
s2=strings(1,100);
for i=1:1:100
    if(i<10)
        num = num2str(i);
        str= ['00',num];
    end
    if(i<100 && i>=10)
        num = num2str(i);
        str=['0',num];
    end
    if(i>=100 )
        num = num2str(i);
        str= num;
    end
    s2(i)= ['/home/sanchit/6th Semester/Digital Signal/Project/Code/B/O',str,'.txt'];
end

% String array generation for all datasets of class C
s3=strings(1,100);
for i=1:1:100
    if(i<10)
        num = num2str(i);
        str= ['00',num];
    end
    if(i<100 && i>=10)
        num = num2str(i);
        str=['0',num];
    end
    if(i>=100 )
        num = num2str(i);
        str= num;
    end
    s3(i)= ['/home/sanchit/6th Semester/Digital Signal/Project/Code/C/N',str,'.TXT'];
end

% String array generation for all datasets of class D
s4=strings(1,100);
for i=1:1:100
    if(i<10)
        num = num2str(i);
        str= ['00',num];
    end
    if(i<100 && i>=10)
        num = num2str(i);
        str=['0',num];
    end
    if(i>=100 )
        num = num2str(i);
        str= num;
    end
    s4(i)= ['/home/sanchit/6th Semester/Digital Signal/Project/Code/D/F',str,'.txt'];
end

% String array generation for all datasets of class E
s5=strings(1,100);
for i=1:1:100
    if(i<10)
        num = num2str(i);
        str= ['00',num];
    end
    if(i<100 && i>=10)
        num = num2str(i);
        str=['0',num];
    end
    if(i>=100 )
        num = num2str(i);
        str= num;
    end
    s5(i)= ['/home/sanchit/6th Semester/Digital Signal/Project/Code/E/S',str,'.txt'];
end


allepoc1=zeros(1,1000);
allepoc2=zeros(1,1000);
allepoc3=zeros(1,1000);
allepoc4=zeros(1,1000);
allepoc5=zeros(1,1000);

% Calculation of epoc energy of 100 data sets in one array of size 1000
allepoc1=total(s1,1);
allepoc2=total(s2,2);
allepoc3=total(s3,3);
allepoc4=total(s4,4);
allepoc5=total(s5,5);

mn=allepoc1(1);
mx=allepoc5(1);
for i=1:1:1000
    if(mn>allepoc1(i))
        mn=allepoc1(i);
    end
    if(mx<allepoc5(i))
        mx=allepoc5(i);
    end
end

mx=round(mx);
mn=round(mn);
ff=round(((mx-mn)/1000));
prob=zeros(1,ff);
cnt=0;maxx=1;
thresh=mn;
aa=0;in=0;
for i=mn:1000:mx
    cnt=cnt+1;
    a=0;b=0;c=0;d=0;e=0;tmp=0;
    for j=1:1000
        if(allepoc1(j)<i)
            a=a+1;
        end
        if(allepoc2(j)<i)
            b=b+1;
        end
        if(allepoc3(j)<i)
            c=c+1;
        end
        if(allepoc4(j)<i)
            d=d+1;
        end
        if(allepoc5(j)>i)
            e=e+1;
        end
    end
    if(aa<a)
        aa=a;
        in=i;
    end
    temp=a+b+c+d+(4*e);
    if(maxx<temp)
        maxx=temp;
        thresh=i;
    end
    prob(cnt)=(temp/8000);
    ff=i;
end
a=0;b=0;c=0;d=0;e=0;

for i=1:1:1000
    if(allepoc1(i)>thresh)
        a=a+1;
    end
    if(allepoc2(i)>thresh)
        b=b+1;
    end
    if(allepoc3(i)>thresh)
        c=c+1;
    end
    if(allepoc4(i)>thresh)
        d=d+1;
    end
    if(allepoc5(i)>thresh)
        e=e+1;
    end
end


%% Calculation of accuracy of different classes
r1=1-(a/1000);
r2=1-(b/1000);
r3=1-(c/1000);
r4=1-(d/1000);
r5=1-(e/1000);
r1
r2
r3
r4


%%sensitivity calculation
sensitivity=e/1000;
sensitivity


%%specificity calculation
specificity=(a+b+c+d)/4000;
specificity


%% ROC Construction
x=0:.01:1;
y= zeros(1,101);
m1=sensitivity/specificity;
m2=(1-sensitivity)/(1-specificity);
l=0;
for i=0:0.01:1
   l=l+1;
   if(i<=specificity)
       y(l)= m1*i;
   end
   if(i>specificity)
       y(l)= sensitivity + m2*i;
   end
end

figure(13)
plot(x,y);
title('ROC');
xlabel('False Positives') % x-axis label
ylabel('True Positives') % y-axis label
%% 