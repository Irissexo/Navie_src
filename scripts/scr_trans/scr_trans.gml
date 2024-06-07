// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function trans_to(_rm){
	if !instance_exists(obj_trans) {
		var inst = instance_create_depth(0, 0, -999999, obj_trans);
			inst.t_room = _rm;
	}
}