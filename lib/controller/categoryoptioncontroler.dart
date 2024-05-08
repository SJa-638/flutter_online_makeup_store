import 'package:get/get.dart';
import 'package:flutter_online_makeup_store/Models/product.dart';

class CategoryOptionController extends GetxController {
  var CategoryStrings = [
    'PENCIL',
    'LIPSTICK',
    'LIQUID',
    'EMPTY',
    'POWDER',
    'LIP_GLOSS',
    'GEL',
    'CREAM',
    'PALETTE',
    'CONCEALER',
    'HIGHLIGHTER',
    'BB_CC',
    'CONTOUR',
    'LIP_STAIN',
    'MINERAL'
  ].obs;

  List<String> get Category {
    return [...CategoryStrings];
  }
}
