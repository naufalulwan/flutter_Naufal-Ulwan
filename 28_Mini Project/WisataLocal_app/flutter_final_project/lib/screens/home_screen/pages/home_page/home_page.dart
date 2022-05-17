import 'package:flutter/material.dart';
import 'package:flutter_final_project/screens/account_screen/account_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final AccountController _accountController = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                      () => _accountController.userData.value.url == ''
                          ? const CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.yellow,
                              backgroundImage:
                                  AssetImage('assets/images/people.jpg'),
                            )
                          : CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.yellow,
                              backgroundImage: NetworkImage(_accountController
                                  .userData.value.url
                                  .toString()),
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
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Container(
                      width: 350,
                      height: 99,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/tmii.jpeg'),
                            fit: BoxFit.cover),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onLongPress: () {},
                        ),
                      ),
                    ),
                  ),
                  GridView.builder(
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
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
                        child: Stack(
                          children: [
                            Container(
                              height: 200,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/monas.jpg'),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                ),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  ),
                                  onTap: () {},
                                  onLongPress: () {},
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: 150,
                              height: 25,
                              alignment: Alignment.centerLeft,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomRight,
                                  end: Alignment.bottomLeft,
                                  colors: <Color>[Colors.yellow, Colors.green],
                                ),
                              ),
                              child: const Text(
                                'Monumen Nasional',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
