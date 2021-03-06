import 'package:coffee_house/coffee_card.dart';
import 'package:coffee_house/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final colorPalette = ColorPalette();
  var _selectedOption = 0;
  List navs = [
    ColdBrew(),
    Text('Yes THESE NAVBARS DO WORK!'),
    ColdBrew(),
    Text('Yes THESE NAVBARS DO WORK!'),
    ColdBrew(),
  ];

  List selIndx = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      children: [
        Container(
            height: size.height, width: size.width, color: Colors.transparent),
        Container(
            height: size.height,
            width: size.width / 5,
            color: colorPalette.leftBarColor),
        Positioned(
            left: size.width / 5,
            child: Container(
              height: size.height,
              width: size.width - (size.width / 5),
              color: Colors.white,
            )),
        Positioned(top: 35.0, left: 20.0, child: Icon(Feather.menu)),
        Positioned(top: 35.0, right: 20.0, child: Icon(Feather.shopping_bag)),
        Positioned(
            top: size.height - (size.height - 100.0),
            left: (size.width / 5) + 25.0,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('CoffeeHouse',
                  style: TextStyle(
                      fontFamily: 'BigShldr',
                      color: Color(0xFF23163D),
                      fontSize: 40.0)),
              Text('A lot can happen over coffee',
                  style: TextStyle(
                      fontFamily: 'BigShldr',
                      color: Color(0xFFA59FB0),
                      fontSize: 15.0)),
              SizedBox(height: 20.0),
              Container(
                height: 40.0,
                width: 225.0,
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    contentPadding: EdgeInsets.only(top: 10.0, left: 10.0),
                    hintText: 'search...',
                    hintStyle: TextStyle(
                        fontFamily: 'BigShldr',
                        color: Colors.grey.withOpacity(0.4),
                        fontSize: 15.0),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.withOpacity(0.4),
                    ),
                  ),
                ),
              )
            ])),
        _buildSideNav(),
        Positioned(
            top: (size.height / 3.5) + 0,
            left: (size.width / 5) + 25.0,
            child: Container(
                height: size.height - ((size.height / 3) + 0.0),
                width: size.width - ((size.width / 5) + 40.0),
                child: navs[_selectedOption]))
      ],
    ));
  }

  _buildSideNav() {
    return Positioned(
      top: 75.0,
      child: RotatedBox(
        quarterTurns: 3,
        child: Container(
          width: MediaQuery.of(context).size.height - 100.0,
          height: MediaQuery.of(context).size.width / 5,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SizedBox(
              width: MediaQuery.of(context).size.height / 100,
            ),
            _buildNavOpt('Black Gold', 0),
            _buildNavOpt('Cold Brew', 1),
            _buildNavOpt('Nescafe', 2),
            _buildNavOpt('McCafe', 3),
            _buildNavOpt('Gold Brew', 4),
          ]),
        ),
      ),
    );
  }

  _buildNavOpt(String title, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 8.0,
          width: 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selIndx[index] ? Color(0xFF23163D) : Colors.transparent,
          ),
        ),
        SizedBox(height: 5.0),
        GestureDetector(
            onTap: () {
              setState(() {
                _selectedOption = index;
                isOptSel(index);
              });
            },
            child: Text(title,
                style: TextStyle(
                    fontFamily: 'BigShldr',
                    color:
                        selIndx[index] ? Color(0xFF23163D) : Color(0xFFA59FB0),
                    fontSize: 18.0)))
      ],
    );
  }

  isOptSel(index) {
    var previousIndex = selIndx.indexOf(true);
    selIndx[index] = true;
    selIndx[previousIndex] = false;
  }
}
