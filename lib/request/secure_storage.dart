import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GetTokenLocalStorage{

  //local storage
  //ANDROID
  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(
        encryptedSharedPreferences: true,
      );
    final _storage = const FlutterSecureStorage();

  Future<String> readStorage(String key)  async{
    var readData = await _storage.read(key: key, aOptions: _getAndroidOptions());
      print(key);
      print(readData);
    return readData;
  }

  void addStorage(String key, dynamic value){
     _storage.write(
      key: key,
      value: value,
      aOptions: _getAndroidOptions(),
    );
  }

  Future<bool> deleteStorage(String data)  async{
    try {
        await _storage.delete(
          key: data, aOptions: _getAndroidOptions());
       return true;
    }catch(e){
      return false;
    }
  }
}