import 'package:HelpingHand/models/userData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:HelpingHand/Widget/CustomWidget.dart';
import 'package:go_router/go_router.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final User? user = _auth.currentUser;
  // final uid = user.uid;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(_auth.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text("Loading");
          }
          var userDocument = snapshot.data;
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(90),
              child: AppBar(
                backgroundColor: const Color(0xFF1B1E69),
                title: Row(
                  children: [
                    InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/return.png',
                          width: 30,
                          height: 30,
                        )),
                  ],
                ),
              ),
            ),
            body: SafeArea(
              child: Center(
                  child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 75,
                        color: const Color(0xFF1B1E69),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
                            child: Text(
                              userDocument?["Full Name"] ,
                              style: const TextStyle(
                                  fontSize: 30,
                                  color: Color(0xFF1B1E69),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            _auth.currentUser!.email.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xFF1B1E69),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomElevatedButtonWithIcon(
                            icon: Icons.person,
                            onPressed: () {
                              context.pushReplacementNamed("EditProFile");
                            },
                            label: const Text('Edit profile'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomElevatedButtonWithIcon(
                            icon: Icons.notifications,
                            onPressed: () {},
                            label: const Text('Notification setting'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomElevatedButtonWithIcon(
                            icon: Icons.support,
                            onPressed: () {},
                            label: const Text('Support'),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomElevatedButtonWithIcon(
                            icon: Icons.settings,
                            onPressed: () {},
                            label: const Text('Setting'),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color: Colors.blue, // Màu nền của hình tròn
                      border: Border.all(
                        color: Colors.transparent, // Màu viền
                        width: 5, // Độ rộng của viền
                      ),
                      gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.pinkAccent],
                        // Màu của viền
                        begin: Alignment.topLeft,
                        // Điểm bắt đầu của gradient
                        end:
                            Alignment.bottomRight, // Điểm kết thúc của gradient
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 70, // Bán kính của avatar
                      backgroundImage: AssetImage(
                        'assets/meme-ech-xanh-25.jpg',
                      ), // Đường dẫn ảnh avatar
                    ),
                  ),
                ],
              )),
            ),
          );
        });
  }
}
