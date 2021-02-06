import 'package:flutter/material.dart';
import 'package:flutter_pokemon/model/pokedex.dart';
import 'package:flutter_pokemon/model/pokemondetail.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  String url="https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  Pokedex pokedex;
  Future<Pokedex> veri;
  Future<Pokedex>pokemonlariGetir()async {
    var response=await http.get(url);
    var decodedJson=json.decode(response.body);
    pokedex=Pokedex.fromJson(decodedJson);
    return pokedex;
  }

  @override
  void initState() {
    super.initState();
    veri =pokemonlariGetir();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
      ),
      body: OrientationBuilder(
        // ignore: missing_return
        builder: (context,orientation){
          if(orientation==Orientation.portrait){
            return FutureBuilder(
              future: pokemonlariGetir(),
              // ignore: missing_return
              builder: (context,AsyncSnapshot<Pokedex>gelenPokedex){
                if(gelenPokedex.connectionState==ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }else if(gelenPokedex.connectionState==ConnectionState.done){
                  /*return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context,index){
                return Text(gelenPokedex.data.pokemon[index].name);
              });*/
                  return GridView.count(crossAxisCount: 2,children: gelenPokedex.data.pokemon.map((poke) {
                    return InkWell(
                      onTap: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PokemonDetail(pokemon: poke,)));

                      },
                      child: Hero(
                        tag: poke.img,
                        child: Card(
                          elevation: 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 200,
                                height: 120,
                                child: FadeInImage.assetNetwork(placeholder: "assets/loadingpoke.gif", image: poke.img,fit: BoxFit.contain,),
                              ),
                              Text(poke.name,style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),)
                            ],
                          ),


                        ),
                      ),
                    );
                  }).toList(),);
                }
              },

            );

          }else{
            return FutureBuilder(
              future: pokemonlariGetir(),
              // ignore: missing_return
              builder: (context,AsyncSnapshot<Pokedex>gelenPokedex){
                if(gelenPokedex.connectionState==ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }else if(gelenPokedex.connectionState==ConnectionState.done){
                  /*return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context,index){
                return Text(gelenPokedex.data.pokemon[index].name);
              });*/
                  return GridView.extent(maxCrossAxisExtent: 300,children: gelenPokedex.data.pokemon.map((poke) {
                    return InkWell(
                      onTap: () {

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PokemonDetail(pokemon: poke,)));

                      },
                      child: Hero(
                        tag: poke.img,
                        child: Card(
                          elevation: 6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 200,
                                height: 180,
                                child: FadeInImage.assetNetwork(placeholder: "assets/loadingpoke.gif", image: poke.img,fit: BoxFit.contain,),
                              ),
                              Text(poke.name,style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),)
                            ],
                          ),


                        ),
                      ),
                    );
                  }).toList(),);
                }
              },

            );

          }
        },

      )
    );
  }
}
