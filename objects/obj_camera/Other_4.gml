surface_resize(application_surface, res_w * surf_scl, res_h * surf_scl);

view_enabled = true;
view_visible[0] = true;

camera_set_view_size(view_camera[0], res_w, res_h);
camera_set_view_pos(view_camera[0], 0, 0);

display_set_gui_size(res_w, res_h)