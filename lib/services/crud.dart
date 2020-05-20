import 'package:cloud_firestore/cloud_firestore.dart';

class crudMethods {
  getapp() async {
    return await Firestore.instance.collection('app').getDocuments();
  }
  getdesign() async {
    return await Firestore.instance.collection('design').getDocuments();
  }
  getuiux() async {
    return await Firestore.instance.collection('uiux').getDocuments();
  }
}