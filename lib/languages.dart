import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations{
  @override
  Map<String, Map<String,String>> get keys => {
    'en_US':{
      'message' : 'What is your name?',
      'name' : 'Imran Hossain'
    },
    'jp_JP':{
      'message' : 'あなたの名前は何ですか？',
      'name' : 'イムラン・ホセイン'
    },
    'bn_BD':{
      'message' : 'আপনার নাম কি?',
      'name' : 'ইমরান হোসেন'
    },
  };
}