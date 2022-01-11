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
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Color(0xFFBDBDBD)),
        ),
        elevation: 0,
        backgroundColor: const Color(0xff212529),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFFF5F5F5)),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              decoration: const BoxDecoration(color: Color(0xFFF5F5F5)),
              child: Stack(
                children: [
                  Container(
                    height: size.height * 0.2 - 50,
                    decoration: const BoxDecoration(
                      color: Color(0xff212529),
                    ),
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
                              padding: const EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.height / 5,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF0077FF),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        spreadRadius: 0.1,
                                        blurRadius: 5,
                                        color: Colors.black26)
                                  ]),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Icon(
                                          Icons.group_outlined,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                      Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          child: const Text(
                                            'Usuários',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          )),
                                    ],
                                  ),
                                  const Text(
                                    '7',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 45,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.height / 5,
                              decoration: BoxDecoration(
                                  color: const Color(0xFF006CAA),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        spreadRadius: 0.1,
                                        blurRadius: 5,
                                        color: Colors.black26)
                                  ]),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Icon(
                                          Icons.book_outlined,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                      Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          child: const Text(
                                            'Livros',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                          )),
                                    ],
                                  ),
                                  const Text(
                                    '7',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 45,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height / 5.7,
                  width: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                      color: const Color(0xFFDB2D2D),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 0.1,
                            blurRadius: 5,
                            color: Colors.black26)
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.align_vertical_bottom_sharp,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: const Text(
                                'Editoras',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )),
                        ],
                      ),
                      const Text(
                        '7',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height / 5.7,
                  width: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                      color: const Color(0xFF198754),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            spreadRadius: 0.1,
                            blurRadius: 5,
                            color: Colors.black26)
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: const Text(
                                'Aluguéis',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              )),
                        ],
                      ),
                      const Text(
                        '7',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 45,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.height / 1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        spreadRadius: 0.1, blurRadius: 5, color: Colors.black26)
                  ]),
              child: Text('gráfico'),
            )
          ],
        ),
      ),
    );
  }
}
