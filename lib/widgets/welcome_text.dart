import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String initialCity = "Select City";
    return SizedBox(
      child: Stack(
        children: [
          Image.asset(
            'images/bkgrndapp.png',
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: 'Search here ...',
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(15),
                      child: SvgPicture.asset('assets/icons/search.svg'),
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        print('cities were tapped !!!');
                        DropdownSearch<String>(
                          //mode of dropdown
                          mode: Mode.DIALOG,
                          //to show search box
                          showSearchBox: true,
                          showSelectedItem: true,
                          //list of dropdown items
                          items: const [
                            "Islamabad",
                            "Lahore",
                            "Karachi",
                            "Peshawar",
                            "Abbotabad"
                          ],
                          label: "City",
                          onChanged: print,
                          //show selected item
                          selectedItem: "Islamabad",
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          initialCity.toString(),
                          softWrap: true,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(2)),
              ),
            ),
          )
        ],
      ),
    );

    // ;
    // return Container(
    //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.end,
    //         mainAxisSize: MainAxisSize.max,
    //         children: [
    //           Align(
    //             alignment: Alignment.topLeft,
    //             child: Image.asset(
    //               'images/bkgrndapp.png',
    //               width: 150,
    //             ),
    //           ),
    //         ],
    //       ),
    //       const Text(
    //         'TeamWork Property Exchange',
    //       ),
    //       // Consumer<DataBase>(builder: (context, value, child) {
    //       //   Future.delayed(Duration.zero, () {
    //       //     value.setDetailParam('hello Khurshid');
    //       //   });
    //       //   return Text(
    //       //     '${value.web_post_id}',
    //       //   );
    //       // }),
    //       const SizedBox(height: 10),
    //       Text(
    //         'Find the perfect value of your Property Exchange',
    //         style: Theme.of(context).textTheme.headline1!.copyWith(
    //             fontSize: 20,
    //             fontWeight: FontWeight.bold,
    //             color: Theme.of(context).secondaryHeaderColor),
    //       ),
    //     ],
    //   ),
    // );
  }
}
