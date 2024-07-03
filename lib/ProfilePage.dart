import 'package:agile_git/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:agile_git/ChangeName.dart';
import 'package:agile_git/ChangePass.dart';
import 'package:agile_git/ChangePicture.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';



class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? _imageBytes;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderGudang>(context);
    final currentUser = Provider.of<ProviderGudang>(context).Gudang.usinguser;
    final index = provider.Gudang.user[0].indexOf(currentUser);
    final pass = provider.Gudang.user[1][index];
    final ImagePicker _picker = ImagePicker();

    if (currentUser != "") {
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
                      color: Colors.white,
                      padding: EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Consumer<ProviderGudang>(
                          builder: (context, provider, _) {
                            int userIndex = provider.Gudang.user[0].indexOf(currentUser);
                            if (userIndex != -1) {
                              return CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      provider.getUserImage(userIndex),
                                );
                            } else {
                              return Text("User not found!"); 
                            }
                          },
                        ),
                        SizedBox(width : 20,),
                        ElevatedButton.icon(
                              onPressed: () {
                                showModalBottomSheet<void>(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) =>
                                      DraggableScrollableSheet(
                                    expand: false,
                                    initialChildSize: 0.6,
                                    builder: (context, scrollController) =>
                                        SingleChildScrollView(
                                      controller: scrollController,
                                      child: Center(
                                        child: Container(
                                          padding: EdgeInsets.all(20),
                                          child: Column(
                                            children: [
                                              Row(children: [
                                                Text(
                                                  "Profile Image",
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                )
                                              ]),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              ListTile(
                                                onTap: () async {
                                                  Navigator.pop(context);
                                                  final XFile? image =
                                                      await _picker.pickImage(
                                                          source: ImageSource
                                                              .camera);
                                                  if (image != null) {
                                                    Uint8List pic = await image
                                                        .readAsBytes();
                                                    setState(() {
                                                      _imageBytes = pic;
                                                      provider.updateUserImage(
                                                          index,
                                                          MemoryImage(
                                                              _imageBytes!));
                                                    });
                                                  }
                                                },
                                                leading: Icon(
                                                  Icons.camera_alt_outlined,
                                                  size: 30,
                                                ),
                                                title: Text(
                                                  'Capture from Camera',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ),
                                              ListTile(
                                                onTap: () async {
                                                  Navigator.pop(context);
                                                  final XFile? image =
                                                      await _picker.pickImage(
                                                          source: ImageSource
                                                              .gallery);
                                                  if (image != null) {
                                                    Uint8List pic = await image
                                                        .readAsBytes();
                                                    setState(() {
                                                      _imageBytes = pic;
                                                      provider.updateUserImage(
                                                          index,
                                                          MemoryImage(
                                                              _imageBytes!));
                                                    });
                                                  }
                                                },
                                                leading: Icon(
                                                  Icons.photo_library_outlined,
                                                  size: 30,
                                                ),
                                                title: Text(
                                                  'Choose from Gallery',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ),
                                              ListTile(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ChangePicturePage(
                                                        onUpdateImageUrl:
                                                            (newImageUrl) {
                                                          provider
                                                              .updateUserImage(
                                                                  index,
                                                                  newImageUrl);
                                                        },
                                                      ),
                                                    ),
                                                  );
                                                },
                                                leading: Icon(
                                                  Icons.link_outlined,
                                                  size: 30,
                                                ),
                                                title: Text(
                                                  'Input Link URL',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white),
                              icon: Icon(Icons.upload_file),
                              label: Text("Upload Image")),
                        ],
                      ),
                    ),
                     Divider(
        color: Colors.grey,
        height: 1,
        thickness: 1,
      ),
                   ListTile(
        leading: Icon(Icons.person, size: 30, color: Colors.grey[800]),
        title: Text("Change Name", style: TextStyle(fontSize: 20)),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChangeUsernamePage(),
            ),
          );
        },
      ),
                    Divider(
                      color: Colors.grey,
                      height: 5,
                      thickness: 1,
                    ),
                    ListTile(
        leading: Icon(Icons.lock, size: 30, color: Colors.grey[800]),
        title: Text("Change Password", style: TextStyle(fontSize: 20)),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ChangePasswordPage(),
            ),
          );
        },
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
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
          centerTitle: true,
        ),
        body: Center(
          child: Text("Please log in to access settings"),
        ),
      );
    }
  }
}