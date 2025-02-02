import 'package:flutter/material.dart';
import 'package:ids_material_sdk/ui/widget/ids_dropdown_title.dart';
import 'package:ids_material_sdk/ui/widget/theme.dart';
import 'package:ids_material_sdk_example/ids_helper.dart';

class SearchDialogExample extends StatefulWidget {
  const SearchDialogExample({super.key});

  @override
  State<SearchDialogExample> createState() => _SearchDialogExampleState();
}

class _SearchDialogExampleState extends State<SearchDialogExample> {
  String _customer = "";
  int _customerId = 0;
  List<Map<String, dynamic>> customerArray = IDSHelperExample.getSearchData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Code demo",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.grey, // Set the background color
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0), // Add padding for content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IDSDropdownTitle(
                  title: 'Customer *',
                  selectedValue: "Demo",
                  onTap: () {
                    showSearchDialog(
                        2, customerArray, "name", "Search customer");
                  }),
              kSizeBox10,
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    //print("Track/Action clicked");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 35),
                    textStyle: TextStyle(fontSize: 15),
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showSearchDialog(int requestCode, List<dynamic> dataArray, String keyName,
      String searchLabel) async {
    // Show search dialog
    await SearchArrayDialog.showSearchDialog(
      context: context,
      keyName: keyName,
      items: dataArray,
      hintText: searchLabel,
      onSelected: (dynamic item) {
        Map<String, dynamic> jsonData = item;
        setState(() {
          switch (requestCode) {
            case 2:
              _customer = jsonData[keyName];
              _customerId = jsonData["id"];
              break;
          }
        });
        print(jsonData);
      },
    );
  }
}
