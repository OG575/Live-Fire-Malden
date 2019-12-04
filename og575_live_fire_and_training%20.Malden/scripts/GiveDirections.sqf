//////////////////////////////////////////////////////////////////
// Function file for Armed Assault
// Created by: (AEF)Wolffy.au [2CAV]
// Created: 20090326
// Version: 20090326 - Initial release
// Version: 20090410 - Added helicopter support
// Version: 20090414 - Fixed AI flying into trees on take off and
// hover on landing (helps on slopes)
// Contact: http://www.aef-hq.com.au
// Purpose: Give directions to any AI transport inc helis
///////////////////////////////////////////////////////////////////
if (isServer) then {
    PV_AID = [];
    PublicVariable "PV_AID";
    [] spawn {
        while {true} do {
            waitUntil {(count PV_AID) != 0};
            _driver = PV_AID select 0;
            _pos = PV_AID select 1;
            if (vehicle _driver iskindof "Helicopter") then {
                _driver move (position _driver);
                _driver flyInHeight 50;
                waitUntil {(getPos _driver select 2) + (_driver distance (getPos _driver)) > 40};
            };
            _driver move _pos;
            // Originally from Myke's cep_move.sqf
            if (vehicle _driver iskindof "Helicopter") then {
                _driver flyInHeight 50;
                _land = "HeliHEmpty" createVehicle _pos;
                waitUntil {(_driver distance _land) < 150};
                _driver land "GET OUT";
                waitUntil {(getPos _driver select 2) + (_driver distance (getPos _driver)) < 5};
                 _driver flyInHeight 3;
                deletevehicle _land;
            };
            PV_AID = [];
            PublicVariable "PV_AID";
        };
    };
};

if (count _this > 0) then {
    _driver = _this select 0;
    _id = floor random 10000;
    //hint format["%1", _id];
    call compile format["click%1 = [];", _id];
    titleText ["Click on your map where you would like the driver to move to.", "PLAIN DOWN", 1];
    onMapSingleClick format["click%1 = _pos; onMapSingleClick """"", _id];
    waitUntil {call compile format["(count click%1) > 0", _id]};
    waitUntil {(count PV_AID) == 0};
    call compile format["PV_AID = [_driver, click%1]", _id];
    _driver sideChat "Moving out";
    PublicVariable "PV_AID";
};
