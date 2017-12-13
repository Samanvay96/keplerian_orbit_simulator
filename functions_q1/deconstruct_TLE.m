function Sat = deconstruct_TLE(TLEFile)
  % Function to deconstruct TLE Code

  % Load text file for the TLE
  % data = importdata('OrbocommTLE.txt');
  data   = importdata(TLEFile);

  % Initialise Values
  Sat.e           = str2double(['0.' data.textdata{2,5}]);
  Sat.i           = str2double(data.textdata{2,3});
  Sat.rascension  = str2double(data.textdata{2,4});
  Sat.AoP         = str2double(data.textdata{2,6});
  Sat.meanAnomaly = str2double(data.textdata{2,7});
  Sat.EpochYear   = str2double(data.textdata{1,4}(1:2));
  Sat.EpochDay    = str2double(data.textdata{1,4}(3:end));

  % Calculate orbital period to obtain a
  meanMotion    = data.data(2,1);           % Revs/day
  lengthOfDay   = 24*60*60;                 % s
  orbitalPeriod = lengthOfDay/meanMotion;   % s

  % Calculate a
  M_e   = 5.972 * 10^24;  % kg
  G     = 6.67408 * 10^-11; % m^3 kg^-1 s^-2
  mu    = M_e*G;
  Sat.a = ((mu*orbitalPeriod^2)/(4*pi^2))^(1/3);

  % Return Orbital Period
  Sat.orbitPeriod = orbitalPeriod;

end


