# Flutter Clean Architecture

Clean Achitecture usando flutter.

## Getting Started

Este proyecto es una demo usando Clean Architecture para Flutter

Referencias a las librerias usadas en este proyecto:

- [Injection: get_it](https://pub.dev/packages/get_it)
- [Block for state management: flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [Value equality: equatable](https://pub.dev/packages/equatable)
- [Functional programing thingies: dartz](https://pub.dev/packages/dartz)
- [Remote API: json_annotation](https://pub.dev/packages/json_annotation)
- [Remote API: retrofit](https://pub.dev/packages/retrofit)
- [Remote API: dio](https://pub.dev/packages/dio)
- [Remote API: pretty_dio_logger](https://pub.dev/packages/pretty_dio_logger)
- [Local Cache: shared_preferences](https://pub.dev/packages/shared_preferences)
- [Swap the connectivity: data_connection_checker](https://pub.dev/packages/data_connection_checker)
- [For OS-Specific directory paths: path_provider](https://pub.dev/packages/path_provider)


Features incluidos:

- Pantalla de Splash

Su funcion es llamar a un api mediante retrofit y guardar la respuesta en una espacio en memoria dentro del aplicativo.

- Pantalla de Home

Su funcion es recuperar de la data local la lista que se va a pintar y mostrarla en pantalla.

- Pantalla de Error

Cuando ocurra un error el aplicativo mostrará esta pantalla y se tendrá un boton de reiniciado completo del aplicativo.

## Screenshots

![Splash Screen](https://raw.githubusercontent.com/lecasme/FlutterArchitecture/master/assets/images/splash.png?raw=true)
![Home Screen](https://raw.githubusercontent.com/lecasme/FlutterArchitecture/master/assets/images/home.png?raw=true)
![Error Screen](https://raw.githubusercontent.com/lecasme/FlutterArchitecture/master/assets/images/error.png?raw=true)


