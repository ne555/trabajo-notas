Error:
	The stream or file "storage/logs/laravel.log" could not be opened in append mode: failed to open stream: Permission denied
	Habilitando permisos de escritura para apache
		ps aux | grep (apache|httpd)
	(en mi caso, daemon)

	chown -R $USER:daemon storage
	chown -R $USER:daemon bootstrap/cache

	chmod -R 775 storage
	chmod -R 775 bootstrap/cache
