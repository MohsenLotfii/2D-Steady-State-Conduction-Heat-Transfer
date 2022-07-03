clear all
clc

x=0:160;
y=0:160;
u(160,160)=0;

for i=1:160
    u(i,1)=0;
end

for i=1:160
    u(i,160)=0;
end

for i=1:160
    u(160,i)=200;
end

n=1000;

for i=1:n
    for ix=2:159
        for iy=2:159
            u(iy,ix)=0.25*(u(iy-1,ix)+u(iy+1,ix)+u(iy,ix-1)+u(iy,ix+1));
        end
    end
end

u_numerical = u;

figure(3)
contour(u)
[Tempreture]=contour(u);
colorbar

figure(4)
contourf(u)
[Tempreture]=contourf(u);
colorbar


