function modui_button_sprite(_sprite,_subimage,_x,_y) constructor
{
	//default transform and display vars
	//you can edit these
	sprite_index=_sprite
	image_index=_subimage
	x=_x
	y=_y
	image_xscale=1
	image_yscale=1
	image_angle=0
	image_alpha=1
	image_speed=0
	image_blend=c_white
	
	//default bbox variables, can be changed with change_bbox
	bbox_left=x
	bbox_top=y
	bbox_right=x+sprite_get_width(sprite_index)*image_xscale
	bbox_bottom=y+sprite_get_height(sprite_index)*image_yscale
	
	//other vars
	//don't edit these
	selected=false
	canvasRef=-1
	cursor_x=0
	cursor_y=0
	pressed=0
	
	//function lists
	init_list=ds_list_create()
	destroy_list=ds_list_create()
	update_list=ds_list_create()
	selected_list=ds_list_create()
	pressed_list=ds_list_create()
	predraw_list=ds_list_create()
	postdraw_list=ds_list_create()
	
	//MODIFYING METHODS
	static change_bbox=function(_left,_top,_right,_bottom)
	{
		bbox_left=_left
		bbox_right=_right
		bbox_top=_top
		bbox_bottom=_bottom
	}
	
	static transform=function(_x,_y,_xscale,_yscale)
	{
		x=_x
		y=_y
		image_xscale=_xscale
		image_yscale=_yscale
		
		bbox_left=x
		bbox_top=y
		bbox_right=x+sprite_get_width(sprite_index)*image_xscale
		bbox_bottom=y+sprite_get_height(sprite_index)*image_yscale
	}
	
	static add_method=function(_method,_event)
	{
		switch _event
		{
			case MODUI_EVENTS.UPDATE:
				ds_list_add(update_list,_method)
				break
			case MODUI_EVENTS.PRESSED:
				ds_list_add(pressed_list,_method)
				break
			case MODUI_EVENTS.SELECTED:
				ds_list_add(selected_list,_method)
				break
			case MODUI_EVENTS.POSTDRAW:
				ds_list_add(postdraw_list,_method)
				break
			case MODUI_EVENTS.PREDRAW:
				ds_list_add(predraw_list,_method)
				break
			case MODUI_EVENTS.DESTROY:
				ds_list_add(destroy_list,_method)
				break
			case MODUI_EVENTS.INIT:
				ds_list_add(init_list,_method)
				break
		}
	}
	
	static remove_self=function()
	{
		array_delete(canvasRef.elements,position,1)
		destroy()
	}
	
	//EVENTS
	static update=function()
	{
		if bbox_left==0
		{
			imposter="sus"
		}
		
		//update functions
		loop_through_function_list(update_list)
		
		if selected
		{
			loop_through_function_list(selected_list)
			if pressed loop_through_function_list(pressed_list)
		}
		
		//remove vars
		selected=false
		pressed=false
	}
	
	static draw=function()
	{
		//loop through function list
		loop_through_function_list(predraw_list)
		
		//draw self
		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
		
		//loop through other funciton list
		loop_through_function_list(postdraw_list)
	}
	
	static init=function()
	{
		loop_through_function_list(init_list)
	}
	
	static destroy=function()
	{
		loop_through_function_list(destroy_list)
	}
}