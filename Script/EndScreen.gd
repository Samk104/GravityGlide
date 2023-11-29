class_name EndScreen
extends Control
## End Screen of each level
## 
## Should be instantiated over each level after completion.
## 'setUp()' should be called right after instantiation.


func setUp(time : float, levelIndex : int):
	## Sets up the content of the end screen.
	## time (float): The elapsed time in seconds.
	## levelIndex (int): The predetermined zero-based index of the level.
	
	var ParTimes = Global.new().ParTimes
	#Set stars, starPar
	for i in range(3):
		$Panel/VBoxContainer/StarTimes.get_child(i).text = formatTime(ParTimes[levelIndex][i])
		if (time > ParTimes[levelIndex][i]):
			$Panel/VBoxContainer/Stars.get_child(i).modulate = Color(0.25, 0.25, 0.25)
	
	#Set time
	$Panel/VBoxContainer/Time.text = "Time Taken: %s" % formatTime(time)
	
	#Inform Master Leaderboard, create short leaderboard
	var leaderboardScene = preload("res://Scenes/Leaderboard.tscn").instantiate()
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


func continueButton():
	#TODO: Change logic to point to next level/main menu
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")


func quitButton():
	#TODO: CHange logic to point to levelselect
	get_tree().change_scene_to_file("res://Scenes/Leaderboard.tscn")

