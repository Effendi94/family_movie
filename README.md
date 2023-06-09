# Family Movie App

Flutter `v3.3.10 • channel stable` • [https://github.com/flutter/flutter.git](https://github.com/flutter/flutter.git)  
Dart `• version 2.18.6`  

## How to Run

- Clone this repository
- `flutter pub get` (get packages)
- `flutter pub run build_runner build --delete-conflicting-outputs` (generating files / dart codes)
- `flutter run` (I assume your system is Flutter-ready)


### How to Build
```bash
$ flutter build apk --debug --split-per-abi
$ flutter build apk --release --split-per-abi
$ flutter build appbundle
```

### How to Build with obfuscate
```bash
$ flutter build apk --debug --split-per-abi --obfuscate --split-debug-info=.debug_info
$ flutter build apk --release --split-per-abi --obfuscate --split-debug-info=.debug_info
$ flutter build appbundle --obfuscate --split-debug-info=.debug_info
```
