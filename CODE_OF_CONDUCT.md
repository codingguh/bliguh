GENERATE SA-1 & SHA-256

Mac
keytool -genkeypair -v -keystore /path/to/your/custom_keystore_name.keystore -keyalg RSA -keysize 2048 -validity 10000 -alias your_alias_name

keytool -genkeypair -v -keystore ./bliguh.keystore -keyalg RSA -keysize 2048 -validity 10000 -alias bliguh_keystore

cd android && keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android

generate SHA 1 && 256
cd android && ./gradlew app:signingReport

Firebase Syntax
flutterfire configure

dart fix --dry-run && dart fix --apply

flutter pub run flutter_native_splash:create --path=splash.yaml flutter pub run flutter_native_splash:remove

flutter run --dart-define ACCESS_TOKEN=pk.eyJ1IjoidGVndWhhcml0cyIsImEiOiJjbHV2cDNwNGswNDZkMmlsM2dkbjYxemJxIn0.WC7d8ULnuefDTmpF0Gc13A

flutterfire configure --project=modular-robot-416001
flutterfire configure --project=modular-robot-416001
