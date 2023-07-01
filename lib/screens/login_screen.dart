import 'package:flutter/material.dart';
import 'package:react_example/bloc/login/login_bloc.dart';
import 'package:react_example/bloc/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:react_example/screens/home_screen.dart';

import '../widgets/error_dialog.dart';
import '../widgets/loading_section.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "LoginScreen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode myFocusNode1 = FocusNode();
  FocusNode myFocusNode2 = FocusNode();
  bool show1 = true;
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final mail = TextEditingController();
  final passCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var queryData = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            final status = context.read<LoginBloc>().state.loginStatus;
            if(status == LoginStatus.loading){
              showDialog(context: context, builder: (context) => const LoadingSection(),);
            }else if(status == LoginStatus.logged){
              Navigator.of(context).pop();
              context.read<LoginBloc>().add(const ToggleScreens(statess: LoginStatus.initial));
              Navigator.of(context).pushNamed(HomeScreen.routeName);
            }else if(status == LoginStatus.error){
              Navigator.of(context).pop();
              errorDialog(context, state.customError.errorMsg);
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              autovalidateMode: autovalidateMode,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: queryData.size.height * 0.2,
                              child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 10.0,
                                        offset: Offset(0, 10),
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Image.asset('images/logo.png'))),
                        ],
                      ),
                      SizedBox(
                        height: queryData.size.height * 0.04,
                      ),
                      TextFormField(
                        focusNode: myFocusNode1,
                        controller: mail,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please! Enter Email Id';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Email Id',
                          hintText: 'Enter Email Id',
                          labelStyle: TextStyle(
                              color: myFocusNode1.hasFocus
                                  ? const Color(0xFFE52D2D)
                                  : const Color(0xFF303640)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Color(0xFF94ADCF)),
                              borderRadius: BorderRadius.circular(20)),
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Color(0xFFE52D2D)),
                              borderRadius: BorderRadius.circular(20)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Color(0xFFE52D2D)),
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Color(0xFFE52D2D)),
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: Icon(Icons.mail,
                              color: myFocusNode1.hasFocus
                                  ? const Color(0xFFE52D2D)
                                  : const Color(0xFF303640)),
                        ),
                      ),
                      SizedBox(
                        height: queryData.size.height * 0.02,
                      ),
                      TextFormField(
                        focusNode: myFocusNode2,
                        obscureText: show1,
                        controller: passCont,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please! Enter Password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter Password',
                          labelStyle: TextStyle(
                              color: myFocusNode2.hasFocus
                                  ? const Color(0xFFE52D2D)
                                  : const Color(0xFF303640)),
                          suffixIcon: IconButton(
                            icon: Icon(
                                show1 ? Icons.visibility : Icons.visibility_off,
                                color: myFocusNode2.hasFocus
                                    ? const Color(0xFFE52D2D)
                                    : const Color(0xFF303640)),
                            onPressed: () {
                              setState(() {
                                show1 = !show1;
                              });
                            },
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Color(0xFF94ADCF)),
                              borderRadius: BorderRadius.circular(20)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Color(0xFFE52D2D)),
                              borderRadius: BorderRadius.circular(20)),
                          errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Color(0xFFE52D2D)),
                              borderRadius: BorderRadius.circular(20)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Color(0xFFE52D2D)),
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: Icon(Icons.mail,
                              color: myFocusNode2.hasFocus
                                  ? const Color(0xFFE52D2D)
                                  : const Color(0xFF303640)),
                        ),
                      ),
                      SizedBox(
                        height: queryData.size.height * 0.05,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                              offset: Offset(0, 10),
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                autovalidateMode = AutovalidateMode.always;
                              });

                              final form = _formKey.currentState;

                              if (form != null && form.validate()) {
                                form.save();
                                context.read<LoginBloc>().add(LoginUser(email: mail.text, pass: passCont.text));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shadowColor:
                                    const Color(0xFF808080).withOpacity(0.4),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            child: SizedBox(
                              width: queryData.size.width * 0.3,
                              height: queryData.size.height * 0.05,
                              child: const Center(
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: queryData.size.height * 0.02,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
