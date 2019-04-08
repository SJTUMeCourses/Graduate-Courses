clc
clear

PlantCoeffVec = [0,0,1,0,-0.5,0.6,0,0,-1.2,0];
k = 1;
Mu = 2;
freq = 3;
DVMult = [1,1,1,1];

FiltLen= 10;
SR = 1500;
LenHalfTD = 750;

AmpProfile = ones(1,SR);
ld = length(DVMult);

DivPts = [1,fix(SR*[1:1:(ld-1)]/ld)];
DivPts = [DivPts,(SR+1)];
ld = ld+1;
for Ctr = 1:1:ld-1
AmpProfile(1,DivPts(Ctr):DivPts(Ctr+1)-1) = DVMult(Ctr);
end

t = 0:1/(SR-1):1;
DataVec = sin(2*pi*t*freq)+ 0.5*cos(2*pi*t*freq*3)+ k*randn(1,SR);

DataVec = AmpProfile.*DataVec;

TapWt = zeros(length(DataVec),FiltLen);
FiltOut = zeros(1,length(DataVec));
Err = zeros(1,length(DataVec));
n = 1:1:FiltLen;

IterationIndices = FiltLen + 1:1:length(DataVec);
NoIts = length(IterationIndices);

for CurPtr = IterationIndices

FiltOut(1,CurPtr) = sum((TapWt(CurPtr,n)).*DataVec(CurPtr-n));
Err(1,CurPtr)= sum(PlantCoeffVec(n).*DataVec(1,CurPtr-n)) - FiltOut(1,CurPtr);
LIMAdj = sum(DataVec(1,CurPtr-n).^2)+ eps;
TapWt(CurPtr+1,n)= TapWt(CurPtr,n) + ...
    (Mu*Err(1,CurPtr).*(DataVec(1,CurPtr-n)))/(2*LIMAdj); 
end

figure(18)
clf
hold on
for colctr = 1:1:FiltLen
    plot(TapWt(:,colctr),'k')
end
grid on
xlabel(['Iteration'])
ylabel(['Amplitude'])
plotlim = 1.2*max(max(abs(TapWt)));
axis([0,SR,-plotlim,plotlim])


figure(19)
subplot(211)
plot(DataVec)
plotlim1 = 1.2*max(abs(DataVec));
xlabel(['(a) Sample, Input Data '])
ylabel('Amplitude')
axis([0 length(t) -plotlim1 plotlim1])

subplot(212)
plot(Err)
plotlim2 = 1.2*max(abs(Err));
xlabel(['(b) Sample/Iteration of Output/Error'])
ylabel('Amplitude')
axis([0 length(t) -plotlim2 plotlim2])