import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/scheduler.dart';
import 'package:flutter_online_makeup_store/Widgets/MyCustomButton.dart';
import 'package:flutter_online_makeup_store/Models/SignupModel.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with TickerProviderStateMixin {
  late SignupModel _model;
  late TabController _tabController;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = SignupModel();

    _tabController = TabController(
      length: 2,
      initialIndex: 0,
      vsync: this,
    );
    _tabController.addListener(() => setState(() {}));

    _model.emailAddressCreateTextController ??= TextEditingController();
    _model.emailAddressCreateFocusNode ??= FocusNode();

    _model.passwordCreateTextController ??= TextEditingController();
    _model.passwordCreateFocusNode ??= FocusNode();

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();
    _tabController.dispose();
    super.dispose();
  }
@override
Widget build(BuildContext context) {
  return GestureDetector(
    onTap: () {
      if (_model.unfocusNode.canRequestFocus) {
        FocusScope.of(context).requestFocus(_model.unfocusNode);
      } else {
        FocusScope.of(context).unfocus();
      }
    },
    child: Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFFCD2DB),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 12, 32, 32),
              child: Container(
                width: double.infinity,
                height: 230,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/WhatsApp_Image_2024-05-07_at_13.56.57_a49525e8.jpg'),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
              ),
            ),
              Align(
                alignment: AlignmentDirectional(0, -1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 170, 0, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.sizeOf(context).width >= 768.0
                                ? 530.0
                                : 630.0,
                            constraints: BoxConstraints(
                              maxWidth: 570,
                            ),
                            decoration: BoxDecoration(
                              color:Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x33000000),
                                  offset: Offset(
                                    0,
                                    2,
                                  ),
                                )
                              ],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment(0, 0),
                                    child: TabBar(
                                      isScrollable: true,
                                      labelColor: Colors.black,
                                       unselectedLabelColor: Color.fromARGB(125, 158, 158, 158),
                                      labelPadding: EdgeInsets.symmetric(horizontal: 32),
                                      labelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(fontFamily: 'Readex Pro', letterSpacing: 0),
                                      unselectedLabelStyle: Theme.of(context).textTheme.subtitle1!.copyWith(fontFamily: 'Readex Pro', letterSpacing: 0),
                                    
                                      indicatorColor: Color(0xFFFF00B0),
                                      indicatorWeight: 3,
                                      tabs: [
                                        Tab(
                                          text: 'Create Account',
                                        ),
                                        Tab(
                                          text: 'Log In',
                                        ),
                                      ],
                                      controller: _model.tabController,
                                      onTap: (i) async {
                                        [() async {}, () async {}][i]();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                  child: TabBarView(
                                    controller: _model.tabController,
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 230,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text(
                                                  'Create Account',
                                                  style: Theme.of(context).textTheme.headline6!.copyWith(fontFamily: 'Outfit', letterSpacing: 0),
                                                ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 24),
                                                    child: Text(
                                                      'Let\'s get started by filling out the form below.',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                        fontFamily: 'Readex Pro',
                                                        letterSpacing: 0,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 16),
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .emailAddressCreateTextController,
                                                        focusNode: _model
                                                            .emailAddressCreateFocusNode,
                                                        autofocus: true,
                                                        autofillHints: [
                                                          AutofillHints.email
                                                        ],
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'Email',
                                                          labelStyle: TextStyle(
                                                          fontFamily: 'Readex Pro',
                                                          letterSpacing: 0,
                                                        ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color.fromARGB(255, 201, 199, 201),
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: const Color(0xFFFF00B0),
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors.red,
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color:Colors.red,
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40),
                                                          ),
                                                          filled: true,
                                                          fillColor: Colors.white,
                                                          contentPadding:
                                                              EdgeInsets.all(
                                                                  24),
                                                        ),
                                                        style: TextStyle(
                                                        fontFamily: 'Readex Pro',
                                                        letterSpacing: 0,
                                                      ),
                                                            keyboardType:
                                                                TextInputType
                                                                    .emailAddress,
                                                        validator: _model.emailAddressCreateTextControllerValidator,
                                                     ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 16),
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .passwordCreateTextController,
                                                        focusNode: _model
                                                            .passwordCreateFocusNode,
                                                        autofocus: true,
                                                        autofillHints: [
                                                          AutofillHints.password
                                                        ],
                                                        obscureText: !_model
                                                            .passwordCreateVisibility,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'Password',
                                                          labelStyle: TextStyle(
                                                            fontFamily: 'Readex Pro',
                                                            letterSpacing: 0,
                                                          ),
                                                        
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: const Color.fromARGB(255, 211, 209, 209),
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: const Color(0xFFFF00B0),
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors.red,
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors.red,
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40),
                                                          ),
                                                          filled: true,
                                                          fillColor: Colors.white,
                                                          contentPadding:
                                                              EdgeInsets.all(
                                                                  24),
                                                          suffixIcon: InkWell(
                                                            onTap: () =>
                                                                setState(
                                                              () => _model
                                                                      .passwordCreateVisibility =
                                                                  !_model
                                                                      .passwordCreateVisibility,
                                                            ),
                                                            focusNode: FocusNode(
                                                                skipTraversal:
                                                                    true),
                                                            child: Icon(
                                                              _model.passwordCreateVisibility
                                                                  ? Icons
                                                                      .visibility_outlined
                                                                  : Icons
                                                                      .visibility_off_outlined,
                                                              color: const Color(0xFF57636C),
                                                              size: 24,
                                                            ),
                                                          ),
                                                        ),
                                                        style: TextStyle(
                                                        fontFamily: 'Readex Pro',
                                                        letterSpacing: 0,
                                                      ),
                                                      keyboardType: TextInputType.text,
                                                      validator: _model.passwordCreateTextControllerValidator,
                                                      
                                                    ),
                                                                                            ),
                                                                                          ),
                                                                                        Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(bottom: 16),
                                            child: ElevatedButton(
                                            onPressed: () async {},
                                            /*    // Handle button onPressed logic here
                                                GoRouter.of(context).prepareAuthEvent();

                                              final user = await authManager.createAccountWithEmail(
                                                  context,
                                                  _model.emailAddressCreateTextController.text,
                                                  _model.passwordCreateTextController.text,
                                                );

                                                if (user == null) {
                                                  return;
                                                }
                                                
                                                context.goNamedAuth('null', context.mounted);
                                              }, */
                                              style: ElevatedButton.styleFrom(
                                                primary: Color(0xFFFF00B0),
                                                minimumSize: Size(230, 52),
                                                padding: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(40),
                                                ),
                                                elevation: 3,
                                              ),
                                              child: Ink(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFF00B0),
                                                  borderRadius: BorderRadius.circular(40),
                                                ),
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  width: 230,
                                                  height: 52,
                                                  child: Text(
                                                    'Get Started',
                                                    style: TextStyle(
                                                      fontFamily: 'Readex Pro',
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      letterSpacing: 0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                                ),
                                          ),
                                                 ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16,
                                                                      0,
                                                                      16,
                                                                      24),
                                                          child: Text(
                                                            'Or sign up with',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  letterSpacing:
                                                                      0,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 16),
                                                          child: Wrap(
                                                           spacing: 16,
                                                            runSpacing: 0,
                                                            alignment: WrapAlignment.center,
                                                            crossAxisAlignment: WrapCrossAlignment.center,
                                                            direction: Axis.horizontal,
                                                            runAlignment: WrapAlignment.center,
                                                            verticalDirection: VerticalDirection.down,
                                                            clipBehavior: Clip.none,
                                                            children: [
                                                              MyCustomButton(
                                                                onPressed: () async {
                                                                  // Add your action for 'Continue with Google' button
                                                                },
                                                                buttonText: 'Continue with Google',
                                                                iconData: Icons.ac_unit, // Replace with Google icon
                                                              ),
                                                              
                                                                MyCustomButton(
                                                                  onPressed: () async {
                                                                    // Add your action for 'Continue with Apple' button
                                                                  },
                                                                  buttonText: 'Continue with Apple',
                                                                  iconData: Icons.ac_unit, // Replace with Apple icon
                                                                ),
                                                            ],
                                                        ),
                                                      ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0, -1),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24, 16, 24, 0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                    Container(
                                                      width: 230,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  Text(
                                                    'Welcome Back',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                          fontFamily: 'Outfit',
                                                          letterSpacing: 0,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 24),
                                                    child: Text(
                                                      'Fill out the information below in order to access your account.',
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                            fontFamily:
                                                                'Readex Pro',
                                                            letterSpacing: 0,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 16),
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .emailAddressTextController,
                                                        focusNode: _model
                                                            .emailAddressFocusNode,
                                                        autofocus: true,
                                                        autofillHints: [
                                                          AutofillHints.email
                                                        ],
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'Email',
                                                          labelStyle:TextStyle(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors.white,
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color:const Color(0xFFFF00B0),
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color:const Color.fromARGB(255, 194, 192, 192),
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: const Color.fromARGB(255, 198, 196, 196),
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40),
                                                          ),
                                                          filled: true,
                                                          fillColor: Colors.white,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24,
                                                                      24,
                                                                      0,
                                                                      24),
                                                        ),
                                                        style: TextStyle(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              letterSpacing: 0,
                                                            ),
                                                        keyboardType:
                                                            TextInputType
                                                                .emailAddress,
                                                         validator: (value) {
                                                          if (value == null || value.isEmpty) {
                                                            return 'Please enter an email address';
                                                          }
                                                          // Add additional validation logic here if needed
                                                          return null; // Return null to indicate no error
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 16),
                                                    child: Container(
                                                      width: double.infinity,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .passwordTextController,
                                                        focusNode: _model
                                                            .passwordFocusNode,
                                                        autofocus: true,
                                                        autofillHints: [
                                                          AutofillHints.password
                                                        ],
                                                        obscureText: !_model
                                                            .passwordVisibility,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'Password',
                                                          labelStyle:TextStyle(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    letterSpacing:
                                                                        0,
                                                                  ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: const Color.fromARGB(255, 197, 196, 196),
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(0xFFFF00B0),
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors.red,
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors.red,
                                                              width: 2,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40),
                                                          ),
                                                          filled: true,
                                                          fillColor:Colors.white,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      24,
                                                                      24,
                                                                      0,
                                                                      24),
                                                          suffixIcon: InkWell(
                                                            onTap: () =>
                                                                setState(
                                                              () => _model
                                                                      .passwordVisibility =
                                                                  !_model
                                                                      .passwordVisibility,
                                                            ),
                                                            focusNode: FocusNode(
                                                                skipTraversal:
                                                                    true),
                                                            child: Icon(
                                                              _model.passwordVisibility
                                                                  ? Icons
                                                                      .visibility_outlined
                                                                  : Icons
                                                                      .visibility_off_outlined,
                                                              color: Colors.grey,
                                                              size: 24,
                                                            ),
                                                          ),
                                                        ),
                                                        style: TextStyle(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              letterSpacing: 0,
                                                            ),
                                                         validator: (value) {
                                                          if (value == null || value.isEmpty) {
                                                            return 'Please enter a password';
                                                          }
                                                          // Add additional validation logic here if needed
                                                          return null; // Return null to indicate no error
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 16),
                                                      child: ElevatedButton(
                                                        onPressed: () async {},
                                                        /*   GoRouter.of(context)
                                                              .prepareAuthEvent();

                                                          final user =
                                                              await authManager
                                                                  .signInWithEmail(
                                                            context,
                                                            _model
                                                                .emailAddressTextController
                                                                .text,
                                                            _model
                                                                .passwordTextController
                                                                .text,
                                                          );
                                                          if (user == null) {
                                                            return;
                                                          }

                                                          context.goNamedAuth(
                                                              'null',
                                                              context.mounted);
                                                        }, */
                                                        style: ButtonStyle(
                                                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFF00B0)),
                                                        elevation: MaterialStateProperty.all<double>(3),
                                                        shape: MaterialStateProperty.all<OutlinedBorder>(
                                                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                                                        ),
                                                        side: MaterialStateProperty.all<BorderSide>(
                                                          BorderSide(color: Colors.transparent, width: 1),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Text(
                                                          'Sign In',
                                                          style: TextStyle(
                                                            fontFamily: 'Readex Pro',
                                                            letterSpacing: 0,
                                                            color: Colors.white,
                                                            fontSize: 16, // Adjust font size as needed
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    ),
                                                  ),

                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(16, 0,
                                                                  16, 24),
                                                      child: Text(
                                                        'Or sign in with',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:TextStyle(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              letterSpacing: 0,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Wrap(
                                                      spacing: 16,
                                                      runSpacing: 0,
                                                      alignment:
                                                          WrapAlignment.center,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .center,
                                                      direction:
                                                          Axis.horizontal,
                                                      runAlignment:
                                                          WrapAlignment.center,
                                                      verticalDirection:
                                                          VerticalDirection
                                                              .down,
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 16),
                                                          child:ElevatedButton.icon(
                                                            onPressed: () async {
                                                              // Handle logic for signing in with Google
                                                            },
                                                            icon: Icon(
                                                              Icons.work, // Replace with Google icon
                                                              // size: 20, // Customize icon size if needed
                                                            ),
                                                            label: Text(
                                                              'Continue with Google',
                                                              style: TextStyle(
                                                                fontFamily: 'Readex Pro',
                                                                fontWeight: FontWeight.bold,
                                                                letterSpacing: 0,
                                                              ),
                                                            ),
                                                            style: ButtonStyle(
                                                              elevation: MaterialStateProperty.all(0),
                                                              backgroundColor: MaterialStateProperty.all(Colors.white),
                                                              shape: MaterialStateProperty.all(
                                                                RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(40),
                                                                  side: BorderSide(
                                                                    color: const Color.fromARGB(255, 193, 192, 192),
                                                                    width: 2,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                   if (!Platform.isAndroid)  // Include this check if the platform is not Android
                                                    Padding(
                                                      padding: const EdgeInsets.only(bottom: 16),
                                                      child: ElevatedButton.icon(
                                                        onPressed: () async {
                                                          // Handle logic for signing in with Apple
                                                        },
                                                        icon: Icon(
                                                          Icons.grade, // Replace with Apple icon
                                                          // size: 20, // Customize icon size if needed
                                                        ),
                                                        label: Text(
                                                          'Continue with Apple',
                                                          style: TextStyle(
                                                            fontFamily: 'Readex Pro',
                                                            fontWeight: FontWeight.bold,
                                                            letterSpacing: 0,
                                                          ),
                                                        ),
                                                        style: ButtonStyle(
                                                          elevation: MaterialStateProperty.all(0),
                                                          backgroundColor: MaterialStateProperty.all(Colors.white),
                                                          shape: MaterialStateProperty.all(
                                                            RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(40),
                                                              side: BorderSide(
                                                                color: const Color.fromARGB(255, 221, 220, 220),
                                                                width: 2,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),

                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 16),
                                                      child: ElevatedButton(
                                                        onPressed: () async {},
                                                        /*  // Perform any necessary actions
                                                          // Example: Sign in with Google
                                                          GoRouter.of(context).prepareAuthEvent();
                                                          final user = await authManager.signInWithGoogle(context);
                                                          if (user == null) {
                                                            return;
                                                          }
                                                          context.goNamedAuth('null', context.mounted);
                                                        }, */
                                                        style: ButtonStyle(
                                                          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                                          padding: MaterialStateProperty.all<EdgeInsets>(
                                                            EdgeInsets.symmetric(horizontal: 32, vertical: 0),
                                                          ),
                                                          elevation: MaterialStateProperty.all<double>(0),
                                                          shape: MaterialStateProperty.all<OutlinedBorder>(
                                                            RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(40),
                                                              side: BorderSide(color: Colors.white, width: 2),
                                                            ),
                                                          ),
                                                        ),
                                                        child: Text(
                                                          'Forgot Password?',
                                                          style: TextStyle(
                                                            fontFamily: 'Readex Pro',
                                                            letterSpacing: 0,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 16, // Adjust font size as needed
                                                            color: Colors.black, // Change text color as needed
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              
                                              ),
                                            ),
                                                ],
                                        ),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                                ],
                        ),
                    ),
                          ),
                    ),
                      ],
                ),
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
    );
  }
}
