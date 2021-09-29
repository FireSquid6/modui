//get the percentage of the gui you need to be on 
function get_anchor_pos(_anchorid, _x, _y)
{
	var xdist = point_distance(_x, 0, _anchorid.x, 0)
	var ydist = point_distance(_y, 0, _anchorid.y, 0)
	
	var xpercent = room_width / xdist
	var ypercent = room_height / ydist
	
	return {
		xx : xpercent,
		yy : ypercent
	}
}