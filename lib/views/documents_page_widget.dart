import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:convert';

import '../states/app_state.dart';

class DocumentsPageWidget extends StatefulWidget {
  const DocumentsPageWidget({Key key}) : super(key: key);

  @override
  _DocumentsPageWidgetState createState() => _DocumentsPageWidgetState();
}

class _DocumentsPageWidgetState extends State<DocumentsPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final String endPoint = dotenv.get('BASE_URL') + 'api/provider/profile/documents/store';

  void _choose(AppState appState) async {

    var image;
    image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      image = File(image.path); // won't have any error now
    });

    if (image != null) {
      _upload(appState,image);

    }
  }

  void _upload(AppState appState, File file) async {
    String fileName = file.path.split('/').last;

    FormData data = FormData.fromMap({
      "id" : 3,
      "document": await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),

    });

    Dio dio = new Dio();
    String token = appState.accessToken;
    dio.options.headers["Authorization"] = 'Bearer $token';
    dio.post(endPoint, data: data).then((response) {
      var jsonResponse = jsonDecode(response.toString());
      print('response here');
      print(jsonResponse);
    }).catchError((error) => print(error));
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Documents'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _choose(appState);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
