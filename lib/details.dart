import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

//var to store the uploaded image
//? signifies that some value will be inserted in future
File? pickedImage;

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  //method to get the bottomsheet
  void imagePickerOption(){
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),

          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Upload Image From',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 10,),

                  ElevatedButton.icon(
                      onPressed: () {
                        //upload image from source gallery
                        pickImage(ImageSource.gallery);
                      },
                      icon: Icon(Icons.photo),
                      label: Text('Gallery'),
                  ),

                  SizedBox(height: 10,),

                  ElevatedButton.icon(
                    onPressed: () {
                      //upload image from camera source
                      pickImage(ImageSource.camera);
                    },
                    icon: Icon(Icons.photo_camera),
                    label: Text('Camera'),
                  ),

                  SizedBox(height: 10,),

                  ElevatedButton.icon(
                    onPressed: () {
                      //on pressing get back
                      Get.back();
                    },
                    icon: Icon(Icons.cancel),
                    label: Text('Cancel'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //method to pick image
  //@param imageType to pass the source when buttons are tapped

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      //if photo true, store the path of image
      final tempImage = File(photo.path);
      setState(() {
        //store the path in var
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: Colors.orange,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15, 40, 0, 0),
                child: Text(
                    'Fill Your Product Details:',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0
                    ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(20, 35, 30, 0),
                child: Column(
                  children: [
                    TextField(
                        decoration: InputDecoration(
                        labelText: 'Name of Product',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                            focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              Container(
                padding: EdgeInsets.fromLTRB(20, 35, 30, 0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Price of Product',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(20, 35, 30, 0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Punchline of Product',
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(0.0),
                child: ClipRRect(
                  child: pickedImage != null ?
                  Image.file(
                    pickedImage!,
                    fit: BoxFit.cover,
                  ):
                  Image.network(
                    'https://i.pinimg.com/564x/fb/0d/fe/fb0dfe769ca07be8fd98775f93780c34.jpg',
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton.icon(
                  onPressed: () {
                    imagePickerOption();
                  },
                  icon: Icon(Icons.image),
                  label: Text('Upload Image'),

                ),
              ),

              SizedBox(height: 5,),
              Container(
                alignment: Alignment.center,
                child: ElevatedButton.icon(
                  onPressed: () {
                  },
                  icon: Icon(Icons.done),
                  label: Text('Submit'),

                ),
              ),

            ],
    ),

    ),
    );
  }
}
