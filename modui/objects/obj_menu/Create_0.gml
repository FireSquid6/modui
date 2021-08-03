//init canvas
canvas=new modui_canvas()

//coolbox
var coolbox=new modui_button_sprite(spr_box,1,250,250)
coolbox.transform(250,250,4,4)

//add function
coolbox.add_method(change_color_init,MODUI_EVENTS.INIT)
coolbox.add_method(change_color_update,MODUI_EVENTS.UPDATE)
coolbox.add_method(change_color_selected,MODUI_EVENTS.SELECTED)

//add to canvas
canvas.add_element(coolbox)