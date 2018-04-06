% Calculation of epoc energy of one dataset
function [epoc_energy ] = energy(s,p,q)
fileID = fopen(s,'r');
formatSpec = '%d';
A = fscanf(fileID,formatSpec);
l=length(A);
x= 1:1:l;
a = lpc(A,2);
est_A = filter([0 -a(2:end)],1,A);
e = A-est_A;

mini=1000000;
epoc_index=0;
pp=0;
x=1:1:400;
r=1:1:4097;

if(p==1)
    figure(q);
    plot(r,A);
    if(q==1)
        title('The EEE Graph for Healthy State, Eyes Open');
    end
    if(q==2)
          title('The EEE Graph for Healthy State, Eyes Closed');
    end
    if(q==3)
          title('The EEE Graph for Inter-Ictal State(epileptic focus)');
    end
    if(q==4)
          title('The EEE Graph for Inter-Ictal State(Hipocam. region)');
    end
    if(q==5)
          title('The EEE Graph for Ictal State');
    end
    xlabel('Data Points') % x-axis label
    ylabel('Signal value') % y-axis label
end

for i=0:400:3600
    pp=pp+1;
    arr=zeros(1,400);
    for j=1:400
        arr(j)=A(i+j);
    end
    temp=lpc(arr,399);
    err=zeros(400);
    est_arr=filter([0 -temp(2:end)],1,arr);
    error_energy=0;
    for k=1:400
        error_energy= error_energy  + (arr(k)-est_arr(k))^2;
    end
    if(i==0)
        mini=error_energy;
    end
    if(error_energy<mini)
        mini=error_energy;
        epoc_index=i;
    end
end
arr=zeros(1,400);
for j=1:400
        arr(j)=A(epoc_index+j);
end

temp=lpc(arr,399);  
epoc_energy=zeros(1,10);

for i=1:10
    arr=zeros(1,400);
    for j=1:400
        arr(j)=A(i+j);
    end
    est_arr=filter([0 -temp(2:end)],1,arr);
    temp_energy=0;
    for j=1:400
        temp_energy = temp_energy + (arr(j)-est_arr(j))^2;
    end
    epoc_energy(i)=temp_energy;
end

if(p==1 & q==3)
    figure(11);
    x=1:1:10;
    plot(x,epoc_energy);
    title('Energy of Residual Inter Ictal');
end
if(p==1 & q==5)
    x=1:1:10;
    figure(12);
    plot(x,epoc_energy);
    title('Energy of Residual Ictal');
end

end