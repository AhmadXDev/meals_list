// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:meals_list/data/global_data.dart';
import 'package:meals_list/services/categories_api.dart';
import 'package:meals_list/widgets/text_widget.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Categories Page"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: FutureBuilder(
              future: CategoriesApi().getData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    itemCount: allCategories.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        print("hello");
                      },
                      child: Card(
                        child: Column(children: [
                          // Column child 1
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("(${allCategories[index].id})"),
                              Text("  ${allCategories[index].name}")
                            ],
                          ),

                          // Column child 2
                          const SizedBox(width: 30),

                          // Column child
                          Row(
                            children: [
                              Image.network(
                                  allCategories[index].image.toString(),
                                  width: 100,
                                  height: 100),
                              Text("${allCategories[index].description}")
                            ],
                          )
                        ]),
                      ),
                    ),
                  );
                } else {
                  return const TextWidget(text: "No Data!", size: 12);
                }
              })),
    );
  }
}
