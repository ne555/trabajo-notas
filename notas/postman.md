# Postman

crear entorno (environment) para trabajar con variables

## shopify
	Bug:
		La documentación en https://shopify.dev/tutorials/debug-apps-with-postman-for-mac-os establece para la autorización
			Authorization
			Basic Auth
				username: {{api_key}}
				pass: {{pass}}
		con esto se logra GET product y DELETE product,
		pero falla en el POST product, devolviendo un enlace para realizar la autenticación
```html
<html>
  <body>
    <noscript>
      <a href="https://accounts.shopify.com/oauth/authorize?client_id=7ee65a63608843c577db8b23c4d7316ea0a01bd2f7594f8a9c06ea668c1b775c&amp;destination_uuid=af3b0c61-1ebb-4163-8fce-7fa41f0d18f6&amp;nonce=75a5591fab27b1b959642c07b38c4db7&amp;prompt=merge&amp;redirect_uri=https%3A%2F%2Fvnoctopus.myshopify.com%2Fadmin%2Fauth%2Fidentity%2Fcallback&amp;response_type=code&amp;scope=email%20https%3A%2F%2Fapi.shopify.com%2Fauth%2Fdestinations.readonly%20openid%20profile%20https%3A%2F%2Fapi.shopify.com%2Fauth%2Fpartners.collaborator-relationships.readonly%20https%3A%2F%2Fapi.shopify.com%2Fauth%2Fbanking.manage&amp;state=aeb7be1f512d018d600a2c0e9bc3a3f8&amp;ui_locales=en&amp;ux=shop%20new_design_language">Continue</a>
    </noscript>

    <script type="text/javascript" defer>
      window.location = "https:\/\/accounts.shopify.com\/oauth\/authorize?client_id=7ee65a63608843c577db8b23c4d7316ea0a01bd2f7594f8a9c06ea668c1b775c\u0026destination_uuid=af3b0c61-1ebb-4163-8fce-7fa41f0d18f6\u0026nonce=75a5591fab27b1b959642c07b38c4db7\u0026prompt=merge\u0026redirect_uri=https%3A%2F%2Fvnoctopus.myshopify.com%2Fadmin%2Fauth%2Fidentity%2Fcallback\u0026response_type=code\u0026scope=email%20https%3A%2F%2Fapi.shopify.com%2Fauth%2Fdestinations.readonly%20openid%20profile%20https%3A%2F%2Fapi.shopify.com%2Fauth%2Fpartners.collaborator-relationships.readonly%20https%3A%2F%2Fapi.shopify.com%2Fauth%2Fbanking.manage\u0026state=aeb7be1f512d018d600a2c0e9bc3a3f8\u0026ui_locales=en\u0026ux=shop%20new_design_language";
    </script>
  </body>
</html>
```

		Solución:
			Authorization
				Inherit auth from parent
				Header:
					X-Shopify-Access-Token = {{pass}}
			(no se usa para nada la {{api_key}})
			¿qué tan inseguro es esto?


	
	api/fecha no es necesario en la url (¿ponemos o no?)
