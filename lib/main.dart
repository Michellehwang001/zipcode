import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:search_post/post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController postController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('우편번호 검색하기'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: codeController,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: '우편번호를 찾아 주세요!'
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: postController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '우편번호 검색',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonTheme(
                    padding: const EdgeInsets.all(8.0),
                    minWidth: 300,
                    height: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        _navigatePost(context, postController, codeController);
                      },
                      child: Text('검색'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  _navigatePost(BuildContext context, TextEditingController postController, TextEditingController codeController) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Post()),
    );

    print('result--> $result');

    // json 결과값 받기.
    Map<String, dynamic> zipcode = jsonDecode(result);

    postController.text = zipcode['roadAddress'];
    codeController.text = zipcode['zonecode'];
  }

}
