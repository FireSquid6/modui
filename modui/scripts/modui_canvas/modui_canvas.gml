function modui_canvas() constructor
{
	//get initial variables and methods
	elements=[]
	
	//define static methods
	//element adding
	static add_element=function(_element)
	{
		//add element to array
		array_insert(elements,0,_element)
	}
	
	//update function - run each frame in step event
	static update=function(_cursorx,_cursory,_clicked)
	{
		cursor_x=_cursorx
		cursor_y=_cursory
		pressed=_clicked
		
		//loop through each element
		var length=array_length(elements)
		for (var i=0; i<length; i++)
		{	
			//give the element self
			elements[i].canvasRef=self
			elements[i].cursor_x=cursor_x
			elements[i].cursor_y=cursor_y
			elements[i].pressed=pressed
			
			//run update function
			elements[i].update()
		}
	}
	
	//draw function - run in draw/draw gui event respectively
	static draw=function()
	{
		//loop through elements and perform draw
		var length=array_length(elements)
		for (var i=0; i<length; i++)
		{
			elements[i].draw()
		}
	}
}