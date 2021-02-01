import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:clipboard/clipboard.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    double result;
    return Scaffold(
      
      appBar: AppBar(
        title: Center(child: Text(translator.translate('appTitle'))),
        backgroundColor: Color(0xff32C837),
        actions: [
          IconButton(
            icon: Icon(Icons.g_translate),
            color: Colors.white,
            onPressed: () {
              translator.setNewLanguage(
                context,
                newLanguage: translator.currentLanguage == 'ar' ? 'en' : 'ar',
                remember: true,
                restart: true,
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: TextField(
              controller: myController,
              decoration: new InputDecoration(
                  labelText: translator.translate('texfild')),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
            )),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 80,
                vertical: 30,
              ),
              child: RaisedButton(
                  child: Text(
                    translator.translate('convert1'),
                    style: TextStyle(fontSize: 12),
                  ),
                  onPressed: () {
                    int a = int.parse(myController.text);
                    result = a * 2.2046;
                    print(result);
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController.
                          content: Text(
                            result.toString(),
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff32C837)),
                          ),
                          actions: [
                            IconButton(
                                icon: Icon(Icons.copy),
                                onPressed: () {
                                  FlutterClipboard.copy(result.toString());
                                  showTopSnackBar(
                                    context,
                                    CustomSnackBar.success(
                                      message: translator.translate('copytext'),
                                    ),
                                  );
                                })
                          ],
                          title: Center(
                            child: Text(
                              translator.translate('result'),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 80),
              child: RaisedButton(
                  child: Text(
                    translator.translate('convert2'),
                    style: TextStyle(fontSize: 12),
                  ),
                  onPressed: () {
                    int a = int.parse(myController.text);
                    result = a * 0.454;
                    print(result);
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController.
                          content: Text(
                            result.toString(),
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff32C837)),
                          ),
                          actions: [
                            IconButton(
                                icon: Icon(Icons.copy),
                                onPressed: () {
                                  FlutterClipboard.copy(result.toString());
                                  showTopSnackBar(
                                    context,
                                    CustomSnackBar.success(
                                      message: translator.translate('copytext'),
                                    ),
                                  );
                                })
                          ],
                          title: Center(
                            child: Text(
                              translator.translate('result'),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
