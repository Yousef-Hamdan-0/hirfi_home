// ignore_for_file: camel_case_types


import 'package:flutter/material.dart';
import 'package:hirfi_home/data/api/search_api.dart';
import 'package:hirfi_home/data/model/place_model.dart';
import 'package:hirfi_home/theme/app_colors.dart';
import 'package:hirfi_home/view/screens/search/widget/list_search_result.dart';

class customersearch extends SearchDelegate {
  final List<String> username;
  String? selectedCarftsName;

  customersearch({required this.username});

  List<String> filterList = [];
  List<String> duplicateList = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.cancel)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    duplicateList = username
        .where((element) =>
            element.toLowerCase() == selectedCarftsName?.toLowerCase())
        .cast<String>()
        .toList();

    return Scaffold(
        body: FutureBuilder<List<PlaceModel>?>(
      future: SearchApp().getdatafromSerach(selectedCarftsName),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircularProgressIndicator(
                color: AppColors.buttonsBackground,
              ),
              const Text("Loading")
            ]),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey[900]
                  : Colors.white,
              scrolledUnderElevation: 0,
              elevation: 0,
              title: Text(
                "Search",

              ),
              centerTitle: true,
            ),
            body: Center(
                child: Text("Something went wrong",
                    style: TextStyle(fontSize: 13))),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData && snapshot.data != null) {
            List<PlaceModel> data = snapshot.data!;
            if (data.isEmpty) {
              return Center(
                  child: Text("There is no Carftsman with this name",
                      style: TextStyle(fontSize: 13)));
            }
            return ListSearch(
              duplicateList: duplicateList,
              data: data,
            );
          } else {
            return Center(
                child: Text("Something went wrong",
                    style: TextStyle(fontSize: 13)));
          }
        } else {
          return Center(
              child: Text("Something went wrong",
                  style: TextStyle(fontSize: 13)));
        }
      },
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == "") {
      return const Center(child: Text("Enter Craftsman Name"));
    } else {
      filterList = username
          .where(
              (element) => element.toLowerCase().contains(query.toLowerCase()))
          .toList();

      filterList = filterList.toSet().toList();

      if (filterList.isEmpty) {
        return Center(child: Text('No results found for "$query"'));
      }

      return ListView.builder(
        itemCount: filterList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              query = filterList[index];
              showResults(context);
              selectedCarftsName = filterList[index];
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: ListTile(
                title: Text(
                  filterList[index],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      );
    }
  }
}
