import 'package:flutter/material.dart';

// import 'package:travel_app/animations/fade_animation.dart';
import 'package:travel_app/model/travel.dart';

class DetailView extends StatefulWidget {
  final int id;
  const DetailView({super.key, required this.id});

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Travel> travelList = Travel.getTravelItems();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: size.height,
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset(
                  travelList[widget.id].imageUrl[0],
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black87.withOpacity(.3),
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.arrow_back_ios_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black87.withOpacity(.3),
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.more_vert_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: size.height * .6,
              width: size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.topCenter,
                      stops: const [0, 1],
                      colors: [Colors.white, Colors.white.withOpacity(.03)])),
            ),
          ),
          Positioned(
              bottom: 50,
              left: 20,
              width: size.width * .8,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          travelList[widget.id].name,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/star.png',
                              width: 30,
                            ),
                            Text(
                              travelList[widget.id].rating.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.account_balance_wallet,
                              color: Color(0xff8f297f),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            RichText(
                                text: TextSpan(
                                    text: r'$',
                                    style: TextStyle(
                                      color: Colors.black87.withOpacity(0.5),
                                    ),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          travelList[widget.id].cost.toString(),
                                      style:
                                          const TextStyle(color: Colors.black))
                                ]))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/pin.png',
                              width: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            RichText(
                                text: TextSpan(
                                    text: travelList[widget.id].location,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                    ),
                                    children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          '(${travelList[widget.id].distance}km)',
                                      style: TextStyle(
                                          color:
                                              Colors.black87.withOpacity(0.5)))
                                ]))
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      travelList[widget.id].description,
                      style: const TextStyle(
                          color: Color(0xff686771),
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              border:
                                  Border.all(color: const Color(0xff8f294f))),
                          child: const Icon(
                            Icons.favorite_border,
                            color: Color(0xff8f295f),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Container(
                          padding: const EdgeInsets.all(9),
                          decoration: BoxDecoration(
                            color: const Color(0xff8f294f),
                            border: Border.all(
                              color: const Color(0xff8f294f),
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Center(
                            child: Text(
                              'Discover',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                          ),
                        ))
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
