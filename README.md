# taskRush-Creep-Hunt-for-Arma3
Three AI scripts for Arma3

### fn_taskRush
Ever needed the AI to dumbly hunt down and rush the players? This is the script for you.  The premise is simple.  The AI will move with perfect knowledge towards any player unit within range.  While not fearless, the AI is very aggressive and will enter buildings. The AI will know player location but not targeting information-- the AI must still locate the enemy to start shooting.  Perfect for Black Hawk Down style scenarios or mad dashes through Tanoan jungles. Or both! 

Use:
Run the script on unit or group with an optional argument for range (Default is 500 meters). 
_[someUnit, 550] execVM "fn_taskRush.sqf";_

Features
- Simple aggressive AI script
- Multiplayer friendly. 
- Helicopters will generally be ignored, but low flying ones will be suppressed. 
- Tanks and tracked vehicles will be approached cautiously and with suppressive fire 


### fn_taskHunt
A LRRP patrol style script that has the  unit slowly patrol in an area which gradually centres on the nearest player, within the defined range. Good for having patrols which must absolutely trigger or when you need to be careful with your AI resources and want only a single patrol which will generate some heat. 

Use:
Run the script on unit or group with an optional argument for range (Default is 500 meters). 
_[someUnit, 1000] execVM "fn_taskHunt.sqf";_

Features
- Aggressive patrolling script
- Multiplayer friendly. 
- Known enemy buildings will be suppressed 
- Group will fire flares to coordinate friendly forces
- Uses flashlights and IR lasers

### fn_taskCreep
A LRRP patrol style script that has the  unit slowly patrol in an area which gradually centres on the nearest player, within the defined range. Good for having patrols which must absolutely trigger or when you need to be careful with your AI resources and want only a single patrol which will generate some heat. 

Use:
Run the script on unit or group with an optional argument for range (Default is 500 meters). 
_[someUnit, 1000] execVM "fn_taskHunt.sqf";_

Features
- Aggressive patrolling script
- Multiplayer friendly. 
- Known enemy buildings will be suppressed 
- Group will fire flares to coordinate friendly forces
- Uses flashlights and IR lasers

### fn_taskCQB
Description forthcoming
