import 'package:learning_input_image/learning_input_image.dart';


import 'package:learning_text_recognition/learning_text_recognition.dart';

class TextRecognizer{


 InputCameraView getText() {
  print('++++++++++++++0');
  String text = '';

   return InputCameraView(
  canSwitchMode: false,
  mode: InputCameraMode.gallery,
  title: 'Text Recognition',
  onImage: (InputImage image) async {
// or like this:
TextRecognition textRecognition = TextRecognition(
  options: TextRecognitionOptions.Default
);
 print('++++++++++++++1');
  RecognizedText ?result = await textRecognition.process(image);
  if(result != null){
   text =  result.text;
  }
  print(text);

  
  },
);
}

}