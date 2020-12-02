Recursos
	https://phpunit.readthedocs.io/en/9.3/
	https://semaphoreci.com/community/tutorials/getting-started-with-phpunit-in-laravel
	https://phpunit.readthedocs.io/es/latest/
https://www.slideshare.net/DragonBe/introduction-to-unit-testing-with-phpunit-presentation-705447
	the art of unit testing

	https://github.com/ne555/phpunit (ejemplos, repositorio propio)


Instalación
	Es dependencia de Laravel, así que se encuentra directamente en
	./vendor/bin/phpunit
	(¿queda en deploy?)

Tests (asserts):
	cada método es una prueba
	se pueden comprobar valores de retorno, carga de páginas, contenido, excepciones, errores, etc.
	ejemplo:

class ExampleTest extends TestCase
{
    public function testBasicTest()
    {
        $response = $this->get('/');
        $response->assertStatus(200);
    }
}

	Dependencias entre tests:
	(tags entre comentarios /** **/, no funciona con //)
		@depends
		ejecuta otro método antes (llamdo `producer'), usando el valor de retorno como parámetro

	Data Provider: ejecutar el mismo test cambiando parámetros
		@dataProvider
		el provider devuelve un arreglo de arreglos o un iterador
		se pueden asignar varios providers que se ejecutan en secuencia


Uso laravel:
	respetar las convenciones de nombres
	crear los test (tests/Feature/NombreTest)
	$ php artisan make:test NombreTest
	se ejecutan las funciones testNombreDeLaPrueba(), verificando los asserts
	$ phpunit --testdox
	Email #nombre de la clase
		✔ Can be created from valid email address #nombre de la prueba
		✔ Cannot be created from invalid email address
		✔ Can be used as string

	Hello
		✔ Creation
		✘ Salute
		   │
		   │ Failed asserting that two strings are equal.
		   │ --- Expected
		   │ +++ Actual
		   │ @@ @@
		   │ -'hola'
		   │ +'hola hola'
		   │
		   │ tests/HelloTest.php:19

	se puede seleccionar la clase pasándola como parámetro (ruta completa)
	$ phpunit --testdox tests/Feature/HelloTest.php


Dudas:
	¿cómo escribir un buen test? ¿cuáles son buenos casos de prueba?
	creación automática de casos de prueba (¿validación?)
	¿cómo muestrar rutas relativas en lugar de absolutas?
	¿para qué sirve tests/Unit ?
	revisar plugin laravel dusk para automatizar interacciones (relleno de formularios, clicks)
