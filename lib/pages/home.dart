import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:online_market_task/widgets/swiper_item.dart';

import '../util.dart';
import '../widgets/button.dart';
import '../widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  late TabController tabController;
  final swiperController = SwiperController();

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  final swiperList = [
    'assets/images/ps.png',
    'assets/images/iph.png',
    'assets/images/sofa.png',
  ];

  int indicatorIndex = 1;

  void changeIndicator(int value){
    setState(() {
      indicatorIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/person.svg', colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn)),
                const SizedBox(width: 10),
                const Text('Здравствуйте, ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                const Text('Дониёр', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.green)),
              ],
            ),
          ),
          SizedBox(
            height: 220,
            child: ListView.separated(
              padding: const EdgeInsets.all(20),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemCount: 3,
              itemBuilder: (context, index) {
                if(index == 0){
                  return Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: (){
                      //
                    },
                    child: Stack(
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width*0.7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(17),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Готов к выдаче', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.deepOrangeAccent, fontSize: 17)),
                                        SizedBox(height: 6),
                                        Text('Заказ №10021122', style: TextStyle(fontSize: 13, color: Color(0xff7B7B7B))),
                                      ],
                                    ),
                                    Material(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green.withOpacity(0.4),
                                      clipBehavior: Clip.antiAlias,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Icon(Icons.check_rounded, color: Colors.green.shade900),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 17),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Самовывоз до 29 марта', style: TextStyle(fontWeight: FontWeight.w500)),
                                    const SizedBox(height: 20),
                                    Material(
                                      color: Colors.deepOrangeAccent,
                                      borderRadius: BorderRadius.circular(10),
                                      clipBehavior: Clip.antiAlias,
                                      child: const InkWell(
                                        onTap: showToast,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                          child: Text('Забрать заказ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: SvgPicture.asset('assets/images/box.svg')
                        ),
                      ],
                    ),
                  ),
                );
                } else if(index == 1) {
                  return Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: (){
                        //
                      },
                      child: Stack(
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width*0.7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(17),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Как вам работа приложения?', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.deepOrangeAccent, fontSize: 16)),
                                      SizedBox(height: 6),
                                      Text('Нам важно ваше мнение', style: TextStyle(fontSize: 14, color: Color(0xff7B7B7B))),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 17),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('Самовывоз до 29 марта', style: TextStyle(color: Colors.transparent)),
                                      const SizedBox(height: 20),
                                      Material(
                                        color: Colors.deepOrangeAccent,
                                        borderRadius: BorderRadius.circular(10),
                                        clipBehavior: Clip.antiAlias,
                                        child: const InkWell(
                                          onTap: showToast,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                            child: Text('Оценить', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: SvgPicture.asset('assets/images/star.svg')
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: (){
                        //
                      },
                      child: Stack(
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width*0.7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(17),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Готов к выдаче', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.deepOrangeAccent, fontSize: 17)),
                                          SizedBox(height: 6),
                                          Text('Заказ №10021122', style: TextStyle(fontSize: 14, color: Color(0xff7B7B7B))),
                                        ],
                                      ),
                                      Material(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.green.withOpacity(0.4),
                                        clipBehavior: Clip.antiAlias,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Icon(Icons.check_rounded, color: Colors.green.shade900),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 17),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('Самовывоз до 29 марта', style: TextStyle(fontWeight: FontWeight.w500)),
                                      const SizedBox(height: 20),
                                      Material(
                                        color: Colors.deepOrangeAccent,
                                        borderRadius: BorderRadius.circular(10),
                                        clipBehavior: Clip.antiAlias,
                                        child: const InkWell(
                                          onTap: showToast,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                            child: Text('Забрать заказ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                          Positioned(
                              right: 0,
                              bottom: 0,
                              child: SvgPicture.asset('assets/images/bell.svg')
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          Material(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSearchBar(),
                  SizedBox(
                    height: 180,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: 20),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        if(index == 0){
                          return Material(borderRadius: BorderRadius.circular(10), clipBehavior: Clip.antiAlias, child: Image.asset('assets/images/ad1.png'));
                        }
                        return Material(borderRadius: BorderRadius.circular(10), clipBehavior: Clip.antiAlias, child: Image.asset('assets/images/ad2.png'));
                      },
                    ),
                  ),
                  const CustomButton(text: 'Все акции'),
                  const SizedBox(height: 40),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Товар дня', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                      Text('22 : 33 : 15', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 330,
                    child: Swiper(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return SwiperItem(image: swiperList[index]);
                      },
                      itemWidth: MediaQuery.sizeOf(context).width*0.8,
                      layout: SwiperLayout.STACK,
                      pagination: const SwiperPagination(builder: SwiperPagination.rect),
                      controller: swiperController,
                      onIndexChanged: changeIndicator,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: SizedBox(
                      height: 40,
                      width: 140,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        separatorBuilder: (context, index) => const SizedBox(width: 10),
                        itemBuilder: (context, index) {
                          return Container(
                            width: 40,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                              ),
                              border: Border.all(
                                width: 2.5,
                                color: indicatorIndex == index ? Colors.deepOrangeAccent : Colors.grey,
                                style: BorderStyle.solid,
                              ),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Center(
                              child: SizedBox(
                                width: 34,
                                height: 34,
                                child: Image.asset(swiperList[index], fit: BoxFit.cover),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Рекомендуем вам', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                  TabBar(
                    dividerHeight: 0,
                    indicatorColor: Colors.deepOrangeAccent,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.deepOrangeAccent,
                    controller: tabController,
                    tabs: const [
                      Tab(text: 'Новинки',),
                      Tab(text: 'Популярное',),
                      Tab(text: 'Скидки + Рассрочка',),
                    ],
                  ),
                  SizedBox(
                    height: 560,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                clipBehavior: Clip.antiAlias,
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        //
                                      },
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            height: 160,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Center(
                                                child: Image.asset('assets/images/cleaner.png'),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(width: 220, child: Text('Электрическая варочная поверхность MAUNFELD EEHE.32.4B', maxLines: 3, style: TextStyle(fontWeight: FontWeight.bold))),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('2 000 000 сум', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, decoration: TextDecoration.lineThrough)),
                                                      Text('1 750 000 сум', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.orange)),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 25),
                                                  Material(
                                                    clipBehavior: Clip.antiAlias,
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.deepOrangeAccent,
                                                    child: InkWell(
                                                      onTap: showToast,
                                                      child: SizedBox(width: 80, child: Padding(
                                                        padding: const EdgeInsets.all(5),
                                                        child: Center(child: SvgPicture.asset('assets/icons/cart_white.svg')),
                                                      )),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        //
                                      },
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            height: 160,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Center(
                                                child: Image.asset('assets/images/playstation.png'),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(width: 220, child: Text('Игровая приставка Sony PlayStation PS5 DIGITAL EDITION 825Gb/Go', maxLines: 3, style: TextStyle(fontWeight: FontWeight.bold))),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const Text('1 750 000 сум', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.orange)),
                                                  const SizedBox(width: 25),
                                                  Material(
                                                    clipBehavior: Clip.antiAlias,
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.deepOrangeAccent,
                                                    child: InkWell(
                                                      onTap: showToast,
                                                      child: SizedBox(width: 80, child: Padding(
                                                        padding: const EdgeInsets.all(5),
                                                        child: Center(child: SvgPicture.asset('assets/icons/cart_white.svg')),
                                                      )),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        //
                                      },
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            height: 160,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Center(
                                                child: Image.asset('assets/images/fridge.png'),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(width: 220, child: Text('Электрическая варочная поверхность MAUNFELD EEHE.32.4B', maxLines: 3, style: TextStyle(fontWeight: FontWeight.bold))),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const Text('1 750 000 сум', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.orange)),
                                                  const SizedBox(width: 25),
                                                  Material(
                                                    clipBehavior: Clip.antiAlias,
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.deepOrangeAccent,
                                                    child: InkWell(
                                                      onTap: showToast,
                                                      child: SizedBox(width: 80, child: Padding(
                                                        padding: const EdgeInsets.all(5),
                                                        child: Center(child: SvgPicture.asset('assets/icons/cart_white.svg')),
                                                      )),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              const CustomButton(text: 'Смотреть все 15'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                clipBehavior: Clip.antiAlias,
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        //
                                      },
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            height: 160,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Center(
                                                child: Image.asset('assets/images/cleaner.png'),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(width: 220, child: Text('Электрическая варочная поверхность MAUNFELD EEHE.32.4B', maxLines: 3, style: TextStyle(fontWeight: FontWeight.bold))),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('2 000 000 сум', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, decoration: TextDecoration.lineThrough)),
                                                      Text('1 750 000 сум', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.orange)),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 25),
                                                  Material(
                                                    clipBehavior: Clip.antiAlias,
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.deepOrangeAccent,
                                                    child: InkWell(
                                                      onTap: showToast,
                                                      child: SizedBox(width: 80, child: Padding(
                                                        padding: const EdgeInsets.all(5),
                                                        child: Center(child: SvgPicture.asset('assets/icons/cart_white.svg')),
                                                      )),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        //
                                      },
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            height: 160,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Center(
                                                child: Image.asset('assets/images/playstation.png'),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(width: 220, child: Text('Игровая приставка Sony PlayStation PS5 DIGITAL EDITION 825Gb/Go', maxLines: 3, style: TextStyle(fontWeight: FontWeight.bold))),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const Text('1 750 000 сум', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.orange)),
                                                  const SizedBox(width: 25),
                                                  Material(
                                                    clipBehavior: Clip.antiAlias,
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.deepOrangeAccent,
                                                    child: InkWell(
                                                      onTap: showToast,
                                                      child: SizedBox(width: 80, child: Padding(
                                                        padding: const EdgeInsets.all(5),
                                                        child: Center(child: SvgPicture.asset('assets/icons/cart_white.svg')),
                                                      )),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        //
                                      },
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            height: 160,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Center(
                                                child: Image.asset('assets/images/fridge.png'),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(width: 220, child: Text('Электрическая варочная поверхность MAUNFELD EEHE.32.4B', maxLines: 3, style: TextStyle(fontWeight: FontWeight.bold))),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const Text('1 750 000 сум', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.orange)),
                                                  const SizedBox(width: 25),
                                                  Material(
                                                    clipBehavior: Clip.antiAlias,
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.deepOrangeAccent,
                                                    child: InkWell(
                                                      onTap: showToast,
                                                      child: SizedBox(width: 80, child: Padding(
                                                        padding: const EdgeInsets.all(5),
                                                        child: Center(child: SvgPicture.asset('assets/icons/cart_white.svg')),
                                                      )),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              const CustomButton(text: 'Смотреть все 15'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                clipBehavior: Clip.antiAlias,
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        //
                                      },
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            height: 160,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Center(
                                                child: Image.asset('assets/images/cleaner.png'),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(width: 220, child: Text('Электрическая варочная поверхность MAUNFELD EEHE.32.4B', maxLines: 3, style: TextStyle(fontWeight: FontWeight.bold))),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('2 000 000 сум', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, decoration: TextDecoration.lineThrough)),
                                                      Text('1 750 000 сум', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.orange)),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 25),
                                                  Material(
                                                    clipBehavior: Clip.antiAlias,
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.deepOrangeAccent,
                                                    child: InkWell(
                                                      onTap: showToast,
                                                      child: SizedBox(width: 80, child: Padding(
                                                        padding: const EdgeInsets.all(5),
                                                        child: Center(child: SvgPicture.asset('assets/icons/cart_white.svg')),
                                                      )),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        //
                                      },
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            height: 160,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Center(
                                                child: Image.asset('assets/images/playstation.png'),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(width: 220, child: Text('Игровая приставка Sony PlayStation PS5 DIGITAL EDITION 825Gb/Go', maxLines: 3, style: TextStyle(fontWeight: FontWeight.bold))),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const Text('1 750 000 сум', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.orange)),
                                                  const SizedBox(width: 25),
                                                  Material(
                                                    clipBehavior: Clip.antiAlias,
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.deepOrangeAccent,
                                                    child: InkWell(
                                                      onTap: showToast,
                                                      child: SizedBox(width: 80, child: Padding(
                                                        padding: const EdgeInsets.all(5),
                                                        child: Center(child: SvgPicture.asset('assets/icons/cart_white.svg')),
                                                      )),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        //
                                      },
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 100,
                                            height: 160,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Center(
                                                child: Image.asset('assets/images/fridge.png'),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(width: 220, child: Text('Электрическая варочная поверхность MAUNFELD EEHE.32.4B', maxLines: 3, style: TextStyle(fontWeight: FontWeight.bold))),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const Text('1 750 000 сум', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.orange)),
                                                  const SizedBox(width: 25),
                                                  Material(
                                                    clipBehavior: Clip.antiAlias,
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.deepOrangeAccent,
                                                    child: InkWell(
                                                      onTap: showToast,
                                                      child: SizedBox(width: 80, child: Padding(
                                                        padding: const EdgeInsets.all(5),
                                                        child: Center(child: SvgPicture.asset('assets/icons/cart_white.svg')),
                                                      )),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              const CustomButton(text: 'Смотреть все 15'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ORZU', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.green)),
                      Text('BLOG', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.deepOrangeAccent)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 170,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      separatorBuilder: (context, index) => const SizedBox(width: 20),
                      itemBuilder: (context, index) {
                        return Material(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset('assets/images/windows.png'),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CustomButton(text: 'Читать все'),
                  const SizedBox(height: 60),
                  GestureDetector(
                    onTap: showToast,
                    child: SizedBox(
                      height: 160,
                      width: double.infinity,
                      child: Image.asset('assets/images/to_catalog.png', fit: BoxFit.cover),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
