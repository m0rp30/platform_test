extends Sprite

var index = 0
var entries = []

func _ready():
	for node in get_parent().get_children():
		if node is Label && node.visible:
			entries.append(node)
	set_selected_entry(0)

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		move_up()
	if Input.is_action_just_pressed("ui_down"):
		move_down()
	
	if Input.is_action_just_pressed("ui_accept"):
		var selected_entry = entries[index]
		if selected_entry.modulate.a == 1:
			selected_entry.callback()
		else:
			#TODO Inserire suono selezione nullo
			pass

func set_selected_entry(new_index):
	if 0 <= new_index && new_index < len(entries):
		index = new_index
		var selected_entry = entries[index]
		
		position = Vector2(
			selected_entry.rect_position.x - (get_rect().size.x * scale.x) / 2 - 10,
			selected_entry.rect_position.y + selected_entry.rect_size.y / 2
		)
		return true
	else:
		print("ERROR set_selection(): invalid index")
		return false

func move_down():
	if set_selected_entry(index + 1):
		#TODO: Aggiungere suono 
		pass

func move_up():
	if set_selected_entry(index - 1):
		#TODO: Aggiungere suono 
		pass
