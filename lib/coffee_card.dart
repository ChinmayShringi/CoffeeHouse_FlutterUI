import 'package:coffee_house/coffee_details.dart';
import 'package:coffee_house/main.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ColdBrew extends StatefulWidget {
  @override
  _ColdBrewState createState() => _ColdBrewState();
}

class _ColdBrewState extends State<ColdBrew> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView(children: [
          SizedBox(
            height: 10,
          ),
          buildListItem(
              'assets/coffee4.png', '150', ColorPalette().secondSlice, size),
          buildListItem(
              'assets/coffee2.png', '200', ColorPalette().firstSlice, size)
        ]));
  }

  buildListItem(String imgPath, String price, Color bgColor, var size) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                CoffeeDetails(imgPath: imgPath, headerColor: bgColor)));
      },
      child: Stack(
        children: [
          Container(
            height: 300.0,
            width: 250.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.transparent),
          ),
          Positioned(
            top: 70.0,
            child: Container(
              height: 210.0,
              width: 250.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: bgColor.withOpacity(0.9),
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            right: 0,
            child: Hero(
              tag: imgPath,
              child: Container(
                height: 170.0,
                width: 170.0,
                child: Image(image: AssetImage(imgPath), fit: BoxFit.scaleDown),
              ),
            ),
          ),
          Positioned(
            top: 90.0,
            left: 15.0,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Price',
                style: TextStyle(
                    fontFamily: 'BigShldr',
                    color: Color(0xFF23163D),
                    fontSize: 20.0),
              ),
              Text(
                '\$' + price,
                style: TextStyle(
                    fontFamily: 'BigShldr',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 45.0),
              ),
              SizedBox(height: 20.0),
              Text(
                'Grady\'s COLD BREW',
                style: TextStyle(
                    fontFamily: 'BigShldr',
                    color: Color(0xFF23163D),
                    fontWeight: FontWeight.bold,
                    fontSize: 27.0),
              ),
              SizedBox(height: 2.0),
              Container(
                width: 200.0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '65 reviews',
                              style: TextStyle(
                                  fontFamily: 'BigShldr',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontSize: 15.0),
                            ),
                            SmoothStarRating(
                                starCount: 5,
                                size: 15.0,
                                color: Colors.white,
                                borderColor: Colors.white,
                                rating: 3.0)
                          ]),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 75.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: Colors.white,
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add, size: 17.0),
                                SizedBox(width: 5.0),
                                Text(
                                  'Add',
                                  style: TextStyle(
                                      // fontFamily: 'BigShldr',
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF23163D),
                                      fontSize: 15.0),
                                ),
                              ]),
                        ),
                      ),
                    ]),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
