import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_work/pages/Property/Addproperty.dart';
import 'package:team_work/pages/auth/register.dart';
import 'package:team_work/pages/home/widget/city.dart';
import 'package:team_work/pages/home/widget/projects.dart';
import 'package:team_work/widgets/Drawer.dart';
import 'package:team_work/widgets/best_offer.dart';
import 'package:team_work/widgets/propertyType.dart';
import 'package:team_work/widgets/recommended_house.dart';
import 'package:team_work/widgets/search_input.dart';
import 'package:flutter_svg/svg.dart';
import 'package:team_work/widgets/welcome_text.dart';
import '../../models/database.dart';
import '../../widgets/custom_bottom_navigation_bar.dart';
import '../auth/users.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<DataBase>();
    dbclass.getUsername();
    Future<dynamic> makme() async {
      String usern = await dbclass.getUsername();
      if (usern == 'hassan') {
        print('yes');
      } else {
        print(usern);
      }
    }

    makme();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Image(
            image: AssetImage('images/teamWrkNew.png'),
            width: 120,
          ),
          leading: IconButton(
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
              color: Colors.purple,
            ),
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                if (dbclass.getUsername().isEmpty) {
                  print(dbclass.getUsername());
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const Register()));
                } else {
                  print(dbclass.getUsername());
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => const users()));
                }
              },
              child: const Icon(
                Icons.account_circle_rounded,
                size: 40,
                color: Colors.purple,
              ),
            )
          ],
        ),
        drawer: const Mydrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              WelcomeText(),
              // SearchInput(),
              PropertyType(),
              RecommendedHouse(),
              Listing(),
              City(),
              Projects()
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Stack(
          children: [
            Positioned(
              left: MediaQuery.of(context).size.width / 2.1,
              bottom: 23,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 5),
                    color: Colors.purple),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Addproperty()));
                  },
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (int i) {},
            backgroundColor: Colors.white,
            currentIndex: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.purple,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.more_horiz),
                label: 'More',
              ),
              // Mybottom(),
            ])
        // Mybottom(),
        );
  }
}
