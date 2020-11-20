import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> litems = [];
  final TextEditingController eCtrl = new TextEditingController();
  String secretWord =
      "#r#mp L#st"; // Secret word. Change this to change the word!
  String userName = "Player's Username"; // The player's username.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(134, 232, 214, 1.0),
      //padding: EdgeInsets.all(10),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 200.0,
            width: 350.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Text(
                      userName,
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Center(
                    child: Column(
                      children: _getTips(),
                    ),
                  ),
                ),
                ListTile(
                  title: Center(
                      child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                      children: _getHiddenString(),
                    ),
                  )),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: 250.0,
            width: 350.0,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Column(
                children: <Widget>[
                  new Expanded(
                      child: new ListView.separated(
                        padding: const EdgeInsets.all(8),
                        itemCount: litems.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = litems[index];
                          return RichText(
                            text: TextSpan(
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            children: <TextSpan>[
                            TextSpan(
                                text: userName + ": ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                            TextSpan(text: litems[index]),
                          ],
                        ),
                      );
                    },
                        separatorBuilder: (BuildContext context, int index) => const Divider(),
                  )),
                ],
              ),
            ),
          ),
          Container(
            height: 50.0,
            width: 350.0,
            child: Scaffold(
              backgroundColor: Color.fromRGBO(134, 232, 214, 1.0),
              resizeToAvoidBottomInset: false,
              body: TextField(
                controller: eCtrl,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Type your guess...',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onSubmitted: (text) {
                  if (text.isNotEmpty) litems.add(text);
                  eCtrl.clear();
                  setState(() {});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getTips() {
    List<String> someList = [
      "Define the word here!",
      "You can say more stuff too!"
    ];
    return new List<Widget>.generate(someList.length, (int index) {
      return Text(someList[index].toString(),
          style: TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(100, 100, 100, 1.0),
            fontWeight: FontWeight.bold,
          ));
    });
  }

  /* The following function returns an array of TextSpans based on the format of the word inside the "secretWord" variable.
     '#' characters in the secret word are transformed into '__'. Any other case is left unchanged.
  */
  _getHiddenString() {
    List<TextSpan> temp = new List<TextSpan>();
    for (int i = 0; i < secretWord.length; i++) {
      if (secretWord[i] == '#')
        temp.add(new TextSpan(
          text: "  ",
          style: TextStyle(decoration: TextDecoration.underline),
        ));
      else
        temp.add(new TextSpan(text: secretWord[i]));
      if (i + 1 != secretWord.length) temp.add(new TextSpan(text: " "));
    }
    return temp;
  }

  _setMessageString(int index) {
    String stringInQuestion = litems[index];
    List<TextSpan> temp = new List<TextSpan>();
  }
}
