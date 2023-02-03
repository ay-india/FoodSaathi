import 'package:flutter/material.dart';

class UserAccount extends StatelessWidget {
  const UserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 13, right: 14, top: 4),
        margin: EdgeInsets.only(top: 37),
        color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(30),
              height: 300,
              color: Colors.yellow,
              width: double.infinity,
              child: Column(
                children: [
                  CircleAvatar(
                    // child: Image.asset('asset/images/pizza.jpeg'),
                    radius: 66,
                    backgroundImage: AssetImage('asset/images/pizza.jpeg'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
// import 'dart:math' as math;

// import 'package:flutter_svg/svg.dart';
// class UserAccount extends StatelessWidget {
//   const UserAccount({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: 302.9127197265625,
//         height: 526.3701171875,

//         child: Stack(
//           children: <Widget>[
//             Positioned(
//           top: 44.3701171875,
//           left: 85.9127197265625,
//           child: Container(
//           width: 131,
//           height: 124,
//           decoration: BoxDecoration(
//             color : Color.fromRGBO(217, 217, 217, 1),
//         image : DecorationImage(
//             image: AssetImage('assets/images/Ellipse2.png'),
//             fit: BoxFit.fitWidth
//         ),
//         borderRadius : BorderRadius.all(Radius.elliptical(131, 124)),
//       )
//         )
//         ),Positioned(
//           top: 177.3701171875,
//           left: 104.9127197265625,
//           child: Text('Ashish', textAlign: TextAlign.center, style: TextStyle(
//           color: Color.fromRGBO(0, 0, 0, 1),
//           fontFamily: 'Inter',
//           fontSize: 17,
//           letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//           fontWeight: FontWeight.normal,
//           height: 1
//         ),)
//         ),Positioned(
//           top: 204.3701171875,
//           left: 77.9127197265625,
//           child: Text('+919142552948', textAlign: TextAlign.center, style: TextStyle(
//           color: Color.fromRGBO(0, 0, 0, 1),
//           fontFamily: 'Inter',
//           fontSize: 17,
//           letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//           fontWeight: FontWeight.normal,
//           height: 1
//         ),)
//         ),Positioned(
//           top: 252.3701171875,
//           left: 10.9127197265625,
//           child: Text('My Profile', textAlign: TextAlign.left, style: TextStyle(
//           color: Color.fromRGBO(0, 0, 0, 1),
//           fontFamily: 'Inter',
//           fontSize: 12,
//           letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//           fontWeight: FontWeight.normal,
//           height: 1
//         ),)
//         ),Positioned(
//           top: 414.3701171875,
//           left: 10.9127197265625,
//           child: Text('Contact Us', textAlign: TextAlign.left, style: TextStyle(
//           color: Color.fromRGBO(0, 0, 0, 1),
//           fontFamily: 'Inter',
//           fontSize: 12,
//           letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//           fontWeight: FontWeight.normal,
//           height: 1
//         ),)
//         ),Positioned(
//           top: 387.3701171875,
//           left: 10.9127197265625,
//           child: Text('About Us', textAlign: TextAlign.left, style: TextStyle(
//           color: Color.fromRGBO(0, 0, 0, 1),
//           fontFamily: 'Inter',
//           fontSize: 12,
//           letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//           fontWeight: FontWeight.normal,
//           height: 1
//         ),)
//         ),Positioned(
//           top: 360.3701171875,
//           left: 10.9127197265625,
//           child: Text('Notification', textAlign: TextAlign.left, style: TextStyle(
//           color: Color.fromRGBO(0, 0, 0, 1),
//           fontFamily: 'Inter',
//           fontSize: 12,
//           letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//           fontWeight: FontWeight.normal,
//           height: 1
//         ),)
//         ),Positioned(
//           top: 333.3701171875,
//           left: 10.9127197265625,
//           child: Text('My Voucher', textAlign: TextAlign.left, style: TextStyle(
//           color: Color.fromRGBO(0, 0, 0, 1),
//           fontFamily: 'Inter',
//           fontSize: 12,
//           letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//           fontWeight: FontWeight.normal,
//           height: 1
//         ),)
//         ),Positioned(
//           top: 306.3701171875,
//           left: 10.9127197265625,
//           child: Text('Payment Settings', textAlign: TextAlign.left, style: TextStyle(
//           color: Color.fromRGBO(0, 0, 0, 1),
//           fontFamily: 'Inter',
//           fontSize: 12,
//           letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//           fontWeight: FontWeight.normal,
//           height: 1
//         ),)
//         ),Positioned(
//           top: 279.3701171875,
//           left: 10.9127197265625,
//           child: Text('Change Password', textAlign: TextAlign.left, style: TextStyle(
//           color: Color.fromRGBO(0, 0, 0, 1),
//           fontFamily: 'Inter',
//           fontSize: 12,
//           letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//           fontWeight: FontWeight.normal,
//           height: 1
//         ),)
//         ),Positioned(
//           top: 486.3701171875,
//           left: 33.9127197265625,
//           child: Container(
//           width: 260,
//           height: 40,
//           decoration: BoxDecoration(
//             borderRadius : BorderRadius.only(
//               topLeft: Radius.circular(14),
//               topRight: Radius.circular(14),
//               bottomLeft: Radius.circular(14),
//               bottomRight: Radius.circular(14),
//             ),
//         color : Color.fromRGBO(217, 217, 217, 1),
//       )
//         )
//         ),Positioned(
//           top: 493.3701171875,
//           left: 116.9127197265625,
//           child: Text('Sign out', textAlign: TextAlign.left, style: TextStyle(
//           color: Color.fromRGBO(0, 0, 0, 1),
//           fontFamily: 'Inter',
//           fontSize: 22,
//           letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
//           fontWeight: FontWeight.normal,
//           height: 1
//         ),)
//         ),Positioned(
//           top: 254.3701171875,
//           left: 293.9127197265625,
//           child: SvgPicture.asset(
//           'assets/images/vector.svg',
//           semanticsLabel: 'vector'
//         )
//         ),Positioned(
//           top: 254.3701171875,
//           left: 293.9127197265625,
//           child: SvgPicture.asset(
//           'assets/images/vector.svg',
//           semanticsLabel: 'vector'
//         ),
//         ),Positioned(
//           top: 280.3701171875,
//           left: 293.9127197265625,
//           child: SvgPicture.asset(
//           'assets/images/vector.svg',
//           semanticsLabel: 'vector'
//         ),
//         ),Positioned(
//           top: 254.3701171875,
//           left: 293.9127197265625,
//           child: SvgPicture.asset(
//           'assets/images/vector.svg',
//           semanticsLabel: 'vector'
//         ),
//         ),Positioned(
//           top: 309.3701171875,
//           left: 293.9127197265625,
//           child: SvgPicture.asset(
//           'assets/images/vector.svg',
//           semanticsLabel: 'vector'
//         ),
//         ),Positioned(
//           top: 336.3701171875,
//           left: 293.9127197265625,
//           child: SvgPicture.asset(
//           'assets/images/vector.svg',
//           semanticsLabel: 'vector'
//         ),
//         ),Positioned(
//           top: 360.3701171875,
//           left: 293.9127197265625,
//           child: SvgPicture.asset(
//           'assets/images/vector.svg',
//           semanticsLabel: 'vector'
//         ),
//         ),Positioned(
//           top: 17,
//           left: 11,
//           child: Transform.rotate(
//           angle: 180 * (math.pi / 180),
//           child: SvgPicture.asset(
//           'assets/images/vector.svg',
//           semanticsLabel: 'vector'
//         ),
//         ),
//         ),
//           ]
//         )
//       ),
//     );
//   }
// }
