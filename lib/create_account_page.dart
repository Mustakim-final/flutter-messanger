import 'package:chat_application/Method_Page.dart';
import 'package:chat_application/home_page.dart';
import 'package:chat_application/login_page.dart';
import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {


  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  TextEditingController _name=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _password=TextEditingController();

  bool isLoading=false;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: isLoading
          ?Center(
        child: Container(
          height: size.height/20,
          width: size.width/20,
          child: CircularProgressIndicator(),
            ),
           )

          :SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: size.height/20,),
            Container(
                width: size.width/1.2,
                alignment: Alignment.centerLeft,
                child: IconButton(onPressed: (){},
                    icon: Icon(Icons.arrow_back_ios))
            ),
            SizedBox(height: size.height/50,),
            Container(
              width: size.width/1.3,
              child: Text("Welcome",style: TextStyle(fontSize: 28,fontWeight: FontWeight.w500),),
            ),
            Container(
              width: size.width/1.3,
              child: Text("Create Account to Contiue!",
                style:  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.grey[700]),
              ),
            ),
            SizedBox(height: size.height/20,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Container(
                width: size.width,
                alignment: Alignment.center,
                child: field(size, "Name", Icons.account_box,_name),
              ),
            ),
            Container(
                width: size.width,
                alignment: Alignment.center,
                child: field(size, "email",Icons.account_box,_email)
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Container(
                width: size.width,
                alignment: Alignment.center,
                child: field(size, "password", Icons.lock,_password),
              ),
            ),

            SizedBox(height: size.height/20,),

            customButton(size),
            SizedBox(height: size.height/10,),
            GestureDetector(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen())),
              child: Text(
                  "Login",
                style: TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget customButton(Size size){
    return GestureDetector(
      onTap: (){
        if(_name.text.isNotEmpty &&
           _email.text.isNotEmpty &&
           _password.text.isNotEmpty){
          setState(() {
            isLoading=true;
          });
          createAccount(_name.text.trim(), _email.text.trim(), _password.text.trim())
              .then((user) {
                if(user!=null){
                  setState(() {
                    isLoading=false;
                  });
                  print("Login successfull");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                }else{
                  isLoading=false;
                  print("Login Failed");
                }
          });
        }
      },
      child: Container(
        height: size.height/13,
        width: size.width/1.2,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue
        ),

        child: Text(
          "Create Account",
          style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

  Widget field(Size size,String hintText,IconData icon,TextEditingController cont){
    return Container(
      height: size.height/15,
      width: size.width/1.1,
      child: TextField(
        controller: cont,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
            )
        ),
      ),
    );
  }
}
