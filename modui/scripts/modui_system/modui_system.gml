//Checks if this UI element is "selected"
function __ui_check_hover(_x1,_y1,_x2,_y2)
{
	var ret=false
	if point_in_rectangle(mouse_x,mouse_y,_x1,_y1,_x2,_y2) ret=true
	return ret
}

//Checks if this UI element has been "clicked" on
function __ui_check_clicked(_hover)
{
	if _hover && mouse_check_button_pressed(mb_left) return true
	return false
}
