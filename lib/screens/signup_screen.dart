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
                  backgroundImage: NetworkImage('https://in.images.search.yahoo.com/images/view;_ylt=AwrKDyXQ4w5mKgU8Tjy9HAx.;_ylu=c2VjA3NyBHNsawNpbWcEb2lkAzRkZjJlYWI3ZDlmNWEzY2JkNTA5OGQ0YzAwZmRkZTA3BGdwb3MDNwRpdANiaW5n?back=https%3A%2F%2Fin.images.search.yahoo.com%2Fsearch%2Fimages%3Fp%3Dbackground%2Bimages%26type%3DE210IN885G0%26fr%3Dmcafee%26fr2%3Dpiv-web%26tab%3Dorganic%26ri%3D7&w=474&h=266&imgurl=www.pixelstalk.net%2Fwp-content%2Fuploads%2F2016%2F08%2FBeautiful-nature-cool-images-background-hd.jpg&rurl=http%3A%2F%2Fwww.pixelstalk.net%2Fcool-nature-background-images%2F&size=247.6KB&p=background+images&oid=4df2eab7d9f5a3cbd5098d4c00fdde07&fr2=piv-web&fr=mcafee&tt=Cool+Nature+Background+Images+%7C+PixelsTalk.Net&b=0&ni=21&no=7&ts=&tab=organic&sigr=ePHq5nvB6vp.&sigb=H6U2GP0QUC1R&sigi=WuOUZ9FsSe8F&sigt=SADui3ML8gVE&.crumb=qZZ6SDs2e4g&fr=mcafee&fr2=piv-web&type=E210IN885G0'),
                ),
                Positioned(child: IconButton(onPressed: () {
                  
                },icon: const Icon(Icons.add_a_photo),
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
