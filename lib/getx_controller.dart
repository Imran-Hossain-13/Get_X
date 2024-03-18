import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CounterController extends GetxController{
  RxInt counter = 0.obs;
  RxDouble opacity = 0.5.obs;
  RxBool notification = false.obs;
  RxList<String> country = ['Bangladesh','Pakistan','Nepal','China','Japan','Finland'].obs;
  RxList favoriteCountry = [].obs;
  incrementCounter(){
      counter.value++;
  }
  decrementCounter(){
    if(counter.value >= 1){
      counter.value--;
    }
  }
  changeOpacity(double value){
    opacity.value = value;
  }
  changeNotification(){
    notification.value = !notification.value;
  }
  selectCountry(String country){
    if(favoriteCountry.contains(country)){
      favoriteCountry.remove(country);
    }else{
      favoriteCountry.add(country);
    }
  }
}

class ImagePickerController extends GetxController{
  RxString imagePath = ''.obs;
  Future getImage() async{
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if(image != null){
      imagePath.value = image.path.toString();
    }
  }
}