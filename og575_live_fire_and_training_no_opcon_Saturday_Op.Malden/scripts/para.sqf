/*
Ghost put this in an objects init line - ghst_halo = host1 addAction ["Halo", "ghst_halo.sqf", 6, true, true, "","alive _target"];
*/

_host = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_altpara = 200; //altitude of halo jump
_timeout = 300;	//change to 30 minutes.
_altchute = 100;//altitude for autochute deployment


_elapsedTime = 86400; //24 hours

if (not alive _host) 												exitwith {hint "Halo Not Available"; _host removeaction _id;};

//special case: first time halo
if !(isNil {_caller getVariable "jump_last_time"}) then
{
	_lastTime 		= _caller getVariable "jump_last_time";
	_elapsedTime 	= time - _lasttime;
};


_Chute = ["rhsusf_eject_Parachute_backpack", :"ACE_NonSteerableParachute", "MRH_AADEquippedNSParachute"];


if (_elapsedTime < _timeout) exitWith {_caller groupchat format["Next flight will be ready in %1 seconds.", (round(_timeout - _elapsedTime))];};
if (not ((backpack _caller) in _Chute)) exitwith {_caller groupchat "You will need a non-steerable parachute, Burn Baby Burn.";};


private ["_pos"];
_caller groupchat "Left click on the map where you want to insert";
openMap true;
mapclick = false;
onMapSingleClick "clickpos = _pos; mapclick = true; onMapSingleClick """";true;";
waituntil {mapclick or !(visiblemap)};

if !(visibleMap) exitwith {_caller groupchat "Im too scared to jump";};

_pos = clickpos;

_caller setpos [_pos select 0, _pos select 1, _altpara];
_caller spawn bis_fnc_halo;

openMap false;

[_caller] spawn bis_fnc_halo;

waituntil {(position _caller select 2) <= _altchute};

_caller action ["openParachute"];
_caller setVariable ["jump_last_time", time];
