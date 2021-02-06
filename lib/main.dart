import 'package:flutter/material.dart';
import 'package:flutter_pokemon/pokemonlist.dart';
import 'package:http/http.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.deepOrange,
      ),
      home: PokemonList()
    );
  }
}


