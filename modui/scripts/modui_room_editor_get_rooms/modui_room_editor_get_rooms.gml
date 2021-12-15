function modui_room_editor_get_rooms()
{
	//get all the rooms to go to
	//make sure to give all the rooms the prefix "modroom"
	var i = room_first
	var room_name
	var rooms_list = [] //put all the rooms to go to in this list
	while room_exists(i)
	{
		room_name = room_get_name(i)
		
		if string_pos_ext("modroom", room_name, 0)
		{
			array_push(rooms_list, room)
		}
		
		i = room_next(i)
	}	
	return rooms_list
}