
import 'package:flutter/material.dart';
import 'package:give_gobble/controller/consts/const.dart';
import 'package:give_gobble/view/Restaurant/widgets/restaurant_cardwidget.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenHomeRestaurant extends StatelessWidget {
  const ScreenHomeRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Give&Gobble",
                  style: GoogleFonts.reenieBeanie(color: kpink, fontSize: 45),
                ),
                kheight30,
                Center(
                  child: Container(
                      width: 380,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color.fromARGB(255, 122, 93, 170),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.9),
                                spreadRadius: 3,
                                blurRadius: 10,
                                offset: const Offset(0, 4))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Share Your Love \n with donation ",
                                  style: textStyleFuc(
                                      weight: FontWeight.w500,
                                      color: kwhite,
                                      size: 21),
                                ),
                                kHeight15,
                                ElevatedButton(
                                    onPressed: () {},
                                    child: const Text("Donation"))
                              ],
                            ),
                            Image.asset(
                              "assets/cardimage-removebg-preview.png",
                              width: 150,
                              height: 160,
                            )
                          ],
                        ),
                      )),
                ),
                kHeight15,
                Text(
                  "Donate",
                  style: textStyleFuc(
                      weight: FontWeight.w600, color: kBlack, size: 20),
                ),
                kHeightFive,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RestuarantCardWidget(
                      text: "Food",
                      image: "assets/food-removebg-preview.png",
                    ),
                    RestuarantCardWidget(
                      text: "Education",
                      image: "assets/Graduation_hat-removebg-preview.png",
                    ),
                    RestuarantCardWidget(
                      text: "Water",
                      image: "assets/waterbottle-removebg-preview (1).png",
                    ),
                    RestuarantCardWidget(
                      text: "Clothes",
                      image: "assets/clothes-removebg-preview.png",
                    ),
                  ],
                ),
                kheight30,
                Text(
                  "Latest Updates ",
                  style: textStyleFuc(
                      weight: FontWeight.w600, color: kBlack, size: 20),
                ),
                kheight30,
                Column(
                  children: [
                    Center(
                      child: Container(
                        width: 400,
                        height: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: const Color.fromARGB(255, 255, 255, 255),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.9),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: const Offset(0, 4))
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Image.asset(
                              "assets/ncdonalds.jfif",
                              width: 380,
                              height: 250,
                            )),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 30),
                                  child: Container(
                                    
                                    child: Text("Amelia Lucas,Kate Roger",style: textStyleFuc(weight: FontWeight.w300, color: kwhite, size: 14),
                                    
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 122, 93, 170),
                                      borderRadius: radius4
                                    ),
                                    
                                  ),
                                  
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30,right: 10),
                                  child: Text("McDonald's closes corporate offices as workers await layoffs - CNBC",style: textStyleFuc(weight: FontWeight.w500, color: kBlack, size: 17),),
                                ),
                                kHeight15,
                                Center(child: Text("read more",style: textStyleFuc(weight: FontWeight.normal, color: Colors.grey, size: 14),))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
