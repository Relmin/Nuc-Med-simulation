extends PanelContainer

@export_range(0, 10) var LAD_slider_value = $SliderBox/LADSlider.value
@export_range(0, 10) var RCA_slider_value = $SliderBox/RCASlider.value
@export_range(0, 10) var LCX_slider_value = $SliderBox/LCXSlider.value

var heat_map = PackedColorArray([
	black, 
	gunmetal, 
	carribean_blue, 
	egyptian_blue, 
	chrysler_blue, 
	french_violet, 
	magenta, 
	cocoa_brown, 
	earth_yellow, 
	ancient_white, 
	])

var black = Color(Color.hex(0x040907))
var gunmetal = Color(Color.hex(0x203637))
var carribean_blue = Color(Color.hex(0x386669))
var egyptian_blue = Color(Color.hex(0x323a93))
var chrysler_blue = Color(Color.hex(0x7100d1))
var french_violet = Color(Color.hex(0x6a00cf))
var magenta = Color(Color.hex(0x9333260))
var cocoa_brown = Color(Color.hex(0xd57125)) 
var earth_yellow = Color(Color.hex(0xe2a65e))
var ancient_white = Color(Color.hex(0xf9ebd7))

func lad_change_color():
	Color(heat_map[LAD_slider_value])

func rca_change_color():
	Color(heat_map[RCA_slider_value])

func lcx_change_color():
	Color(heat_map[LCX_slider_value])

func _on_lad_slider_drag_ended(_value_changed: bool) -> void:
	get_tree().call_group("LADBullseye", "lad_change_color")

func _on_rca_slider_drag_ended(_value_changed: bool) -> void:
	get_tree().call_group("RCABullseye", "rca_change_color")

func _on_lcx_slider_drag_ended(_value_changed: bool) -> void:
	get_tree().call_group("LCXBullseye", "lcx_change_color")
