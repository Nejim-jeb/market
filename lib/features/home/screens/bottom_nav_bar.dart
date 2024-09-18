import 'package:flutter/material.dart';
import 'package:flutter_grocery/helper/responsive_helper.dart';
import 'package:flutter_grocery/localization/language_constraints.dart';
import 'package:flutter_grocery/utill/images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return ResponsiveHelper.isMobilePhone()
        ? Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            height: 55,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  flex: 3,
                  child: BottomAppBarItem(
                    selectedIndex: selectedIndex,
                    childNumber: 0,
                    onPressed: () {},
                    assetPath: Images.homeSolid,
                    label: getTranslated('home', context),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: BottomAppBarItem(
                    selectedIndex: selectedIndex,
                    childNumber: 1,
                    onPressed: () {},
                    assetPath: Images.walletSolid,
                    label: getTranslated('wallet', context),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: BottomAppBarItem(
                    selectedIndex: selectedIndex,
                    childNumber: 2,
                    onPressed: () {},
                    assetPath: Images.ordersSolid,
                    label: getTranslated('orders', context),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: BottomAppBarItem(
                    selectedIndex: selectedIndex,
                    childNumber: 3,
                    onPressed: () {},
                    assetPath: Images.favoriteSolid,
                    label: getTranslated('favourite', context),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}

class BottomAppBarItem extends StatelessWidget {
  const BottomAppBarItem({
    Key? key,
    required this.childNumber,
    required this.onPressed,
    required this.assetPath,
    required this.label,
    required this.selectedIndex,
  }) : super(key: key);
  final String assetPath;
  final int childNumber;
  final int selectedIndex;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedIndex == childNumber;
    const selectedColor = Colors.white70;
    const unselectedColor = Colors.white;
    final iconSize = isSelected ? 20.0 : 18.0;
    final iconColor = !isSelected ? selectedColor : unselectedColor;
    return InkWell(
      onTap: isSelected ? null : onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            assetPath,
            color: iconColor,
            width: iconSize,
            height: iconSize,
          ),
          // const SizedBox(height: 4),
          // Text(
          //   label,
          //   textAlign: TextAlign.center,
          //   style: const TextStyle(),
          // )
        ],
      ),
    );
  }
}
