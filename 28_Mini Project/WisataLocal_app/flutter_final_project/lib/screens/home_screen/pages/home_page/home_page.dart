import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project/screens/account_screen/account_controller.dart';
import 'package:flutter_final_project/screens/home_screen/pages/home_page/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final AccountController _accountController = Get.put(AccountController());
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Builder(
        builder: (context) => SafeArea(
          child: Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(left: 10, right: 10, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Discover',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Obx(
                    () => _accountController.userData.value.url != ''
                        ? CircleAvatar(
                            radius: 22,
                            backgroundImage: NetworkImage(_accountController
                                .userData.value.url
                                .toString()),
                          )
                        : const CircleAvatar(
                            radius: 22,
                            backgroundImage:
                                AssetImage('assets/images/people.jpg'),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Expanded(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(
            () => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    child: CarouselSlider(
                      items: [
                        Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          borderOnForeground: true,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.white70, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.all(10),
                          elevation: 4,
                          child: Image.asset(
                            'assets/images/wisata_bogor.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          borderOnForeground: true,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.white70, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.all(10),
                          elevation: 4,
                          child: Image.asset(
                            'assets/images/pemandangan.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          borderOnForeground: true,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.white70, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.all(10),
                          elevation: 4,
                          child: Image.asset(
                            'assets/images/wisata_bekasi.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        aspectRatio: 2.0,
                        viewportFraction: 2,
                        autoPlay: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 75,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/jakarta.jpg'),
                                radius: 30,
                              ),
                              Text('Jakarta'),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 75,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/bogor.jpg'),
                                radius: 30,
                              ),
                              Text('Bogor'),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 75,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/depok.jpg'),
                                radius: 30,
                              ),
                              Text('Depok'),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 75,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/tanggerang.jpg'),
                                radius: 30,
                              ),
                              Text('Tanggerang'),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 75,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/bekasi.jpg'),
                                radius: 30,
                              ),
                              Text('Bekasi'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                _homeController.tourData.isNotEmpty
                    ? Column(
                        children: [
                          const Text('Community'),
                          GridView.builder(
                              itemCount: _homeController.tourData.length,
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 3,
                              ),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 10,
                                    left: 5,
                                    right: 5,
                                  ),
                                  child: Stack(children: [
                                    _homeController.tourData.isNotEmpty
                                        ? Container(
                                            height: 200,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      _homeController
                                                          .tourData[index].url
                                                          .toString()),
                                                  fit: BoxFit.cover),
                                            ),
                                            child: Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                onTap: () {},
                                              ),
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      width: 150,
                                      height: 25,
                                      alignment: Alignment.centerLeft,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                        ),
                                        gradient: LinearGradient(
                                          tileMode: TileMode.mirror,
                                          begin: Alignment.bottomRight,
                                          end: Alignment.bottomLeft,
                                          colors: <Color>[
                                            Colors.yellowAccent,
                                            Colors.greenAccent
                                          ],
                                        ),
                                      ),
                                      child: Text(
                                        _homeController.tourData[index].nameTour
                                            .toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    )
                                  ]),
                                );
                              }),
                        ],
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  height: 20,
                ),
                const Text('Recomendasi dari kami'),
                GridView.builder(
                    itemCount: _homeController.apiTourData.length,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 3,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10,
                          left: 5,
                          right: 5,
                        ),
                        child: Stack(children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(_homeController
                                      .apiTourData[index].url
                                      .toString()),
                                  fit: BoxFit.cover),
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {},
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            width: 150,
                            height: 25,
                            alignment: Alignment.centerLeft,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                              ),
                              gradient: LinearGradient(
                                tileMode: TileMode.mirror,
                                begin: Alignment.bottomRight,
                                end: Alignment.bottomLeft,
                                colors: <Color>[
                                  Colors.yellowAccent,
                                  Colors.greenAccent
                                ],
                              ),
                            ),
                            child: Text(
                              _homeController.apiTourData[index].name
                                  .toString()
                                  .toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          )
                        ]),
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
