import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import '../../data/response/status.dart';
import '../../res/language/language.dart';
import '../../view_model/myprofi_view_model.dart';
import 'create_profile.dart';
import 'edit_porfile.dart';

class ViewProfileDetails extends StatefulWidget {
  const ViewProfileDetails({Key? key}) : super(key: key);

  @override
  State<ViewProfileDetails> createState() => _ViewProfileDetailsState();
}

class _ViewProfileDetailsState extends State<ViewProfileDetails> {
  MyprofiViewViewModel myProfileViewViewModel = MyprofiViewViewModel();
  String name = '';
  String number = '';
  String emailid = '';
  String alternatenumber = '';
  String gender = '';
  List details = [];
  String? _genderValue = 'm';

  @override
  void initState() {
    myProfileViewViewModel.fetchMyprofiListApi();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          AppLocale.viewProfile.getString(context),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => EditProfile(),
                ),
              );
            },
            icon: const Icon(Icons.edit),
            iconSize: 20,
            color: Colors.black,
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Material(
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.zero,
                child:  ChangeNotifierProvider<MyprofiViewViewModel>(
                    create: (BuildContext context) => myProfileViewViewModel,
                    child: Consumer<MyprofiViewViewModel>(
                        builder: (context, value, _) {
                          switch (value.dataList.status!) {
                            case Status.loading:
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.teal,
                                ),
                              );

                            case Status.completed:
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: SizedBox(
                                      height: 120,
                                      width: 120,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.grey[500],
                                        radius: 70,
                                        child: const CircleAvatar(
                                          radius: 65,
                                          backgroundColor: Colors.white,
                                          backgroundImage:
                                          AssetImage('assets/images/user_profile.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    '${value.dataList.data?.data![1].name}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                   Text(
                                    AppLocale.owner.getString(context),
                                    style: TextStyle(
                                        fontFamily: 'Lato',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff39404A)),
                                  ),
                                  /*Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.facebook,
                                            size: 40, color: Colors.blue),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon:
                                        const Icon(Icons.facebook, size: 40, color: Colors.blue),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon:
                                        const Icon(Icons.facebook, size: 40, color: Colors.blue),
                                      ),
                                    ],
                                  ),*/
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    margin: EdgeInsets.zero,
                                    color: const Color(0xffDFE1E4),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                             Padding(
                                              padding: EdgeInsets.only(left: 15),
                                              child: Text(
                                                AppLocale.phoneNumber.getString(context),
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff39404A)),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 15),
                                              child: Text(
                                                '${value.dataList.data?.data![1].userid}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: const Color(0xff626D7E)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Divider(
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 15),
                                              child: Text(
                                                AppLocale.alternateNumber.getString(context),
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(0xff39404A)),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 15),
                                              child: Text(
                                                "NA",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: const Color(0xff626D7E)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Divider(
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left: 15),
                                              child: Text(
                                                AppLocale.dob.getString(context),
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(0xff39404A)),
                                              ),
                                            ),
                                            Padding(
                                              padding:  EdgeInsets.only(right: 15),
                                              child: Text(
                                                '${value.dataList.data?.data![1].dob}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: const Color(0xff626D7E)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Divider(
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                             Padding(
                                              padding: EdgeInsets.only(left: 15),
                                              child: Text(
                                                AppLocale.gender.getString(context),
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color(0xff39404A)),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 15),
                                              child: value.dataList.data?.data![1].gender == 'f'
                                                  ?  Text(
                                                AppLocale.female.getString(context),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: const Color(0xff626D7E)),
                                              )
                                                  : value.dataList.data?.data![1].gender == 'm'
                                                  ?  Text(
                                                AppLocale.male.getString(context),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: const Color(0xff626D7E)),
                                              )
                                                  :  Text(
                                                AppLocale.other.getString(context),
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: const Color(0xff626D7E)),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const Divider(
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                             Padding(
                                              padding: EdgeInsets.only(left: 15),
                                              child: Text(
                                                AppLocale.emailId.getString(context),
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: Color(0xff39404A)),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(right: 15),
                                              child: value.dataList.data?.data![1].email =='' ? const Text("NA", style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Color(0xff626D7E))):
                                              Text(
                                                '${value.dataList.data?.data![0].email}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Color(0xff626D7E)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const Divider(
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );

                            case Status.error:
                              return Center(
                                  child: Text(''));
                          }
                        }
                    )),

              ))
      ),
    );
  }
}