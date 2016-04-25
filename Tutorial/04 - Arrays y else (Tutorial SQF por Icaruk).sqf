
// La otra vez os ped� esto:

/*
Teniendo en cuenta que:
	num1 vale 10
	num2 vale 5

Quiero que me pong�is el c�digo de un hint que diga el nombre de mi jugador y mi bando, en dos l�neas diferentes...
�PERO!
que s�lo se ejecute si se cumplen todas estas condiciones:
	num1 es 10
	num2 es 5
	num1 y num2 no sean iguales
	num1 o num2 sean menores que 20
	
*/

// Pista: agrupar las condiciones por bloques, para que cada bloque formado por peque�os bloques parecidos den true o false

// Soluci�n 1, para que lo veas claramente

if (
	(num1 == 10) AND
	(num2 == 5) AND
	(num1 != num2) AND
	(
		(num1 < 20) OR
		(num2 < 20)
	)
) then {
	hint format ["Mi nombre es %1\nMi bando es %2", name player, side player];
};
	
	
// solucion 2, m�s comprimido

if (
	(num1 == 10) AND (num2 == 5) AND (num1 != num2) AND
	((num1 < 20) OR	(num2 < 20))
) then {
	hint format ["Mi nombre es %1\nMi bando es %2", name player, side player];
};

// soluci�n 3, lo que se suele hacer (por cierto, si hac�is click en un par�ntesis N++ os dice d�nde cierra)

if ((num1 == 10) AND (num2 == 5) AND (num1 != num2) AND ((num1 < 20) OR	(num2 < 20))) then {
	hint format ["Mi nombre es %1\nMi bando es %2", name player, side player];
};

// soluci�n 3 explicada http://i.imgur.com/Vxc6USE.png

/*
nuevo data type: ARRAY
	contiene elementos separados por comas y todos agrupados por []
	[elemento1, elemento2, elemento3]

puede contener cualquier data type
	[1, 2, 3, 4]
	["hola", "adios", "talue"]
	[true, false, true, false]

y mezclas de ellos
	[1, "uno", 2, "dos"]
	["paco", false, "antonio", true]
	
incluso puede contener otros arrays
	[[1, 2, 3], ["uno", "dos", "tres"]]
	
tambi�n puede estar vac�o
	[]
*/

// �como hago que una variable sea igual a un array?
// easy:

miArray = [1, "hola", true];

// si miro en monitor me devuelve [1, "hola", true]
// pero... �c�mo saco algo de ah�?
// pruebo en monitor las siguientes l�neas

miArray select 0
miArray select 1
miArray select 2
miArray select 3

// el �ltimo dar� error zero divisor, quiere decir que el �ndice que le hab�is dicho no existe
// se empieza a contar desde el 0, si mi array tiene 3 elementos, el m�ximo select que pueda hacer ser� un 2.
// entonces podr� hacer cosas como:

arr = [name player, side player];
hint format ["Mi nombre es %1 y mi bando %2", arr select 0, arr select 1];


// operando con arrays:
// SUMA de arrays:

arr1 = ["a", "b"];
arr2 = ["c", "d"];
arr3 = arr1 + arr2;

// tambi�n se puede hacer directamente
test = ["a", "b"] + ["c", "d"];

// miramos cu�nto vale arr3 y veremos que nos ha sumado los dos arrays
// RESTA de arrays:

arr3 = arr3 - arr2;

// decimos: arr3 es igual a:
// �l mismo menos arr2
// hay otra forma de hacerlo, pero primero vamos a decir que arr3 era lo de antes:

arr3 = arr1 + arr2;
arr3 = - arr2;

// es la misma operaci�n, pero m�s corto

/*
A�ADIR un elemento con pushBack
	array pushBack elemento
siempre se pondr� en el �ltimo lugar
*/

arr3 pushBack "hola";

// de momento deber�amos de tener ["a","b","hola"]

/*
CAMBIAR un elemento con set
	array set [indice, elemento]
*/

arr3 set [2, "adios"];

// nos devuelve ["a","b","adios"]
// porque en el �ndice 2 (es decir, el tercer elemento) decimos que lo cambie por "adios"
// tambi�n podr�amos haberlo cambiado por cualquier otro data type como 123 o true

/*
DARLE LA VUELTA al array con reverse
	reverse array
*/

reverse arr3;

// nos devuelve ["adios","b","a"]

reverse arr3;

// nos lo pone como antes ["a","b","adios"]

/*
nuevo comando: count
	count array
	count string
cuenta los elementos de lo que le digamos
*/
// miramos en monitor estas dos l�neas por separado:

count ["asd", "asd", "asd"];
count "asd";

// el primero devolver� 3, ya que hay 3 elementos
// el segundo devolver� 3, porque "asd" tiene 3 letras.
// Volvamos a las condiciones

if ((arr3 select 2) == "adios") then {
	hint "BIEN";
};

// si el tercer elemento de arr3 es igual a "adios", entonces BIEN
// ahora podremos hacer cosas como:

arr = [name player, 5];
if ((count (arr select 0)) > (arr select 1)) then {
	hint "Mi nombre tiene m�s de 5 letras";
} else {
	hint "Mi nombre 5 letras o menos";
};

/*
�anda! una cosa nueva, un else
traducido ser�a como: y si no...

	if (condicion) then {
		cosas;
	} else {
		otrasCosas;
	};


ejemplos:
	
si (tengoDinero) entonces {
	comproCosas;
ySiNo {
	puesMeJodo;
};

if (tengoDinero) entonces {
	comproCosas;
else {
	puesMeJodo;
};

si despu�s del else pongo ; estar�a mal, porque el punto y coma indica que se acaba la orden, y ah� no acaba
porque si no se cumple nuestra condici�n, va a pasar al else
*/

// por si el else te ha dado muy fuerte en la cara dejo un ejemplo sencillo:

dinero = -100;
if (dinero > 0) then {
	hint "No debes dinero";
} else {
	hint "Debes dinero";
};


// Ahora quiero que partiendo de que mi variable es un array vac�o

var = [];

// met�is las siguientes cosas:
// vuestro nombre de jugador
// vuestro bando
// la salud de vuestro soldado (comando damage, pod�is buscar o probar directamente)
// la posici�n de vuestro soldad (comando getPos, pod�is buscar o probar directamente)

// y al final del todo, pong�is una screen de un hint que diga en la primera frase todo vuestro array
// y en la segunda frase cu�ntos elementos tiene

