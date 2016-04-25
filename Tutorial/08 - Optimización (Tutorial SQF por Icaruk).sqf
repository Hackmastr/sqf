
// os ped�:

/*
No s� si este escal�n ser� demasiado, pero ahora quiero el c�digo en spoiler o un pastebin de lo siguiente:

Una tienda como la que hemos hecho, pero que en lugar de s�lo comprar y vender pl�tanos, tenga m�nimo 6 �tems.
Hay que usar arrays para sacar los precios de los items, por ejemplo:
	[item, precio, item, precio]
	[[item, precio], [item, precio]]

Que cuando compres o vendas te diga alg�n mensaje como:
	Gracias por <comprar o vender> <item>, te ha costado <precio>

*/

// posible soluci�n (mejorable ahora despu�s)

// variables:

platano = 1;
manzana = 0;
pera = 0;
kiwi = 0;
agua = 0;
droga = 0;

dinero = 1000;

// tienda.sqf:

_param = _this select 0;
_que = _this select 1;

_tienda = [["platano", 100], ["manzana", 100], ["pera", 100], ["kiwi", 100], ["agua", 200], ["droga", 1000]];
_precio = 0;

for "_idx" from 0 to (count _tienda)-1 do { // _idx va a ir subiendo de 0 hasta (6-1)
	if ((_tienda select _idx select 0) == _que) exitWith {
		_precio = _tienda select _idx select 1;
	};
};

if (_param) then {
	if (dinero < _precio) exitWith {hint "No tienes suficiente dinero"};
	
	dinero = dinero - _precio;
	
	switch (_que) do {
		case "platano": {platano = platano + 1};
		case "manzana": {manzana = manzana + 1};
		case "pera": {pera = pera + 1};
		case "kiwi": {kiwi = kiwi + 1};
		case "agua": {agua = agua + 1};
		case "droga": {droga = droga + 1};
	};	
	
	hint format ["Gracias por comprar %1 por %2�", _que, _precio];
} else {
	if (
		((_que == "platano") AND (platano <= 0)) OR
		((_que == "manzana") AND (manzana <= 0)) OR
		((_que == "pera") AND (pera <= 0)) OR
		((_que == "kiwi") AND (kiwi <= 0)) OR
		((_que == "agua") AND (agua <= 0)) OR
		((_que == "droga") AND (droga <= 0))
	) exitWith {hint "No puedes vender algo que no tienes"};

	dinero = dinero + _precio;
	
	switch (_que) do {
		case "platano": {platano = platano - 1};
		case "manzana": {manzana = manzana - 1};
		case "pera": {pera = pera - 1};
		case "kiwi": {kiwi = kiwi - 1};
		case "agua": {agua = agua - 1};
		case "droga": {droga = droga - 1};
	};
	
	hint format ["Gracias por vender %1 por %2�", _que, _precio];
};

// ejecuto con:
[true, "platano"] execVM "tienda.sqf";

// compruebo mis variables mirando este array
[dinero, platano, manzana, pera, kiwi, agua, droga]

// -----------------------------------------------------------
// _tabla lo podr�a hacer de otra forma:

/*
nuevo comando: find
	array find elemento
	string find elemento
	
["a", "b", "c"] find "b" // devuelve 1
"hola" find "o" // devuelve 1
*/

_tienda = ["platano", 100, "manzana", 100, "pera", 100, "kiwi", 100, "agua", 200, "droga", 1000];
_precio = 0;

_idx = _tienda find _que;
_precio = _tienda select (_idx + 1);

// el problema de esto es que si queremos ampliar el array con elementos, por ejemplo:
// que los precios de compra y venta sean diferentes

_tienda = ["platano", 100, 50, "pera", 100, 50, ... ]

// tendr�a que poner el nuevo elemento para toooodas las cosas de la tienda, con el sistema que he utilizado arriba:

_tienda = [["platano", 100, 50], ["pera", 100] ... ]

// puedo decir, por ejemplo: si pera no tiene 3 elementos, es que no se puede vender
// pero vamos, hay  mil millones de formas de hacer esto.

// Para hablar de la optimizaci�n del c�digo, vamos a comentar unas cuantas cosas, muy �tiles:

/*
Sin optimizar:

	if (dinero >= 0) then {
		deboDinero = false;
	} else {
		deboDinero = true;
	};

Optimizado

	deboDinero = if (dinero >=) then {false} else {true};

Da igual ponerlo en varias l�neas, pero como as� se queda tan corto y es f�cil de leer, mejor en una

Esto pasa lo mismo con switch:

	estado = switch (dinero) do {
		case 0: {"pobre"};
		case 3000: {"normal"};
		case 10000: {"rico"};
		case 999999: {"millonario"};
	};

*/

/*
nuevo comando: getVariable / setVariable
	namespace getVariable "variable"
	namespace setVariable ["variable", valor, public];

missionNamespace ser� la "caja" que contiene todas las variables que hemos estado usando hasta ahora (s�lo las que no tienen _)
lo de public por defecto est� en false, pero si queremos que la variable sea p�blicae es decir, que todos los ordenadores
la sepan, ser�a lo mismo que hacer << publicVariable "variable" >> pero bueno, ya iremos viendo eso xD

entonces, preguntar en monitor:
	missionNamespace getVariable "dinero";
	
ser� lo mismo que preguntar por:
	dinero
	

De igual forma que:
	missionNamespace setVariable ["dinero", 100];

ser� l mismo que:
	dinero = 100;
	
	
La ventaja de usar setVariable y getVariable es que podemos formar la variable mediante format:

	_prefijo = "din";
	_sufijo = "ero";

	missionNamespace getVariable (format ["%1%2", _prefijo, _sufijo]);
	
Ahora cambiamos _sufijo por lo que queramos y podemos preguntar infinitas variables, en una l�nea.	
*/

// Ahora vamos a optimizar la tienda que he puesto antes:


// tienda.sqf:

_param = _this select 0;
_que = _this select 1;

_tienda = [["platano", 100], ["manzana", 100], ["pera", 100], ["kiwi", 100], ["agua", 200], ["droga", 1000]];

_precio = for "_idx" from 0 to (count _tienda)-1 do { // _idx va a ir subiendo de 0 hasta (6-1)
	if ((_tienda select _idx select 0) == _que) exitWith {
		_tienda select _idx select 1;
	};
};

if (_param) then {
	if (dinero < _precio) exitWith {hint "No tienes suficiente dinero"};
	
	dinero = dinero - _precio;
	missionNamespace setVariable [_que, (missionNamespace getVariable _que) + 1];	
	
	hint format ["Gracias por comprar %1 por %2�", _que, _precio];
} else {
	
	if ((missionNamespace getVariable _que) <= 0) exitWith {hint "No puedes vender algo que no tienes"};

	dinero = dinero + _precio;
	missionNamespace setVariable [_que, (missionNamespace getVariable _que) - 1];	
	
	hint format ["Gracias por vender %1 por %2�", _que, _precio];
};


// Joder, ahora s� que es f�cil meter 10000000 elementos en la lista, porque ya no se depende
// del c�digo de la tienda, s�lo del array que contiene �tems, precios y dem�s par�metros.

// Se puede hacer m�s por optimizar, como por ejemplo hacer las preguntas indicadas en el momento indicado, 
// no vale de nada, por ejemplo, preguntar lo mismo 3 veces a lo largo del script, hay que buscar el sitio o la forma
// de poder hacer la pregunta s�lo una vez.

/*
Ahora quiero, el c�digo en spoiler o en pastebin de lo siguiente:

Una tienda como la que hemos hecho (puedes reutilizar el c�digo que te he puesto y cambiarlo o hacer algo diferente)... �pero!
que cada �tem de la tienda tenga los siguientes par�metros:
	item
	precio
	stock

Si no queda stock, no puedes comprar el �tem, y si t� vendes �tems, el stock sube.
El mensaje de cuando compras y vendes, te tiene que informat del stock actual del �tem que has comprado/vendido.

Es bastante complicado, yo me he tenido que comer un poco la cabeza, PERO AQU� VENIMOS A COMERNOS LA CABEZA.
*/



