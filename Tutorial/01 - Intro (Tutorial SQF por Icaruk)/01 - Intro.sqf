
// esto es un comentario

// el arma ignora comentarios
// más tarde veremos para qué se usan, pero adelanto que son para comentar

estoNoSeriaIgnorado
// esto sí
/* esto también */

/* esto se usa
para cosas más largas
*/


/*

Cosas necesarias antes de empezar:

- Arma 3
- Notepad++ (incluído en la carpeta que os habéis bajado)
- Colorines para N++ (incluídos en la carpeta que os habéis bajado)
- Una o dos manos (cada mano debería de tener al menos 5 dedos hábiles)
- Una cabeza (si es posible, sin golpes)


Inicio, ejecutar, %appdata%
	O también puedes ir a C:\Users\UsuarioQueSea\AppData\Roaming
Buscamos la carpeta Notepad++ y pegamos mi userDefineLang.xml

Buscamos donde tengamos instalado N++ esta ruta
	C:\Program Files (x86)\Notepad++\plugins\APIs
y pegamos mi archivo SQF.xml

Ahora vamos a configuración > preferencias > auto-completar
	y hacemos que nos auto-complete siempre, función y palabra, desde el 3º carácter
	cada uno que se lo ponga como quiera, o que ni se lo ponga.

Ahora toca abrir este mismo archivo en N++ y en Lenguaje seleccionas SQF Icaruk o algo así
¡Colorines! Ah no, está todo gris porque todo es un comentario, menos una línea.
Pero lo solucionamos pronto...

1- Abrir el Arma con el parámetro -showScriptErrors
2- Ir al editor y entráis en Stratis.
3- Doble click en la pista de aterrizaje y sin tocar nada OK.
4- Ya "eres". Puedes darle a preview para comprobar que existes, ESC > abort > yes, para volver el editor (esto lo vais a repetir muuuuuuuuuuuuuuuuuuuuuuucho).
5- CTRL + SHIFT + S para guardar como... o hacer click en el segundo iconito de guardar. Le pones de nombre TutorialMolon y sin tocar nada OK.
6- Vais a la ruta C:\Users\UsuarioQueSea\Documents\Arma 3\missions y buscáis la carpeta TutorialMolon.Stratis
		sólo debería de estar mission.sqm que contiene toda la información que toquéis en el editor (objetos y sus posiciones). Sólo para que lo sepáis.
		
7- Copiais mi archivo description.ext en esa misma carpeta, al lado del mission.sqm
8- CTRL + O y seleccionáis TutorialMolon, o con el iconito de arriba a la izquierda.
9- ¡BOOM! Os dirá que la linea 3 caca, borráis la linea 3 (deberían de quedaros 7 líneas) y volvéis a abrir el Arma. Cada vez que la caguéis en description.ext el Arma peta.
10- Esto no era necesario ahora, pero mola. Entráis a la misión (TutorialMolon) y pulsáis ESC para abrir la consola.
11- Escribís las siguientes líneas, ejecutáis en local y pulsáis ESC. Si lo tenéis en español el orden de los botones es: SERVER, GLOBAL, LOCAL.
		hint "ASDF"
Aparece un mensajito que dice ASDF
		hint 123
Os da error diciendo que es un número y se esperaba un string. Bien, expliquemos esto...
	"ASDF" 	esto es un string
	1234 	esto son números
	"1234" 	esto es un string
	ASDF 	esto es una variable
	
Cualquier cosa entre comillas será un string (una especie de texto). Hay más data types, pero ya iremos viendo.
El punto y coma ; se usa para separar un comando de otro, para que se ejecute uno detrás de otro, probad con esto:
	hint "primero"; hint "segundo"
	
Y a ver quién me puede decir porqué no sale el primero (empezamos flojo xD) mientras pienso el segundo capítulo.
*/
