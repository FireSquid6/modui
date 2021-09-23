#macro MODUI_VERSION "1.1.0" //the current version of modui

//you can change this at runtime!
//controls whether bboxes and stuff are drawn
global.modui_debug=false

#macro ROOM_GUI_NEXT_ROOM room_first //controls which room the game goes to after finishing looping through all gui rooms
#macro MODUI_DEBUG_COLOR c_aqua //controls the color debug info is drawn in

#region DON'T EDIT THESE UNLESS YOU KNOW WHAT YOU'RE DOING
enum MODUI_EVENTS
{
	UPDATE, //every frames
	SELECTED, //when the element is "selected" via mouse hovering or grid selection
	PRESSED, //when the element is "clicked on" via mouse or grid
	PREDRAW, //draw event before the element draws itself
	POSTDRAW, //draw event after the element draws itself
	INIT, //when the element is created
	DESTROY //when the element or canvas is destroyed
}

enum MODUI_ELEMENT_TYPES
{
	BUTTON, //clickable button
	SLIDER //dragable slider
}
#endregion
