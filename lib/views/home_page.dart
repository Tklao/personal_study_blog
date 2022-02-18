// ignore_for_file: prefer_const_constructors

import 'package:blog_app/api/notices_api.dart';
import 'package:blog_app/models/blog_model.dart';
import 'package:blog_app/shared/color_pallet.dart';
import 'package:blog_app/shared/const.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              flexibleSpace: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('./assets/images/bg.jpeg'),
                      isAntiAlias: true,
                      opacity: 0.8,
                      fit: BoxFit.cover),
                ),
                child: ListTile(
                  title: Center(
                    child: Text(
                      pageTitle,
                      style: TextStyle(
                        fontSize: 30,
                        color: AppColor.lightText,
                      ),
                    ),
                  ),
                ),
              ),
              collapsedHeight: 70,
              expandedHeight: 200,
            ),
            /*SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                ((BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text('oi'),
                    ),
                  );
                }),
                childCount: 50,
              ),
            ),
            */
            SliverList(
              delegate: SliverChildBuilderDelegate(
                ((BuildContext context, int index) {
                  BlogModel blogList = listNotices[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      child: Card(
                        color: Colors.blue[100 * (index % 9)],
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                blogList.blogTitle,
                                style: TextStyle(
                                    color: AppColor.darkText, fontSize: 20),
                              ),
                              Divider(color: Colors.transparent, height: 20),
                              Text(
                                blogList.blogData,
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                blogList.previewNotice,
                                style: TextStyle(fontSize: 17),
                              ),
                              TextButton.icon(
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: AppColor.hiperlinkColor,
                                ),
                                onPressed: () {
                                  //chamar página completa
                                },
                                label: Text(
                                  'Materia completa',
                                  style:
                                      TextStyle(color: AppColor.hiperlinkColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                childCount: listNotices.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
