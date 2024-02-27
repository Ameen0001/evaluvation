import 'dart:convert';

import 'package:evaluvation/category.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var id,strcateory,strThumb,strDescription;
  List<CategoryElement> data=[];
  getData()async{

    var response = await http.get(Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'));
    if(response.statusCode ==200 ){

      setState(() {
        data=categoryFromJson(response.body).categories;
      });

    }
    else{
      print('errror');
    }


  }
  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisExtent: 840,
              childAspectRatio: 1 /1 ,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: data.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(data[index].idCategory.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(data[index].strCategory),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(image: NetworkImage(data[index].strCategoryThumb))
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(data[index].strCategoryDescription),
                  ),
                ],
              )
            );
          }),
    );
  }
}
