import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_work/pages/home/widget/search_input.dart';

class Addproperty extends StatelessWidget {
  const Addproperty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(40))
          ),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: Stack(

              fit: StackFit.loose,

              children: [
                Image.network(
                    'https://www.uky.edu/hr/sites/www.uky.edu.hr/files/styles/slideshow_large/public/iStock-1187581124_0.jpg?itok=9sfxzvm5'),
                Positioned(
                    top: 90,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Post an Add',
                              style: GoogleFonts.ubuntu(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              'Reach Thousand of Buyers \n and tenants in a few steps',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.ubuntu(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))
                        ]))
              ],
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.transparent, width: 5),
                  color: Colors.transparent),
              child: const Icon(
                Icons.check_circle_sharp,
              ),
            ),
            const Text(
              ' Purpose',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,


            children: [
             Chip(
                 backgroundColor:Colors.black12,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    label: const Text(
                      "Sale",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
              Container(
                width: 10,
              ),

              Chip(
                      backgroundColor:Colors.black12,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      label: const Text(
                        "Exchange",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ))
            ]),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.transparent, width: 5),
                  color: Colors.transparent),
              child: const Icon(
                Icons.landscape,
              ),
            ),
            const Text(
              ' Select Property Type',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,


            children: [
              Chip(
                  backgroundColor:Colors.black12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  label: const Text(
                    "Residential",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
              Container(
                width: 10,
              ),

              Chip(
                  backgroundColor:Colors.black12,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  label: const Text(
                    "Commercial",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ))
            ]),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.transparent, width: 5),
                  color: Colors.transparent),
              child: const Icon(
                Icons.location_on_rounded,
              ),
            ),
            const Text(
              ' City',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38),
            )
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left
                  : 30),
              child: Text('City Name'),
            ),
            Spacer(),
            Icon(Icons.arrow_right)
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.transparent, width: 5),
                    color: Colors.transparent),
                child: const Icon(
                  Icons.my_location_rounded,
                ),
              ),





            Padding(
              padding: const EdgeInsets.only(right
                  : 30),
              child: Text('Location'),
            ),
            Spacer(),
            Icon(Icons.arrow_right)
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.transparent, width: 5),
                  color: Colors.transparent),
              child: const Icon(
                Icons.check_box_outline_blank,
              ),
            ),
            const Text(
              ' Area Size',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left
              : 30),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter Area Size',

              suffixIcon: Icon(Icons.arrow_drop_down)
            ),
          )
        ),
        SizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.transparent, width: 5),
                  color: Colors.transparent),
              child: const Icon(
                Icons.tag,
              ),
            ),
            const Text(
              '  Total price',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38),
            )
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(left
                : 30),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Total price',

                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text('PKR'),
                  )
              ),
            )
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.transparent, width: 5),
                  color: Colors.transparent),
              child: const Icon(
                Icons.format_size,
              ),
            ),
            const Text(
              '  Property Title',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38),
            )
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(left
                : 30),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: 'Enter Title e.g beautiful new house',


              ),
            )
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.transparent, width: 5),
                  color: Colors.transparent),
              child: const Icon(
                Icons.list,
              ),
            ),
            const Text(
              '  Property Discription',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38),
            )
          ],
        ),
        Padding(
            padding: const EdgeInsets.only(left
                : 30),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Describe Your Property in details ',


              ),
            )
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.transparent, width: 5),
                  color: Colors.transparent),
              child: const Icon(
                Icons.image,
              ),
            ),
            const Text(
              '  Upload image of Your Property',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38),
            )
          ],
        ),
        Column(
          children: [
            Chip(
                backgroundColor:Colors.black12,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                label: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [ Icon(Icons.image),const Text(
                    "Upload Image",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ])),
            Container(
              width: 10,
            ),

            Chip(
                backgroundColor:Colors.black12,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                label: Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt),
                    const Text(
                    " from camera",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ]))
          ],
        ),
        Divider(),
        Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [


            ElevatedButton(onPressed: (){}, child: Text('Post Ad'),
            style: ElevatedButton.styleFrom(
              primary: Colors.purple
            ),),

          ],
        ),





    ]
    )

    ));
  }
}
