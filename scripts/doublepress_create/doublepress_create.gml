/// @description doublepress_create( max time );
/// @param max time 
function doublepress_create(argument0) {

	///---		Example		---///
	/*	//Create
		doublepress_create( room_speed* 0.2 );
	
		//////////////////////////
		Double tap a keyboard key within 0.2 seconds to trigger the event (inside step event)

	*/

	prevKey[ 2 ]	= 0;
	prevKeyTimer	= 0;
	prevKeyTimerMax = argument0; //double tap within this time
	DoubleKey		= -1; 



}
