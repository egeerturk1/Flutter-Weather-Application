import 'package:flutter/material.dart';
import 'package:hava_durumu/repository/DatabaseRepository.dart';
import 'package:hava_durumu/tools/locator.dart';
import 'package:hava_durumu/view/register_page.dart';
import 'package:hava_durumu/view_model/login_view_model.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';
import '../yerel_veri_tabanı.dart';
import 'main_page.dart';

class LoginPage extends StatelessWidget {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();



  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      centerTitle: true,
      title: Text("Hava Durumu"),
    );
  }

  Widget _buildBody(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Center(
        child: Column(
          children: [
            Text(
              "LOGIN",
              style: TextStyle(
                fontSize: 50,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 35, left: 40, right: 40, bottom: 15,
              ),
              child: Consumer<LoginViewModel>(
                builder: (context, viewModel, child) {
                  return Column(
                    children: [
                      Text(
                        viewModel.text,
                        style: TextStyle(color: Colors.red),
                      ),
                      TextField(
                        controller: controller1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          hintText: "Username",
                          hintStyle: TextStyle(color: Colors.white24),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.indigo, width: 2.0),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextField(
                        controller: controller2,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white24),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.indigo, width: 2.0),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          viewModel.openRegisterPage(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "If you are not registered, register.",
                              style: TextStyle(
                                color: Colors.indigoAccent,
                                fontSize: 15,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.indigoAccent,
                                decorationStyle: TextDecorationStyle.double,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (controller1.text.isNotEmpty && controller2.text.isNotEmpty) {
                            List<User> userList1 = await viewModel.getAllUsers();
                            for (User u in userList1) {
                              if (u.username == controller1.text && u.password == controller2.text) {
                                viewModel.text = "";
                                viewModel.openMainPage(context);
                              } else {
                                viewModel.text = "Lütfen Kayıt Olunuz";
                              }
                            }
                          } else {
                            viewModel.showAlertDialog2(context);
                          }
                        },
                        child: Text("LOGIN"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }




}
