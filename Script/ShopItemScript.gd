extends PanelContainer

@export var itemIndex : int = 0
@export var starPrice : int = 8
var leaderboard = Leaderboard.new()

func _ready():
	#Set star count (min(count, reqirement), star requirement
	var count = min(leaderboard.getStarCount(), starPrice)
	$VBoxContainer/Pricetag/StarPrice.text = "%d/%d" % [count, starPrice]
	
	#Set text color
	if (starPrice > count):
		$VBoxContainer/Pricetag/StarPrice.add_theme_color_override("font_color", Color.DARK_RED)
	
	#Set if button is disabled from cost or purchase
	var purchased = false
	$VBoxContainer/ItemButton.disabled = starPrice > count or purchased
	$VBoxContainer/ItemButton.text = "Equipped" if purchased else "Equip"

func onEquip():
	var global = Global.new()
	if (global.Items[itemIndex]):
		return
	
	global.Items[itemIndex] = true
	leaderboard.saveAsJSON(global.Items, global.ItemPath)
	$VBoxContainer/ItemButton.disabled = true
	$VBoxContainer/ItemButton.text = "Equipped"
