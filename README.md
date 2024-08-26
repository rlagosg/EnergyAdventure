# Aventura Energetica / EnergyAdventure

1. Si hacemos cambio en las entidades, hacer siempre un  ```flutter pub run build_runner build``` para que se actualice el esquema de base de datos.


# Prod
Para cambiar el nombre de la aplicación:
```
flutter pub run change_app_package_name:main com.rlagosg.energyadventure
```

Para cambiar el ícono de la aplicación
```
flutter pub run flutter_launcher_icons
```

Para cambair el splash screen
```
flutter pub run flutter_native_splash:create
```


Android AAB
```
flutter build appbundle