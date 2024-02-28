extends Node2D

var current_level_index : int = 0
var current_level : Level

func start_level() -> void:
	if LevelLists.levels.size() - 1 < current_level_index:
		push_error("Level index " + str(current_level_index) + " does not exist")
		return
	
	%MainMenu.visible = false
	%DeathScreen.visible = false
	%LevelSelect.visible = false
	%Background.set_process(false)
	
	current_level = LevelLists.levels[current_level_index].scene.instantiate()
	add_child(current_level)
	current_level.level_ended.connect(go_to_death_screen.bind())
	

func go_to_death_screen() -> void:
	%MainMenu.visible = false
	%DeathScreen.visible = true
	%LevelSelect.visible = false
	%Background.set_process(true)
	
	if current_level:
		current_level.queue_free()
		
	

func go_to_main_menu() -> void:
	%MainMenu.visible = true
	%DeathScreen.visible = false
	%LevelSelect.visible = false
	%Credits.visible = false
	%Background.set_process(true)
	

func go_to_level_select() -> void:
	%MainMenu.visible = false
	%DeathScreen.visible = false
	%LevelSelect.visible = true
	%Background.set_process(true)
	

func go_to_credits() -> void:
	%MainMenu.visible = false
	%DeathScreen.visible = false
	%LevelSelect.visible = false
	%Credits.visible = true
	%Background.set_process(false)
	
	

func restart_level() -> void:
	start_level()
	

func start_next_level() -> void:
	current_level_index += 1
	if LevelLists.levels.size() - 1 < current_level_index:
		current_level_index = 0
		
	
	start_level()
	

func select_and_start_level(index : int) -> void:
	current_level_index = index
	start_level()
	
