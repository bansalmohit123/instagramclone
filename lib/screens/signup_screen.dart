import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
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
            Stack(
              children: [
                const CircleAvatar(
                  radius: 64,
                  backgroundImage: NetworkImage('url'),
                ),
                Positioned(child: IconButton(onPressed: () {
                  
                },icon: Icon(Icons.add_a_photo),
                ))
              ],
            ),
              const SizedBox(
              height: 12,
            ),
             TextFieldInput(
                textEditingController: _usernameController,
                textInputType: TextInputType.text,
                hintText: 'Enter Your Username'
                ),
                const SizedBox(
              height: 12,
            ),
            TextFieldInput(
                textEditingController: _bioController,
                textInputType: TextInputType.text,
                hintText: 'Enter Your bio'
                ),
                const SizedBox(
              height: 12,
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
                  onTap: (){},
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding:const EdgeInsets.symmetric(vertical: 12) ,
                    decoration: const ShapeDecoration(shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4),),
                    ),
                    color: blueColor
                    ),
                   
                    child: const Text('LOG IN'),
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
                      onTap: (){},
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
