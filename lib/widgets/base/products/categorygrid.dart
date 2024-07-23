import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({super.key});

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  Future<List<String>> fetchCategories() async {
    final response = await http
        .get(Uri.parse('https://fakestoreapi.com/products/categories'));

    if (response.statusCode == 200) {
      List<dynamic> categories = json.decode(response.body);
      return categories.map((category) => category.toString()).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                "Category",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          FutureBuilder<List<String>>(
            future: fetchCategories(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No categories found'));
              } else {
                return GridView.builder(
                  shrinkWrap:
                      true, // ต้องการเพื่อให้ GridView ทำงานภายใน Column ได้
                  physics:
                      const NeverScrollableScrollPhysics(), // ปิดการสกอลล์ของ GridView แยกต่างหาก
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // จำนวนคอลัมน์ใน grid
                    childAspectRatio:
                        3, // อัตราส่วนของความกว้างต่อความสูงของแต่ละรายการ
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 215, 215, 215),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      width: double.infinity,
                      child: Text(
                        snapshot.data![index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 20, 20, 20),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  },
                );
              }
            },
          )
        ],
      ),
    );
  }
}
