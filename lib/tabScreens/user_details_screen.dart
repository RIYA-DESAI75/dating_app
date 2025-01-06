import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/accountSettingScreen/account_settings_screen.dart';
import 'package:dating_app/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slider/carousel.dart';
import 'package:get/get.dart';

class UserDetailsScreen extends StatefulWidget
{
  String? userID;

  UserDetailsScreen({super.key, this.userID,});

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen>
{
  //personal info
  String name ='';
  String age ='';
  String phoneNo = '';
  String city = '';
  String country = '';
  String profileHeading = '';
  String lookingForInaPartner = '';

  //appearance
  String height = '';
  String weight = '' ;
  String bodyType = '';

  //Life style
  String drink = '';
  String smoke = '';
  String martialStatus = '';
  String haveChildren ='';
  String noOfChildren = '';
  String profession = '';
  String employmentStatus = '';
  String income = '';
  String livingSituation = '';
  String willingToRelocate = '';
  String relationshipYouAreLookingFor = '';

  //Background - Cultural Values
  String nationality = '';
  String education = '';
  String languageSpoken = '';
  String religion = '';
  String ethnicity = '';

  //slider images
  String urlImage1 = 'https://firebasestorage.googleapis.com/v0/b/tinderclone-bc291.appspot.com/o/Place%20Holder%2Fprofile_avatar.jpg?alt=media&token=d5ca6933-2899-4e1e-a2f4-ffac6a90ec21';
  String urlImage2 = 'https://firebasestorage.googleapis.com/v0/b/tinderclone-bc291.appspot.com/o/Place%20Holder%2Fprofile_avatar.jpg?alt=media&token=d5ca6933-2899-4e1e-a2f4-ffac6a90ec21';
  String urlImage3 = 'https://firebasestorage.googleapis.com/v0/b/tinderclone-bc291.appspot.com/o/Place%20Holder%2Fprofile_avatar.jpg?alt=media&token=d5ca6933-2899-4e1e-a2f4-ffac6a90ec21';
  String urlImage4 = 'https://firebasestorage.googleapis.com/v0/b/tinderclone-bc291.appspot.com/o/Place%20Holder%2Fprofile_avatar.jpg?alt=media&token=d5ca6933-2899-4e1e-a2f4-ffac6a90ec21';
  String urlImage5 = 'https://firebasestorage.googleapis.com/v0/b/tinderclone-bc291.appspot.com/o/Place%20Holder%2Fprofile_avatar.jpg?alt=media&token=d5ca6933-2899-4e1e-a2f4-ffac6a90ec21';

  retrieveUserInfo() async
  {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(widget.userID)
        .get()
        .then((snapshot)
    {
      if(snapshot.exists)
      {
        if(snapshot.data()!["urlImage1"] != null)
        {
          setState(() {
            urlImage1 = snapshot.data()!["urlImage1"];
            urlImage2 = snapshot.data()!["urlImage2"];
            urlImage3 = snapshot.data()!["urlImage3"];
            urlImage4 = snapshot.data()!["urlImage4"];
            urlImage5 = snapshot.data()!["urlImage5"];
          });
        }

        setState(() {
          //personal info
          name = snapshot.data()!["name"];
          age = snapshot.data()!['age'].toString();
          phoneNo = snapshot.data()!['phoneNo'];
          city = snapshot.data()!['city'];
          country = snapshot.data()!["country"];
          profileHeading = snapshot.data()!['profileHeading'];
          lookingForInaPartner = snapshot.data()!["lookingForInaPartner"];

          //appearance
          height = snapshot.data()!['height'];
          weight = snapshot.data()!['weight'];
          bodyType = snapshot.data()!['bodyType'];

          //life style
          drink = snapshot.data()!['drink'];
          smoke = snapshot.data()!['smoke'];
          martialStatus = snapshot.data()!['martialStatus'];
          haveChildren = snapshot.data()!['haveChildren'];
          noOfChildren = snapshot.data()!['noOfChildren'];
          profession = snapshot.data()!['profession'];
          employmentStatus = snapshot.data()!['employmentStatus'];
          income = snapshot.data()!['income'];
          livingSituation = snapshot.data()!['livingSituation'];
          willingToRelocate = snapshot.data()!['willingToRelocate'];
          relationshipYouAreLookingFor = snapshot.data()!['relationshipYouAreLookingFor'];

          //background - cultural values
          nationality= snapshot.data()!['nationality'];
          education = snapshot.data()!['education'];
          languageSpoken = snapshot.data()!['languageSpoken'];
          religion = snapshot.data()!['religion'];
          ethnicity= snapshot.data()!['ethnicity'];
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    retrieveUserInfo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        //automaticallyImplyLeading: widget.userID == currentUserID ? false : true,
        leading: widget.userID != currentUserID ? IconButton(
          onPressed: ()
          {
            Get.back();
          },
          icon:  const Icon(Icons.arrow_back_outlined,size:30.0),
        ) : Container(),
        actions: [
          widget.userID == currentUserID ?
          Row(
            children: [
              IconButton(
                onPressed: ()
                {
                  Get.to(AccountSettingsScreen());
                },
                icon: const Icon(
                  Icons.settings,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: ()
                {
                  FirebaseAuth.instance.signOut();
                },
                icon: const Icon(
                  Icons.logout,
                  size: 30,
                ),
              ),
            ],
          ) : Container(),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [

              //image slider
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Carousel(
                    indicatorBarColor: Colors.black.withOpacity(0.3),
                    autoScrollDuration: const Duration(seconds: 2),
                    animationPageDuration: const Duration(milliseconds: 500),
                    activateIndicatorColor: Colors.black,
                    animationPageCurve: Curves.easeIn,
                    indicatorBarHeight: 30,
                    indicatorHeight: 10,
                    indicatorWidth: 10,
                    unActivatedIndicatorColor: Colors.grey,
                    stopAtEnd: true,
                    autoScroll: true,
                    items: [
                      Image.network(urlImage1, fit: BoxFit.cover,),
                      Image.network(urlImage2, fit: BoxFit.cover,),
                      Image.network(urlImage3, fit: BoxFit.cover,),
                      Image.network(urlImage4, fit: BoxFit.cover,),
                      Image.network(urlImage5, fit: BoxFit.cover,),
                    ],
                  ),
                ),
              ),

              const SizedBox(height:10.0,),

              //personal info
              const SizedBox(height: 30,),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Personal Info: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              //personal info table data
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  children: [

                    //name
                    TableRow(
                      children:
                      [
                        const Text(
                          "Name: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          name,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //age
                    TableRow(
                      children:
                      [
                        const Text(
                          "Age: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          age,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //phoneNo
                    TableRow(
                      children:
                      [
                        const Text(
                          "Phone Number: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          phoneNo,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //city
                    TableRow(
                      children:
                      [
                        const Text(
                          "City: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          city,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //country
                    TableRow(
                      children:
                      [
                        const Text(
                          "Country: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          country,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //seeking
                    TableRow(
                      children:
                      [
                        const Text(
                          "Seeking: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          lookingForInaPartner,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),











                  ],
                ),
              ),

              //appearance title
              const SizedBox(height: 30,),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Appearance: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              //appearance table data
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  children: [

                    //height
                    TableRow(
                      children:
                      [
                        const Text(
                          "Height: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          height,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //weight
                    TableRow(
                      children:
                      [
                        const Text(
                          "Weight: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          weight,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //bodyType
                    TableRow(
                      children:
                      [
                        const Text(
                          "Body Type: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          bodyType,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),


                  ],
                ),
              ),

              //life style
              const SizedBox(height: 30,),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Life style: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              //life style table data
              Container(
                padding: const EdgeInsets.all(20.0),
                child:Table(
                  children: [

                    //drink
                    TableRow(
                      children:
                      [
                        const Text(
                          "Drink: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          drink,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //smoke
                    TableRow(
                      children:
                      [
                        const Text(
                          "Smoke: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          smoke,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //martial status
                    TableRow(
                      children:
                      [
                        const Text(
                          "Martial Status: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          martialStatus,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //haveChildren
                    TableRow(
                      children:
                      [
                        const Text(
                          "Have children: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          haveChildren,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //noOfChildren
                    TableRow(
                      children:
                      [
                        const Text(
                          "Number of children: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          noOfChildren,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //profession
                    TableRow(
                      children:
                      [
                        const Text(
                          "Profession: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          profession,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //employment status
                    TableRow(
                      children:
                      [
                        const Text(
                          "Emplyment status: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          employmentStatus,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //income
                    TableRow(
                      children:
                      [
                        const Text(
                          "Income: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          income,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //livingSituation
                    TableRow(
                      children:
                      [
                        const Text(
                          "Living situation: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          livingSituation,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //willingToRelocate
                    TableRow(
                      children:
                      [
                        const Text(
                          "Willing to relocate: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          willingToRelocate,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //lookingForInaPartner
                    TableRow(
                      children:
                      [
                        const Text(
                          "Looking for: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          lookingForInaPartner,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),




                  ],
                ),
              ),

              //background - cultural values
              const SizedBox(height: 30,),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Background-cultural values: ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Colors.white,
                thickness: 2,
              ),
              //background - cultural values table data
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Table(
                  children: [

                    //nationality
                    TableRow(
                      children:
                      [
                        const Text(
                          "Nationality: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          nationality,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //education
                    TableRow(
                      children:
                      [
                        const Text(
                          "Education: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          education,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //language spoken
                    TableRow(
                      children:
                      [
                        const Text(
                          "Language spoken: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          languageSpoken,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //religion
                    TableRow(
                      children:
                      [
                        const Text(
                          "Religion: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          religion,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),

                    //ethnicity
                    TableRow(
                      children:
                      [
                        const Text(
                          "Ethnicity: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          ethnicity,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),

                    //extra row
                    const TableRow(
                      children:
                      [
                        Text(""),
                        Text(""),
                      ],
                    ),


                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
