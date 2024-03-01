import 'package:cv_maker/resources/components/text_form_field.dart';
import 'package:cv_maker/utils/routes/routes_name.dart';
import 'package:cv_maker/view/data_fetch_screen/education_screen.dart';
import 'package:flutter/material.dart';

class DataFetchingScreen extends StatefulWidget {
  const DataFetchingScreen({super.key});

  @override
  State<DataFetchingScreen> createState() => _DataFetchingScreenState();
}

class _DataFetchingScreenState extends State<DataFetchingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "ENTER DETAILS",
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // First Name
            customTextField(
              context: context,
              labelText: "First Name",
              hintText: "Waleed",
              width: 0.9,
              height: 0.08,
              icon: Icons.account_circle_outlined,
            ),
            const SizedBox(height: 25),
            // Last Name
            customTextField(
              context: context,
              labelText: "Last Name",
              hintText: "Khan",
              width: 0.9,
              height: 0.08,
              icon: Icons.account_circle_outlined,
            ),
            const SizedBox(height: 25),
            // Phone number
            customTextField(
              context: context,
              labelText: "Contact Number",
              hintText: "+92 3386413322",
              width: 0.9,
              height: 0.08,
              icon: Icons.phone,
            ),
            const SizedBox(height: 25),
            // Email
            customTextField(
              context: context,
              labelText: "Email",
              hintText: "waleedkhan@gamil.com",
              width: 0.9,
              height: 0.08,
              icon: Icons.email_outlined,
            ),
            const SizedBox(height: 25),
            // Address
            customTextField(
              context: context,
              labelText: "Address",
              hintText: "xyz Street..,abc City",
              width: 0.9,
              height: 0.08,
              icon: Icons.account_balance_sharp,
            ),

            // const SizedBox(height: 25),
            // // Education
            // customTextField(
            //   context: context,
            //   labelText: "Education",
            //    hintText: "Enter degree with university name ",
            //    icon: Icons.school_outlined,
            //  ),
            //
            // const SizedBox(height: 25),
            // // Expertise
            // customTextField(
            //   context: context,
            //   labelText: "Expertise",
            //    hintText: "Enter your Skills ",
            //    icon: Icons.abc_rounded,
            //  ),
            // const SizedBox(height: 25),
            // // Language
            // customTextField(
            //   context: context,
            //   labelText: "Language",
            //    hintText: "Enter Languages ",
            //    icon: Icons.language_rounded,
            //  ),
            // const SizedBox(height: 25),
            // // Experience
            // customTextField(
            //   context: context,
            //   labelText: "Experience",
            //    hintText: "Enter your Experience",
            //    icon: Icons.work_history_outlined,
            //  ),
            const SizedBox(height: 25),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.educationScreen);
              },
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: const [
                    BoxShadow(blurRadius: 8, offset: Offset(5, 5)),
                  ],
                  color: Colors.blueGrey,
                ),
                child: const Center(
                  child: Text(
                    'Add to CV',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
