# Guía para el desarrollo en etangram 
En este documento se detallan los pasos para agregar funcionalidades al proyecto de e-tangram.

## Creación del repositorio local
```
    $ git clone https://gitlab.com/i2tsa/etangram
    usuario: maximiliano.mery@i2t-sa.com.ar
    pass: 123456gg
```

> Para que el usuario y la contraseña se soliciten por línea de comandos en lugar de abrir una ventana, modifique su configuración de git
> ```$ git config --global core.askPass ""```
> De esta manera, su archivo .gitconfig contendrá las líneas
> ```
>      [core]
>          askPass = 
> ```

Se estará trabajando sobre la rama *develop*.

### Pruebas locales
* http://localhost:4200 mediante el comando ```$ ng serve```
* Base de datos 10.20.8.5:suitecrm_etangram
* Servicios 131.255.4.200:/home/fbenitez/etangram (versionado con git)
* suitecrm http://devetg.i2tsa.com.ar/suitecrm/index.php

## Actualización al servidor
1. Subimos los cambios al repositorio
    ```
    $ git fetch origin
    $ git merge origin/develop
    (resolver conflictos)
    $ git push origin develop
    ```
1. Compilamos el código
    ```
    $ node --max_old_space_size=8192 node_modules/@angular/cli/bin/ng build --aot --output-hashing=all
    ```
    Se genera una carpeta dist/etangram con archivos .js y .js.map
1. Versionamos los archivos del servidor
    El directorio de ambiente *DESARROLLO* está ubicado en:
    /var/www/etangram/frontendintegraciondefinitiva
    Crear un .zip con todos los archivos .js y .js.map y el index.html, respetando el protocolo de nombres de versiones_anteriores
        ```$ zip versiones_anteriores/etangram_i2t_42.zip *.js *.js.map index.html```

1. Reemplazamos los archivos .js y .js.map del servidor con los locales ubicados en dist/etangram
    > Se recomienda eliminar los .js y .js.map del servidor, los nombres no son exactamente iguales.

1. Se ajusta el archivo index.html del servidor reemplazando la anteúltima línea con el contenido del index.html local.
    Esta línea contiene las referencias a nuestros .js a ejecutarse
    ```
    <script type="text/javascript" src="runtime.a136eed977b1987a18e2.js"></script><script type="text/javascript" src="polyfills.3227f13eff36a2ee8269.js">...
    ```

1. *Opcional* Reiniciar los servicios
    ```
    # /etc/init.d/nodejs stop --force
    # /etc/init.d/nodejs start
    ```
    * nodejs apunta a /home/fbenitez/etangram (develop)
    * dev_nodejs apunta a /var/wwwtst/etangram/etangram/webservice/etangram (testing)
    * tstetg_nodejs apunta a /var/wwwtst/etangram/etangram/webservice/etangram (testing)
    * tstcas_nodejs apunta a /var/wwwtst/etangram/administracion/webservice/etangram (otra cosa)

### Pruebas servidor desarrollo
* http://devetg.i2tsa.com.ar/frontendintegraciondefinitiva
* Base de datos 10.20.8.5:suitecrm_etangram
* Servicios 131.255.4.200:2235/home/fbenitez/etangram
* suitecrm http://devetg.i2tsa.com.ar/suitecrm/index.php

## Pasaje a testing
1. Crear rama local a partir de origin/testing
    ```
    $ git checkout origin/testing
    $ git checkout -b testing
    ```
1. Pasar los cambios mediante cherry-pick (en orden cronológico)
    ```
    $ git cherry-pick hash
    ```
    > se puede dar un rango [] mediante
    > ``` $ git cherry-pick begin^..end ```
1. Resolver los conflictos
1. Ajustar los servicios
    1. Mover los stored procedures a la base de datos suitecrm_administracion
    1. Copiar meta_catalog y sp.json a /var/wwwtst/etangram/etangram/webservice/etangram/metadata
    1. Reiniciar el servidor tstetg_nodejs

### Pruebas locales
* http://localhost:4200 mediante el comando ```$ ng serve```
* Base de datos 10.20.8.5:suitecrm_administracion
* Servicios 131.255.4.200:/var/wwwtst/etangram/etangram/webservice/etangram/metadata
* suitecrm ¿?

### Actualización del servidor
Una vez que las pruebas locales hayan resultado exitosas, se procede de la misma manera que para el caso del ambiente de *DESARROLLO*.
El directorio de ambiente *TESTING* está ubicado en:
/var/wwwtst/etangram/etangram/app

### Pruebas servidor testing
* http://tstetg.i2tsa.com.ar/etangram/app/
* Base de datos 10.20.8.5:suitecrm_administracion
* Servicios 131.255.4.200:/var/wwwtst/etangram/etangram/webservice/etangram/metadata
* suitecrm http://tstetg.i2tsa.com.ar/suitecrm
