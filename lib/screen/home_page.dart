import 'package:flutter/material.dart';
import 'package:gfx_optimizer/facebook_audience_network_widgets/fb_native_banner_ad.dart';
import 'package:gfx_optimizer/screen/setting.dart';
import 'package:lottie/lottie.dart';
import 'package:system_info2/system_info2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  String _cpuName = 'Unknown';
  String _totalRam = 'Unknown';
  String _freeRam = 'Unknown';
  String _cores = 'Unknown';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDeviceInfo();
  }

  void _getDeviceInfo() {
    final processors = SysInfo.cores;
    final totalPhysicalMemory = SysInfo.getTotalPhysicalMemory();
    final freePhysicalMemory = SysInfo.getFreePhysicalMemory();
    final deviceCore = SysInfo.cores;
    // Convert memory values to gigabytes (GB)
    double totalRamInGB = totalPhysicalMemory / (1024 * 1024 * 1024);
    double freeRamInGB = freePhysicalMemory / (1024 * 1024 * 1024);

    setState(() {
      _cpuName = processors.isNotEmpty ? processors.first.name : 'Unknown';
      _totalRam = totalRamInGB.toStringAsFixed(2);
      _freeRam = freeRamInGB.toStringAsFixed(2);
      _cores = deviceCore.toString();
    });
  }

  var ram = SysInfo.getVirtualMemorySize();
  int megaByte = 1024 * 1024 * 1024;
  _onWillPop() {
    print("object");
    return (showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        null;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) => _onWillPop,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 11, 16, 54),
        appBar: AppBar(
          elevation: 25,
          backgroundColor: const Color.fromARGB(255, 11, 16, 54),
          title: const Text(
            "Game Booster",
            style: TextStyle(color: Colors.white, fontFamily: "Gugi"),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height / 4,
                  child: Card(
                    color: const Color.fromRGBO(15, 22, 95, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: MediaQuery.sizeOf(context).width / 4,
                            height: MediaQuery.sizeOf(context).height,
                            child: LottieBuilder.asset(
                                "assest/lottieAnimation/headerAnimation.json")),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Column(
                              children: [
                                Text(
                                  "Enhance your game play",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Gugi",
                                      fontSize: 19),
                                ),
                                Text(
                                  "Winner winner chicken dinner",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              // color: Colors.amber,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assest/img/ramIcon.png",
                                        color: Colors.white,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                20,
                                      ),
                                      Text(
                                        _totalRam,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Image.asset(
                                        "assest/img/cpu-icon.png",
                                        color: Colors.white,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                20,
                                      ),
                                      Text(
                                        _freeRam,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    " Become Pro-Player",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Gugi",
                      fontSize: 19,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                      color: const Color.fromRGBO(15, 22, 95, 1),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Image.asset(
                                "assest/img/phone.png",
                                width: 55,
                              ),
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Android 11",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Text(
                                  "Red Velvet Cake",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          Color.fromARGB(186, 255, 255, 255)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      color: const Color.fromRGBO(15, 22, 95, 1),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: Image.asset(
                                "assest/img/android.png",
                                width: 55,
                              ),
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Android 11",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                Text(
                                  "Red Velvet Cake",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          Color.fromARGB(186, 255, 255, 255)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(12), // Image border
                                child: SizedBox.fromSize(
                                  size:
                                      const Size.fromRadius(28), // Image radius
                                  child: Image.asset('assest/img/logo.jpg',
                                      scale: 20, fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Enhance BGMI",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Gugi",
                                      fontSize: 19,
                                    ),
                                  ),
                                  Text(
                                    "Play without Low Ping",
                                    style: TextStyle(
                                      color: Color.fromARGB(182, 255, 255, 255),
                                      fontSize: 13,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SettingListScreen(),
                                  ));
                            },
                            child: Container(
                              height: 42,
                              width: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(229, 28, 68, 1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                "Boost",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingListScreen(),
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(12), // Image border
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(
                                        28), // Image radius
                                    child: Image.asset(
                                        'assest/img/bgmilogo.avif',
                                        scale: 20,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Enhance PBG",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Gugi",
                                        fontSize: 19,
                                      ),
                                    ),
                                    Text(
                                      "Play without Lag",
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(182, 255, 255, 255),
                                        fontSize: 13,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: 42,
                              width: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(229, 28, 68, 1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                "Boost",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                NativeBannerAdWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
