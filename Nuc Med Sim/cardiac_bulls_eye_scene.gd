extends Node

var heat_map = PackedColorArray([
	Color.BLACK,
	Color.REBECCA_PURPLE, 
	Color.BLUE_VIOLET, 
	Color.BLUE, 
	Color.TEAL, 
	Color.WEB_GREEN, 
	Color.YELLOW_GREEN, 
	Color.YELLOW, 
	Color.ORANGE, 
	Color.RED, 
	])

var greyscale = PackedColorArray([
	Color.BLACK, 
	Color.DIM_GRAY, 
	Color.WEB_GRAY, 
	Color.DARK_GRAY, 
	Color.GRAY, 
	Color.SILVER, 
	Color.LIGHT_GRAY, 
	Color.GAINSBORO,
	Color.WHITE_SMOKE,
	Color.WHITE, 
	])

var current_color_map

var color_segment_array = [
	$CardiacBullseye/OneArea/OneColor, 
	$CardiacBullseye/TwoArea/TwoColor, 
	$CardiacBullseye/ThreeArea/ThreeColor, 
	$CardiacBullseye/FourArea/FourColor, 
	$CardiacBullseye/FiveArea/FiveColor, 
	$CardiacBullseye/SixArea/SixColor, 
	$CardiacBullseye/SevenArea/SevenColor, 
	$CardiacBullseye/EightArea/EightColor, 
	$CardiacBullseye/NineArea/NineColor, 
	$CardiacBullseye/TenArea/TenColor, 
	$CardiacBullseye/ElevenArea/ElevenColor, 
	$CardiacBullseye/TweleveArea/TwelveColor, 
	$CardiacBullseye/ThirteenArea/ThirteenColor, 
	$CardiacBullseye/FourteenArea/FourteenColor, 
	$CardiacBullseye/FifteenArea/FifteenColor, 
	$CardiacBullseye/SixteenArea/SixteenColor, 
	$CardiacBullseye/SeventeenArea/SeventeenColor, 
]

var slider_segment_array = [
	$"17SliderSetup/SliderContainer/VSlider1", 
	$"17SliderSetup/SliderContainer/VSlider2", 
	$"17SliderSetup/SliderContainer/VSlider3", 
	$"17SliderSetup/SliderContainer/VSlider4", 
	$"17SliderSetup/SliderContainer/VSlider5", 
	$"17SliderSetup/SliderContainer/VSlider6", 
	$"17SliderSetup/SliderContainer/VSlider7", 
	$"17SliderSetup/SliderContainer/VSlider8", 
	$"17SliderSetup/SliderContainer/VSlider9", 
	$"17SliderSetup/SliderContainer/VSlider10", 
	$"17SliderSetup/SliderContainer/VSlider11", 
	$"17SliderSetup/SliderContainer/VSlider12", 
	$"17SliderSetup/SliderContainer/VSlider13", 
	$"17SliderSetup/SliderContainer/VSlider14", 
	$"17SliderSetup/SliderContainer/VSlider15", 
	$"17SliderSetup/SliderContainer/VSlider16", 
	$"17SliderSetup/SliderContainer/VSlider17", 
]


func color_refresh() ->void:
	for number in range(16):
		var current_slider = slider_segment_array[number].step
		color_segment_array[number].set("color", current_color_map[current_slider])

# Set all bullseye colors to white at default
func _ready() -> void:
	get_tree().call_group("all_bullseye", "set_color", Color.WHITE)
	current_color_map = heat_map
	$ColorPanel/HeatMap.button_pressed = true

func _on_heat_map_pressed() -> void:
	current_color_map = heat_map
	color_refresh()

func _on_greyscale_pressed() -> void:
	current_color_map = greyscale
	color_refresh()

# Set up value signal, set to update all colors whenever one is changed
func _on_lad_slider_value_changed(ladcolor) -> void:
	get_tree().call_group("lad_bullseye", "set_color", current_color_map[ladcolor])

func _on_rca_slider_value_changed(rcacolor) -> void:
	get_tree().call_group("rca_bullseye", "set_color", current_color_map[rcacolor])

func _on_lcx_slider_value_changed(lcxcolor) -> void:
	get_tree().call_group("lcx_bullseye", "set_color", current_color_map[lcxcolor])

func _on_v_slider_1_value_changed(one_color) -> void:
	$"CardiacBullseye/OneArea/OneColor".set("color", current_color_map[one_color])

func _on_v_slider_2_value_changed(two_color) -> void:
	$"CardiacBullseye/TwoArea/TwoColor".set("color", current_color_map[two_color])

func _on_v_slider_3_value_changed(three_color) -> void:
	$"CardiacBullseye/ThreeArea/ThreeColor".set("color", current_color_map[three_color])

func _on_v_slider_4_value_changed(four_color) -> void:
	$"CardiacBullseye/FourArea/FourColor".set("color", current_color_map[four_color])

func _on_v_slider_5_value_changed(five_color) -> void:
	$"CardiacBullseye/FiveArea/FiveColor".set("color", current_color_map[five_color])

func _on_v_slider_6_value_changed(six_color) -> void:
	$"CardiacBullseye/SixArea/SixColor".set("color", current_color_map[six_color])

func _on_v_slider_7_value_changed(seven_color) -> void:
	$"CardiacBullseye/SevenArea/SevenColor".set("color", current_color_map[seven_color])

func _on_v_slider_8_value_changed(eight_color) -> void:
	$"CardiacBullseye/EightArea/EightColor".set("color", current_color_map[eight_color])

func _on_v_slider_9_value_changed(nine_color) -> void:
	$"CardiacBullseye/NineArea/NineColor".set("color", current_color_map[nine_color])

func _on_v_slider_10_value_changed(ten_color) -> void:
	$"CardiacBullseye/TenArea/TenColor".set("color", current_color_map[ten_color])

func _on_v_slider_11_value_changed(eleven_color) -> void:
	$"CardiacBullseye/ElevenArea/ElevenColor".set("color", current_color_map[eleven_color])

func _on_v_slider_12_value_changed(twelve_color) -> void:
	$"CardiacBullseye/TweleveArea/TwelveColor".set("color", current_color_map[twelve_color])

func _on_v_slider_13_value_changed(thirteen_color) -> void:
	$"CardiacBullseye/ThirteenArea/ThirteenColor".set("color", current_color_map[thirteen_color])

func _on_v_slider_14_value_changed(fourteen_color) -> void:
	$"CardiacBullseye/FourteenArea/FourteenColor".set("color", current_color_map[fourteen_color])

func _on_v_slider_15_value_changed(fifteen_color) -> void:
	$"CardiacBullseye/FifteenArea/FifteenColor".set("color", current_color_map[fifteen_color])

func _on_v_slider_16_value_changed(sixteen_color) -> void:
	$"CardiacBullseye/SixteenArea/SixteenColor".set("color", current_color_map[sixteen_color])

func _on_v_slider_17_value_changed(seventeen_color) -> void:
	$"CardiacBullseye/SeventeenArea/SeventeenColor".set("color", current_color_map[seventeen_color])
