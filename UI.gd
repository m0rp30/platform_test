extends CanvasLayer

onready var progress_life : ProgressBar = $HBoxContainer/VBoxContainer/ProgressBar as ProgressBar
onready var tween_life : Tween = $HBoxContainer/VBoxContainer/ProgressBar/Tween as Tween
onready var label_coin : Label = $HBoxContainer/HBoxContainer/Label as Label

func _ready():
	progress_life.value = 10

func _on_Player_update_life(life : int) -> void:
	if life == -1:
		tween_life.interpolate_property(progress_life, "value", progress_life.value, 0, 0, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	else:
		tween_life.interpolate_property(progress_life, "value", progress_life.value, life, .25, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween_life.start()

func _on_Player_update_coin():
	print("preso coin")
	label_coin.text = str(int(label_coin.text)+1)
	if int(label_coin.text)>0:
		label_coin.visible = true
		$HBoxContainer/HBoxContainer/TextureRect.visible = true
