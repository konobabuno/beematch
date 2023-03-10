import 'package:beematch/blocs/blocs.dart';
import 'package:beematch/config/theme.dart';
import 'package:beematch/repositories/storage/storage_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CustomImageContainer extends StatelessWidget {
  final TabController tabController;
  const CustomImageContainer({super.key, required this.tabController, this.imageUrl});

  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: Container(
        height: 150,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppTheme.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: 

          (imageUrl == null) ?
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: IconButton(
                iconSize: 40,
                icon: const Icon(Icons.add_circle, color: AppTheme.green,), 
                  onPressed: () async {
                    ImagePicker _picker = ImagePicker();
                    final XFile? _image = 
                      await _picker.pickImage(source: ImageSource.gallery);
                      
                    if (_image == null){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Ninguna imagen fue seleccionada')
                        ));
                    }

                    if (_image != null){
                      print('Uploading ...');
                      // StorageRepository().uploadImage(_image);
                      context
                        .read<OnboardingBloc>()
                        .add(UpdateUserImages(image: _image));
                    }
                },
              ),
            )
          ) : ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(imageUrl!, fit: BoxFit.cover, ),
          ),


      ),
    );
  }
}