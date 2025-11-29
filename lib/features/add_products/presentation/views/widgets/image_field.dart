import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onChanged, this.currentImage});
  final ValueChanged<File?> onChanged;
  final String? currentImage;
  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? fileImage;
  late String currentImage;
  @override
  void initState() {
    currentImage = widget.currentImage ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          try {
            await pickImageFromGallery();
          } catch (error) {
            isLoading = false;
            setState(() {});
            log("there was an error when picking image $error");
          }
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: currentImage.isNotEmpty
                  ? Image.network(widget.currentImage!)
                  : fileImage != null
                      ? Image.file(fileImage!)
                      : const Icon(
                          Icons.image_outlined,
                          size: 250,
                        ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  if (currentImage.isNotEmpty) {
                    currentImage = '';
                    widget.onChanged(null);
                  } else {
                    fileImage = null;
                    widget.onChanged(null);
                  }
                });
              },
              icon: fileImage != null || currentImage.isNotEmpty
                  ? const Icon(
                      Icons.delete_sharp,
                      color: Colors.red,
                      size: 30,
                    )
                  : const SizedBox(),
            ),
            Text("image name= ${getFileName(fileImage ?? File(currentImage))}"),
          ],
        ),
      ),
    );
  }

  Future<void> pickImageFromGallery() async {
    isLoading = true;
    setState(() {});
    final ImagePicker imagePicker = ImagePicker();
    final XFile? file =
        await imagePicker.pickImage(source: ImageSource.gallery);
    fileImage = File(file!.path);
    widget.onChanged(fileImage);
    setState(() {
      isLoading = false;
    });
  }

  String getFileName(File path) {
    if (path.path.isNotEmpty) {
      return path.path.split('/').last;
    } else {
      return "no image";
    }
  }
}
