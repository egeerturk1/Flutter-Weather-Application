import 'package:flutter/material.dart';
import 'package:hava_durumu/view/login_page.dart';
import 'package:hava_durumu/view_model/register_view_model.dart';
import 'package:hava_durumu/yerel_veri_taban%C4%B1.dart';
import 'package:provider/provider.dart';

import '../model/user.dart';
import '../repository/DatabaseRepository.dart';
import '../tools/locator.dart';

class RegisterPage extends StatefulWidget {

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  User? user;

  TextEditingController controller1 = TextEditingController();

  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    RegisterViewModel viewModel =  Provider.of<RegisterViewModel>(context,listen:false);
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Center(
        child: Column(
          children: [
            Text(
              "REGISTER",
              style: TextStyle(
                  fontSize: 50,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 35, left: 40, right: 40, bottom: 15),
              child: Column(
                children: [
                  TextField(
                    controller: controller1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      hintText: "Username",
                      hintStyle: TextStyle(color: Colors.white24),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.indigo, width: 2.0),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: controller2,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white24),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        const BorderSide(color: Colors.indigo, width: 2.0),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      ElevatedButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Text("LOGIN PAGE"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent,
                        ),
                      ),
                      ElevatedButton(
                        onPressed:(){
                          viewModel.addUser(controller1.text, controller2.text, context);
                        },
                        child: Text("REGISTER"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent,
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
