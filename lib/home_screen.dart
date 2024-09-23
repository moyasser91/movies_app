import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/api_constant.dart';
import 'package:movies/movie_item.dart';
import 'package:movies/slider_popular.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String , dynamic >>popularList =[];
  List<Map<String , dynamic >>popularEgyList =[];
  List<Map<String , dynamic >>upComingList =[];
  List<Map<String , dynamic >>topRatedList =[];


 Future<void>popularUSA() async{
   var popularUsaResponse = await http.get(Uri.parse(ApiConstant.popularUSA));
   if(popularUsaResponse.statusCode == 200)
     {
       var popularUsaData = jsonDecode(popularUsaResponse.body);
       var popularJson = popularUsaData['results'];
       for(var i = 0 ; i < popularJson.length ; i++)
         {
           popularList.add({
             'id' : popularJson[i]['id'],
             'original_title' : popularJson[i]['original_title'],
             'poster_path' : popularJson[i]['poster_path'],
             'vote_average' : popularJson[i]['vote_average'],
           });
         }
     }
 }
  Future<void>popularEgypt() async{
    var popularEgyResponse = await http.get(Uri.parse(ApiConstant.popularEgypt));
    if(popularEgyResponse.statusCode == 200)
    {
      var popularEgyData = jsonDecode(popularEgyResponse.body);
      var popularEgyJson = popularEgyData['results'];
      for(var i = 0 ; i < popularEgyJson.length ; i++)
      {
        popularEgyList.add({
          'id' : popularEgyJson[i]['id'],
          'original_title' : popularEgyJson[i]['original_title'],
          'poster_path' : popularEgyJson[i]['poster_path'],
          'vote_average' : popularEgyJson[i]['vote_average'],
        });
      }
    }
  }
  Future<void>upComingUsa() async{
    var upComingUsaResponse = await http.get(Uri.parse(ApiConstant.upComingUSA));
    if(upComingUsaResponse.statusCode == 200)
    {
      var upComingUsaData = jsonDecode(upComingUsaResponse.body);
      var upComingJson = upComingUsaData['results'];
      for(var i = 0 ; i < upComingJson.length ; i++)
      {
        upComingList.add({
          'id' : upComingJson[i]['id'],
          'title' : upComingJson[i]['title'],
          'original_title' : upComingJson[i]['original_title'],
          'poster_path' : upComingJson[i]['poster_path'],
          'vote_average' : upComingJson[i]['vote_average'],
          'release_date' : upComingJson[i]['release_date'],
        });
      }
    }
  }
  Future<void>topRatedUSA () async{
    var topRatedUsaResponse = await http.get(Uri.parse(ApiConstant.topRatedUSA));
    if(topRatedUsaResponse.statusCode == 200)
    {
      var topRatedData = jsonDecode(topRatedUsaResponse.body);
      var topRatedJson = topRatedData['results'];
      for(var i = 0 ; i < topRatedJson.length ; i++)
      {
        topRatedList.add({
          'id' : topRatedJson[i]['id'],
          'title' : topRatedJson[i]['title'],
          'original_title' : topRatedJson[i]['original_title'],
          'poster_path' : topRatedJson[i]['poster_path'],
          'vote_average' : topRatedJson[i]['vote_average'],
          'release_date' : topRatedJson[i]['release_date'],
        });
      }
    }
  }

  int selectCountry = 1 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Padding(
        padding:  EdgeInsets.all(8.0),
        child: ListView(
          children:[ Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 28,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text('Popular',style: TextStyle(fontSize: 25,color: Colors.white),),
                 InkWell(
                   onTap: () {

                   },
                   child: Row(
                     children: [
                       SizedBox(width: 3,),
                       DropdownButton(
                         value: selectCountry ,
                         dropdownColor: Colors.black,
                         icon: Icon(Icons.arrow_drop_down_sharp,color: Colors.yellow,size: 28,),
                         onChanged: (value) {
                           setState(() {
                             popularList.clear();
                             selectCountry = int.parse(value.toString());
                           });
                         },
                           items: [
                             DropdownMenuItem(
                                 child: Text('USA',style: TextStyle(
                                     fontSize: 16,color: Colors.white)),
                               value: 1
                               ,),
                             DropdownMenuItem(
                               child: Text('Egypt',style: TextStyle(
                                   fontSize: 16,color: Colors.white)),
                               value: 2,
                             ),

                           ],
                           ),
                       //Icon(Icons.arrow_drop_down_sharp,color: Colors.white,size: 25,),
                       SizedBox(width: 3,),
                     ],
                   ),
                 )
               ],
             ),
              SizedBox(height: 20,),
              SliderPopular(listMovie: popularList, functionSelected: popularUSA),  /// CarouselSlider
              SizedBox(height: 17,),
              Text('New Relases',style: TextStyle(fontSize: 25,color: Colors.white),),
              SizedBox(height: 17,),
              MovieItem(futureFunction: upComingUsa , listMovie: upComingList),
              SizedBox(height: 17,),
              Text('Recomended',style: TextStyle(fontSize: 25,color: Colors.white),),
              SizedBox(height: 17,),
              MovieItem(futureFunction: topRatedUSA , listMovie: topRatedList),
              SizedBox(height: 17,),
              Text('Other',style: TextStyle(fontSize: 25,color: Colors.white),),
              SizedBox(height: 17,),
              MovieItem(futureFunction: popularEgypt , listMovie: popularEgyList),

            ],
          )
          ],),
      ),
    );
  }
}