import 'package:flutter/material.dart';
import 'package:dynamic_todo_list/utils/theme.dart';

void main() {
  runApp(const UpgradePackageView());
}

class UpgradePackageView extends StatefulWidget {
  const UpgradePackageView({Key? key}) : super(key: key);

  @override
  _UpgradePackageViewState createState() => _UpgradePackageViewState();
}

class _UpgradePackageViewState extends State<UpgradePackageView> {
  List<List<String>> packages = [
    ['Monthly', 'Good for starting up', '25K'],
    ['Quarterly', 'Focusing on building', '120K'],
    ['Yearly', 'Consistency good life', '160K'],
  ];
  int selectedOption = -1;

  Widget option(int index) {
    Color borderColor = Colors.black26;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = index;
        });
      },
      child: Container(
          padding: const EdgeInsets.all(25),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                    color: selectedOption == index ? accentColor : borderColor,
                    style: BorderStyle.solid)
                .scale(selectedOption == index ? 2.5 : 1.8),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: selectedOption == index ? accentColor : bgColor,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 3,
                  color: selectedOption == index ? accentColor : borderColor,
                  style: BorderStyle.solid,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: selectedOption == index ? accentColor : bgColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 3,
                      color: selectedOption == index ? Colors.white : bgColor,
                      style: BorderStyle.solid,
                    )),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  packages[index][0],
                  style: GoogleFonts.poppins(
                    color: darkColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(packages[index][1])
              ],
            ),
            const SizedBox(width: 15),
            Text(
              packages[index][2],
              textAlign: TextAlign.end,
              style: GoogleFonts.poppins(
                color: darkColor,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )
          ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: bgColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 20, right: 20),
              child: Column(
                children: [
                  const SizedBox(width: 20, height: 15),
                  Center(
                      child: Image.asset(
                          'assets/image/ilus-upgrade-package.png',
                          width: 240)),
                  const SizedBox(width: 20, height: 35),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text('Upgrade to ', style: titleTextStyle),
                          Text(
                            'Pro',
                            style: titleAcccentTextStyle,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(width: 20, height: 15),
                  Text(
                    'Go unlock all feature and \n build your own bussiness bigger',
                    style: GoogleFonts.poppins(
                      color: darkColor,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(width: 20, height: 25),
                  Expanded(
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: packages.length,
                        itemBuilder: (context, index) {
                          return option(index);
                        }),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: accentColor,
                        minimumSize: const Size(double.infinity, 52)),
                    child: Text(
                      'Checkout now',
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                  TextButton(
                      onPressed: () => {}, child: const Text('Sorry, not now'))
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.stretch,
                  //   children: [
                  //     // ElevatedButton(
                  //     //   onPressed: () {},
                  //     //   child: Text('Submit'),
                  //     //   style: ElevatedButton.styleFrom(
                  //     //     minimumSize: Size(double.infinity,
                  //     //         50), // Set minimum width and height
                  //     //   ),
                  //     // ),
                  //     // ElevatedButton(
                  //     //           onPressed: () => {},
                  //     //           style: ElevatedButton.styleFrom(backgroundColor: accentColor),
                  //     //           child: Text('Checkout now',
                  //     //               style: GoogleFonts.poppins(
                  //     //                 color: Colors.white,
                  //     //                 fontWeight: FontWeight.bold,
                  //     //                 fontSize: 18,
                  //     //               )))
                  //   ],
                  // )
                  // TextButton.icon(
                  //   style: TextButton.styleFrom(
                  //     foregroundColor: Colors.white,
                  //     backgroundColor: accentColor,
                  //   ),
                  //   onPressed: () {},
                  //   label: const Text('Checkout now'),
                  // ),
                ],
              ),
            ),
          )),
    );
  }
}
