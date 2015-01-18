//NAME: slope2.ks
//Determines the angle of the slope at a given lat/long coordinate

//DEPENDENCIES
//None

//A position that is given as an argument
DECLARE PARAMETER slope2_scanPos.

//Determines how big the scanned area is in degrees lat/lng
SET slope2_scanSize TO 0.0005.

//Offsets the four corners of the square that is scanned
SET slope2_north TO LATLNG(slope2_scanPos:LAT+slope2_scanSize, slope2_scanPos:LNG).
SET slope2_east  TO LATLNG(slope2_scanPos:LAT, slope2_scanPos:LNG+slope2_scanSize).
SET slope2_south TO LATLNG(slope2_scanPos:LAT, slope2_scanPos:LNG-slope2_scanSize).
SET slope2_west TO LATLNG(slope2_scanPos:LAT-slope2_scanSize, slope2_scanPos:LNG).

//Determines which of the corners of the square is the highest/lowest
SET slope2_highestPoint TO slope2_north.
SET slope2_lowestPoint TO slope2_north.

IF slope2_east:TERRAINHEIGHT > slope2_highestPoint:TERRAINHEIGHT{
	SET slope2_highestPoint TO slope2_east.
}.
IF slope2_east:TERRAINHEIGHT < slope2_lowestPoint:TERRAINHEIGHT{
	SET slope2_lowestPoint TO slope2_east.
}.


IF slope2_south:TERRAINHEIGHT > slope2_highestPoint:TERRAINHEIGHT{
	SET slope2_highestPoint TO slope2_south.
}.
IF slope2_south:TERRAINHEIGHT < slope2_lowestPoint:TERRAINHEIGHT{
	SET slope2_lowestPoint TO slope2_south.
}.


IF slope2_west:TERRAINHEIGHT > slope2_highestPoint:TERRAINHEIGHT{
	SET slope2_highestPoint TO slope2_west.
}.
IF slope2_west:TERRAINHEIGHT < slope2_lowestPoint:TERRAINHEIGHT{
	SET slope2_lowestPoint TO slope2_west.
}.


//We now know the highest/lowest corners of the square
//A vector that goes from the high point to the low point is created
SET slope2_slopeVector TO slope2_lowestPoint:POSITION - slope2_highestPoint:POSITION.

//Calculate the angle between the horizon and the vector that was just created
SET slope2_slope TO ABS( VANG(slope2_slopeVector, BODY:POSITION)-90 ).
