/*
Author: Sirloin

Arguments:
	_launchVic - The unit to provide fire support. Must be equipped with a Titan NLOS system (e.g. Combat Boat (AT)).
	
This script is confirmed to work with the following vehicles from the Expeditionary Forces CDLC:
	Hunter AT
	Combat Boat (AT)
	AH-99J Python
	
Example:
	titanVic execVM "scripts\titanLaunch.sqf";
*/

private _launchVic = _this;	   //passes the vehicle to a private variable
sleep 4;
private _laserTgt = laserTarget focusOn;    //sets the laser to be targeted
private _status = weaponState [_launchVic, [0], "EF_Weapon_Titan_NLOS"];    //gets the status of the vehicle's titan launcher
if ((_status select 4) > 0 && (_status select 5) == 0 && (_status select 6) == 0) then {    //this section checks to see if the launcher can fire, and then commands it to fire. If the unit can't fire (reloading, out of ammo, etc.) it will say so.
	_launchVic commandTarget _laserTgt;    //aim at the laser target
	_handle = _launchVic fireAtTarget [_laserTgt, "EF_Weapon_Titan_NLOS"];    //fire ze missiles!
	_launchVic sideChat "Laser locked, missile inbound.";    //tell the player what you've done
}
else {
	_launchVic sideChat "Cannot fire!";    //tell the player no
}