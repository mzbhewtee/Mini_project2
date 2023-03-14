import 'package:flutter/material.dart';

class Appointment2 extends StatefulWidget {
  @override
  Appointment2State createState() => Appointment2State();
}

class Appointment2State extends State<Appointment2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Header(),
          MyAppointments(),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          // The first container that contains the blue background
          Container(
            height: 150,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF0E0255),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
              ),
            ),
          ),

          // The second container that contains the white background
          Positioned(
            top: 0,
            left: 0,
            right: 40,
            bottom: 30,
            child: Container(
              height: 100,

              // create the width of the container to be the same as the parent
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100),
                ),
              ),
            ),
          ),

          // The third container that contains the title
          Positioned(
            top: 50,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Appointments',
                  style: TextStyle(
                    color: Color(0xFF0E0255),
                    fontSize: 24,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyAppointments extends StatefulWidget {
  @override
  _MyAppointmentsState createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {
  final List<String> Name = [    'Beauty Ikudehinbu',    'Hilary Clinton',    'Opeyemi Olorunfemi'  ];
  final List<String> Info = [    'General Checkup',    'General Checkup',    'General Checkup'  ];

  void handleCancel(int index) {
    setState(() {
      Name.removeAt(index);
      Info.removeAt(index);
    });
  }

  void handleCheck() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Appointment accepted'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 8, right: 8),
    child : Column(
      children: List.generate(
        Name.length,
        (index) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
        child: Card(
          color: Color.fromARGB(68, 139, 127, 199),
          child: ListTile(
            title: Text(
              Name[index],
              style: TextStyle(
                color: Color.fromRGBO(14, 2, 85, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              Info[index],
              style: TextStyle(
                color: Color.fromRGBO(14, 2, 85, 1),
                fontWeight: FontWeight.w300,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.check, color: Colors.green),
                  onPressed: () {
                    handleCheck();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.cancel, color: Colors.red),
                  onPressed: () {
                    handleCancel(index);
                  },
                ),
              ],
            ),
          ),
        ),
        ),
      ),
    ),
    );
  }
}
