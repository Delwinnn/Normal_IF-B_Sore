import 'package:agile_git/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';


class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderGudang>(context);
    final currentUser = Provider.of<ProviderGudang>(context).Gudang.usinguser;
    final index = provider.Gudang.user[0].indexOf(currentUser);
    final pass = provider.Gudang.user[1][index];
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile",style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Container(
          child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    color: Colors.green[300],
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    height: 230,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage("${provider.Gudang.user[2][index]}"),
                        ),
                      SizedBox(height: 10,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, 
                            foregroundColor: Colors.white,
                          ),
                        onPressed: () {
                          
                        },
                        child: Text("Edit"),
                      ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.person,
                              size: 50,
                            )
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Username", style: TextStyle(fontSize: 15, color: Colors.grey),),
                              Text("${provider.Gudang.user[0][index]}",style: TextStyle(fontSize: 20),)
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        iconSize: 30,
                        color: Colors.blue,
                        padding: EdgeInsets.all(10),
                        onPressed: () {
                        
                        }, 
                        icon: Icon(Icons.edit)
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 5,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Icon(
                              Icons.lock,
                              size: 50,
                            )
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Password", style: TextStyle(fontSize: 15, color: Colors.grey),),
                              Text("${"*"*pass.length}",style: TextStyle(fontSize: 20),)
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        iconSize: 30,
                        color: Colors.blue,
                        padding: EdgeInsets.all(10),
                        onPressed: () {
                    
                        }, 
                        icon: Icon(Icons.edit)
                      )
                    ]
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 5,
                    thickness: 1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Log Out"),
                        content: Text("Are you sure you want to Log Out?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.grey[800]),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.popUntil(context, (route) => route.isFirst);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            child: Text("Log Out", style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, size: 25),
                    SizedBox(width: 10),
                    Text("Log Out", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  elevation: 0,
                  fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } 
}
