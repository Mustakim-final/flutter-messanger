import 'package:chat_application/Method_Page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class HomeScreen  extends StatefulWidget {
  const HomeScreen ({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String,dynamic>? userMap;
  TextEditingController _search=TextEditingController();
  bool isLoading=false;

  void onSearch() async{
    FirebaseFirestore _firestore=FirebaseFirestore.instance;
    setState(() {
      isLoading=true;
    });
    await _firestore.collection("Users").where("email",isEqualTo: _search.text.trim()).get().then((value) {
      setState(() {
        userMap=value.docs[0].data();
        isLoading=false;
      });
      print(userMap);
    });
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        leading: Icon(Icons.arrow_back),
        actions: [
          IconButton(onPressed: ()=>LogOut(context), icon: Icon(Icons.logout))
        ],
      ),
      body:isLoading?

          Center(
            child: Container(
              height: size.height/20,
              width: size.width/20,
              child: CircularProgressIndicator(),
            ),
          )

          :Column(
        children: [
          SizedBox(height: size.height/20,),
          Container(
            height: size.height/14,
            width: size.width,
            alignment: Alignment.center,
            child: Container(
              height: size.height/14,
              width: size.width/1.2,
              child: TextField(
                controller: _search,
                decoration: InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
            ),
          ),


          SizedBox(height: size.height/30,),

          ElevatedButton(
              onPressed: (){
                onSearch();
              },
              child: Text("Search")
          ),
          SizedBox(height: size.height/14,),
          userMap!=null?ListTile(
            onTap: (){},
            title: Text(userMap!["name"]),
            subtitle: Text(userMap!["email"],
            style: TextStyle(color: Colors.blue,fontSize: 18),
            ),
            trailing: Icon(Icons.chat),
            leading: Icon(Icons.account_box),
          ):Container(),

        ],
      )
    );
  }
}
