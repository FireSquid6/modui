//create a canvas
canvas = new modui_canvas()

//do stuff for all of the elements
var element
with par_element_object
{
	//method lists
	element.update_list = update_list
	element.init_list = init_list
	element.destroy_list = destroy_list
	element.pressed_list = pressed_list
	element.selected_list = selected_list
	element.predraw_list = predraw_list
	element.postdraw_list = postdraw_list
	
	//default variables
	element.sprite_index = sprite_index
	element.image_index = image_index
	element.image_blend = image_blend
	element.image_alpha = image_alpha
	element.image_xscale = image_xscale
	element.image_yscale = image_yscale
	
	//other variables
	
	//add custom code for setting linking to anchors
	
	canvas.add_element(element)
}

//add the canvas to the rooms list
var name = room_get_name(room)
array_push(global.modui_room_canvases,
{
	room_name : name
	canvas : canvas
})

//go to next room
currentRoom++
room = ds_list_find_value(roomslist,currentRoom)