import 'package:cv_maker/repository/services/user_id.dart';
import 'package:cv_maker/resources/components/drawer.dart';
import 'package:cv_maker/resources/components/home_container.dart';
import 'package:cv_maker/resources/components/home_screen_container_small.dart';
import 'package:cv_maker/resources/consts/consts.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseReference ref = FirebaseDatabase.instance.ref('User');
  dynamic userName = '...';
  dynamic userEmail = '...';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: StreamBuilder(
          stream: ref.child(SessionController().userId.toString()).onValue,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              Map<dynamic, dynamic> data = snapshot.data.snapshot.value;
              userName = data['username'].toString();
              userEmail = data['email'].toString();
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 50, right: 20, left: 20),
                  width: double.infinity,
                  height: height * 0.25,
                  decoration: BoxDecoration(
                      color: lightBlue,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(50))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Scaffold.of(context).openDrawer();
                            },
                            child: Icon(
                              Icons.list,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Resume Builder',
                            style: TextStyle(
                                fontFamily: regular,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          CircleAvatar(
                            radius: 15,
                            child: Icon(Icons.person),
                          ),
                        ],
                      ),
                      //-----------
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Hi, $userName',
                        style: TextStyle(
                            fontFamily: bold,
                            fontSize: 28,
                            color: whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Make Your own cv of your style cv of your style',
                        style: TextStyle(
                          color: whiteColor,
                        ),
                      ),
                    ],
                  ),

                  //--------------------------
                ),
                //---------------
                Stack(
                  children: [
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(color: Color(0xff0f9690)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 2),
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(50))),
                    ),
                    //--------
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SmallContainer(
                                width: width,
                                height: height,
                                color: const Color(0xfff39f5A),
                                mainHeading: 'Create Resume',
                                subHeading: 'Make Your Resume From Start',
                                assetImage: presentationImage,
                                onPress: () {},
                              ),
                              SmallContainer(
                                width: width,
                                height: height,
                                color: const Color(0xff0C7078),
                                mainHeading: 'Your resume',
                                subHeading: 'Glimse of your resumes',
                                assetImage: myResumeImage,
                                onPress: () {},
                              ),
                            ],
                          ),
                          HomeContainer(
                            height: height,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Text(
                              'Popular Resumes',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            height: height * 0.25,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.all(13),
                                    width: width * 0.4,
                                    height: height * 0.2,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(5)),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
      drawer: CustomDrawer(
        userName: userName.toString(),
        userEmail: userEmail.toString(),
      ),
    );
  }
}
