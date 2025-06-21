/*
Author: Sirloin

Arguments:
	_missile - The missile to be tracked

To add camera functionality to a Titan support unit, paste the following code into the unit's init field:

this addEventHandler ["Fired",{_titan = _this select 6; _titan execVM "scripts\titanCamera.sqf";}];

This script is confirmed to work with the following vehicles from the Expeditionary Forces CDLC:
	Hunter AT
	Combat Boat (AT)
	AH-99J Python
*/

private _missile = _this;
["init", _missile] call EF_fnc_liveFeedMissile;    //enables the camera for the missile that was just fired
waitUntil {!alive _missile};
["close", _missile] call EF_fnc_liveFeedMissile;    //disables the camera after the missile is destroyed