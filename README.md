# Barrioteca Acalenca - App iOS (iPhone/iPad)

App nativa para iOS de la Barrioteca Acalenca, generada con un **WKWebView** que empaqueta la app web.

## Requisitos

- **Mac** con macOS 13 (Ventura) o superior
- **Xcode 15** o superior (descargar desde la App Store)
- **Apple Developer Account** (gratuita para pruebas, $99/año para App Store)

## Como generar la app iOS

La app iOS se genera con un proyecto Xcode que carga la app web en un `WKWebView`:

1. Crea un nuevo proyecto en Xcode: **iOS -> App**
2. Sustituye el `ContentView.swift` por un `WKWebView` que cargue la URL
3. Añade permisos de cámara en `Info.plist` para el escaner de codigos
4. Configura el `apple-app-site-association` en tu NAS

## Datos tecnicos

| Dato | Valor |
|------|-------|
| Bundle ID | `com.barrioteca.acalenca.ios` |
| URL | `https://pelotxo.synology.me/barrioteca` |
| Tecnologia | WKWebView (WebKit) |
| Version minima iOS | 15.0 |
| Permisos | Camara (NSCameraUsageDescription) |
| Orientacion | Portrait |

## Configuracion del NAS para iOS

Para que la app iOS funcione correctamente, necesitas anadir el archivo `apple-app-site-association` en tu NAS:

1. Sube el archivo `apple-app-site-association` (incluido en este repo) a:
   - `/barrioteca/.well-known/apple-app-site-association`
   - O bien a la raiz del dominio: `https://pelotxo.synology.me/.well-known/apple-app-site-association`

2. El archivo debe servirse sin extension `.json` y con content-type `application/json`

## Permisos de camara (Info.plist)

Anade esto al `Info.plist` del proyecto Xcode:

```xml
<key>NSCameraUsageDescription</key>
<string>La Barrioteca necesita acceder a la camara para escanear los codigos de barras de los libros y las tarjetas de socias.</string>
```

## Publicar en la App Store

1. **Apple Developer Program**: $99 USD/ano
2. En Xcode: Product -> Archive -> Distribute App
3. Subir a App Store Connect
4. Completar ficha: descripcion, capturas, politica de privacidad
5. Esperar revision (1-2 dias)

### Politica de privacidad

La app no recopila datos personales. Todo el procesamiento ocurre en el NAS de la barrioteca. La URL de privacidad puede ser:

```
https://pelotxo.synology.me/barrioteca/privacidad.html
```

## Estructura del repositorio

```
barrioteca-ios/
├── README.md
├── apple-app-site-association    # Configuracion Universal Links
└── .gitignore
```

## Repositorios relacionados

| Repositorio | Descripcion |
|------------|-------------|
| [acalenca-barrioteca-app](https://github.com/jesuscastilla/acalenca-barrioteca-app) | App web (frontend React) |
| [acalenca-barrioteca](https://github.com/jesuscastilla/acalenca-barrioteca) | SLiMS (backend PHP) |
| [acalenca-barrioteca-app-android](https://github.com/jesuscastilla/acalenca-barrioteca-app-android) | App Android + docs |

## Creditos

Desarrollado por **Peloxi** ([@Pelochochi](https://instagram.com/Pelochochi)) para la **Barrioteca Acalenca**, espacio perteneciente a **Lebeche**, asociacion cultural y vecinal de Salobrena (Granada).

## Licencia

[GNU General Public License v3.0](LICENSE)