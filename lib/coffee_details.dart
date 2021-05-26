import 'package:coffee_house/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CoffeeDetails extends StatefulWidget {
  final img, itemColor;
  CoffeeDetails({this.img, this.itemColor});
  @override
  _CoffeeDetailsState createState() => _CoffeeDetailsState();
}

class _CoffeeDetailsState extends State<CoffeeDetails> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(children: [
      Container(
          height: size.height,
          width: size.width,
          color: ColorPalette().leftBarColor),
      Container(
        height: size.height / 1.95,
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
            ),
            color: Colors.white),
      ),
      Container(
        height: (size.height / 3.3),
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          ),
          color: widget.itemColor.withOpacity(0.9),
        ),
      ),
      Positioned(
        top: 35.0,
        left: 20.0,
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      Positioned(
        top: 35.0,
        right: 20.0,
        child: Icon(
          Feather.shopping_bag,
          color: Colors.white,
        ),
      ),
      Positioned(
        top: (size.height / 12),
        left: size.width / 2 - size.height / 6.6,
        child: Hero(
          tag: widget.img,
          child: Image(
              image: AssetImage(widget.img),
              height: size.height / 3.3,
              width: size.height / 3.3,
              fit: BoxFit.cover),
        ),
      ),
      Positioned(
        top: (size.height / 2.5),
        left: size.width / 2 - 120,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Grady\s COLD BREW',
                style: TextStyle(
                    fontFamily: 'BigShldr',
                    color: Color(0xFF23163D),
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                    fontSize: 22.0),
              ),
              SizedBox(height: 10.0),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Feather.user),
                SizedBox(width: 10.0),
                Text(
                  '1.5k',
                  style: TextStyle(
                      fontFamily: 'BigShldr',
                      color: ColorPalette().firstSlice,
                      fontSize: 17.0),
                ),
                SizedBox(width: 15.0),
                Container(width: 1.0, height: 20.0, color: Colors.grey),
                SizedBox(width: 15.0),
                //Repeat the same block as above
                Icon(Feather.star),
                SizedBox(width: 15.0),
                Text(
                  '4.0',
                  style: TextStyle(
                      fontFamily: 'BigShldr',
                      color: ColorPalette().firstSlice,
                      fontSize: 17.0),
                ),
                SizedBox(width: 15.0),
                Container(
                  width: 1.0,
                  height: 20.0,
                  color: Colors.grey,
                ),
                SizedBox(width: 15.0),
                Icon(Feather.anchor),
                SizedBox(width: 15.0),
                Text(
                  'No. 1',
                  style: TextStyle(
                      fontFamily: 'BigShldr',
                      color: ColorPalette().firstSlice,
                      fontSize: 17.0),
                ),
              ])
            ],
          ),
        ),
      ),
      Positioned(
          top: size.height / 1.87,
          left: 25.0,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'About Us',
              style: TextStyle(
                  fontFamily: 'BigShldr',
                  color: Color(0xFF23163D),
                  fontWeight: FontWeight.w700,
                  fontSize: 34.0),
            ),
            SizedBox(height: 10.0),
            Container(
              width: size.width - 40.0,
              child: Text(
                'Cold brewed with chicory and a unique blend of spices for 20 hours, our concentrate is velvety-smooth and packed with flavor.',
                style: TextStyle(
                    fontFamily: 'BigShldr',
                    letterSpacing: 1,
                    color: Color.fromRGBO(178, 167, 182, 1),
                    fontSize: 15.0),
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              height: 150.0,
              width: size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildSimilarItem('\$65.00', size),
                  SizedBox(width: 20.0),
                  _buildSimilarItem('\$120.00', size),
                  SizedBox(width: 20.0)
                ],
              ),
            ),
            SizedBox(
              height: size.height / 40,
            ),
            Row(children: [
              Container(
                  height: 50.0,
                  width: size.width / 1.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: ColorPalette().buttonColor),
                  child: Center(
                      child: Text(
                    'BUY NOW',
                    style: TextStyle(
                        fontFamily: 'BigShldr',
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                        fontSize: 20.0),
                  ))),
              SizedBox(width: 25.0),
              Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                          color: ColorPalette().buttonColor, width: 2.0)),
                  child: Center(child: Icon(Feather.bookmark, size: 17.0)))
            ])
          ]))
    ]));
  }

  _buildSimilarItem(price, size) {
    return Stack(children: [
      Container(
          height: 125.0, width: size.width / 1.6, color: Colors.transparent),
      Positioned(
        top: 50.0,
        child: Container(
          height: 80.0,
          width: size.width / 1.6,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    blurRadius: 4.0,
                    spreadRadius: 2.0,
                    color: Colors.grey.withOpacity(0.2))
              ],
              color: Colors.white),
        ),
      ),
      Positioned(
        right: 1.0,
        child: Container(
          height: 120.0,
          width: 120.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/coffee3.png'), fit: BoxFit.cover),
          ),
        ),
      ),
      Positioned(
          left: 10.0,
          top: 60.0,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              price,
              style: TextStyle(
                  fontFamily: 'BigShldr',
                  letterSpacing: 1,
                  fontWeight: FontWeight.w700,
                  color: ColorPalette().firstSlice,
                  fontSize: 30.0),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'COLD BREW KIT',
              style: TextStyle(
                  fontFamily: 'BigShldr',
                  color: Color(0xFF23163D),
                  letterSpacing: 1,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0),
            )
          ]))
    ]);
  }
}
