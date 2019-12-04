//////Enhanced High&Low Script Ver2.1 by Rodeostar42//////    ///adviced by Halal///

///World index///
_mediterranean = [
"Altis",
"Stratis",
"Koplic",
"bozcaada",
"evergreen",
"SugarLake",
"Gorgona"
];
_middleeast = [
"Takistan",
"Zargabad",
"pja310",
"Shapur_BAF"
];
_winter_maps = [
"Chernarus_winter",
"utes_winter",
"anim_helvantis_v2",
"abramia",
"ThirskW"
];
_euro = [
"Panthera3",
"Chernarus",
"Chernarus_Summer",
"Woodland_ACR",
"ProvingGrounds_PMC",
"utes",
"Bornholm",
"Thirsk",
"sfp_wamako",
"Napf",
"sfp_sturko",
"imrali",
"imralispring"
];
_tropical = [
"pja305",
"Sara_dbe1",
"SaraLite",
"Sara",
"Porto",
"Intro",
"IslaDuala3",
"Mog",
"lingor3",
"wake",
"Atlantis"
];
_Southern = [
"australia"
];
_World = [
"Altis",
"Stratis",
"bozcaada",
"Takistan",
"Zargabad",
"pja310",
"Shapur_BAF",
"Chernarus_winter",
"utes_winter",
"ThirskW",
"anim_helvantis_v2",
"Panthera3",
"Chernarus",
"Chernarus_Summer",
"Woodland_ACR",
"ProvingGrounds_PMC",
"utes",
"Bornholm",
"Thirsk",
"pja305",
"Sara_dbe1",
"SaraLite",
"Sara",
"Porto",
"Intro",
"IslaDuala3",
"Mog",
"lingor3",
"abramia",
"australia",
"Koplic",
"sfp_wamako",
"Napf",
"evergreen",
"sfp_sturko",
"SugarLake",
"imrali",
"imralispring",
"wake",
"Atlantis",
"Gorgona"
];

if (!isDedicated) then {

   if ((worldName in _World )) then {

if (worldName in _mediterranean) then {

   nul=[] execVM "EHL\mediterranean.sqf";
};

if (worldName in _middleeast) then {

   nul=[] execVM "EHL\middleeast.sqf";
};

if (worldName in _winter_maps) then {

   nul=[] execVM "EHL\winter_maps.sqf";
};

if (worldName in _euro) then {

   nul=[] execVM "EHL\euro.sqf";
};

if (worldName in _tropical) then {

   nul=[] execVM "EHL\equator.sqf";
};

if (worldName in _Southern) then {

   nul=[] execVM "EHL\Southern.sqf";
};

   cuttext ["Water Temp Start.  World Index OK","PLAIN",2];
}
else{

   nul=[] execVM "EHL\Standard_temp.sqf";

   cuttext ["Water Temp Start. Standard Temp Index","PLAIN",2];
};

   while {true} do {

_unit = player;
_uniform = ["U_O_PilotCoveralls","U_B_PilotCoveralls","U_I_pilotCoveralls","JS_JC_FA18_PilotCoveralls"];
_gear = [

///Head gear///
///ARMA3///
"H_PilotHelmetFighter_B",
"H_PilotHelmetFighter_I",
"H_PilotHelmetFighter_O",
///RHS///
"RHS_jetpilot_usaf",
"rhs_zsh7a",
///USAF///
"USAF_SFS_Pilot_H",
///CUP///
"USAF_SFS_Pilot_F35_Down",
"USAF_SFS_Pilot_F35_Up",
"USAF_SFS_Pilot_H_Up",
"USAF_SFS_Pilot_H_Down",
"USAF_SFS_Pilot_N",
//f18//
"JS_JC_FA18_PilotHelmet"
];


if ((headgear player in _gear)&&(vehicle player == player)) then
      {

         player setFatigue 1;
      };

      sleep 1;


 ///Oxygen Enhanced ///
/* 
if (( vehicle player) isKindOf "Air" && ((getPosASLVisual (vehicle player) select 2) > 5000)&&(!(headgear player in _gear))) then {

      hint parseText format["<t size='1' color=""#FFD700"">We're in high altitude.jump from here?  %1 It must be equipped with oxygen helmet</t>"];
         };
          */
            sleep 0.1;
/* 
if ((vehicle player == player)&&(!(headgear player in _gear))&&(( getPosASL (vehicle  player) select 2) > 5000 ))then {

   hint parseText format["<t size='1' color=""#FF0000"">Danger!! %1 Low oxygen concentration</t>"];

   dethcount = 0;

   private ["_black"];
   _black = ppEffectCreate ["ColorCorrections", 1500];
   _black  ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [1, 1, 1, 0], [0.75, 0.25, 0, 1.0]];
   _black  ppEffectCommit 10;
   _black  ppEffectEnable TRUE;

   private ["_bl"];
   _bl = ppEffectCreate ["DynamicBlur", 10];
   _bl ppEffectEnable true;
   _bl ppEffectAdjust [5];
   _bl ppEffectCommit 10;

   while {dethcount < 15} do{

if ((headgear player in _gear)or( getPosASL (vehicle  player) select 2) < 4999 )  then {

   hint parseText format["<t size='1' color=""#FFFFFF"">Oxygen concentration is normal %1 Status OK</t>"];

   _bl ppEffectAdjust [0];
   _bl ppEffectCommit 10;

   _black  ppEffectAdjust [1, 1, 0,[ 0, 0, 0, 0],[ 1, 1, 1, 1],[ 0, 0, 0, 0]];
   _black  ppEffectCommit 10;

   dethcount = 15;
};

   sleep 1;
   dethcount = dethcount + 1;
};

if ((vehicle player == player)&&(!(headgear player in _gear))&&(( getPosASL (vehicle  player) select 2) > 5000 ) )then {
   player setDamage 1;
};
   sleep 1;
};
 */
};

};
