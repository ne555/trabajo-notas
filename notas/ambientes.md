    * dev
    * test
    * sandbox
	* prod_i2t

# SuiteCRM
url
    * http://devetg.i2tsa.com.ar/suitecrm
    * http://tstetg.i2tsa.com.ar/suitecrm
    * http://tstcas.i2tsa.com.ar/cas/administracion/suitecrm
DB
    * suitecrm_etangram
    * suitecrm_administracion
    * suitecrm_administracion
ubicación
    * 10.20.8.5:/var/www/etangram/suitecrm
    * 10.20.8.5:/var/wwwtst/etangram/suitecrm
    * 172.24.72.179:/var/www/cas/administracion/suitecrm

# Portal
url
    * http://devetg.i2tsa.com.ar/portal/
    * http://tstetg.i2tsa.com.ar/portal/
    * http://tstetg.i2tsa.com.ar/administracion/portal/
DB
    * wordpress_etangram
    * tst_wordpress_etangram
    * wordpress_administracion
ubicación
    * 10.20.8.5:/var/www/etangram/portal
    * 10.20.8.5:/var/wwwtst/etangram/portal
    * 10.20.8.5:/var/wwwtst/etangram/administracion/portal

# App
url
    * http://devetg.i2tsa.com.ar/frontend/ 
    * http://tstetg.i2tsa.com.ar/etangram/app
    * http://tstetg.i2tsa.com.ar/administracion/app/
ubicación
    * /var/www/etangram/frontend
    * /var/wwwtst/etangram/etangram/app
    * /var/wwwtst/etangram/administracion/app
url
    * http://devetg.i2tsa.com.ar/frontendintegraciondefinitiva/
ubicacion
    * /var/www/etangram/frontendintegraciondefinitiva

# Jasper
url
    * http://devjasper.i2tsa.com.ar:8080/jasperserver
    * http://devjasper.i2tsa.com.ar:8080/jasperserver
    * http://tstcas.i2tsa.com.ar:8080/jasperserver/login.html
carpeta
    * E_Tangram
    * E_Tangram_TST
    * E_Tangram
ubicación
    * 10.20.8.5
    * 10.20.8.5
    * 172.24.72.179
DB
    * suitecrm_etangram
    * suitecrm_administracion
    * suitecrm_administracion

# Web service
ubicación
    * /home/fbenitez/etangram
    * /var/wwwtst/etangram/etangram/webservice/etangram
    * /var/wwwtst/etangram/administracion/webservice/etangram
job
    * /etc/init.d/nodejs
    * /etc/init.d/tstetg_nodejs
    * /etc/init.d/tstcas_nodejs
puerto
    * 3000
    * 3005
    * 3002

#Proveedores
url
    * http://devetg.i2tsa.com.ar/proveedores/
    * http://tstetg.i2tsa.com.ar/proveedores
    * http://tstetg.i2tsa.com.ar/administracion/proveedores
DB
    * wordpress_etangram_prov
    * tst_wordpress_etangram_prov
    * wordpress_administracion_prov
ubicación
    * 10.20.8.5:/var/www/etangram/proveedores
    * 10.20.8.5:/var/wwwtst/etangram/proveedores
    * 10.20.8.5:/var/wwwtst/etangram/administracion/proveedores

# Dev
    * http://devetg.i2tsa.com.ar/suitecrm
    * suitecrm_etangram
    * 10.20.8.5:/var/www/etangram/suitecrm
    * http://devetg.i2tsa.com.ar/frontendintegraciondefinitiva/
    * 10.20.8.5:/var/www/etangram/frontendintegraciondefinitiva
    * /home/fbenitez/etangram
    * /etc/init.d/nodejs

# Testing
    * http://tstetg.i2tsa.com.ar/suitecrm
    * suitecrm_administracion
    * 10.20.8.5:/var/wwwtst/etangram/suitecrm
    * http://tstetg.i2tsa.com.ar/etangram/app
    * 10.20.8.5:/var/wwwtst/etangram/etangram/app
    * /var/wwwtst/etangram/etangram/webservice/etangram
    * /etc/init.d/tstetg_nodejs
