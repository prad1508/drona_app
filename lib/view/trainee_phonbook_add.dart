import 'package:drona/view/profile/view_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import '../res/language/language.dart';
import '../res/widget/round_button.dart';
import '../utils/routes/routes_name.dart';
import 'traine_invite.dart';

class AddPhonebook extends StatefulWidget {
  const AddPhonebook({super.key});

  @override
  State<AddPhonebook> createState() => _AddPhonebookState();
}

class _AddPhonebookState extends State<AddPhonebook> {
  //multi language support
  final FlutterLocalization _localization = FlutterLocalization.instance;

  List<int> _selectedItems = <int>[];

  List<Contact>? contacts;

  @override
  initState() {
    super.initState();
     contacts = contacts;
    getContact();
  }

  void getContact() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      setState(() {contacts = this.contacts;});
    }
  }


void dataFilter(String enteredKeyword) {
     List<Contact>? results = [];
    if (enteredKeyword.isEmpty) {
      results = contacts;
    } else {
      results = contacts!
          .where((user) =>
              user.name.first.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      contacts = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: _localization.supportedLocales,
      localizationsDelegates: _localization.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              Text(
                _selectedItems.length == 0 ? '' : _selectedItems.length.toString(),
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          title: Text(AppLocale.phonebook.getString(context),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            _selectedItems.length == 0
                ? IconButton(
                    onPressed: (() {
                      if (kDebugMode) {
                        print('Batch List');
                      }
                    }),
                    icon: const Icon(Icons.add),
                    iconSize: 25,
                    color: Colors.black,
                  )
                : IconButton(
                    onPressed: (() {
                      if (kDebugMode) {
                        print('add coach list');
                      }
                    }),
                    icon: const Icon(Icons.delete_outline),
                    iconSize: 25,
                    color: Colors.black,
                  ),
          ],
        ),
        body: Material(
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                    side: BorderSide(
                      color: Color.fromARGB(255, 197, 196, 196),
                    ),
                  ),
                  elevation: 0,
                  child: ListTile(
                    title: TextField(
                      onChanged: (value) => dataFilter(value),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 0.0),
                          hintText: AppLocale.search.getString(context),
                          border: InputBorder.none),
                    ),
                    trailing: const Icon(Icons.search),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: (contacts) == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: contacts!.length,
                itemBuilder: (BuildContext context, int index) {
                  Uint8List? image = contacts![index].photo;
                  String num = (contacts![index].phones.isNotEmpty) ? (contacts![index].phones.first.number) : "--";
                  return ListTile(
                     tileColor: (_selectedItems.contains(index))
                                      ? Color.fromARGB(255, 218, 218, 219)
                                          .withOpacity(0.5)
                                      : Colors.transparent,
                      leading: _selectedItems.contains(index) ? const Icon(
                                              Icons.check,
                                              color: Color.fromRGBO(
                                                  71, 192, 136, 1),
                                              size: 30.0,
                                            ) : ((contacts![index].photo == null)
                          ? const CircleAvatar(child: Icon(Icons.person))
                          : CircleAvatar(backgroundImage: MemoryImage(image!))),
                      title: Text(
                          "${contacts![index].name.first} ${contacts![index].name.last}"),
                      subtitle: Text(num),
                      onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ViewProfilenew()));
                                  },
                                  onLongPress: () {
                                    if (!_selectedItems.contains(index)) {
                                      setState(() {
                                        _selectedItems.add(index);
                                      });
                                    } else {
                                      setState(() {
                                        _selectedItems
                                            .removeWhere((val) => val == index);
                                      });
                                    }
                                  },
                      );
                },
            )
             ,
                ),
                const SizedBox(
                  height: 15,
                ),
                RoundButton(
                    loading: false,
                    title: AppLocale.add.getString(context),
                    textColor: Colors.white,
                    rounded: true,
                    color: Theme.of(context).primaryColor,
                    onPress: () {
                     Navigator.push(
                               context,
                               MaterialPageRoute(
                                 builder: (BuildContext context) =>
                                     const TrainInvite(),
                               ),
                             );
                    }),
                 ],
            )
            ),
        ),
      ),
    );
  }
}


