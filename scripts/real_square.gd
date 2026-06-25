extends GenericCharacter


func _ready() -> void:
	current_form = "square"
	super._ready()


func setup(previous: GenericCharacter) -> void:
	super.setup(previous)
	
	hp = 1000
	atk = 100
