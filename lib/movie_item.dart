import 'package:flutter/material.dart';

class MovieItem extends StatelessWidget {
  Function futureFunction;
  List listMovie ;
   MovieItem({required this.futureFunction , required this.listMovie});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureFunction(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listMovie.length,
              itemBuilder: (context, index) {
                final i = listMovie[index];
                return GestureDetector(
                  onTap: () {

                  },
                  child: Column(
                      children:[ Expanded(
                        child: Stack(children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            margin: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage('https://image.tmdb.org/t/p/w500${i['poster_path']}'),

                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          InkWell(
                              onTap:() {

                              },
                              child: Icon(Icons.favorite_outline_sharp,size: 30,color: Colors.grey,))
                        ],),
                      ),
                        SizedBox(height: 7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.star,size: 19,color: Colors.yellow,),
                            SizedBox(width: 5,),
                            Text(
                              '${i['vote_average'] ?? '4.7'}',
                              style: TextStyle(fontSize: 18, color: Colors.grey), ),
                            SizedBox(width: 15,),
                            Text(
                              '${i['release_date'] ?? '05-02'}',
                              style: TextStyle(fontSize: 13, color: Colors.grey), ),
                          ],),
                        Text(
                          '${i['title'] ?? 'Movies'}',
                          style: TextStyle(fontSize: 18, color: Colors.white70), ),

                      ]),
                );
              },
            ),
          );}
        else {
          return  Container(
            height: MediaQuery.of(context).size.height*.2,
            child: Center(
                child: CircularProgressIndicator(
                  color: Colors.yellow,
                )),
          );
        }
      },
    );
  }
}
