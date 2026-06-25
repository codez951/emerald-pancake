extends GenericCharacter


func _ready() -> void:
	current_form = "triangle"
	super._ready()


func setup(previous: GenericCharacter) -> void:
	super.setup(previous)
	
	hp = 500
	atk = 200
