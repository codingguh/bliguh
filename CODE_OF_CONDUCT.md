GENERATE SA-1 & SHA-256

Mac
keytool -genkeypair -v -keystore /path/to/your/custom_keystore_name.keystore -keyalg RSA -keysize 2048 -validity 10000 -alias your_alias_name

keytool -genkeypair -v -keystore ./bliguh.keystore -keyalg RSA -keysize 2048 -validity 10000 -alias bliguh_keystore

keytool -list -v -keystore ./bliguh.keystore -alias bliguh_keystore

Firebase Syntax
flutterfire configure
