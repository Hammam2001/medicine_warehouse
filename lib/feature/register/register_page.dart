import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:regester/language.dart';

import '../../core/global/api.dart';
import '../../core/global/app_text-form_filed.dart';
import '../home_view/home_view.dart';
import 'package:http/http.dart' as http ;


class Register extends StatelessWidget {
   Register({super.key});
  TextEditingController? phoneController = TextEditingController();
  TextEditingController ? passwordController= TextEditingController();
  TextEditingController? firstNameController= TextEditingController();
  TextEditingController ?lastNameController= TextEditingController();
  TextEditingController ?confirmPasswordController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Language.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text( Language.isEn ? 'Register' : 'تسجيل',style: TextStyle(color:Colors.white),),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFiledApp(
                  controller: firstNameController,
                  type: TextInputType.name,
                  label: Language.isEn ? 'First Name' : 'الاسم الاول',
                  obscurePassword: false,
                  prefix: Icons.abc,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFiledApp(
                  controller: lastNameController,
                  type: TextInputType.name,
                  label: Language.isEn ? 'Last Name' : 'الاسم الاخير',
                  obscurePassword: false,
                  prefix: Icons.abc,

                ),
                const SizedBox(
                  height: 20,
                ),
                TextFiledApp(
                  controller: phoneController ,
                  type: TextInputType.name,
                  label: Language.isEn ? 'Phone' : 'رقم الهاتف',
                  obscurePassword: false,
                  prefix: Icons.numbers,
                ),
                const SizedBox(
                  height: 20,
                ),

                TextFiledApp(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  prefix: Icons.lock,
                  label: Language.isEn ? 'Password' : 'كلمة المرور',
                  obscurePassword: true,
                  suffix: Icons.remove_red_eye_sharp,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFiledApp(
                  controller: confirmPasswordController,
                  type: TextInputType.visiblePassword,
                  prefix: Icons.lock,
                  label: Language.isEn ? 'Confirm Password' : 'تاكيد كلمة المرور',
                  obscurePassword: true,
                  suffix: Icons.remove_red_eye_sharp,
                ),

                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: MaterialButton(
                    onPressed: () {
                      register(context);
                    },
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      Language.isEn ? 'Register'  : 'تسجيل',
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future register(BuildContext context) async {
    String?phone= phoneController?.text;
    String?password= passwordController?.text;
    String?firstname= firstNameController?.text;
    String?lastname= lastNameController?.text;
    String?coniform= confirmPasswordController?.text;
    var response = await http.post(
      Uri.parse('${Api.api}/users/register'),
      headers : {
        'Accept' : 'application/json' ,
      } ,
      body : {
        'phone' : '$phone',
        'first_name' : firstname ,
        'last_name' : lastname,
        'password' : password,
        'password_confirmation' : coniform,
      } ,
    ) ;
    print(response.body);
    if(response.statusCode == 200 ) {
      var map = jsonDecode(response.body) ;
      Api.token = map['token'] ;
      Navigator.push(context,MaterialPageRoute(builder: (context) => HomeView()) );
      return response.body ;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('error occured'),));
    }


  }
}
