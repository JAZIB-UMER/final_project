import 'package:cv_maker/resources/components/text_form_field.dart';
import 'package:cv_maker/view/data_fetch_screen/language_screen.dart';
import 'package:flutter/material.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "Experience",
            style: TextStyle(color: Colors.white70),
          )),
          backgroundColor: Colors.indigo,
        ),
        body: Column(
          children: [
            const SizedBox(height: 30),
            const Row(
              children: [
                SizedBox(width: 20),
                Icon(Icons.work_history_outlined),
                Text(
                  "  Enter Your Experience ",
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
                    MaterialPageRoute(builder: (_) => const LanguageScreen()));
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
        ));
  }
}
