//FILENAME: slope.ks
//slope_slope is how steep the ground beneath the craft is in degrees in the direction of travel
//slope_slope > 0 means it's an upwards slope
//slope_slope < 0 means it's a downwards slope

SET slope_height0 TO SHIP:GEOPOSITION:TERRAINHEIGHT.
WAIT 0.05.

SET slope_height1 TO SHIP:GEOPOSITION:TERRAINHEIGHT.
SET slope_slope TO arctan((slope_height1-slope_height0)/(0.05*VXCL(BODY:POSITION,SHIP:VELOCITY:SURFACE):MAG)).
