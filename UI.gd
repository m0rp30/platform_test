extends CanvasLayer

onready var progress_life : ProgressBar = $HBoxContainerLeft/VBoxLife/ProgressBar as ProgressBar
onready var tween_life : Tween = $HBoxContainerLeft/VBoxLife/ProgressBar/Tween as Tween
onready var label_coin : Label = $HBoxContainerLeft/HBoxCoin/Label as Label


func _ready():
	progress_life.value = 10


func _on_Player_update_life(life : int) -> void:
	if life == -1:
		tween_life.interpolate_property(progress_life, "value", progress_life.value, 0, 0, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	else:
		tween_life.interpolate_property(progress_life, "value", progress_life.value, life, .25, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween_life.start()


func _on_Player_update_coin():
	label_coin.text = str(int(label_coin.text)+1)
	if int(label_coin.text)>0:
		label_coin.visible = true
		$HBoxContainerLeft/HBoxCoin/TextureRect.visible = true
