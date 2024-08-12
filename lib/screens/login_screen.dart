import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/responsive/mobile_screen_layout.dart';
import 'package:instagram_clone/responsive/responsive_screen_layout.dart';
import 'package:instagram_clone/responsive/web_screen_layout.dart';
import 'package:instagram_clone/screens/signup_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading=false;
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  void loginuser() async{
    setState(() {
      _isLoading=true;
    });
    String res = await AuthMethods().loginUser(email: _emailController.text, password: _passwordController.text);
    if(res=="success"){
      setState(() {
        _isLoading=false;
      });
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const ResponsiveLayout(webScreenlayout: WebScreenlayout(), mobileScreenlayout: MobileScreenLayout())));
    }
    else{
      showSnackBar(res, context);
    }
    setState(() {
      _isLoading=false;
    });
  }
  void navigateToSignup(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUpScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Container(),
            ),
           
            SvgPicture.asset(
              'assets/ic_instagram.svg',    
              color: primaryColor,
              height: 64,
            ),
            const SizedBox(
              height: 64,
            ),
            TextFieldInput(
                textEditingController: _emailController,
                textInputType: TextInputType.emailAddress,
                hintText: 'Enter Your Email'
                ),
            const SizedBox(
              height: 12,
            ),
                TextFieldInput(
                textEditingController: _passwordController,
                textInputType: TextInputType.text ,
                hintText: 'Enter Your Password',
                isPass: true,),
                const SizedBox(height: 12,),
                InkWell(
                  onTap: loginuser,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding:const EdgeInsets.symmetric(vertical: 12) ,
                    decoration: const ShapeDecoration(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4),),
                    ),
                    color: blueColor
                    ),
                   
                    child: _isLoading? const Center(
                     child: CircularProgressIndicator(color: primaryColor,)
                    ) :Text('LOG IN'),
                  ),
                ),
                const SizedBox(height: 12,),
                Flexible(flex: 2,child: Container(),),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8
                      ),
                      child: const Text("Don't have an account"),
                    ),
                    GestureDetector(
                      onTap: navigateToSignup,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8
                        ),
                        child: const Text("Sign Up",style: TextStyle(
                          fontWeight: FontWeight.bold
                      
                        ),),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12,),
                

          ],
        ),
      )),
    );
  }
}
