# lastfm
<img align="right" src="https://github.com/Nikoro/lastfm/blob/master/demo.gif" alt="A demo illustrating the UI of the app" width="288" height="624" style="display: inline; float: right"/>

lastfm is a Flutter application.<br>
The app is used to search for music albums.<br>
It uses data from [LastFM](https://www.last.fm/api) REST API.

It supports:
1. Searching by album name
2. Pagination & infinite scrolling

## Getting Started

You will need to create an account at lastFM and generate an API key:
* Signup -> [last.fm](https://www.last.fm)
* Create API key -> [create](https://www.last.fm/api/account/create)
* Copy your API key & replace text "YOUR_API_KEY" in **constants.dart** file under **lib/resources** directory

This project uses [code generation tools](https://pub.dev/packages/build_runner).<br>
**Before building the project:**<br>
Run the below command in the terminal to generate necessary files:
```shell script
flutter pub run build_runner build --delete-conflicting-outputs
```

### Libraries
* [Bloc Test](https://pub.dev/packages/bloc_test)
* [Cached Network Image](https://pub.dev/packages/cached_network_image)
* [Dartz](https://pub.dev/packages/dartz)
* [Dio](https://pub.dev/packages/dio)
* [Flutter BloC](https://bloclibrary.dev/)
* [Flutter Hooks](https://pub.dev/packages/flutter_hooks)
* [Freezed](https://pub.dev/packages/freezed)
* [Get It](https://pub.dev/packages/get_it)
* [Injectable](https://pub.dev/packages/injectable)
* [Json Serializable](https://pub.dev/packages/json_serializable)
* [Mockito](https://pub.dev/packages/mockito)
* [Retrofit](https://pub.dev/packages/retrofit)
