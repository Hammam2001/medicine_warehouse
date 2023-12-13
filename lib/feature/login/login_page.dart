import 'package:flutter/material.dart';
import 'package:regester/core/global/api.dart';
import 'package:regester/feature/home_view/home_view.dart';
import '../../core/global/app_text-form_filed.dart';
import '../register/register_page.dart';
import 'package:http/http.dart' as http ;

class Login extends StatelessWidget {
  const Login({
    super.key,
    this.phoneController,
    this.passwordController,
  });

  final TextEditingController? phoneController;
  final TextEditingController? passwordController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Pharmacy',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
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
                  label: 'Phone',
                  obscurePassword: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFiledApp(
                  controller: phoneController,
                  type: TextInputType.visiblePassword,
                  prefix: Icons.lock,
                  label: 'Password',
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
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                        },
                        child:  Text(
                          'Register',
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
    if(response.statusCode == 200 ) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeView(),));
      return response.body ;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('error occured'),));
    }
  }


}
