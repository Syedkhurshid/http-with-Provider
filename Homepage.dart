import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}





class _HomepageState extends State<Homepage> {

  String data = "";
  var users_length;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  void getData() async {
    http.Response response =
    await http.get(Uri.parse("https://hassanbaiga.com/json/results.json"));

    if (response.statusCode == 200) {
      data = response.body;
      // print(data);

      setState(() {
        users_length = jsonDecode(data)['user'];
        print(users_length.length);
      });

      // var usama = jsonDecode(data)['user'][4]['name'];
      // print(usama);

    } else {
      print(response.statusCode);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Contents"),
      ),
      body: ListView.builder(
        itemCount: users_length == null ? 0 : users_length.length,
        itemBuilder: (BuildContext context, int index) {
          if(users_length == null){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return Card(
              child: ListTile(
                leading: Image.network(
                  jsonDecode(data)['user'][index]['avatar'],
                  fit: BoxFit.cover,
                  width: 100,
                  height: 500,
                  alignment: Alignment.center,
                ),
                title: Text(jsonDecode(data)['user'][index]['name']),
                subtitle: Text(jsonDecode(data)['user'][index]['id']),
              ),
            );
          }

        },
      ),
    );
  }

}