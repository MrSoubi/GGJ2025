extends Node

@onready var sfx_win: AudioStreamPlayer = $SFX_Win
@onready var ambient_bells: AudioStreamPlayer = $AmbientBells
@onready var mystical_soundscape: AudioStreamPlayer = $MysticalSoundscape
@onready var animation_player: AnimationPlayer = $AnimationPlayer

const RSE_ENTERED_MAIN_MENU = preload("res://Data/RSE_EnteredMainMenu.tres")
const RSE_GAME_STARTED = preload("res://Data/RSE_GameStarted.tres")
const RSE_GAME_PAUSED = preload("res://Data/RSE_GamePaused.tres")
const RSE_GAME_UNPAUSED = preload("res://Data/RSE_GameUnpaused.tres")
const RSE_GOAL_REACHED = preload("res://Data/RSE_GoalReached.tres")

var audio_effect : AudioEffectLowPassFilter
var base_cutoff_hz : float

func _ready() -> void:
	RSE_ENTERED_MAIN_MENU.triggered.connect(transition_to_menu)
	RSE_GAME_STARTED.triggered.connect(transition_to_game)
	RSE_GAME_PAUSED.triggered.connect(enable_low_pass)
	RSE_GAME_UNPAUSED.triggered.connect(disable_low_pass)
	RSE_GOAL_REACHED.triggered.connect(play_win_sfx)
	
	ambient_bells.play()
	ambient_bells.volume_db = 0
	mystical_soundscape.volume_db = -80
	
	audio_effect = AudioEffectLowPassFilter.new()
	AudioServer.add_bus_effect(0,audio_effect,0)
	
	base_cutoff_hz = audio_effect.cutoff_hz

func play_win_sfx():
	sfx_win.play()

func transition_to_menu():
	if ambient_bells.playing: return
	
	animation_player.play("to_main_menu")

func transition_to_game():
	if mystical_soundscape.playing: return
	
	animation_player.play("to_game")

func enable_low_pass():
	var tween := create_tween()
	tween.tween_property(audio_effect,"cutoff_hz",200,0.5)

func disable_low_pass():
	var tween := create_tween()
	tween.tween_property(audio_effect,"cutoff_hz",base_cutoff_hz,0.5)
