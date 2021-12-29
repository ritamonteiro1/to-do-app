import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:to_do_app/store/login_store.dart';
import 'package:to_do_app/widget/custom_text_field.dart';
import 'package:to_do_app/screen/list_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginStore loginStore = LoginStore();

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
                  CustomTextField(
                      controller: null,
                      hint: 'Email',
                      prefix: Icon(Icons.account_circle),
                      suffix: null,
                      obscure: false,
                      textInputType: TextInputType.emailAddress,
                      onChanged: loginStore.setEmail,
                      enable: null),
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
                          enable: null);
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Observer(builder: (_) {
                    return SizedBox(
                      height: 44,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        child: Text('Login'),
                        color: Theme.of(context).primaryColor,
                        disabledColor:
                            Theme.of(context).primaryColor.withAlpha(100),
                        textColor: Colors.white,
                        onPressed: loginStore.isFormValid
                            ? () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => ListScreen()));
                              }
                            : null,
                      ),
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
