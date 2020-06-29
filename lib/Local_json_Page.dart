import 'package:flutter/material.dart';
import 'dart:convert';

class json_class extends StatefulWidget {
  @override
  _json_class createState() => _json_class();
}

class _json_class extends State<json_class> {
// final String url = "https://swapi.co/api/starships";
// List data;

// Future<String> getSWData() async {
  // var response = await http
  // .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

// setState(() {
  // var reponse_Body = json.decode(response.body);
//   data = reponse_Body[
//     "results"
//   ];
// });
// return "Sucess!";

// }

  String bim;

  var json_data;
  int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: FutureBuilder(
            //future property her is to locate and load our json from our asset
            //as specified in the pubyaml file

            future: DefaultAssetBundle.of(context)
                .loadString('json_local_api/bot.json'),
            //load context
            //snapshot to display our json data
            builder: (context, snapshot) {
              //json_data variable here which is a list type
              //decodes the local json and stores the json data
              //and the decoded json data is converted to string for use

              json_data = json.decode(snapshot.data.toString());
              int json_itemtodisplay = json_data == null ? 0 : json_data.length;
              //the listview.builder method is to display our json data in list
              //and with respect length to the length of our json data
              return ListView.builder(
//item count is the amount of items to be displayed
                  itemCount: json_itemtodisplay,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return Scaffold(
                                backgroundColor: Colors.grey[200],
                                appBar: AppBar(
                                  title: Text(
                                    "Message from" +
                                        " " +
                                        json_data[index]["name"],
                                    style:
                                        TextStyle(fontFamily: 'MavenPro-Bold'),
                                  ),
                                  titleSpacing: 1,
                                  centerTitle: true,
                                  actions: <Widget>[
                                    IconButton(
                                        icon: Icon(
                                          Icons.share,
                                          size: 17,
                                        ),
                                        onPressed: () {})
                                  ],
                                ),
                                body: Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 70.0),
                                      child: ListView(
                                        children: <Widget>[
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              chat_widgeter(index),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              chat_widget2(index),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              chat_widgeter(index),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              chat_widget2(index),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              chat_widgeter(index),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              chat_widget2(index),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              chat_widgeter(index),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              chat_widget2(index),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              chat_widgeter(index),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              chat_widget2(index),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Message_box(),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }));
                          },
                          splashColor: Colors.grey[300],
                          child: InkWell(
                            child: ListTile(
                              contentPadding: EdgeInsets.only(
                                  left: 16, right: 16, top: 5, bottom: 1),
                              leading: CircleAvatar(
                                backgroundImage: AssetImage("images/5355.jpg"),
                                radius: 25,
                              ),
                              title: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.green,
                                      radius: 2.5,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 8, top: 15),
                                    child: Text(
                                      json_data[index]["name"],
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, top: 6, bottom: 5),
                                child: Text(
                                  json_data[index]["message"] +
                                      " " +
                                      json_data[index]["name"],
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                              ),
                              trailing: Column(
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.only(top: 22.0),
                                      child: Text("3:12",
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.9),
                                              fontSize: 13))),
                                  Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                          "8/10/" + json_data[index]["date"],
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              fontSize: 10))),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          splashColor: Colors.grey[300],
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 10.0, left: 80),
                            child: SizedBox(
                                child: Divider(
                                    color: Colors.black.withOpacity(0.4))),
                          ),
                        ),
                      ],
                    );
                  });
              // } else {
              //   return Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: <Widget>[
              //       Container(
              //         width: 80,
              //         height: 80,
              //         color: Colors.black,
              //         child: CircularProgressIndicator(
              //           backgroundColor: Colors.red,
              //         ),
              //       )
              //     ],
              //   );
              // }
            }),
      ),
    ));
  }

  Row chat_widget2(int index) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            width: 190.0,
            height: 100.0,
            margin: EdgeInsets.only(
              top: 10,
              bottom: 25,
              right: 0,
              left: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(0),
                  bottomLeft: Radius.circular(20)),
              color: const Color(0xffffffff),
              // border: Border.all(
              //     width: 1.0,
              //     color:
              //         const Color(0xff707070)),
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 10, top: 10),
                      child: Text(
                        "hello " +
                            json_data[index]["name"] +
                            " " +
                            "how have u been its been a while weve had a chat  ",
                        textAlign: TextAlign.left,
                        style: TextStyle(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 90, right: 10, left: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage("images/5355.jpg"),
            radius: 25,
          ),
        ),
      ],
    );
  }

  Row chat_widgeter(int index) {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 90, right: 10, left: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage("images/5355.jpg"),
            radius: 25,
          ),
        ),
        Expanded(
          child: Container(
            width: 190.0,
            height: 100.0,
            margin: EdgeInsets.only(top: 10, bottom: 25, right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              color: const Color(0xffffffff),
              // border: Border.all(
              //     width: 1.0,
              //     color:
              //         const Color(0xff707070)),
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 10, top: 10),
                      child: Text(
                        "hello " +
                            json_data[index]["name"] +
                            " " +
                            "how have u been its been a while weve had a chat  ",
                        textAlign: TextAlign.left,
                        style: TextStyle(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

//BottomApp_bar
  Widget Message_box() {
    return BottomAppBar(
      color: Colors.grey[90],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 4, right: 5, top: 0, bottom: 0),
                width: 300.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[300],
                  // border: Border.all(
                  //     width: 1.0,
                  //     color:
                  //         const Color(0x4d707070)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail,
                            color: Colors.black.withOpacity(0.6)),
                        border: InputBorder.none,
                        hintText: "Write a message"),
                  ),
                ),
              ),
            ),
            Container(
              width: 50.0,
              height: 46.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.elliptical(23.0, 21.0)),
                color: Colors.grey[300],
                border: Border.all(width: 1.0, color: const Color(0x63707070)),
              ),
              child: Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}
