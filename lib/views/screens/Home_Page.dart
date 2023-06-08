import 'dart:math';

import 'package:flutter/material.dart';
import 'package:galaxy_planets/controllers/providers/json_decode_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  loadData() async {
    await Provider.of<JsonDecodeProvider>(context, listen: false).loadJson();
  }

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    loadData();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
      lowerBound: 0,
      upperBound: 2 * pi,
    );
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/gifs/BackgroundBlack.gif'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Container(
                            padding: EdgeInsets.all(6.w),
                            height: 18.h,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed('settings_page');
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.settings, size: 4.h),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text(
                                        "Settings",
                                        style: TextStyle(fontSize: 2.5.h),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 2.5.h,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed('favorites_page');
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.favorite_border_rounded,
                                          size: 4.h),
                                      SizedBox(
                                        width: 3.w,
                                      ),
                                      Text(
                                        "Favorites",
                                        style: TextStyle(fontSize: 2.5.h),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.dehaze),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 18,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...List.generate(
                        Provider.of<JsonDecodeProvider>(context, listen: false)
                            .galaxyDetails
                            .length,
                        (index) => Column(
                          children: [
                            AnimatedBuilder(
                              animation: animationController,
                              child: Image.asset(
                                  Provider.of<JsonDecodeProvider>(context,
                                          listen: false)
                                      .galaxyDetails[index]
                                      .image),
                              builder: (context, widget) {
                                return Transform.rotate(
                                  angle: animationController.value,
                                  child: widget,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
