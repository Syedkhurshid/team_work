import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:team_work/models/house.dart';
import 'package:team_work/widgets/circle_icon_button.dart';

import '../models/database.dart';

class BestOffer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    context.read<DataBase>().fetchProjects;
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
    itemCount: value.map['projects'].length,
    itemBuilder: (context, index) {
    return Offers(
    map: value.map['projects'][index]);
    });
    },
    ),
    ),
    );
  }
}

class Offers extends StatelessWidget {
  const Offers({Key? key, required this.map}) : super(key: key);
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
    // child: Column(
    // children: [
    // Row(
    //
    // children: [
    // Text(
    // 'Best Offer',
    // style: Theme.of(context)
    //     .textTheme
    //     .headline1!
    //     .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
    // ),
    //
    // ],
    // ),
    // SizedBox(height: 10),
    // Row(
    //   children: [
    //   Card(
    //   elevation: 10,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //
    //       Container(
    //
    //
    //         decoration: BoxDecoration(
    //
    //           color: Colors.white, borderRadius: BorderRadius.circular(8),
    //         ),
    //
    //         child: Stack(
    //           children: [
    //
    //             Container(
    //               height: 100,
    //               width: 250,
    //
    //
    //
    //               child: CachedNetworkImage(
    //                 progressIndicatorBuilder: (context, url, progress) =>
    //                     Center(
    //                       child: CircularProgressIndicator(
    //                         value: progress.progress,
    //                       ),
    //                     ),
    //                 imageUrl: (map['image_link']),fit: BoxFit.cover,
    //
    //
    //               ),
    //             ),
    //
    //            Positioned(
    //              bottom: 0,
    //              top: 0,
    //              left: 0,
    //              right: 0,
    //              child: Container(
    //                decoration: BoxDecoration(
    //                  color: Colors.purple
    //
    //                ),
    //                child: Center(child: Text(map['ribbon'],style: TextStyle(color: Colors.white),),
    //
    //                ),
    //              ),
    //            )
    //
    //
    //           ],
    //         ),
    //       ),
    //       Column(
    //         children: [
    //           SizedBox(height: 20),
    //           Text(map['title'],style: TextStyle(fontWeight:FontWeight.bold,color: Colors.purple),)
    //         ],
    //       ),
    //       Column(
    //         children: [Row(
    //           children: [
    //
    //             Icon(Icons.location_pin,color: Colors.black,),
    //             Text(map['title'])
    //
    //           ],
    //         )
    //
    //         ],
    //       )
    //       // ),
    //     ],
    //   ),
    //
    // )]
    //
    //
    //
    //
    // )
    //
    //
    //
    //
    //
    //
    // ]));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Our Projects',
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),

            ],
          ),
          SizedBox(height: 10),
          Card(
    elevation: 10,
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

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
    imageUrl: (map['image_link']),fit: BoxFit.cover,


    ),
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


    Container(
    width: 150,


    decoration: BoxDecoration(

    color: Colors.purple
    ),
    child: Center(
    child: Row(children: [
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(map['ribbon'],style: TextStyle(color: Colors.white)),
    ),

    ]),
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

    Text(map['type'],style: TextStyle(fontWeight:FontWeight.bold,color: Colors.purple),)
    ],
    ),
    Column(
    children: [Row(
    children: [


    Text(map['title'])

    ],
    )

    ],
    )
    // ),
    ],
    ),

    )




        ],
      ),
    );

  }


}
