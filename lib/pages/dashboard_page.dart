import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        elevation: 0,
        backgroundColor: const Color(0xff212529),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFFF5F5F5)),
        child: Column(
          children: [
            Container(
              height: 130,
              decoration: const BoxDecoration(color: Color(0xFFF5F5F5)),
              child: Stack(
                children: [
                  Container(
                    height: size.height * 0.2 - 50,
                    decoration: const BoxDecoration(
                        color: Color(0xff212529),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(26),
                            bottomRight: Radius.circular(26))),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height / 6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.height / 5,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF0077FF),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(
                                        spreadRadius: 0.1,
                                        blurRadius: 5,
                                        color: Colors.black26)
                                  ]),
                              child: const Text('ola'),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.height / 5,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF006CAA),
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: const [
                                    BoxShadow(
                                        spreadRadius: 0.1,
                                        blurRadius: 5,
                                        color: Colors.black26)
                                  ]),
                              child: const Text('ola'),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
