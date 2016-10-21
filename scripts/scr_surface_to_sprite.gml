/**********************************
This script:
* Creates a new surface
* Draws a card onto the surface based on global.my_csv array values
* Makes a sprite of the surface
* Assigns that sprite as the sprite_index of the object
* Tells object to draw itself
* Deletes the surface
***********************************/

if (!surface_exists(surface)) {
    // Create a new surface
    surface = surface_create(360,504);
    
    surface_set_target(surface); // start drawing on surface

    // Draw the card illustration image first
    draw_sprite(spr_card_img,local_card_number,160,320);
    
    // Draw the card template second
    if global.my_csv[local_card_number,2] = "w" { // card color
        draw_sprite(spr_card_template, 5, 0, 0);  
    } else if global.my_csv[local_card_number,2] = "r" {
        draw_sprite(spr_card_template, 4, 0, 0);
    } else if global.my_csv[local_card_number,2] = "g" {
        draw_sprite(spr_card_template, 3, 0, 0);   
    } else if global.my_csv[local_card_number,2] = "u" {
        draw_sprite(spr_card_template, 2, 0, 0);    
    } else if global.my_csv[local_card_number,2] = "b" {
        draw_sprite(spr_card_template, 1, 0, 0); 
    }
    
    // Draw the card text third
    draw_set_color(c_black)
    draw_set_font(roboto_condensed_12);
    draw_text(17, 11, global.my_csv[local_card_number,3]) // cost
    draw_set_color(c_white);
    draw_text(50, 11, global.my_csv[local_card_number,4]); // name
    draw_set_color(c_black); // reset
        if (card_attk < card_attk_starting) draw_set_color(c_red)
        if (card_attk > card_attk_starting) draw_set_color(c_green)
    draw_text(315, 11, card_attk); //var set by create event to change string to real
    draw_set_color(c_black); // reset
        if (card_def < card_def_starting) draw_set_color(c_red)
        if (card_def > card_def_starting) draw_set_color(c_green)
    draw_text(332, 11, card_def); //var set by create event to change string to real
    draw_set_color(c_black); // reset
    draw_set_font(roboto_condensed_10);
    draw_text_ext(50, 50, global.my_csv[local_card_number, 7], 15, 275); // desc
    

    // Draw surface to sprite
    spr_custom_card = sprite_create_from_surface(surface, 0, 0, 360, 504, false, true, 0, 0);
    sprite_index = spr_custom_card;
    sprite_set_offset(sprite_index, sprite_width/2, sprite_height/2);
    
        // Set sapped angle
        if !sapped image_angle = 0;
        if sapped image_angle = -90;
    
    // End the surface
    surface_reset_target(); // stop drawing on surface
    surface_free(surface);  // delete the surface    
}
