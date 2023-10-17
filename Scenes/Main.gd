extends Node

var score : int = 0 # Number of chunks completed without dying
var coins_collected : int = 0 # Number of coins collected during the game

func coin_collected() -> void:
	coins_collected += 1
