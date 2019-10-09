// Aggressive Attacker script
// version 4.4
// by nkenny

/*

  Aggressive tracking and attacking script

  Arguments
    1, Group or object tracker  [Object or Group]
    2, Range of tracking        [Number]
*/

// functions ---

_fn_findTarget = {
    _newDist = _range; 
    _all = (switchableUnits + playableUnits - entities "HeadlessClient_F");
    _all = _all select {side _x != civilian && {side _x != side _group}};
    _target = objNull;
    {
        _distance = (leader _group) distance2d _x;
        if (_distance < _newDist && {getpos _x select 2 < 200}) then {_target = _x;_newDist = _distance;};
        true
    } count _all; 
    _target
};

_fn_rushOrders = {
    // Helicopters -- supress it! 
    if ((leader _group distance2d _target < 220) && {vehicle _target isKindOf "Air"}) exitWith {
        {
        _x commandSuppressiveFire getposASL _target;
        true
        } count units _group;
    };

    // Tank -- hide or ready AT
    if ((leader _group distance2d _target < 80) && {vehicle _target isKindOf "Tank"}) exitWith {
        {
            if (secondaryWeapon _x != "") then {
                _x setUnitpos "Middle";
                _x selectWeapon (secondaryweapon _x);
            } else {
                _x setunitpos "DOWN";
                _x commandSuppressiveFire getposASL _target;
            };
            true
        } count units _group;
        _group enableGunLights "forceOff";
    };

    // Default -- run for it! 
    {_x setunitpos "UP";_x domove (getposATL _target);true} count units _group;
    _group enableGunLights "forceOn";
}; 

// functions end ---

// init
params ["_group",["_range",500],["_cycle",15]];

// sort grp
if (!local _group) exitWith {};
if (_group isEqualType objNull) then {_group = group _group;};

// orders
_group setSpeedMode "FULL";
_group setFormation "WEDGE";
_group enableAttack false;
{_x disableAI "AUTOCOMBAT";dostop _x;true} count units _group;

// Hunting loop
while {{alive _x} count units _group > 0} do {

    // performance
    waitUntil {sleep 1; simulationenabled leader _group};
    
    // find
    _target = call _fn_findTarget;
    
    // act
    if (!isNull _target) then {
        call _fn_rushOrders;
        _cycle = 15;
    } else {
        _cycle = 60;
    };

    // delay 
    sleep _cycle;
};

// end
true