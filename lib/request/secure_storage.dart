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
    try {
      var readData = await _storage.read(
          key: key);
      return readData;
    }catch(e){
      print('test me read $e');
    }
  }

  void addStorage(String key, dynamic value){
    try {
      _storage.write(
        key: key,
        value: value,
        aOptions: _getAndroidOptions(),
      );
    }catch(e){
      print('test me  again $e');
    }
  }

  Future<bool> deleteStorage(String key)  async{
    try {
        await _storage.delete(
          key: key, aOptions: _getAndroidOptions());
       return true;
    }catch(e){
      return false;
    }
  }
}