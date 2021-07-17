//NOTE: THIS SCRIPT REQUIRES BOTH SCRIBBLE AND CLEAN SHAPES
//https://github.com/JujuAdams/scribble
//https://github.com/JujuAdams/Clean-Shapes

//SYSTEM FUNCTIONS - EDIT THESE TO CHANGE HOW THE SYSTEM PERCIEVES HOVERING AND CLICKING


//CLICKABLE SPRITE
function modui_button_sprite(_x,_y,_sprite,_subimg) : modui_button_parent() constructor
{	
	#region MODIFYING FUNCTIONS
	//change format
	changeFormat=function(_defaultsubimg,_defaultblend,_defaultalpha)
	{
		blend=_defaultblend
		subimg=_defaultsubimg
		alpha=_defaultalpha
	}
	
	//transform
	scale=function(_xscale,_yscale)
	{
		image_xscale=_xscale
		image_yscale=_yscale
	}
	
	//grid position
	change_grid_position=function()
	{
		
	}
	
	#endregion
	
	#region DEFAULT VARS
	//sprite format
	x=_x
	y=_y
	sprite_index=_sprite
	
	image_index=_subimg
	image_xscale=1
	image_yscale=1
	image_blend=c_white
	image_angle=0
	image_alpha=1
	subimg=_subimg
	blend=c_white
	alpha=1
	width=sprite_get_width(sprite_index)*image_xscale
	height=sprite_get_height(sprite_index)*image_yscale
	
	//vars
	isSelected=false
	mx=0
	my=0
	drawType=DEFAULT_DRAW
	
	#endregion
	
	#region STEP FUNCTIONS
	//lists
	updateFunctions=ds_list_create()
	postDrawFunctions=ds_list_create()
	preDrawFunctions=ds_list_create()
	pressFunctions=ds_list_create()
	selectFunctions=ds_list_create()
	
	//functions
	update=function()
	{
		//get mouse
		__ui_get_mouse_pos(drawType)
		
		//get width and height
		width=sprite_get_width(sprite_index)*image_xscale
		height=sprite_get_height(sprite_index)*image_yscale
		
		//get hover
		isSelected=__ui_check_hover(x,y,x+width,y+height)
		if isSelected loop_through_function_list(selectFunctions)
		if __ui_check_clicked(isSelected) loop_through_function_list(pressFunctions)
		
		image_index=subimg
		image_blend=blend
		image_alpha=alpha
		
		//added functions
		loop_through_function_list(updateFunctions)
	}
	
	draw=function()
	{	
		//pre draw
		loop_through_function_list(preDrawFunctions)
		
		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
		
		//post draw
		loop_through_function_list(postDrawFunctions)
	}
	#endregion
}