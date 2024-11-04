///@description Shoot
var bullet_instance = instance_create_depth(x, y, depth + 1, Bullet, {target_direction: "As Specified"})
bullet_instance.direction = image_angle
bullet_instance.image_angle = image_angle
image_index = 0
alarm[0] = shooting_delay