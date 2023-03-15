import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[TopProfile(), MidProfile(), BottomDocProfile()],
    ));
  }
}

class TopProfile extends StatelessWidget {
  const TopProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Container(
          //margin: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 100.0),
          padding: EdgeInsets.all(20.0),
          width: 390,
          height: 437,
          alignment: Alignment.topRight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: Color(0xff4D0E0255),
          ),
          child: (Icon(Icons.edit)),
        ),
        Positioned(
            left: 140.0,
            top: 150.0,
            child: CircleAvatar(
              backgroundImage: AssetImage(
                'assets/doctor.png',
              ),
              radius: 40.0,
            )),
        Positioned(
            left: 130.0,
            top: 240.0,
            child: Text(
              'Presha Klin',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color(0xff0E0255)),
            )),
        Positioned(
            left: 130.0,
            top: 280.0,
            child: Text(
              'Family Doctor',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  backgroundColor: Colors.white,
                  color: Color(0xff0E0255)),
            )),
      ]),
    );
  }
}

class MidProfile extends StatelessWidget {
  const MidProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Area of Specialisation',
            style: TextStyle(
                color: Color(0xFF0E0255),
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
          Container(
            width: 345,
            height: 132,
            margin: EdgeInsets.symmetric(vertical: 20.0),
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            decoration: BoxDecoration(
                color: Color(0xff4DC12604),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Text(
              'Dr. Presha Klin is a highly skilled and experienced medical professional with a passion for providing exceptional patient care. With over 10 years of experience in Dermatologist , Dr. Klin has established a reputation as a leader in their field.',
              style: TextStyle(color: Color(0xff0E0255), fontSize: 11),
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}

class BottomDocProfile extends StatelessWidget {
  const BottomDocProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> certificates = <String>[
      'assets/cert1.png',
      'assets/cert2.png',
      'assets/cert3.png'
    ];
    return Container(
        margin: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0),
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Certificates',
            style: TextStyle(
                color: Color(0xFF0E0255),
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: certificates.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                  width: 123,
                  margin: EdgeInsets.fromLTRB(0, 20.0, 20.0, 20.0),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Stack(children: [
                        Positioned(
                          left: 10.0,
                          top: 10.0,
                          child: Icon(
                            Icons.cancel,
                            size: 15.0,
                            color: Colors.red,
                          ),
                        ),
                        Positioned(
                          left: 5.0,
                          right: 5.0,
                          top: 10.0,
                          child: Image.asset(
                            '${certificates[index]}',
                            height: 130,
                            width: 115,
                          ),
                        ),
                      ]))),
            ),
          )
        ])));
  }
}
