import 'package:flutter/material.dart';
import 'package:flutter_pokemon/model/pokedex.dart';

class PokemonDetail extends StatelessWidget {
  Pokemon pokemon;
  PokemonDetail({this.pokemon});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(backgroundColor:Colors.red,title: Text(pokemon.name,textAlign: TextAlign.center,),elevation: 0,),
      body: OrientationBuilder(builder: (context,orientation){
        if(orientation==Orientation.portrait){
          return dikeyBody(context);
        }else{
          return yatayBody(context);
        }
      },),
    );
  }
  Stack yatayBody(BuildContext context) {
    return Stack(
      children: [
        Positioned(height: MediaQuery.of(context).size.height*2/3,
          width: MediaQuery.of(context).size.width-20,
          left: 10,
          top: MediaQuery.of(context).size.height*0.1, child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 80,
                ),
                Text(pokemon.name,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                Text("Height : "+pokemon.height,/*style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold*/),
                Text("Weight : "+pokemon.weight,/*style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),*/),
                Text("Types ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),/*+pokemon.type.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),*/),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.type.map((tip) => Chip(backgroundColor:Colors.deepOrange.shade300,label: Text(tip,style: TextStyle(color: Colors.white),))).toList(),
                ),
                Text("Next Evolution",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.nextEvolution!=null? pokemon.nextEvolution.map((evolution) => Chip(backgroundColor:Colors.deepOrange.shade300,label: Text(evolution.name,style: TextStyle(color: Colors.white),))).toList():[Text("Last Evolution",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)],
                ),
                Text("Weaknesses",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.weaknesses!=null? pokemon.weaknesses.map((weakness) => Chip(backgroundColor:Colors.deepOrange.shade300,label: Text(weakness,style: TextStyle(color: Colors.white),))).toList():[Text("There is no Weakness",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)],
                )

              ],
            ),
          ),),
        Align(
          alignment: Alignment.topCenter,
          child:Hero(tag: pokemon.img,child: Container(
            width: 200,
            height: 160,
            child: Image.network(pokemon.img,fit: BoxFit.contain,),
          ),) ,
        )
      ],
    );
  }
  Stack dikeyBody(BuildContext context) {
    return Stack(
      children: [
        Positioned(height: MediaQuery.of(context).size.height*2/3,
          width: MediaQuery.of(context).size.width-20,
          left: 10,
          top: MediaQuery.of(context).size.height*0.1, child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 80,
                ),
                Text(pokemon.name,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                Text("Height : "+pokemon.height,/*style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold*/),
                Text("Weight : "+pokemon.weight,/*style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),*/),
                Text("Types ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),/*+pokemon.type.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),*/),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.type.map((tip) => Chip(backgroundColor:Colors.deepOrange.shade300,label: Text(tip,style: TextStyle(color: Colors.white),))).toList(),
                ),
                Text("Next Evolution",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.nextEvolution!=null? pokemon.nextEvolution.map((evolution) => Chip(backgroundColor:Colors.deepOrange.shade300,label: Text(evolution.name,style: TextStyle(color: Colors.white),))).toList():[Text("Last Evolution",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)],
                ),
                Text("Weaknesses",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.weaknesses!=null? pokemon.weaknesses.map((weakness) => Chip(backgroundColor:Colors.deepOrange.shade300,label: Text(weakness,style: TextStyle(color: Colors.white),))).toList():[Text("There is no Weakness",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)],
                )

              ],
            ),
          ),),
        Align(
          alignment: Alignment.topCenter,
          child:Hero(tag: pokemon.img,child: Container(
            width: 200,
            height: 160,
            child: Image.network(pokemon.img,fit: BoxFit.contain,),
          ),) ,
        )
      ],
    );
  }
}
