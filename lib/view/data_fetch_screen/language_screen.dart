import 'package:cv_maker/resources/components/text_form_field.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            "Language",
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
                Icon(Icons.language_rounded),
                Text(
                  "Languages",
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
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (_) => const LanguageScreen()));
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
