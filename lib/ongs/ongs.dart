import 'package:firebase_storage/firebase_storage.dart';

import '../backend/backend.dart';

class Ongs {
  static Map<DocumentReference, OngsRecord> ongsMap = {};

  static Future loadOngs() async {
    if (ongsMap.length == 0) {
      List<OngsRecord> list = await queryCollectionOnce(OngsRecord.collection, OngsRecord.serializer, queryBuilder: (ongRecord) => ongRecord);
      ongsMap = {for (var item in list) item.reference: item};
    }
  }

  static String getOngName(DocumentReference? reference) {
    return ongsMap[reference]?.name ?? "";
  }
}
