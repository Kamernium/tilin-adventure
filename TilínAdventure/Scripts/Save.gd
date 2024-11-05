extends Node
#este código puede ser usado como autoload en mis proyectos


var ValoresGuardados = { #En este diccionario, puedo meter los datos que quiera guardar(También puedo crear cualquier variable de otro tipo, como un array, int, String, etc)
	"score" : 0,
	"highscore" : 0 
}

const SAVEFILE = "user://SAVEFILE.save"


func _ready():
	load_data() #al abrir el juego, se intenta cargar el archivo creado en la constante anterior

func load_data():
	var file = FileAccess.open(SAVEFILE, FileAccess.READ) 
	if file == null:
		save_data() #si el archivo esta vacío, se guarda la partida
	else:
		ValoresGuardados.vida = file.get_var()
	file = null

func save_data():
	var file = FileAccess.open(SAVEFILE, FileAccess.WRITE)
	file.store_var(ValoresGuardados)
	file = null
	
#cada vez que quiera guardar, debo escribir save.save_data
#cuando quiera guardar una variable de otro script, puedo hacer por ejemplo: VidaJugador = Save.ValoresGuardados["vida"]
