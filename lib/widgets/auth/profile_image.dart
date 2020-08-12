import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File pickedImage) imagePickFn;
  UserImagePicker(this.imagePickFn);
  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File _enterImage;

  Future getImage() async {
    final pickedImage = await ImagePicker()
        .getImage(source: ImageSource.camera, imageQuality: 50, maxWidth: 150);

    setState(() {
      _enterImage = File(pickedImage.path);
    });
    widget.imagePickFn(_enterImage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          // backgroundColor: Colors.blue[200],
          backgroundImage: _enterImage != null ? FileImage(_enterImage) : null,
          radius: 50.0,
        ),
        FlatButton.icon(
            onPressed: getImage,
            icon: Icon(Icons.image),
            label: Text('Upload Image'))
      ],
    );
  }
}
