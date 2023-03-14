import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[TopProfile(), MidProfile(), Testresult()],
    ));
  }
}

class TopProfile extends StatefulWidget {
  @override
  _TopProfileState createState() => _TopProfileState();
}

class _TopProfileState extends State<TopProfile> {
  File? image;
  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() => this.image = imageTemporary);
  }

  String userName = '';
  String userAddress = '';
  String userBlood = '';
  String userAge = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: [
        Container(
          margin: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 100.0),
          padding: EdgeInsets.all(20.0),
          width: 345,
          height: 155,
          alignment: Alignment.topRight,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 139, 127, 199),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: ElevatedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: Container(
                      height: 600,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text(
                              'Bio',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0E0255),
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.close,
                                color: Color.fromARGB(255, 164, 16, 16),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          Divider(),
                          SizedBox(height: 20),
                          Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              GestureDetector(
                                onTap: pickImage,
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(50),
                                    image: image != null
                                        ? DecorationImage(
                                            image: FileImage(image!),
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                  ),
                                  child: image == null
                                      ? Container(
                                          color: Colors.grey[800],
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 50,
                                          ),
                                        )
                                      : null,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF0E0255),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 4,
                                    ),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                    ),
                                    onPressed: pickImage,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                color: Color(0xFF0E0255),
                              ),
                              hintText: 'Enter your name',
                              hintStyle: TextStyle(
                                color: Color(0xFF0E0255),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF0E0255),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF0E0255),
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                userName = value;
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Address',
                              labelStyle: TextStyle(
                                color: Color(0xFF0E0255),
                              ),
                              hintText: 'Enter your address',
                              hintStyle: TextStyle(
                                color: Color(0xFF0E0255),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF0E0255),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF0E0255),
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                userAddress = value;
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Blood Group',
                              labelStyle: TextStyle(
                                color: Color(0xFF0E0255),
                              ),
                              hintText: 'Enter your blood group',
                              hintStyle: TextStyle(
                                color: Color(0xFF0E0255),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF0E0255),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF0E0255),
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                userBlood = value;
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Age',
                              labelStyle: TextStyle(
                                color: Color(0xFF0E0255),
                              ),
                              hintText: 'Enter your age',
                              hintStyle: TextStyle(
                                color: Color(0xFF0E0255),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF0E0255),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF0E0255),
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                userAge = value;
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Save'),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFF0E0255),
                                padding: EdgeInsets.symmetric(vertical: 15),
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: Icon(
              Icons.edit,
              size: 30,
              color: Color(0xFF0E0255),
            ),
            label: Text(''),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.transparent),
              elevation: MaterialStateProperty.all<double>(0),
            ),
          ),
        ),
        Positioned(
          left: 40.0,
          top: 50.0,
          child: Container(
            height: 50,
            width: 50,
            
            child: IconButton(
              icon: Icon(
                Icons.logout,
                color: Color(0xff0E0255),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ),
        Positioned(
            left: 140.0,
            top: 150.0,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/hild.png'),
              radius: 40.0,
            )),
        Positioned(
            left: 130.0,
            top: 240.0,
            child: Text(
              userName,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Color(0xff0E0255)),
            )),
        Positioned(
            left: 30.0,
            top: 280.0,
            child: Row(
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Address: ',
                      style: TextStyle(
                        color: Color(0XFF0E0255),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      children: [
                        TextSpan(
                          text: userAddress,
                          style: TextStyle(
                            color: Color(0xFFC12604),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  width: 15.0,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Age: ',
                      style: TextStyle(
                        color: Color(0XFF0E0255),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      children: [
                        TextSpan(
                          text: userAge,
                          style: TextStyle(
                            color: Color(0xFFC12604),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  width: 15.0,
                ),
                RichText(
                  text: TextSpan(
                      text: 'Blood Type: ',
                      style: TextStyle(
                        color: Color(0XFF0E0255),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                      children: [
                        TextSpan(
                          text: userBlood,
                          style: TextStyle(
                            color: Color(0xFFC12604),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ]),
                ),
              ],
            ))
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
            'Last Doctors Report',
            style: TextStyle(
                color: Color(0xFF0E0255),
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
          Container(
            width: 345,
            height: 155,
            margin: EdgeInsets.symmetric(vertical: 20.0),
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 139, 127, 199),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Text(
              'On physical examination, there is a rash consisting of erythematous papules on the bilateral arms and legs. No pustules or vesicles are noted. The rash is mildly pruritic. There are no other significant findings on physical examination. The patients presentation is consistent with an allergic ...',
              style: TextStyle(color: Color(0xff0E0255), fontSize: 11),
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}

class Testresult extends StatelessWidget {
  const Testresult({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> resultname = <String>[
      'PregTest B Result',
      'Hormone L Result',
      'Skin A Test Result'
    ];
    return Container(
        margin: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0),
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Medical Report',
            style: TextStyle(
                color: Color(0xFF0E0255),
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: resultname.length,
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
                          top: 30,
                          left: 35.0,
                          child: Icon(
                            Icons.download_for_offline,
                            size: 50.0,
                          ),
                        ),
                        Positioned(
                          top: 90,
                          left: 20.0,
                          child: Text(
                            '${resultname[index]}',
                            style: TextStyle(
                                fontSize: 10, color: Color(0xff0E0255)),
                          ),
                        ),
                      ]))),
            ),
          )
        ])));
  }
}
