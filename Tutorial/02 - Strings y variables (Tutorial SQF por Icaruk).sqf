
// Os habréis fijado que siempre dejo la línea 1 vacía, cada uno tiene sus manías
// me parece más limpio visualmente que el código no esté pegado arriba del todo
// Link megaútil que nunca os vais a aprender https://community.bistudio.com/wiki/Category:Scripting_Commands_Arma_3
// Ahí podréis buscar comandos como "sleep" y "spawn" que usaremos en este capítulo, por si queréis más información o ejemplos.


// En el anterior capítulo nos quedamos en... Y a ver quién me puede decir porqué no sale el primero (empezamos flojo xD) mientras pienso el segundo capítulo.

hint "primero"; hint "segundo"

// es lo mismo (pero menos ordenado) que

hint "primero"; 
hint "segundo";

// En la consola no hace falta cerrar con ; en el resto de cosas sí, de todas formas salta error de "missing ;" os dará mucho por culo ya que al principio se suele olvidar.
// Cuando ejecuto algo, el arma lo lee todo del tirón,  a no ser que le diga lo contrario, por eso nunca voy a poder leer "primero"

hint "primero";
sleep 3;	// esto sirve para que se espere 3 segundos
hint "segundo";

// si ejecutamos desde la consola da error, porque la consola es un "non-scheduled environment" (entorno no programado)
// es decir, no puede leer pausas, dará error y ejecutará el código pero nunca esperará

/*
NSE (non-scheduled environment)
	consola
	call (ya lo veremos)

SE (scheduled environment)
	execVM (ya lo veremos)
	spawn (ahora lo vemos, pero más tarde con más detalle)
*/

// seguimos ejecutando en la consola

[] spawn { // el spawn necesita mínimo un argumento entre [] que veremos más tarde, de momento se deja vacío y au
	hint "primero";
	sleep 3;
	hint "segundo";
};

// no, la consola no admite comentarios y os dará error, así que escribidlo a mano así le vais pillando el rollo, después dejaremos de ejecutar en consola.
// Con esto sí que nos funciona el sleep, lo malo de los SE es que són más lentos que los NSE, pero bueno, de optimización ya hablaremos, ahora funciona y vas que chutas.

// Ahora en una de las 4 líneas de abajo, donde pone watch (yo lo llamo monitor), escribís

1+1

// os devuelve 2
// En la siguiente línea escribís

2+2

// en la línea negra de debajo, os devuelve un 4
// Todo lo que metáis en estas líneas lo va a estar ejecutando a cada frame, después lo comprobaremos.
// Ya sabemos sumar números, ahora sumamos strings en cualquiera de las líneas

"Ho" + "la"

// Os devuelve "Hola"

"Ho" + 123

// Error generic error in expression
// traducido: eso que intentas hacer, no se puede
// no puedes sumar un string a un número, igual que no puedes mezclar agua con aceite.


/*
nuevo comando: format
	sirve para componer strings
	convierte cualquier variable en string

ahora trasteamos con este comando para entender qué hace, ponemos las líneas una a una en monitor para ver qué nos devuelve cada una
*/

format ["string"]
format ["string %1", "primero"]
format ["string %1 y %2", "primero", "segundo"]
format ["string %1 y %2 y %3", "primero", "segundo", "tercero"]
format ["%1%2", "Ho", "la"]
format ["%1%2", "12", "34"]
format ["%1%2", 12, 34]
format ["Soy %1", player] 

/*
player es una variable que representa a nuestro objeto, el tío que manejamos es un objeto
con el comando name
	name objeto
	
podemos sacar el nombre del objeto
*/

name player

// devolverá un string con nuestro nombre: "Icaruk" en mi caso

format ["Me llamo %1", name player] 

/*
con el comando side
	side unit

podemos sacar el bando de la unidad
*/

side player

// devuelve WEST porque sois azules

/*
WEST azules
EAST rojos
GUER verdes
CIV civiles

esto tiene truco ya veréis porqué en otro capítulo xD
*/

// Variables, vamos con ellas...
// ejecutamos

var1 = "Ho"

// miramos var en monitor, y nos devuelve su valor, que es un string
// ejecutamos

var2 = "la"

// miramos monitor y pasa lo mismo, ahora vamos a formar un string con estas dos variables

format ["%1%2", var1, var2]

// dejamos esa línea en el monitor para poder monitorizarla
// y después ejecutamos...

var1 = "Pe"; var2 = "ne";

// automáticamente nos cambiará el string del format en nuestro monitor ya que se ejecuta a cada frame
// ejecutamos

var1 = 1; var2 = 2;

// monitor

var1 + var2 

// dará 3
// \n en el format sirve para hacer salto de línea
/*
lo podemos ver con el comando que ya hemos visto: hint
	hint string

	habíamos dicho que el format formaba un string, así que podemos juntar hint y format
*/	

// ejecutamos

hint format ["Linea 1\n Linea 2"]

// Vale pues, quiero el código y una screen en el foro que muestre un hint parecido a esto:

Hola me llamo <Tunombre>.
Soy del bando <Tubando>.
Mi variable1 vale <valor>,
Mi variable2 vale <valor>.

Y su suma es <suma>.


