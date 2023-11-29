import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'default_textfield.dart';
import 'package:http/http.dart' as http;

class DefaultDialog extends StatefulWidget {
  const DefaultDialog({super.key});

  @override
  State<DefaultDialog> createState() => _DefaultDialogState();
}

class _DefaultDialogState extends State<DefaultDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _picImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future<void> addUser(String name, String email, String contact) async {
    if (_image == null) return; // No image selected
    final uri = Uri.parse(
        'https://thetimes.co.in/attendence/api/store'); // Replace with your API endpoint
    var request = http.MultipartRequest('POST', uri);
    request.files
        .add(await http.MultipartFile.fromPath('profilePic', _image!.path));
    request.fields['name'] = name;
    request.fields['email'] = email;
    request.fields['contact'] = contact;
    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        print('Data Sent');
      } else {
        print('Some error occured');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: const Text(
        'Add User',
        style: TextStyle(fontSize: 17),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                _picImage();
                setState(() {});
              },
              child: const CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(
                    'https://images.getpng.net/uploads/preview/instagram-social-network-app-interface-icons-smartphone-frame-screen-template27-1151637511568djfdvfkdob.webp'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            DefaultTextField(
              controller: _nameController,
              hintText: 'Enter name',
            ),
            const SizedBox(
              height: 10,
            ),
            DefaultTextField(
              controller: _emailController,
              hintText: 'Enter email',
            ),
            const SizedBox(
              height: 10,
            ),
            DefaultTextField(
              controller: _contactController,
              hintText: 'Enter contact',
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Back'),
        ),
        ElevatedButton(
          onPressed: () {
            addUser(
              _nameController.text,
              _emailController.text,
              _contactController.text,
            );
            Navigator.of(context).pop();
            setState(() {});
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
