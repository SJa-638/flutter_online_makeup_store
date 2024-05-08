import 'package:flutter/material.dart';

class SignupModel extends ChangeNotifier {
  final unfocusNode = FocusNode();
  late TabController tabController;

  late FocusNode emailAddressCreateFocusNode;
  late TextEditingController emailAddressCreateTextController;
  late String? Function(String?) emailAddressCreateTextControllerValidator;

  late FocusNode passwordCreateFocusNode;
  late TextEditingController passwordCreateTextController;
  late bool passwordCreateVisibility;
  late String? Function(String?) passwordCreateTextControllerValidator;

  late FocusNode emailAddressFocusNode;
  late TextEditingController emailAddressTextController;
  late String? Function(String?) emailAddressTextControllerValidator;

  late FocusNode passwordFocusNode;
  late TextEditingController passwordTextController;
  late bool passwordVisibility;
  late String? Function(String?) passwordTextControllerValidator;

  void initState(BuildContext context) {
    tabController = TabController(length: 2, vsync: NavigatorState());

    emailAddressCreateFocusNode = FocusNode();
    emailAddressCreateTextController = TextEditingController();
    passwordCreateFocusNode = FocusNode();
    passwordCreateTextController = TextEditingController();
    passwordCreateVisibility = false;

    emailAddressFocusNode = FocusNode();
    emailAddressTextController = TextEditingController();
    passwordFocusNode = FocusNode();
    passwordTextController = TextEditingController();
    passwordVisibility = false;

     }
@override
  void dispose() {
    unfocusNode.dispose();
    tabController.dispose();
    emailAddressCreateFocusNode.dispose();
    emailAddressCreateTextController.dispose();
    passwordCreateFocusNode.dispose();
    passwordCreateTextController.dispose();
    emailAddressFocusNode.dispose();
    emailAddressTextController.dispose();
    passwordFocusNode.dispose();
    passwordTextController.dispose();
  }
}