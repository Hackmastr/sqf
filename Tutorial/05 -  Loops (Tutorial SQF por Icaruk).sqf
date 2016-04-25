
// Os ped�:

// Ahora quiero que partiendo de que mi variable es un array vac�o

var = [];

// met�is las siguientes cosas:
// vuestro nombre de jugador
// vuestro bando
// la salud de vuestro soldado (comando damage, pod�is buscar o probar directamente)
// la posici�n de vuestro soldad (comando getPos, pod�is buscar o probar directamente)

// y al final del todo, pong�is una screen de un hint que diga en la primera frase todo vuestro array
// y en la segunda frase cu�ntos elementos tiene

// soluci�n 1:

var pushBack (name player);
var pushBack (side player);
var pushBack (damage player);
var pushBack (getPos player);

hint format ["Mi array es %1\n Y tiene %2 elementos", var, count var];

// soluci�n 2:

var = var + [name player, side player, damage player, getPos player];

hint format ["Mi array es %1\n Y tiene %2 elementos", var, count var];

// posible error:

var pushBack [name player, side player, damage player, getPos player];

// prueba y ver�s

/*
con esto lo que haremos ser� a nuestro array
	[ [meterle otro array] ]
en lugar de inclu�r elementos dentro de �l

es decir, en realidad estamos haciendo esto:
*/

var = [[] + [name player, side player, damage player, getPos player]];

/*
nuevo comando: while
	while {condicion} do {cosas};
	
mientras {tengaDinero} hago {comprar};
while {tengaDinero} do {comprar}; 

atento, que aqu� la condici�n no va con () sino con {}
*/

// pero claro, el bucle va a estar activo hasta que la condici�n deje de cumplirse o hasta que le digamos que se salga.
// Un bucle infinito que petar�a el arma (puedes probar voluntariamente, te la podr�a haber jugado, pero soy bueno) ser�a:
	while {true} do {hint "boom"};
	
// mientras la verdad sea verdad, es decir siempre, muestro un hint aparecer�.
// Nuestro amigo sleep nos ayudar�

	while {true} do {
		hint "hola";
		sleep 5;
	};

// �te acuerdas de que en la consola no pod�a leer pausas porque era NSE (non-scheduled environment)?
// hab�a que usar un spawn (SE), pues easy, lo metemos todo dentro de un spawn

0 spawn {
	while {true} do {
		hint "hola";
		sleep 5;
	};
};

/*
el spawn siempre necesita un argumento, aunque el argumento sea nada (nil), pero ese nada ya es algo para �l
puede ir as�:
	"" spawn {};
	0 spawn {};
	[] spawn {};
 
 el del 0 es el m�s r�pido de escribir, por eso lo uso
 */
 
// entonces podemos hacer un temporizador tal que as�:
// (hasta que no quitemos el men� de pausa, todo estar� congelado)

0 spawn {
	tiempo = 5;
	
	while {tiempo > 0} do {
		tiempo = tiempo - 1;
		hint format ["Tiempo: %1", tiempo];
		sleep 1;
	};
	
	hint "El tiempo se ha acabado";
};
	
// podemos observar que hasta que no salga del while, no sigue leyendo, se queda ah� atrapado dando vueltas

/*
nuevo comando: for 
	for "_variable" from numero to numero do {cosas};
	
para "_vueltas" desde 0 hasta 9 haz {puesDiezVueltasxD};
for "_vueltas" from 0 to 9 do {puesDiezVueltasxD};
*/

// con esto podemos hacer el temporizador de otra forma

0 spawn {
	tiempo = 5;
	
	for "_vueltas" from 0 to 4 do {
		tiempo = tiempo - 1;
		hint format ["Tiempo: %1", tiempo];
		sleep 1;
	};
};

/*
�Anda! _variable
si tiene _ delante, significa que s�lo estar� disponible dentro de ese mismo scope
es decir, "_vueltas" s�lo existir�a dentro de los {} del for, fuera de ah� no existir�a
pero esto lo explicaremos a fondo m�s tarde
*/

// ahora podemos hacer que ocurran cosas cuando queramos

0 spawn {
	tiempo = 10;
	
	while {true} do {
		tiempo = tiempo - 1;
		hint format ["Tiempo: %1", tiempo];
		
		sleep 1;	
	};
	
	if (tiempo <= 1) then {
		tiempo = 10;
		hint "El tiempo no baja de 1";
	};	
};

// Eh, eh , eh, �el tiempo se me pone en negativo!
// Primero, sal de la misi�n y entra, para salir del loop

/*
comando nuevo: exitWith
	if (condicion) exitWith {mevoy};
	sirve para salir del scope actual
	
if (noTengoDinero) exitWith {noEntroEnLaDiscoteca};
*/

// vamos a probar lo siguiente para enterlo mejor:


0 spawn {
	tiempo = 10;
	
	if (tiempo == 10) exitWith {
		hint "Pues me voy del spawn, y no leo nada m�s";
	};
	
	while {true} do {
		tiempo = tiempo - 1;
		hint format ["Tiempo: %1", tiempo];
		
		sleep 1;	
	};
	
	if (tiempo <= 1) then {
		tiempo = 10;
		hint "El tiempo no baja de 1";
	};	
};

// la l�nea 169 est� dentro de los {} del spawn, es su scope (los scopes los estamos marcando con tabulaciones)
// y al hacer exitWith saldr�a de ah�, intentando leer la 184, en la cual acaba el spawn

// ahora entenderemos mejor qu� es el scope

0 spawn {
	tiempo = 10;
	
	if (tiempo == 10) then {
		if (tiempo == 10) exitWith {
			hint "Pues me voy del if, y sigo leyendo abajo";
			sleep 3;
		};
	};
	
	while {true} do {
		if (tiempo <= 1) exitWith {
			hint "Salgo del loop";
			sleep 3;
		};
		
		tiempo = tiempo - 1;
		hint format ["Tiempo: %1", tiempo];
		
		sleep 1;	
		
		if (tiempo <= 1) then {
			tiempo = 10;
			hint "El tiempo no ha bajado de 1";
			sleep 2;
		};	
	};
};

// ah�, el exitWith s�lo se estar�a saliendo del scope de los {} del if que tiene en 194.

// vale ahora quiero el c�digo en spoiler de un temporizador
// que muestre minutos y segundos (usando hint format), da igual c�mo, 1:15 o 1m15s o en varias l�neas.
// pero que tenga 1 minuto y 10 segundos y que cuando llegue a 0 ejecute la siguiente l�nea

titleText ["La luz se apaga", "BLACK", 5];


