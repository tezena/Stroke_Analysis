import 'package:final_sprs/logic/chat/bloc/chat_bloc.dart';
import 'package:final_sprs/presentaion/core/app_export.dart';
import 'package:http/http.dart' as http;

import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:final_sprs/presentaion/widgets/ChatMessage.dart';
import 'package:final_sprs/presentaion/screens/Drawer.dart';

import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];

  SharedPreferences? sharedPreferences;

  @override
  void initState() {
    super.initState();
    initializeDialogFlowtter();
  }

  Future<void> initializeDialogFlowtter() async {
    dialogFlowtter = await DialogFlowtter.fromFile();
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: mediaQueryData.size.width,
        height: mediaQueryData.size.height,
        decoration: BoxDecoration(
            color: appTheme.whiteA700,
            image: DecorationImage(
                image: AssetImage(ImageConstant.imgGroup57),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: messages.isEmpty
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          children: [
            if (messages.isEmpty)
              Expanded(
                  child: Align(
                      alignment: Alignment.center,
                      child: Container(
                          width: 300.h,
                          height: 230.h,
                          margin: const EdgeInsets.only(top: 0, bottom: 0),
                          padding: EdgeInsets.symmetric(
                              horizontal: 33.h, vertical: 8.v),
                          decoration: AppDecoration.fillCyan,
                          child: Column(children: [
                            SizedBox(height: 20.v),
                            CustomImageView(
                                imagePath: ImageConstant.imgImage4,
                                height: 100.adaptSize,
                                width: 80.adaptSize),
                            SizedBox(height: 5.v),
                            Text("NeuroGen",
                                style: CustomTextStyles
                                    .titleLargeOpenSansBluegray800
                                    .copyWith()),
                            SizedBox(height: 10.v),
                            Text("start your new chat here.",
                                style: theme.textTheme.labelLarge!.copyWith(
                                    color: Colors.black45, fontSize: 14)),
                            SizedBox(height: 10.v),
                          ]))))
            else
              Expanded(
                child: MessagesScreen(messages: messages),
              ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 10.0, left: 20, right: 20),
                        child: TextField(
                          minLines: 1,
                          maxLines: null,
                          controller: _controller,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.blue.shade400,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 3,
                                color: Colors.blue.shade400,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            hintText: '       add your text here',
                            hintStyle: const TextStyle(color: Colors.grey),
                            suffixIcon: IconButton(
                              onPressed: () {
                                sendMessage(_controller.text);
                                _controller.clear();
                              },
                              icon: Icon(
                                MdiIcons.send,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('message is empty');
    } else {
      setState(() {
        addMessage(text, true);
      });

      Future<void> postData() async {
        final storage = FlutterSecureStorage();
        final sessionCookie = await storage.read(key: 'sessionCookies');

        final userId = await storage.read(key: 'userId');

        final Uri uri = Uri.parse(
            'https://neuronet.onrender.com/api/v1/medical/medical-chat/:$userId');
        final Map<String, String> headers = {
          'Content-Type': 'application/json',
          'Cookie': sessionCookie!,
        };

        final Map<String, dynamic> body = {"question": text, "userId": userId};

        try {
          final response =
              await http.post(uri, headers: headers, body: json.encode(body));
          final responseBody = response.body;
          print("the response is: {$responseBody}");
          if (response.statusCode == 200) {
            final jsonResponse = json.decode(response.body);
            String responseText = jsonResponse["response"];
            print(jsonResponse);
            setState(() {
              addMessage(responseText);
              // addGradualMessage(responseText);
            });
          } else {
            throw Exception('Failed to load data');
          }
        } catch (e) {
          print('the Error: $e');
        }
      }

      await postData();
    }
  }

  addMessage(String message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
