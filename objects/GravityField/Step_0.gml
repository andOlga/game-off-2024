///@description Drag objects

for (var obj_to_pull_idx = 0; obj_to_pull_idx < array_length(objects_to_pull); obj_to_pull_idx++) {
	ds_list_clear(instances_met)
	instance_place_list(x, y, objects_to_pull[obj_to_pull_idx], instances_met, false)
	with (objects_to_pull[obj_to_pull_idx]) {
		gravity = 0
		for (var met_check_idx = 0; met_check_idx < ds_list_size(other.instances_met); met_check_idx++) {
			if (id == other.instances_met[| met_check_idx]) {
				gravity = other.pull_strength
				gravity_direction = other.image_angle
			}
		}
	}
}