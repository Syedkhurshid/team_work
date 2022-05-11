import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_work/models/database.dart';
import 'package:team_work/models/house.dart';
import 'package:team_work/pages/detail/detail.dart';
import 'package:team_work/widgets/circle_icon_button.dart';
import 'package:google_fonts/google_fonts.dart';

//
class RecommendedHouse extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    context.read<DataBase>().fetchFeatured;
    return Container(
      padding: EdgeInsets.all(15),
      height: 340,
      child: RefreshIndicator(
        onRefresh: () async {},
        child: Consumer<DataBase>(
          builder: (context, value, child) {
            return value.map.length == 0 && !value.error
                ? CircularProgressIndicator()
                : value.error
                    ? Text(
                        'Oops, something went wrong .${value.errorMessage}',
                        textAlign: TextAlign.center,
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.mapFeatured['web_posts'].length,
                        itemBuilder: (context, index) {
                          return FeaturedCard(
                              map: value.mapFeatured['web_posts'][index]);
                        },
                      );
            // return ListView.separated(
            //     scrollDirection: Axis.horizontal,
            //     itemBuilder: (context, index) => GestureDetector(
            //           onTap: () {
            //             Navigator.of(context)
            //                 .push(MaterialPageRoute(builder: (context) {
            //               return DetailPage(house: recommendedList[index]);
            //             }));
            //           },
            //           child: Container(
            //             width: 230,
            //             padding: EdgeInsets.all(10),
            //             decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 borderRadius: BorderRadius.circular(8)),
            //             child: Stack(
            //               children: [
            //                 Container(
            //                   decoration: BoxDecoration(
            //                       image: DecorationImage(
            //                           image: AssetImage(
            //                             recommendedList[index].imageUrl,
            //                           ),
            //                           fit: BoxFit.cover)),
            //                 ),
            //                 Positioned(
            //                   right: 15,
            //                   top: 15,
            //                   child: CircleIconButton(
            //                       iconUrl: 'assets/icons/mark.svg',
            //                       color: Theme.of(context).accentColor),
            //                 ),
            //                 Positioned(
            //                     bottom: 0,
            //                     left: 0,
            //                     right: 0,
            //                     child: Container(
            //                       color: Colors.white54,
            //                       padding: EdgeInsets.all(10),
            //                       child: Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           Column(
            //                             crossAxisAlignment:
            //                                 CrossAxisAlignment.start,
            //                             children: [
            //                               Text(recommendedList[index].name,
            //                                   style: Theme.of(context)
            //                                       .textTheme
            //                                       .headline1!
            //                                       .copyWith(
            //                                           fontSize: 16,
            //                                           fontWeight:
            //                                               FontWeight.bold)),
            //                               SizedBox(
            //                                 height: 5,
            //                               ),
            //                               Text(
            //                                 recommendedList[index].address,
            //                                 style: Theme.of(context)
            //                                     .textTheme
            //                                     .bodyText1!
            //                                     .copyWith(
            //                                         fontSize: 12,
            //                                         fontWeight: FontWeight.bold),
            //                               )
            //                             ],
            //                           ),
            //                           CircleIconButton(
            //                               iconUrl: 'assets/icons/mark.svg',
            //                               color: Theme.of(context).accentColor)
            //                         ],
            //                       ),
            //                     ))
            //               ],
            //             ),
            //           ),
            //         ),
            //     separatorBuilder: (_, index) => SizedBox(width: 20),
            //     itemCount: recommendedList.length);
            // }),
          },
        ),
      ),
    );
  }
}

class FeaturedCard extends StatelessWidget {
  const FeaturedCard({Key? key, required this.map}) : super(key: key);
  final Map<String, dynamic> map;
  @override
  Widget build(BuildContext context) {
    return  Card(
        elevation: 10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('this ?'),
            // Image.network('https://teamworkpk.com/${map['primary_image']}'),
            Container(


              decoration: BoxDecoration(

                  color: Colors.white, borderRadius: BorderRadius.circular(8),
              ),

              child: Stack(
                children: [

                  Container(
                    height: 200,
                    width: 350,



                    child: CachedNetworkImage(
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,
                        ),
                      ),
                     imageUrl: (map['primary_image']),fit: BoxFit.cover,
                          

                    ),
                  ),
                  Positioned(
                    right: 18,
                    top: 15,
                    child: Text('Featured',style: GoogleFonts.macondo(color: Colors.purple,fontWeight:FontWeight.bold),),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        color: Colors.white54,
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  map['price']+"PKR",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                      fontSize: 20, fontWeight: FontWeight.bold),),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: 120,
                                  
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                    color: Colors.purple
                                  ),
                                  child: Center(
                                    child: Row(children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(map['city'],style: TextStyle(color: Colors.white)),
                                      ),
                                 Icon(   Icons.location_pin,color: Colors.white,)]
                                  ),
                                )
                  )],
                            ),
                            
                          ],
                        ),
                      )),

                ],
              ),
            ),
            Column(
              children: [
                SizedBox(height: 20),
                Text(map['title'],style: TextStyle(fontWeight:FontWeight.bold,color: Colors.purple),)
              ],
            ),
            Column(
              children: [Row(
                children: [

                Icon(Icons.location_pin,color: Colors.black,),
                  Text(map['title'])

                ],
              )

              ],
            )
            // ),
          ],
        ),

      );

  }
}
