extends "res://visual_effects/floating_text/floating_text_manager.gd"

const MYMOD_LOG = "blank-BetterDmgNumbers"

func _on_unit_took_damage(unit: Unit, value: int, _knockback_direction: Vector2, _knockback_amount: float, is_crit: bool, is_dodge: bool, is_protected: bool, armor_did_something: bool, _args: TakeDamageArgs, hit_type: int) -> void :
	if not ProgressData.settings.damage_display:
		return

	var color: Color = Color.white
	var text = format_damage_text(value)
	var always_display = false
	var need_translate = false

	if unit is Player:
		always_display = true
		if value > 0:
			color = Color.red
			text = "-" + text
		elif is_dodge:
			text = "DODGE"
			need_translate = true
		elif is_protected:
			text = "NULLIFIED"
			need_translate = true
	elif is_crit:
		color = Color.yellow
	elif armor_did_something:
		color = Color.gray


	var icon = null if hit_type == HitType.NORMAL else get_special_hit_icon(hit_type)

	display(text, unit.global_position, color, icon, duration, always_display, direction, need_translate)

func format_damage_text(value: int) -> String :
	var suffix = ["", "K", "M", "B", "T"]
	var fvalue = float(value)
	var p = 0
	
	while(fvalue > 1000):
		p += 1
		fvalue /= 1000
	
	if(p >= len(suffix)) :
		return "TOO MUCH DMG"
	
	return str(stepify(fvalue, 0.01)) + suffix[p]
