// import 'package:cv_maker/repository/services/firebase_services.dart';
// import 'package:cv_maker/resources/consts/color.dart';
// import 'package:cv_maker/utils/routes/routes_name.dart';
// import 'package:cv_maker/utils/utils.dart';
// import 'package:flutter/material.dart';
//
// class CVInputScreen extends StatefulWidget {
//   @override
//   _CVInputScreenState createState() => _CVInputScreenState();
// }
//
// class _CVInputScreenState extends State<CVInputScreen> {
//   final FireBaseServices _fireBaseServices = FireBaseServices();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneNumberController = TextEditingController();
//   final List<Map<String, dynamic>> _educations = [];
//   final List<Map<String, dynamic>> _skills = [];
//   final List<Map<String, dynamic>> _languages = [];
//   String? _profilePicture;
//   String? _experience;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: lightBlue,
//         title: Text(
//           'Create CV',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             const Text('Personal Details', style: TextStyle(fontSize: 18)),
//             SizedBox(height: 8),
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(
//                   labelText: 'Name', border: OutlineInputBorder()),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                   labelText: 'Email', border: OutlineInputBorder()),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextField(
//               controller: _phoneNumberController,
//               decoration: InputDecoration(
//                   labelText: 'Phone Number', border: OutlineInputBorder()),
//             ),
//             SizedBox(height: 16),
//             Text('Education', style: TextStyle(fontSize: 18)),
//             SizedBox(height: 8),
//             _buildEducationFields(),
//             SizedBox(height: 16),
//             Text('Skills', style: TextStyle(fontSize: 18)),
//             SizedBox(height: 8),
//             _buildSkillFields(),
//             SizedBox(height: 16),
//             Text('Languages', style: TextStyle(fontSize: 18)),
//             SizedBox(height: 8),
//             _buildLanguageFields(),
//             SizedBox(height: 16),
//             Text('Experience', style: TextStyle(fontSize: 18)),
//             SizedBox(height: 8),
//             TextField(
//               onChanged: (value) => _experience = value,
//               decoration: InputDecoration(labelText: 'Experience'),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 if (_nameController.text != '' ||
//                     _emailController.text != '' ||
//                     _educations.isNotEmpty ||
//                     _languages.isNotEmpty ||
//                     _skills.isNotEmpty) {
//                   _fireBaseServices
//                       .addData(context, _profilePicture.toString(),
//                           name: _nameController.text.toString(),
//                           email: _emailController.text.toString(),
//                           phoneNumber: _phoneNumberController.text.toString(),
//                           education: _educations,
//                           skills: _skills,
//                           languages: _languages,
//                           experience: _experience.toString())
//                       .then((value) {
//                     _emailController.clear();
//                     _nameController.clear();
//                     _phoneNumberController.clear();
//                     _educations.clear();
//                     _skills.clear();
//                     _languages.clear();
//                     _profilePicture = null;
//                     _experience = null;
//                     Navigator.pushReplacementNamed(
//                         context, RoutesName.homeScreen);
//                   });
//                 } else {
//                   Utils.flushBarErrorMessage('Empty', Colors.red, context);
//                 }
//               },
//               child: Text('Save to Firestore'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildEducationFields() {
//     return Column(
//       children: [
//         for (int i = 0; i < _educations.length; i++)
//           Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(labelText: 'Degree'),
//                   onChanged: (value) => _educations[i]['degree'] = value,
//                 ),
//               ),
//               Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(labelText: 'Institution'),
//                   onChanged: (value) => _educations[i]['institution'] = value,
//                 ),
//               ),
//               Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(labelText: 'Completion Year'),
//                   onChanged: (value) =>
//                       _educations[i]['completionYear'] = value,
//                 ),
//               ),
//             ],
//           ),
//         IconButton(
//           onPressed: () {
//             setState(() {
//               _educations.add({});
//             });
//           },
//           icon: Icon(Icons.add),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildSkillFields() {
//     return Column(
//       children: [
//         for (int i = 0; i < _skills.length; i++)
//           Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(labelText: 'Skill Name'),
//                   onChanged: (value) => _skills[i]['name'] = value,
//                 ),
//               ),
//               Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(labelText: 'Expertise Level'),
//                   onChanged: (value) => _skills[i]['expertiseLevel'] = value,
//                 ),
//               ),
//             ],
//           ),
//         IconButton(
//           onPressed: () {
//             setState(() {
//               _skills.add({});
//             });
//           },
//           icon: Icon(Icons.add),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildLanguageFields() {
//     return Column(
//       children: [
//         for (int i = 0; i < _languages.length; i++)
//           Row(
//             children: [
//               Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(labelText: 'Language'),
//                   onChanged: (value) => _languages[i]['language'] = value,
//                 ),
//               ),
//               Expanded(
//                 child: TextField(
//                   decoration: InputDecoration(labelText: 'Proficiency Level'),
//                   onChanged: (value) =>
//                       _languages[i]['proficiencyLevel'] = value,
//                 ),
//               ),
//             ],
//           ),
//         IconButton(
//           onPressed: () {
//             setState(() {
//               _languages.add({});
//             });
//           },
//           icon: Icon(Icons.add),
//         ),
//       ],
//     );
//   }
// }
//
// //---------------------------------------------------
// class CVData {
//   String? name;
//   String? email;
//   List<Education> educations = [];
//   List<Skill> skills = [];
//   List<Language> languages = [];
// }
//
// class Education {
//   String? degree;
//   String? institution;
//   String? completionYear;
// }
//
// class Skill {
//   String? skillName;
//   String? expertiseLevel; // You can define this as an enum if needed
// }
//
// class Language {
//   String? language;
//   String? proficiencyLevel; // You can define this as an enum if needed
// }
import 'package:cv_maker/repository/services/firebase_services.dart';
import 'package:cv_maker/resources/components/round_button.dart';
import 'package:cv_maker/resources/consts/color.dart';
import 'package:cv_maker/utils/routes/routes_name.dart';
import 'package:cv_maker/utils/utils.dart';
import 'package:flutter/material.dart';

class CVInputScreen extends StatefulWidget {
  @override
  _CVInputScreenState createState() => _CVInputScreenState();
}

class _CVInputScreenState extends State<CVInputScreen> {
  final FireBaseServices _fireBaseServices = FireBaseServices();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final List<Map<String, dynamic>> _educations = [];
  final List<Map<String, dynamic>> _skills = [];
  final List<Map<String, dynamic>> _languages = [];
  String? _profilePicture;
  String? _experience;

  @override
  Widget build(BuildContext context) {
    dynamic height = MediaQuery.of(context).size.height;
    dynamic width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightBlue,
        title: Text(
          'Create CV',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Personal Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            _buildTextField(
              controller: _nameController,
              labelText: 'Name',
              icon: Icons.person,
            ),
            SizedBox(height: 10),
            _buildTextField(
              controller: _emailController,
              labelText: 'Email',
              icon: Icons.email,
            ),
            SizedBox(height: 10),
            _buildTextField(
              controller: _phoneNumberController,
              labelText: 'Phone Number',
              icon: Icons.phone,
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Education',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            _buildEducationFields(),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Skills',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            _buildSkillFields(),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Languages',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            _buildLanguageFields(),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Experience',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            _buildTextField(
              labelText: 'Experience',
              onChanged: (value) => _experience = value,
              icon: Icons.work,
            ),
            SizedBox(height: 16),
            RoundButton(
                title: 'Save',
                onPress: () {
                  if (_nameController.text.isNotEmpty ||
                      _emailController.text.isNotEmpty ||
                      _educations.isNotEmpty ||
                      _languages.isNotEmpty ||
                      _skills.isNotEmpty) {
                    _fireBaseServices
                        .addData(
                      context,
                      _profilePicture.toString(),
                      name: _nameController.text,
                      email: _emailController.text,
                      phoneNumber: _phoneNumberController.text,
                      education: _educations,
                      skills: _skills,
                      languages: _languages,
                      experience: _experience,
                    )
                        .then((value) {
                      _nameController.clear();
                      _emailController.clear();
                      _phoneNumberController.clear();
                      _educations.clear();
                      _skills.clear();
                      _languages.clear();
                      _profilePicture = null;
                      _experience = null;
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesName.homeScreen,
                      );
                    });
                  } else {
                    Utils.flushBarErrorMessage(
                      'Empty fields',
                      Colors.red,
                      context,
                    );
                  }
                },
                height: height,
                width: width)
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    TextEditingController? controller,
    required String labelText,
    IconData? icon,
    ValueChanged<String>? onChanged,
  }) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        prefixIcon: Icon(icon),
      ),
    );
  }

  Widget _buildEducationFields() {
    return Column(
      children: [
        for (int i = 0; i < _educations.length; i++)
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: 'Degree'),
                  onChanged: (value) => _educations[i]['degree'] = value,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: 'Institution'),
                  onChanged: (value) => _educations[i]['institution'] = value,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: 'Completion Year'),
                  onChanged: (value) =>
                      _educations[i]['completionYear'] = value,
                ),
              ),
            ],
          ),
        IconButton(
          onPressed: () {
            setState(() {
              _educations.add({});
            });
          },
          icon: Icon(Icons.add),
        ),
      ],
    );
  }

  Widget _buildSkillFields() {
    return Column(
      children: [
        for (int i = 0; i < _skills.length; i++)
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: 'Skill Name'),
                  onChanged: (value) => _skills[i]['name'] = value,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: 'Expertise Level'),
                  onChanged: (value) => _skills[i]['expertiseLevel'] = value,
                ),
              ),
            ],
          ),
        IconButton(
          onPressed: () {
            setState(() {
              _skills.add({});
            });
          },
          icon: Icon(Icons.add),
        ),
      ],
    );
  }

  Widget _buildLanguageFields() {
    return Column(
      children: [
        for (int i = 0; i < _languages.length; i++)
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: 'Language'),
                  onChanged: (value) => _languages[i]['language'] = value,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(labelText: 'Proficiency Level'),
                  onChanged: (value) =>
                      _languages[i]['proficiencyLevel'] = value,
                ),
              ),
            ],
          ),
        IconButton(
          onPressed: () {
            setState(() {
              _languages.add({});
            });
          },
          icon: Icon(Icons.add),
        ),
      ],
    );
  }
}
