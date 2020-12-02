Recursos
	https://shopify.dev/tutorials/authenticate-a-private-app-with-shopify-admin
	https://shopify.dev/tutorials/authenticate-with-oauth

¿qué es cada cosa y para qué sirven?


Product:
	producto tipo: nombre, descripción, categorías (tags), imágenes
	producto tiene opciones (¿?) max 3
	y variantes (combinación de opciones)

Variante:
	refiere a un producto
	diferentes versiones
		precio
		color
		peso

Inventory Item:
	relación 1:1 con Variante
	producto físico, para inventario, transporte

Inventory Level:
	Relaciona «Inventory Item» con «Location» (un inventory level por cada location)
	almacena la cantidad existente en el local

Location:
	ubicación física (almacén)


La orden se trabaja con la variante
	se decrementa la cantidad en el InvLev de menor id (¿qué pasa si es 0?)
	cuando se realiza el envío, se ajustan los inventarios de ambas InvLev (la de menor id y desde donde se mandó)



Shopify access token
Private apps can authenticate with Shopify by including the request header X-Shopify-Access-Token: {access_token}, where {access_token} is replaced by your private app's Admin API password.



Apps públicas y privadas
	autenticación pública:
		api_key y api_secret
		redireccionar las url al sitio de la app
	autenticación privada
		header
			X-Shopify-Access-Token: {api_pass}
		url
			username:password@{shop}.myshopify.com

URLs
Shopify merchants access your app through the URLs you specify here.
Allowed redirection URL(s)
	usar https

custom-app
	Allowed redirection URL(s)
		usar https
	testear desde shopify partners (pero eso no tenemos...)
	instalar la app
