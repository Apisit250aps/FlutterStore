import 'package:flutter/material.dart';
import 'package:flutter_store/widgets/base/home/helper.dart';
import 'package:flutter_store/widgets/base/home/welcome.dart';
import 'package:flutter_store/widgets/base/products/categorygrid.dart';
import 'package:flutter_store/widgets/base/products/productlist.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SHOPPING",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CategoryGrid(),
            ProductList(),
          ],
        ),
      ),
    );
  }
}
