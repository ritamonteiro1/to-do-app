import 'package:flutter/material.dart';
import 'package:to_do_app/widget/custom_text_field.dart';
import 'package:to_do_app/screen/login_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tarefas',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 32),
                    ),
                    IconButton(
                      icon: Icon(Icons.exit_to_app),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // CustomTextField(
                        //     controller: controller,
                        //     hint: hint,
                        //     prefix: prefix,
                        //     suffix: suffix,
                        //     obscure: obscure,
                        //     textInputType: textInputType,
                        //     onChanged: onChanged,
                        //     enable: enable),
                        const SizedBox(
                          height: 8,
                        ),
                        Expanded(
                            child: ListView.separated(
                                itemBuilder: (_, index) {
                                  return ListTile(
                                    title: Text('Item $index'),
                                    onTap: () {},
                                  );
                                },
                                separatorBuilder: (_, __) {
                                  return Divider();
                                },
                                itemCount: 10))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
