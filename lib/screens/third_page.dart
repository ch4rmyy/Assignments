import 'dart:async';
import 'dart:convert';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  ThirdPageState createState() => ThirdPageState();
}

class ThirdPageState extends State<ThirdPage> {
  var demonSlayers;
  bool? isLoading;

  Future getTheList() async {
    setState(() {
      isLoading = true;
    });

    var data = await getSlayersJSON();
    // print(data);

    setState(() {
      isLoading = false;
      demonSlayers = data['content'];
    });
  }

  Future<Map> getSlayersJSON() async {
    //await Future.delayed(const Duration(seconds: 3), () {});

    //wala na sa required api sir hehehehe
    var url = Uri.parse(
        'https://www.demonslayer-api.com/api/v1/combat-styles?page=3');
    var response = await http.get(url);

    //successful retrieval

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Canceled flight sang demon slayers');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Demon Slayer"),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          color: Colors.grey[300],
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(30),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Demon Slayer Combat Styles',
                      style: TextStyle(
                          color: Color.fromRGBO(93, 11, 5, 0.869),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                  // setup the URL for your API here
                  future: getSlayersJSON(),
                  builder: (context, snapshot) {
                    // Consider 3 cases here
                    // when the process is ongoing
                    // return CircularProgressIndicator();
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    // when the process is completed:
                    if (snapshot.hasData) {
                      var data = snapshot.data as Map;
                      var results = data['content'];
                      // print(results);

                      // successful
                      // Use the library here
                      // return ExpandedTitleList.builder;

                      return ExpandedTileList.builder(
                          itemCount: results == null ? 0 : results.length,
                          itemBuilder: (context, i, controller) {
                            var addedDetails =
                                results[i]['combat_style_character'];

                            return ExpandedTile(
                              controller: controller,
                              title: Text(results[i]['name'],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              leading: SizedBox(
                                height: 150,
                                // width: 150,
                                child: Image.network(
                                  results[i]["img"],
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.error),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text('Image unavailable.')
                                        ]);
                                  },
                                ),
                              ),
                              content: Container(
                                padding: const EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    Text(results[i]['description']),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Technique Users',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    ...addedDetails.map<Widget>((users) {
                                      return Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 5, 30, 5),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                  width: 150,
                                                  child: Text(
                                                      '${users['name']}   ',
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight
                                                              .bold))),
                                              // SizedBox(width: 50,),
                                              Expanded(
                                                  child: Text(
                                                      users['description']))
                                            ],
                                          ),
                                        ),
                                      );
                                    })
                                    // TextButton(
                                    //   onPressed: (){
                                    //   },
                                    //   child: child)
                                  ],
                                ),
                              ),
                            );
                          });
                    } //if ending

                    if (snapshot.hasError) {
                      return Text(
                          "An error has occured: ${snapshot.error.toString()}");
                    }

                    return Container();
                  }),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
              child: FloatingActionButton(
                heroTag: 'back',
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back),
              ),
            ),
            const SizedBox(
              width: 130,
            ),
            // SizedBox(
            //   height: 40,
            //   child: FloatingActionButton(
            //     heroTag: 'next',
            //     onPressed: () {
            //       Navigator.pushNamed(context, '/thirdPage');
            //     },
            //     child: const Icon(Icons.arrow_forward),
            //   ),
            // )
          ],
        ));
  }
}
