develop
http://devetg.i2tsa.com.ar/frontendintegraciondefinitiva/login

## Versión en específico
```bash
#Angular 2:the last RC version before switching to angular 4 as far as I can tell — based on this and the next version now depends on angular
npx -p @angular/cli@1.0.0-rc.2 ng new angular2app

#Angular 4: the last CLI version before angular 5
npx -p @angular/cli@1.4.10 ng new angular4app

#Angular 5: the last CLI version before 6
npx -p @angular/cli@1.7.4 ng new angular5app

#Angular 6: the last CLI version before 7
npx -p @angular/cli@6.2.9 ng new angular6app

# Angular 7: (the last CLI version before 8
npx -p @angular/cli@7.3.9 ng new angular8app

#Angular 8: the last CLI version before 9
npx -p @angular/cli@8.3.25 ng new angular8app

#Angular 9: not last CLI version 9
npx -p @angular/cli@9.1.12 ng new Angular9App
```

# Internacionalización
Existen diferencias entre versiones, se darán las guías para la versión 6 y para la 11

# i18n Angular 6
Se describen a continuación los pasos para realizar la traducción de una aplicación creada con Angular versión 6 utilizando los tags i18n.
Esta traducción se realiza sobre texto estático en los .html

1. Marcar el contenido a traducir.
    Se agrega la directiva ``i18n`` dentro del tag html.
    Ejemplo:
    ```html
    <h1 i18n="saludo|">Hello</h1>
    ```
    donde ``"saludo|"`` es una etiqueta de significado. A igual significado y contenido corresponde la misma traducción.

1. Generar los archivos de traducción.
    Mediante el comando
    ```bash
    $ ng xi18n  --output-path locale --out-file messages.idioma.xlf
    ```
    se genera un archivo ``src/locale/messages.idioma.xlf`` que contiene los mensajes a traducir de *todos* los archivos .html
    > Advertencia: Esta operación es destructiva, si el comando se ejecuta nuevamente se perderán los cambios realizados sobre el archivo.
    > Se recomienda el versionado del mismo.

1. Realizar la traducción.
    El archivo .xlf generado contiene el texto a traducir dentro de tags ``<source>``.
    La traducción se colocará dentro de tags ``<target>``.
    Ejemplo:
    ```html
      <trans-unit id="f99f908ba1100cc6f35d85f29c73ad07d1f38a8e" datatype="html">
        <source>Hello</source>
        <target>Hola</target>
        <context-group purpose="location">
          <context context-type="sourcefile">app/app.component.html</context>
          <context context-type="linenumber">20</context>
        </context-group>
        <context-group purpose="location">
          <context context-type="sourcefile">app/app.component.html</context>
          <context context-type="linenumber">23</context>
        </context-group>
        <note priority="1" from="meaning">saludo</note>
      </trans-unit>
    ```

1. Compilación.
    Se creará una opción de compilación en el archivo ``angular.json``
    ```json
{
  "projects": {
    "nombre-app": {
      "architect": {
        "build": {
          "configurations": {
            "es": {
                "i18nFile": "src/locale/messages.es.xlf",
                "i18nLocale": "es",
                "i18nFormat": "xlf",
                "aot": true
            },
            ...
        "serve": {
          "configurations": {
            "es":{
                "browserTarget": "nombre-app:build:es"
            }
            ...
    "nombre-app-e2e": {
      "architect": {
        "e2e": {
          "configurations": {
            "es":{
                "devServerTarget": "nombre-app:serve:es"
            }
            ...
    ```
    De esta manera se tendrán las traducciones en las funciones de ``build``, ``serve`` o ``e2e`` utilizando el flag de ``--configuration``
    ```bash
    $ ng serve --configuration es
    ```


## Problemas al integrarlo en etangram
Los tags de i18n sirven únicamente para cambiar texto estático, por lo tanto se logró cambiar únicamente la pantalla de consulta-expedientes y no la de expedientes que generaba los títulos y tablas mediante un stored procedure.
Investigar el uso de la opción "fileReplacements" junto con variables de entorno.

Se observó que el comando ``$ ng serve --configuration es`` fallaba al quedarse sin memoria.
Para solucionar este problema, se eliminó la opción ``"aot": true``, por lo que para observar los cambios es necesario generar los archivos en ``dist/`` que luego se levantarán mediante ``live-server``
```bash
$ npm install -g live-server
$ node --max_old_space_size=8192 node_modules/@angular/cli/bin/ng build --aot --output-hashing=all --configuration es
$ cd dist/etangram
$ live-server --entry-file=./index.html
```


## Utilizando variables de entorno
El método anterior sirve únicamente para cambiar texto estático, no es útil si necesitamos cabiar el contenido de alguna variable que se muestre en el html.
Para esto, se pueden utilizar las variables de entorno
```ts
// src/environment.ts
export const environment = {
  production: false,
  title: "Test"
};
// src/environment.es.ts
export const environment = {
  production: false,
  title: "Prueba"
};
// src/app/nombre.component.ts
import { environment } from 'src/environments/environment';
//...
    this.title = environment.title
```
y configurar un reemplazo automático en ``angular.json``
```json
            "es": {
                "i18nFile": "src/locale/messages.es.xlf",
                "i18nLocale": "es",
                "i18nFormat": "xlf",
                "aot": true,
                "fileReplacements":[
                    {
                        "replace": "src/environments/environment.ts",
                        "with": "src/environments/environment.es.ts"
                    },
                ],
            }
```

* * *
#### Fin



> Advertencia: Aparentemente este método no permite traducir variables (interpolación)
> sólo se traduce texto estático dentro de tags


Para que la aplicación soporte internacionalización, siga estos pasos:
1. Agregue el paquete de internacionalización
    ```bash
    $ ng add @angular/localize
    ```
    > Angular 6 no soporta el paquete localize
    > no lo instalo


1. Usar el id del _locale_ (puntuación, formato de fecha, moneda)
1. Dar formato segun el _locale_. Usar _pipes_
1. Preparar las templates.
    1. Marcar el texto a traducir: atributo ``i18n`` en los tags
        ```html
        <h1 i18n>Hello i18n!</h1>
        ```
    1. Agregar descripciones a los tags ``meaning | description``
        ```html
        <h1 i18n="site header | An introduction header for this sample">Hello i18n!</h1>
        ```
        Usa _meaning_  para hacer la traducción una sola vez.
        Mismo significado y contenido traduce igual.
1. Realizar la traducción
    1. Crear los archivos de traducción
        ```bash
        $ ng extract-i18n
        $ ng extract-i18n --output-path src/locale --out-file messages.esp.xlf
        ```
        En Angular 6 el comando es
        ```bash
        $ ng xi18n
        $ ng xi18n  --output-path locale --out-file messages.esp.xlf
        ```
    1. Traducir el texto entre ``<source>`` tags y ubicarlo en ``<target>``
    ```html
    <source>oh brave new world</source>
    <target>hola mundo feliz</target>
    ```
1. Instalar las traducciones en la aplicación
   ``project/nombre-proyecto/i18n/sourceLocale`` usada en el código
   ``project/nombre-proyecto/i18n/locales``  mapa de _locale_ a archivo de traducción
   1. Generar las versiones de la app
   ``project/nombre-proyecto/build/options/localize``
   Establecer en ``true`` o en un arreglo de locales a construir
       > Advertencia: en dev solamente se puede elegir _una_ locale

       > Alternativa: usar en la línea de comandos ``--localize``
   Cada vez que cambie el archivo de traducción, reiniciar el serve

1. Múltiples locales. ``baseHref``



```html
<h1 i18n>Texto a traducir</h1>
```

```bash
$ ng xi18n --output-path=locale/
```
genera un archivo ``mesages.xlf``, cambiar el nombre a algo alusivo
Buscar tags ``<source>`` y agregar un ``<target>`` con la traducción

### Compilación
#### Configuración
en ``angular.json`` agregar una configuración de compilación
``projects/nombre-proyecto/architect/build/configurations``
```json
"es": {
    "i18nFile": "src/locale/messages.es.xlf",
    "i18nLocale": "es",
    "i18nFormat": "xlf",
    "aot": true
}
```

``projects/nombre-proyecto/architect/serve/configurations``
```json
"es": {
    "browserTarget": "test-i18n:build:es"
}
```

``projects/nombre-proyecto-e2e/architect/serve/configurations/``
```json
"es": {
    "devServerTarget": "test-i18n:serve:es"
}
```
¿ah? ¿de dónde salió ese e2e?


#### Compilación propiamente dicha
(ver con node)
```bash
$ ng serve -o --configuration=es
```
