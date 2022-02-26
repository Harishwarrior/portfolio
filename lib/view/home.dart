import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 20.0,
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Home",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 20.0,
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Resume",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 20.0,
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Contact",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Text(
                          "Harish.",
                          style: TextStyle(fontSize: 100),
                        ),
                      ),
                      Column(
                        children: [
                          Text("Flutter Developer"),
                          Text("Chennai"),
                        ],
                      ),
                      Column(
                        children: [
                          Text("LAB TECH / 2019"),
                          Text("---"),
                          Text("/// CRAFTED IN CHENNAI, INDIA"),
                        ],
                      )
                    ],
                  ),
                ),
                Spacer(),
                Flexible(
                  flex: 2,
                  child: Image.asset(
                    "assets/images/flutter_logo.png",
                    height: MediaQuery.of(context).size.height / 1.2,
                  ),
                ),
                Spacer(),
                Flexible(
                  flex: 1,
                  child: RotatedBox(
                    quarterTurns: 45,
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text(
                        "PORTFOLIO",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
