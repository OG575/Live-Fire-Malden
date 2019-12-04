/*-----
reset.sqf contents
-----*/

/*-------
Makes targets pop up at the user's command. Targets go down after being hit,
and return back with user action. Because swivel targets have a different
script assigned to them that works differently from all other targets, 
they are handled separately in the script. If you don't plan
to use swivel targets at all, feel free to delete the corresponding part
of the code.

Optional parameters:
_0 = [objectName,radius] execVM "reset.sqf";
example:
_0 = [iCenter,120] execVM "reset.sqf";

default:
_0 = [player, 50] execVM "reset.sqf";
-------*/

params [["_dist",50,[1]],["_center",player,[objNull]]];					//in params
_targets = nearestObjects [position _center, ["TargetBase"], _dist];	//take all nearby practice targets
if (count _targets < 1) exitWith {
	systemChat "No compatible targets were found.";						//exit if no targets have been found
};
{_x animate ["Terc",0];} forEach _targets;								//get all targets to upright pos
{_x addEventHandler ["HIT", {											//add EH
(_this select 0) animate ["Terc",1];									//if hit, get to the ground
(_this select 0) RemoveEventHandler ["HIT",0];							//remove EH
}
]} forEach _targets;
//systemChat "Ready.";


//swivel targets start here

_SwivelTargets = nearestObjects [position _center, ["Target_Swivel_01_base_F"], _dist];		//swivel targets work differently
if (count _SwivelTargets < 1) exitWith {
	systemChat "No swivel targets were found.";
};
{_x animate ["Terc",0]; _x setVariable ["BIS_poppingEnabled", false];} forEach _SwivelTargets;	//nopop has no effect, it's poppingEnabled now
{_x addEventHandler ["HitPart", {
((_this select 0) select 0) animate ["Terc",1];
((_this select 0) select 0) RemoveEventHandler ["HitPart",0];
}
]} forEach _SwivelTargets;
//systemChat "Swivel ready.";