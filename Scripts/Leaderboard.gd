class_name Leaderboard
extends Control
## Handles the leaderboard screen and logic.
## Provides access to saving and loading helper functions.

var global = Global.new()


func _ready():
	## Builds the leaderboard GUI
	var data = loadAsJSON(global.LeaderboardPath, [[], [], [], [], [], [], [], []])
	var tabContainer = $TabContainer
	for i in range(0, len(data)):
		var tab = tabContainer.get_child(i).get_child(0).get_child(0)
		for d in data[i]:
			var label = Label.new()
			label.text = str(d)
			tab.add_child(label)


func appendNewTime(time : float, levelIndex : int) -> Array:
	## Appends a new time to the leaderboard for the specified level.
	## time (float): THe time to append.
	## levelIndex (int): The index for the level.
	
	#Load times
	var path = global.LeaderboardPath
	var leaderboardTimes = loadAsJSON(path, [[], [], [], [], [], [], [], []])
	#append to correct spot
	var index = leaderboardTimes[levelIndex].bsearch(time)
	leaderboardTimes[levelIndex].insert(index, time)
	#save times
	saveAsJSON(leaderboardTimes, path)
	getStarCount()
	#return times for short leaderboard
	#Top 3, 2 above time, time, below time
	var slbIndexes = [0, 1, 2, index-2, index-1, index, index+1]
	var seen = []
	var slbTimes = []
	for i in slbIndexes:#remove out of bounds/duplicates
		print(str(i) + str(seen))
		if (0 <= i and i < len(leaderboardTimes[levelIndex]) and i not in seen):
			slbTimes.append(leaderboardTimes[levelIndex][i])
			seen.append(i)
	return slbTimes


func getStarCount() -> int:
	var starCount = 0
	var data = loadAsJSON(global.LeaderboardPath, [[], [], [], [], [], [], [], [], [], [], ])
	var parTimes = global.ParTimes
	for i in range(len(data)):#For each level, get top score
		var pars = parTimes[i]
		if (len(data[i]) > 0):#If Top time exists... add the stars to the total
			for j in range(len(pars)-1, -1, -1):#For each star...
				if (data[i][0] <= pars[j]):
					starCount += j + 1#If the 3rd star is earned, just add 3 stars
					break
	return starCount


func saveAsJSON(data : Array, path : String):
	## Save an array using JSON to the path specified
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	file.close()


func loadAsJSON(path : String, default : Array) -> Array:
	## Load an array using JSON, from the path specified
	## 'default' specifies the default value, usually when loading for the first time
	if FileAccess.file_exists(path):
		var file = FileAccess.open(path, FileAccess.READ)
		var data = JSON.new()
		data.parse(file.get_as_text())
		file.close()
		return data.data
	else:
		return default


func BackButton():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
