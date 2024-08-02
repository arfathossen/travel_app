import 'package:flutter/material.dart';
import 'package:travel_app/model/travel.dart';
import 'package:travel_app/ui/detail._view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Travel> travelList = Travel.getTravelItems();
    List<Travel> nearestTravelList = Travel.getTravelItems();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              color: Colors.black,
              weight: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_pin,
                  weight: 20,
                  color: Color(0xff8f2941),
                ),
                SizedBox(width: 2),
                Text(
                  "London",
                  style: TextStyle(
                    color: Color(0xff8f2941),
                    fontSize: 16,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xff8f2941),
                )
              ],
            ),
            CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/profile.png',
              ),
            )
          ],
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: const TextSpan(
                      text: 'Discover',
                      style: TextStyle(
                          color: Color(0xff8f2941), fontSize: 32, height: 1.3),
                      children: <TextSpan>[
                    TextSpan(
                        text: " the Best Places to Travel",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ))
                  ])),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.search,
                        weight: 24,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search Pleace'),
                        ),
                      ),
                      Image.asset(
                        'assets/images/option.png',
                        width: 24,
                      )
                    ],
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nearest to you',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xff8f294f)),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: size.height * .4,
                child: ListView.builder(
                    itemCount: nearestTravelList.length,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailView(id: index)));
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(24),
                                  ),
                                  child: Image.asset(
                                      nearestTravelList[index].imageUrl[0])),
                              Positioned(
                                  bottom: 20,
                                  left: 20,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 29, vertical: 10),
                                    decoration: const BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, .5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Text(
                                      '${nearestTravelList[index].distance}Kn Away',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 24,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Discover Places',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'View all',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xff8f294f)),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: size.height * .4,
                child: ListView.builder(
                  itemCount: travelList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailView(id: index)));
                        },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(
                                travelList[index].imageUrl[1],
                                fit: BoxFit.fill,
                                height: 40.0,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  travelList[index].name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      travelList[index].location,
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          color: Color(0xff686771)),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/star.png',
                                          width: 30,
                                        ),
                                        Text(
                                          travelList[index].rating.toString(),
                                          style:
                                              const TextStyle(fontSize: 16.0),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
