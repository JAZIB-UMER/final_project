import 'package:cv_maker/model/pic_api_model.dart';
import 'package:cv_maker/repository/services/firebase_services.dart';
import 'package:cv_maker/repository/services/shared_pref_services.dart';
import 'package:cv_maker/repository/services/user_id.dart';
import 'package:cv_maker/resources/components/drawer.dart';
import 'package:cv_maker/resources/components/home_container.dart';
import 'package:cv_maker/resources/components/home_screen_container_small.dart';
import 'package:cv_maker/resources/consts/consts.dart';
import 'package:cv_maker/utils/routes/routes_name.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FireBaseServices _fireBaseServices = FireBaseServices();
  DatabaseReference ref = FirebaseDatabase.instance.ref('User');
  dynamic userName = '';
  dynamic userEmail = '';

  @override
  void initState() {
    UserData userData = SharedPreferencesHelper().getData();

    userName = userData.name;
    userEmail = userData.email;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
          stream: ref.child(SessionController().userId.toString()).onValue,
          builder: (context, AsyncSnapshot snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 50, right: 20, left: 20),
                  width: double.infinity,
                  height: height * 0.25,
                  decoration: const BoxDecoration(
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
                            child: const Icon(
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
                          Hero(
                            tag: 'icon',
                            child: CircleAvatar(
                              backgroundColor: lightBlue,
                              radius: 15,
                              child:
                                  Image.asset('assets/icons/cv_maker_logo.png'),
                            ),
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
                                onPress: () {
                                  //_fireBaseServices.addData();
                                  Navigator.pushNamed(context, RoutesName.cv);
                                },
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
                          InkWell(
                            onTap: () {
                              // _fireBaseServices.addData();
                            },

                            // BIG CONTAINER
                            child: HomeContainer(
                              height: height,
                            ),
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
                          SizedBox(
                            height: height * 0.25,
                            child: FutureBuilder<PexelsPics>(
                              future: getData(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<PexelsPics> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  // Show a loading indicator while waiting for the future to complete
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  // Show an error message if the future encountered an error
                                  return Text('Error: ${snapshot.error}');
                                } else if (!snapshot.hasData ||
                                    snapshot.data == null) {
                                  // Handle the case where the future completed but returned null data
                                  return Text('No data available');
                                } else {
                                  return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data!.perPage,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: const EdgeInsets.all(13),
                                          width: width * 0.4,
                                          height: height * 0.2,
                                          decoration: const BoxDecoration(
                                              //color: Colors.blue,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black38,
                                                  blurRadius: 10,
                                                  offset: Offset(5, 5),
                                                )
                                              ]),
                                          child: Image.network(
                                            snapshot.data!.photos[index].src
                                                .portrait,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      });
                                }
                              },
                            ),
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

  Future<PexelsPics> getData() async {
    var response = await http.get(
        Uri.parse('https://api.pexels.com/v1/search?query=resumes'),
        headers: {
          'Authorization':
              'pJZ7UnC5N9D89kRBMDr7xRquJD9rWbm6QUieORVGN2rlDsFhorpt8X5a',
        });

    if (response.statusCode == 200) {
      return pexelsPicsFromJson(response.body);
    } else {
      throw Exception('Error');
    }
  }
}
