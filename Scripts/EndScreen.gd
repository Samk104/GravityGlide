class_name EndScreen
extends Control
## End Screen of each level
## 
## Should be instantiated over each level after completion.
## 'setUp()' should be called right after instantiation.

var nextLevel : String = "res://Scenes/main_menu.tscn"

func setUp(time : float, levelIndex : int, newNextLevel : String):
	## Sets up the content of the end screen.
	## time (float): The elapsed time in seconds.
	## levelIndex (int): The predetermined zero-based index of the level.
	
	nextLevel = newNextLevel
	
	var ParTimes = Global.new().ParTimes
	#Set stars, starPar
	for i in range(3):
		var starText = $Panel/VBoxContainer/Stars.get_child(i).get_child(1)
		starText.text = formatTime(ParTimes[levelIndex][i])
		if (time > ParTimes[levelIndex][i]):
			starText.modulate = Color(0.25, 0.25, 0.25)
	
	#Set time
	$Panel/VBoxContainer/Time.text = "Time Taken: %s" % formatTime(time)
	
	#Inform Master Leaderboard, create short leaderboard
	var leaderboardScene = Leaderboard.new()#preload("res://Scenes/Leaderboard.tscn").instantiate()
	var leaderboardTimes = leaderboardScene.appendNewTime(time, levelIndex)
	
	var board = $Panel/VBoxContainer/ScrollContainer/Leaderboard/ExampleBoard
	var didHighlight = false
	for lbT in leaderboardTimes:
		var newBoard = board.duplicate()
		newBoard.find_child("TimeLabel", true, false).text = formatTime(lbT)
		newBoard.find_child("StarLabel", true, false).text = str(getStarCount(lbT, levelIndex))
		if (lbT == time and not didHighlight):#Highlight current time
			didHighlight = true
			var style = newBoard.get_theme_stylebox("panel").duplicate()
			style.bg_color = Color.GOLDENROD
			newBoard.add_theme_stylebox_override("panel", style)
		$Panel/VBoxContainer/ScrollContainer/Leaderboard.add_child(newBoard)
	board.queue_free()


func formatTime(seconds : float):
	return "%2d:%02d.%02d" % [seconds / 60, fmod(seconds, 60), fmod(seconds * 100, 100)]


func getStarCount(time : float, levelIndex : int):
	## Gets the number of stars earned from the given time.
	## time (float): time in seconds
	
	var ParTimes = Global.new().ParTimes
	for i in range(len(ParTimes[levelIndex])-1, -1, -1):
		if time <= ParTimes[levelIndex][i]:
			return i+1
	return 0


var levelToLoad := ""
func loadLevel(level : String):
	$Panel.visible = false
	levelToLoad = level
	var LS = preload("res://Scenes/loading_scene.tscn").instantiate()
	add_child(LS)
	var timer := Timer.new()
	add_child(timer)
	timer.timeout.connect(actuallyLoadLevel)
	timer.start(0.2)
func actuallyLoadLevel():
	get_tree().change_scene_to_file(levelToLoad)


func continueButton():
	loadLevel(nextLevel)
	#get_tree().change_scene_to_file(nextLevel)

func quitButton():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

