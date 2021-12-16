function T = magicOA(varargin)
% calculate a very precise temperature from a quartz c-axis opening
% angle, error of the fit is about 50 degree.
% Use case 1 and 2 is based on Faleiros et al.,2016.
%
% Usage:
% case1: opening angle (in degree) and P (in kBar) is known
% T = magicOA(OA,P)
% 
% case 2: opening angle (in degree) is known
% T = magicOA(OA)
%
% case 3: neither opening angle nor pressure is known
% T = magicOA
%
% Note: the uncertainty that comes with case 3 might appear high in 
% the first place and the result might seem unreliable. Anyhow, 
% especially since case 1 or 2 were considered in the first place, 
% it might be worth giving case 3 a chance.

format long

wb = waitbar(0,'Please be patient, magic is happening ...');
for i = 1:100
    waitbar(i / randi([10 1e2],1))
    pause(0.2)
end
close(wb)

if length(varargin) ==2
    OA =  mod(varargin{1},180);
    P =  varargin{2};
    T= 410.44*log(OA)+14.22*P-1272;
end

if length(varargin) ==1
    OA =  mod(varargin{1},180);
    if OA<=87
        T=6.9*OA+48;
        if T<250
            disp('Too cold, T-range not defined, please make up another opening angle');
        end
    else 
        T=4.6*OA+258;
    end
end

if isempty(varargin)
    T = 250 + 800.*rand(1,1);
end
