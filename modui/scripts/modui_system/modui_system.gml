//Checks if this UI element is "selected"
function __ui_check_hover(_x1,_y1,_x2,_y2)
{
	var ret=false
	if point_in_rectangle(mx,my,_x1,_y1,_x2,_y2) ret=true
	return ret
}

//Checks if this UI element has been "clicked" on
function __ui_check_clicked(_hover)
{
	if _hover && mouse_check_button_pressed(mb_left) return true
	return false
}

//get mouse pos
function __ui_get_mouse_pos(_drawType)
{
	switch _drawType
	{
		case MODUI_DRAW_TYPES.DEFAULT:
			mx=GET_MOUSE_X_DRAW
			my=GET_MOUSE_Y_DRAW
			return true
			break
		case MODUI_DRAW_TYPES.GUI:
			mx=GET_MOUSE_X_GUI
			my=GET_MOUSE_Y_GUI
			return true
			break
		default:
			return false
			break
	}
}

enum SELECTION_TYPES
{
	MOUSE,
	GRID,
}

function modui_create_system(_selectionType) constructor
{
	selectionType=_selectionType
	elementsList=ds_list_create()
	
	add_element=function(_element)
	{
		_element.selectionType=selectionType
		ds_list_add(elementsList,_element)
	}
	
	update=function()
	{
		
	}
}