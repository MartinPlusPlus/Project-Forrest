x = obj_player.x + 5;
y = obj_player.y - 12;

image_angle = point_direction(x, y, mouse_x, mouse_y);

firingDelay = firingDelay - 1;
recoil = max(0, recoil - 1);

if (mouse_check_button(mb_left)) && (firingDelay < 0)
{
	recoil = 5;
	firingDelay = 30;
	screenShake(4, 20);
	with (instance_create_layer(x, y, "Bullets", obj_bullet))
	{
		speed = 15;
		direction = other.image_angle + random_range(-3, 3);
		image_angle = direction;
	}
}

x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);

if (image_angle > 90) && (image_angle < 270)
{
	image_yscale = -1;
	with (obj_player)
	{
		image_xscale = -1;
		if (sign(hsp) < 0) && (hsp != 0)
		{
			image_speed = -1;
		}
		else
		{
			image_speed = 1;
		}
	}
}
else 
{
	image_yscale = 1;
	with (obj_player)
	{
		image_xscale = 1;
		if (sign(hsp) < 0) && (hsp != 0)
		{
			image_speed = 1;
		}
		else
		{
			image_speed = -1
		}
	}
}