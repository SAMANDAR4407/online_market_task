import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_market_task/util.dart';

class SwiperItem extends StatelessWidget {
  const SwiperItem({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        color: Colors.white,
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: (){
            //
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image),
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Микроволновая печь соло Gorenje \nMO17E1W',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('2 000 000 сум', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, decoration: TextDecoration.lineThrough)),
                        Text('1 750 000 сум', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.orange)),
                      ],
                    ),
                    Material(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepOrangeAccent,
                      child: InkWell(
                        onTap: showToast,
                        child: SizedBox(width: 90, child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Center(child: SvgPicture.asset('assets/icons/cart_white.svg')),
                        )),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
