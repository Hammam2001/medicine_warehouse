import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:regester/core/global/api.dart';
import 'package:regester/feature/home_view/home_view.dart';
import 'package:regester/language.dart';
import '../../core/global/app_text-form_filed.dart';
import '../register/register_page.dart';
import 'package:http/http.dart' as http ;

class Login extends StatelessWidget {
  Login({
    super.key,
  });

  final TextEditingController? phoneController = TextEditingController();
  final TextEditingController? passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Language.isEn ? TextDirection.ltr : TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: null,
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            Language.isEn ? 'Pharmacy' : 'صيدلية',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/image/pharmacy.jpeg'),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFiledApp(
                    controller: phoneController,
                    type: TextInputType.phone,
                    prefix: Icons.phone,
                    label: Language.isEn ?  'Phone' : 'رقم الهاتف',
                    obscurePassword: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFiledApp(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    prefix: Icons.lock,
                    label: Language.isEn ?  'Password' : 'كلمة المرور',
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
                        login(context);
                      },
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        Language.isEn ? 'LOGIN' : 'تسجيل الدخول',
                        style: const TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        Language.isEn ? 'Don\'t have an account?' : 'ليش لديك حساب؟',
                        style: const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                          },
                          child:  Text(
                            Language.isEn ? 'Register' : 'تسجيل',
                            style: TextStyle(
                                fontSize: 18, color: Theme.of(context).primaryColor,),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future login(BuildContext context) async {
    String? phone = phoneController?.text ;
    String? password = passwordController?.text ;
    var response = await http.post(
      Uri.parse('${Api.api}/users/login'),
      headers : {
        'Accept' : 'application/json' ,
      } ,
      body : {
        'phone' : '$phone',
        'password' : password,
      } ,
    ) ;
    print(response.body) ;
    if(response.statusCode == 200 ) {
      var map = jsonDecode(response.body) ;
      Api.token = map['token']["accessToken"] ;
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeView(),));
      return response.body ;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('error occured'),));
    }
  }


}
