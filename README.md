# A3-EF-Titan-NLOS-Script
A simple script for Titan NLOS support using Arma 3's Expeditionary Forces CDLC.

This set of scripts is designed to create a custom fire support for units using the EF Titan NLOS system. Here's a quick breakdown of the scripts.

  description.ext - Contains the definitions for the new custom support class. Required to add the support to a players communications menu.
  scripts\titanLaunch.sqf - actually executes the launching of the missile, referenced in description.ext
  scripts\titanCamera.sqf - displays the camera that tracks the missile in flight

General usage is as follows:

  1. Create a new mission, save it, and drop description.ext and the scripts folder into the mission directory.
  2. Place a unit with a laser designator and make sure Data Link Send is enabled.
  3. Paste the following code into the unit's init field:
     _titanSup = [this, "myTitanSupport"] call BIS_fnc_addCommMenuItem;
  5. Place a vehicle with a Titan NLOS launcher (e.g. Combat Boat (AT)), set it's variable name to "titanVic", and paste the following into it's init field:
     this addEventHandler ["Fired",{_titan = _this select 6; _titan execVM "scripts\titanCamera.sqf";}];
  4a. Set the vehicle's behavior to "Hold Fire, Keep Formation." This prevents the unit from firing at the laser unless you tell it to.
  6. Launch the mission, lase the target, and call the support!
