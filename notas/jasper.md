# Jasper

## Recursos
https://community.jaspersoft.com/project/jaspersoft-studio/resources
		

    Jasper files are what you need to ship with your application in order to run the reports.

¿correr los informes? ejectuar el .jasper contra una entrada de datos
¿qué aplicación?


## Múltiples queries en un sólo reporte
https://stackoverflow.com/questions/7482412/multiple-queries-in-a-single-jasper-document
> using a subDataset and datasetRun

## No Data subreport
En el reporte principal poner una consulta que nunca falle
```[sql]
SELECT 1;
```
Elegir en todos la opción de usar la banda de No Data

*¿Cómo mantengo el título?*
