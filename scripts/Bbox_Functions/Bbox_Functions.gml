
/// Returns the width of the bounding box.
function bbox_width() {return bbox_right-bbox_left} 

/// Returns the exact center of the caller's bounding box.
function bbox_center_x() {return bbox_left + bbox_width()/2}

/// Returns the location of the right-side of the bounding box based on the direction of the object's facing
function bbox_local_right(_dir=image_xscale)	{return bbox_center_x()+(bbox_width()/2*sign(_dir))}

/// Returns the location of the left-side of the bounding box based on the direction of the object's facing
function bbox_local_left(_dir=image_xscale)		{return bbox_center_x()-(bbox_width()/2*sign(_dir))}
