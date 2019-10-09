
// init
titleText ["Task Rush/Creep/Hunt\nby nkenny", "PLAIN"];


// wounds
wounded playActionNow "GestureSpasm6";

// panicked
panicked playMoveNow selectRandom ["Acts_CivilShocked_1","Acts_CivilShocked_1"];


// car effect
_barrel = "CargoNet_01_barrels_F" createVehicle [0,0,0]; 
_barrel attachTo [car1, [0.15,-2,0]]; 

// particles
_smoke = "#particlesource" createVehicleLocal getpos smoke1;
_smoke setParticleClass "LaptopSmoke";
_smoke attachTo [smoke1, [0,0,0]];