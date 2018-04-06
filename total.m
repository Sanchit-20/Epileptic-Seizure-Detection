%Calculation of epoc energy of 100 dataset in one allepoc array
function[ allepoc ] = total(s,a)
allepoc=zeros(1,1000);
tot=0;
for i=1:1:100
    ee=zeros(1,400);
    ee=energy(s(i),i,a);
    for j=1:10
        tot=tot+1;
        allepoc(tot)=ee(j);
    end
end

mn=allepoc(1);
mx=allepoc(1);
for i=1:1000
    if( mn>allepoc(i))
        mn=allepoc(i);
    end
    if(mx<allepoc(i))
        mx=allepoc(i);
    end
end

mx=round(mx);
mn=round(mn);
ff=round(((mx-mn)/1000));
prob=zeros(1,ff);
cnt=0;
for i=mn:1000:mx
    cnt=cnt+1;
    temp=0;
    for j=1:1000
        if(allepoc(j)>i & a==5)
            temp=temp+1;
        end
        if(allepoc(j)<i && a~=5)
            temp=temp+1;
        end
    end
    temp=temp/1000;
    prob(cnt)=temp;
    ff=i;
end
t=mn:1000:(ff);
if(a==1)
    figure(6);
    plot(t,prob,'-.x');
    title('Healthy State(Eyes Open)');
    xlabel('Data Points') % x-axis label
    ylabel('Probability') % y-axis label

end
if(a==2)
    figure(7);
    plot(t,prob,'-.x');
    title('Healthy State(Eyes Closed)');
    xlabel('Data Points') % x-axis label
    ylabel('Probability') % y-axis label
end
if(a==3)
    figure(8);
    plot(t,prob,'-.x');
    title('Inter Ictal State(epileptic focus)');
    xlabel('Data Points') % x-axis label
    ylabel('Probability') % y-axis label

end

if(a==4)
    figure(9);
    plot(t,prob,'-.x');
    title('Inter Ictal State(Hipocam. region)');
    xlabel('Data Points') % x-axis label
    ylabel('Probability') % y-axis label

end

if(a==5)
    figure(10);
    plot(t,prob,'-.x');
    title('Ictal State');
    xlabel('Data Points') % x-axis label
    ylabel('Probability') % y-axis label

end

end