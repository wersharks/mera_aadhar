import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:mera_aadhar/utilities/constants.dart';
import 'package:mera_aadhar/utilities/size_config.dart';

class OperatorBookCard extends StatelessWidget {
  String name;
  String rating;
  Map<String, String> reviews;
  OperatorBookCard(
      {required this.name,
      required this.rating,
      this.reviews = const {"": "No reviews yet"}});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 28),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/operator.png',
              width: 130,
              height: 160,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: kTextSTyle,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Rated $rating⭐",
                style: kTextSTyle,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 200,
                height: 120,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Expanded(
                    child: RawScrollbar(
                      thumbVisibility: true,
                      thumbColor: Color(0xffF8774A),
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: reviews.length,
                          itemBuilder: (context, i) {
                         
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    '${reviews.keys.elementAt(i)}: ',
                                    style: kPoppinBlack.copyWith(
                                        fontWeight: FontWeight.bold),
                                    softWrap: true,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    '${reviews.values.elementAt(i)}',
                                    style: kPoppinBlack,
                                    softWrap: true,
                                  ),
                                )
                              ],
                            );
                          }),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
