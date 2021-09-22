currentRoom = 0
roomslist = modui_room_editor_get_rooms()
global.modui_room_canvases = []

room = ds_list_find_value(roomslist,currentRoom)