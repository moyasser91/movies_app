
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderPopular extends StatelessWidget {
  Function functionSelected ;
  List listMovie ;


  SliderPopular({required this.listMovie , required this.functionSelected});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:functionSelected(),
      builder: (context, snapshot) {
        if(snapshot.connectionState== ConnectionState.done){
          return CarouselSlider(
              items: listMovie.map((i){
                return Builder(builder:(context){
                  return GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*.4,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(20),
                        image: DecorationImage(
                            image:NetworkImage('https://image.tmdb.org/t/p/w500${i['poster_path']}'),
                            fit: BoxFit.fill),

                      ),
                    ),
                  );
                });
              }).toList(),
              options: CarouselOptions(
                  viewportFraction: 1 ,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  height: MediaQuery.of(context).size.height*.3
              ));
        }else{
          return Container(
            height: MediaQuery.of(context).size.height*.3,
            child: Center(
                child: CircularProgressIndicator(
                  color: Colors.yellow,
                )),
          );

        }
      },);
  }
}
