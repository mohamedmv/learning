



import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
void cameraOrGallery(BuildContext context,Function update){
showDialog(
              context: context,
              barrierDismissible: true,
              builder: (context) {
                final _codeController = TextEditingController();
                return AlertDialog(
                  title: Text("Pick image"),
                  content: Row(
                    
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                       Expanded(
                         child: PhotoButton(
                            title:'Gallery',
                            icon: Icons.photo,onTap: () async{
                              var file = await ImagePicker().pickImage(source: ImageSource.gallery);
                              if(file != null){
                                 file.readAsBytes().then((f){
                                      update(f);
                                    });
                              }
                                   

                              
                              Navigator.pop(context);
                          },),
                       ),
                      
                       Expanded(
                         child: PhotoButton(
                           title:'Camera',
                           icon: Icons.camera_alt,onTap: ()async{
                             var file = await ImagePicker().pickImage(source: ImageSource.gallery);
                              if(file != null){
                                 file.readAsBytes().then((f){
                                      update(f);
                                    });
                              }
                            Navigator.pop(context);
                         },),
                       )
                      
                      
                    ],
                  ),
                  
                );

              });

              }

class PhotoButton extends StatelessWidget {
  VoidCallback onTap;
  IconData icon;
  Color color;
  String title;
   PhotoButton({ Key? key,required this.icon,required this.onTap ,this.color =Colors.blue,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(onPressed: onTap, icon:Icon(icon,size: 60,color: color,),padding: EdgeInsets.all(0), ),
            SizedBox(height: 20,),
                     Text(title)
        ],
      
    );
  }
}