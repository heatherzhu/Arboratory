extends Area2D

onready var Water = get_tree().get_root().find_node("water", true, false)
onready var Seed = get_tree().get_root().find_node("aSeeds", true, false) #Declares variables as instances of Nodes in the Scene
var seeded = false;
var planted = 0
signal seeded

#Sets all the connected nodes up

func _ready():
	Water.connect("watered",self,"grow") #Tells Godot that these nodes will emit a certain signal and to run a function when it does
	Seed.connect("planted",self,"planted")

"""
When the seed is overlaps with the pot it will emit a planted signal activating the planted function over here.
The signal is also emitted when the seed leaves the pot.
The function itself will switch the local variable seeded to true and false based on how many times the function has been called
The print line Planted Function was run is for debugging
"""

func planted():
	print("Planted Function was Run")
	if planted % 2 == 0:
		seeded = true
	else:
		seeded = false
	print(seeded)
	planted += 1



"""
When the water overlaps with the pot it will emit a signal "watered" which activates the grow function.
The function itself will emit a signal "seeded" that will be used in a different script.
The print line we made it this far is just for debugging.
"""

func grow():
	print("Grow Function was Run")
	if seeded:
		emit_signal("seeded")
		print("We made it this far")




func _on_Pot_area_shape_entered(area_id, area, area_shape, self_shape):
	var areaName = area.get_name()
	if area.is_in_group("seedGroup"):
		print("It is in Seed Group")
	pass # Replace with function body.
