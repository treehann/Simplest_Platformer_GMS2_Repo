// *** VERTICAL CODE ***

// get variables representing a wall below and above (or noone if there is no wall)
var wall_below = instance_place(x, y+1, o_wall);
var wall_above = instance_place(x, y-1, o_wall);

// if there is no wall below
if(wall_below == noone)
{	
	// increase downward speed to simuate gravity
    vspeed += 1;
}
else if(vspeed > 0) // if there IS a wall below and we are going down
{
	// stop downward speed
	vspeed = 0;
	
	// fix vertical position to be on top of the wall
	y = wall_below.y - sprite_height;  
}
else if(vspeed == 0) // if there IS a wall below and we are not moving vertically
{
	// check for jump button (W as in WASD or up arrow)
	if(keyboard_check(ord("W")) || keyboard_check(vk_up))
	{
		// only allow if there is no wall above
		if(wall_above == noone)
		{
			// set vertical speed to jump
			vspeed = -16;
		}
	}
}

// check for jumping into a ceiling - only if already moving upward (negative vertical speed)
if(vspeed < 0)
{
	// check for the ceiling (a wall above)
	if(wall_above != noone)
	{
		// stop upward speed
	    vspeed = 0;
		
		// fix vertical position to be below the wall
	    y = wall_above.y + wall_above.sprite_height;
	}
}


// *** HORIZONTAL CODE ***

// if right key pressed (D as in WASD or right arrow)
if(keyboard_check(ord("D")) || keyboard_check(vk_right))
{
	// get a variable representing a wall to the right (or noone if there is no wall)
	var wall_right = instance_place(x+1, y, o_wall);
	
	// if there is no wall to the right
	if(wall_right == noone)
	{
		// set horizontal speed to move right
		hspeed = 4;
	}
	else // if there IS a wall to the right
	{
		// stop horizontal speed
		hspeed = 0;
		
		// fix horizontal position to be to the left of the wall
		x = wall_right.x - sprite_width;
	}
}
else if(keyboard_check(ord("A")) || keyboard_check(vk_left))  // left key pressed (A as in WASD or left arrow)
{
	// get a variable representing a wall to the left (or noone if there is no wall)
	var wall_left = instance_place(x-1, y, o_wall);
	
	// if there is no wall to the left
	if(wall_left == noone)
	{
		// set horizontal speed to move left
		hspeed = -4;
	}
	else // if there IS a wall to the left
	{
		// stop horizontal speed
		hspeed = 0;
		
		// fix horizontal position to be to the right of the wall
		x = wall_left.x + wall_left.sprite_width;
	}
}
else // if no horizontal key pressed
{
	// stop movement (otherwise character will keep going when in empty area)
	hspeed = 0;	
}