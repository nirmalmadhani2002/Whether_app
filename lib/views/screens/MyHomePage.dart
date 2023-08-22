import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wheather_api_flutter/Global.dart';
import '../../Helpar/helpar.dart';
import '../../modal/modal.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime currentDate = DateTime.now();
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          "weather App", 
          style: TextStyle(color: Global.bg5Color),
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.flag_circle,
              size: 35,
              color: Global.bg1Color,
              
            ),
            onSelected: (val) {
              setState(() {
                Global.country = val;
                Global.searchData();
              });
            },
            color: Global.bg5Color.withOpacity(0.7),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: "In",
                child: Text("India"),
              ),
              const PopupMenuItem(
                value: "UK",
                child: Text("United Kingdom"),
              ),
              const PopupMenuItem(
                value: "RU",
                child: Text("Russia"),
              ),
              const PopupMenuItem(
                value: "FR",
                child: Text("France"),
              ),
            ],
          ),
          const SizedBox(
            width: 8,
          ),
        ],
        backgroundColor: Global.bg3Color,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: CupertinoSearchTextField(
                controller: cityController,
                prefixInsets: const EdgeInsets.all(8),
                borderRadius: BorderRadius.circular(30),
                padding: const EdgeInsets.symmetric(vertical: 10),
                placeholder: "Search",
                placeholderStyle: TextStyle(
                  fontSize: 18,
                  color: Global.bg3Color.withOpacity(0.6),
                ),
                onSubmitted: (val) {
                  setState(() {
                    Global.search = val;
                    cityController.clear();
                  });
                },
                backgroundColor: const Color(0XFF6A62B7).withAlpha(50),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              flex: 9,
              child: FutureBuilder(
                future: ApiHelpers.apiHelpers
                    .getData(city: Global.search, code: Global.country),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error is : ${snapshot.error}"),
                    );
                  } else if (snapshot.hasData) {
                    Weather? data = snapshot.data;
                    return (data != null)
                        ? Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xffac255e),
                                        Color(0xffca485c),
                                        Color(0xffe16b5c),
                                        Color(0xfff39060),
                                        Color(0xffffb56b),
                                      ],
                                      tileMode: TileMode.mirror,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${data.name}, ${Global.title}",
                                          style: myStyle3,
                                        ),
                                        Text(
                                          "Today,${Global.months[currentDate.month - 1]} ${currentDate.day} ${currentDate.hour}:${currentDate.minute}",
                                          style: myStyle3,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    CupertinoIcons.sun_max,
                                                    color: Global.color1,
                                                  ),
                                                  SizedBox(
                                                    width: 80,
                                                    child: Text(
                                                      data.description,
                                                      style: myStyle3,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "${(data.feelsLike.toInt() - 273.15).toInt()}°",
                                                style: TextStyle(
                                                  color: Global.color1,
                                                  fontSize: 86,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 18, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Weather now",
                                            style: TextStyle(
                                              color: Global.bg1Color,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: CircleAvatar(
                                                          radius: 26,
                                                          backgroundImage:
                                                          const AssetImage(
                                                              "assets/icons/heating.png"),
                                                          backgroundColor:
                                                              Global.bg1Color,
                                                        ),
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(
                                                            "Feel like",
                                                            style: myStyle,
                                                          ),
                                                          Text(
                                                            "${(data.feelsLike.toInt() - 273.15).toInt()}°",
                                                            style: myStyle1,
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: CircleAvatar(
                                                          radius: 26,
                                                          backgroundImage:
                                                          const AssetImage(
                                                              "assets/icons/wind.png"),
                                                          backgroundColor:
                                                              Global.bg1Color,
                                                        ),
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(
                                                            "Wind",
                                                            style: myStyle,
                                                          ),
                                                          Text(
                                                            "${data.speed.toInt()} km/h",
                                                            style: myStyle1,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: CircleAvatar(
                                                          radius: 26,
                                                          backgroundImage:
                                                              const AssetImage(
                                                                  "assets/icons/raining.png"),
                                                          backgroundColor:
                                                              Global.bg1Color,
                                                        ),
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(
                                                            "Pressure",
                                                            style: myStyle,
                                                          ),
                                                          Text(
                                                            "${data.pressure} hpa",
                                                            style: myStyle1,
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: CircleAvatar(
                                                          radius: 26,
                                                          backgroundImage:
                                                              const AssetImage(
                                                                  "assets/icons/humidity.png"),
                                                          backgroundColor:
                                                              Global.bg1Color,
                                                        ),
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Text(
                                                            "Humidity",
                                                            style: myStyle,
                                                          ),
                                                          Text(
                                                            "${data.humidity.toInt()}%",
                                                            style: myStyle1,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const Center(
                            child: Text("Data is Not Founds ...."),
                          );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle myStyle = TextStyle(
    color: Global.bg3Color,
    fontSize: 14,
  );
  TextStyle myStyle1 = TextStyle(
    color: Global.bg3Color,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );

  TextStyle myStyle2 = const TextStyle(
    color: Colors.black,
    fontSize: 14,
  );
  TextStyle myStyle3 = TextStyle(
    color: Global.color1,
    fontWeight: FontWeight.w500,
    fontSize: 16,
  );
}
