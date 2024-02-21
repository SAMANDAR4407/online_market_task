import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xfff3f3f3),
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            SvgPicture.asset('assets/icons/search_normal.svg'),
            const SizedBox(width: 15),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Поиск товаров',
                    hintStyle: TextStyle( color: Colors.grey),
                    isDense: true,
                    isCollapsed: true
                ),
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
