# Feature branch workflow
master se actualiza a la historia oficial
```
git checkout master
git fetch origin
git reset --hard origin/master
```

crear nueva rama para el feature
```
git checkout -b new-feature

```
subir rama al repositorio central
```
git push -u origin new-feature
```

# Git workflow
Ramas principales: _master_ y _develop_
Ramas auxiliares: _feature_ y _release_

En _master_ están las versiones
En _release_ se acumulan los cambios desde _develop_ para hacer la nueva versión
En _feature_ se agrega la nueva funcionalidad.

```
git checkout develop
git merge --no-ff myfeature
```

Partiendo de develop, crear nueva feature, mezclar con --no-ff para tener un commit de merge (facilita revertir)
Ir pasando funcionalidades de develop a release
Bug fixing en release, merge también a develop

# Github flow
	Si está en rama _main_ se puede hacer deploy

Importancia del mensaje de commit, tamaño del commit

Pull request (¿git básico?)
	no sólo al terminar el código
	consultas y avances
	revisión de código

Modelos:
	Fork & pull
	Shared repository

Deploy desde la rama (rollback a main)[

Merge: los pull request se usan como historial

# Git workflow  (argeniss)
1. Update to the latest version of master - `$ git checkout master && git pull`
1. Create a new branch for working on the issue
  1. `$ git checkout -b features/<#issue_number>-<name>` (If it's a new feature)
  1. `$ git checkout -b bug_fixing/<#issue_number>-<name>` (If it's a bug)
1. Commit locally as you need - `$ git commit -m 'bla bla'`
1. Update your branch against master - `$ git fetch origin && git rebase origin master`
1. Push your branch to github - `$ git push origin <branch-name>`
1. Create a Pull request and assign a reviewer

# Argeniss
1. Crear una nueva rama con nombre de la tarea
	Entorno: ver docker 
		``docker-compose up -d``
		``docker-compose exec server sh -c "cd src/migration; node migrate.js``
	o al menos un readme de versiones
2. Completar la tarea
	1. Crear las pruebas unitarias
	1. Asegurar compilacion
	1. Asegurar éxito en las pruebas unitarias
	1. Asegurar éxito en las pruebas de integración
	1. Asegurar cumplimiento de los requisitos de la funcionalidad
3. Pull request

## Jared front
1. Obtener última versión
	``git checkout master && git pull``
1.	Crear rama de trabajo
	``git checkout -b feature/4.2-nombre``
	``git checkout -b bug_fix/4.2-nombre``
1. Guardar cambios
	``git commit``
1. Actualizar contra master
	``git fetch origin``
	``git rebase origin mastere``
	(revisar rebase)
1. Subir al servidor
	``git push origin <nombre-rama>``
1. Pull request





# Comandos
* lista los archivos tocados
    git show --name-only --pretty=""
	git diff --name-only SHA1 SHA2
* log que muestra usuario y fecha de commit
    git log --pretty=format:"%Cred%h %Cgreen(%an) %Creset%ad: %s" --date=short --decorate --graph
* mostrar el stash
    git stash show -p
* push tags
    git push --tags
* mostrar historia lineal --first-parent
* ordenar branch por fecha
	git branch --sort=-committerdate
* mostrar historia de una linea
	git log -L '/the line from your file/,+1:path/to/your/file.txt'
* ramas sin mergear
	git branch --no-merged master
* punto de bifurcacion
	git merge-base branchA branchB
A...B: compara A contra el ancestro común de A y B
* commits en branch que no estan en HEAD
	git log branch --not HEAD
* mostrar logs entre fechas
  git log --after="2021-03-30 00:00" --before="2021-03-30 23:59" --decorate --graph
