import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final callIDText = TextEditingController(text: "call_id");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 218, 223, 233),
      appBar: AppBar(
        title:const Text(
          "Video and Audio Call",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 63, 207, 212),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextFormField(
                controller: callIDText,
                decoration: const InputDecoration(
                    labelText: "Join a Call by ID",
                    border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CallPage(callID: callIDText.text);
                    }));
                  },
                  child: const Text("Join Now", style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)),
            )
          ],
        ),
      ),
    );
  }
}

class CallPage extends StatelessWidget {
  final String callID;
  const CallPage({super.key, required this.callID});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
          appID: 566713262, // your AppID,
          appSign:
              '3531909cd39c29e8ea7017515ad1dfb1c0f49edc6ddf8ae24eb9f7facb6ac956',
          userID: 'local user id',
          userName: 'local user name',
          callID: 'call id',
          config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()),
    );
  }
}
