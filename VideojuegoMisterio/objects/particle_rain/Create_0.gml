/// @description Particle Setup

particle_system = part_system_create_layer("Weather", 0);

#region Rain
particleType_Rain = part_type_create();

part_type_sprite(particleType_Rain, spr_Particle_Rain_Hard, 0, 0, 1);
part_type_size(particleType_Rain, 2, 2, 0, 0);

part_type_gravity(particleType_Rain, 0.05, 250);

part_type_life(particleType_Rain, 200, 200);

part_type_orientation(particleType_Rain, 320, 330, 0, 0, 0)
#endregion


xStart = camera_get_view_x(view_camera[0]);
yStart = camera_get_view_y(view_camera[0]);

CameraWidth = camera_get_view_width(view_camera[0]);

emitterRain = part_emitter_create(particle_system);

part_emitter_region(particle_system, emitterRain, xStart - 800, xStart + CameraWidth + 800, yStart - 50, yStart - 50, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(particle_system, emitterRain, particleType_Rain, 5);