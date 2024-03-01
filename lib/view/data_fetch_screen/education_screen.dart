import 'package:cv_maker/resources/components/text_form_field.dart';
import 'package:cv_maker/view/data_fetch_screen/expertise_screen.dart';
import 'package:flutter/material.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Education",
          style: TextStyle(color: Colors.white70),
        )),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Row(
              children: [
                SizedBox(width: 20),
                Icon(Icons.school_outlined),
                Text(
                  "  Enter Your Education ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )
              ],
            ),
            const SizedBox(height: 15),
            // Education
            customTextField(
              context: context,
              width: 0.9,
              height: 0.5,
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ExpertiseScreen()));
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
