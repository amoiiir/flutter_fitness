import 'package:fitness/models/diet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/category_model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //use method
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  void _getDiets() {
    diets = DietModel.getDiets();
  }

  void _getInitialInfo(){
    categories = CategoryModel.getCategories();
    diets = DietModel.getDiets();
  }

  @override
  Widget build(BuildContext context) {
    //describe part of the user interface, return type is a widget
    _getInitialInfo();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchField(),
          const SizedBox(height: 40,),
          _categoriesSection(),
          const SizedBox(height: 40,),
          _dietSection()
        ],
      )
    );
  }

  Column _dietSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
            padding: EdgeInsets.only(left: 14.0),
            child: Text(
              'Recommendation\nFor Diet',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            height: 240,
            child: ListView.separated(
              itemBuilder: (context, index){
                return Container(
                  width: 210,
                  decoration: BoxDecoration(
                    color: categories[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(diets[index].iconPath),
                      Text(
                        diets[index].name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        diets[index].level + ' | ' + diets[index].duration + ' | ' + diets[index].calorie + ' calories', 
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 130,
                        child: Center(
                          child: Text(
                            'View',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                          ),
                        ),
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xff9DCEFF),
                              Color(0xff92A3FD),
                            ]
                          ),
                          borderRadius: BorderRadius.circular(10),
                          ),
                      )
                    ],
                  )
                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 25,),
              itemCount: diets.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
              ),
            ),
          )
          ],
        );
  }

  Column _categoriesSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 14.0),
              child: Text(
                'Categories',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //create a vertical distance
            const SizedBox(height: 20,),
            Container(
              height: 150,
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: ListView.separated(
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 20,),
                itemBuilder: (context, index) {
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(categories[index].iconPath),
                          ),
                        ),
                        Text(
                          categories[index].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  );
                },
                ),
            )
          ],
        );
  }

  Container _searchField() {
    return Container(
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xff1D1617).withOpacity(0.11),
                spreadRadius: 0.0,
                blurRadius: 40,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(
                color: Color(0xffA1A5A6),
                fontSize: 14,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/Search.svg',),
              ),
              suffixIcon: Container(
                width: 60,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const VerticalDivider(
                        color: Colors.black,
                        thickness: 1,
                        indent: 10,
                        endIndent: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset('assets/icons/Filter.svg',),
                      ),
                    ],
                  ),
                ),
              ),
              contentPadding:  const EdgeInsets.symmetric(vertical: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              fillColor: const Color(0xffF7F8F8),
              filled: true,
            ),
          ),
        );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Fitness App',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      leading: Container(
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/icons/Arrow - Left 2.svg',
            height: 20,
            width: 20,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffF7F8F8),
          )),
          actions: [
          GestureDetector(
            onTap: () {
              print('Tapped');
            },
            child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset(
              'assets/icons/dots.svg',
              height: 5,
              width: 5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffF7F8F8),
            )),
          ),
          ],
    );
  }
}
