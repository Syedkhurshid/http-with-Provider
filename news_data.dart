import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Newsdata extends ChangeNotifier {
  Map<String, dynamic> map = {};
  bool error = false;
  String errorMessage = "";
  Map<String,dynamic> get _map => map;
  bool get _error=> error;
  String get _errorMessage =>errorMessage;


  Future<void> get fetchData async {
    final responce = await get(
        Uri.parse("https://hassanbaiga.com/json/results.json"));


    if (responce.statusCode==200){
      try{
        map = jsonDecode(responce.body);
        error =false;
      } catch(e){
        error = true;
        errorMessage=e.toString();
        map={};
      }

    }
    else{
      error = true;
      errorMessage=" Error: It could be Your internet connection ";
      map={};

    }
    notifyListeners();
  }
  void initialValue(){
    map= {};
    error=true;
    errorMessage="";
    notifyListeners();
  }

}
