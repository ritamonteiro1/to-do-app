import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:to_do_app/screen/list_screen.dart';
import 'package:to_do_app/store/login_store.dart';
import 'package:to_do_app/widget/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginStore loginStore;
  late ReactionDisposer disposer;

  @override
  void initState() {
    loginStore = LoginStore();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    disposer = reaction((_) => loginStore.loggedIn, (loggedIn) {
      if (loggedIn != null && loggedIn == true) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ListScreen()));
      }
    });
  }

  @override
  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(32),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 16,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Observer(
                    builder: (_) {
                      return CustomTextField(
                          controller: null,
                          hint: 'Email',
                          prefix: Icon(Icons.account_circle),
                          suffix: null,
                          obscure: false,
                          textInputType: TextInputType.emailAddress,
                          onChanged: loginStore.setEmail,
                          enable: !loginStore.loading);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Observer(
                    builder: (_) {
                      return CustomTextField(
                          controller: null,
                          hint: 'Senha',
                          prefix: Icon(Icons.lock),
                          suffix: IconButton(
                            icon: loginStore.passwordVisible
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: loginStore.togglePasswordVisibility,
                          ),
                          obscure: !loginStore.passwordVisible,
                          textInputType: TextInputType.visiblePassword,
                          onChanged: loginStore.setPassword,
                          enable: !loginStore.loading);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Observer(builder: (_) {
                    return SizedBox(
                      height: 44,
                      child: ElevatedButton(
                          child: loginStore.loading
                              ? CircularProgressIndicator(
                                  valueColor:
                                      AlwaysStoppedAnimation(Colors.white),
                                )
                              : Text('Login'),
                          style: ElevatedButton.styleFrom(),
                          onPressed: loginStore.isFormValid
                              ? () {
                                  loginStore.doLogin();
                                }
                              : null),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
