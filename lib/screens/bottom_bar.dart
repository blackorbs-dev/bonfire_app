import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatelessWidget{
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56,
        color: Theme.of(context).colorScheme.tertiaryContainer,
        child: Row(
          children: [
            navBarItem('assets/icons/ic_card_24.svg'),
            const NavItemWithCount(image: 'assets/icons/ic_fire_24.svg', count: 0),
            const NavItemWithCount(image: 'assets/icons/ic_chat_24.svg', count: 10),
            navBarItem('assets/icons/ic_user_16.svg')
          ]
        )
    );
  }

  Widget navBarItem(String image) => Expanded(
      child: SvgPicture.asset(image, width: 32, height: 32)
  );

}

class NavItemWithCount extends StatelessWidget {

  const NavItemWithCount({super.key, required this.image, required this.count});

  final String image;
  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(child: Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: 44, height: 32,
        child: Stack(
            fit: StackFit.passthrough,
            clipBehavior: Clip.antiAlias,
            children: [
              SvgPicture.asset(image, width: 32, height: 32),
              Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 16, height: 14,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.primaryContainer,
                        border: Border.all(
                            width: 2,
                            color: theme.colorScheme.tertiaryContainer
                        )
                    ),
                    child: Text("$count", style: TextStyle(fontSize: 7, fontWeight: FontWeight.bold, color: theme.colorScheme.tertiaryContainer)),
                  )
              )
            ]
        ),
      ),
    ));
  }
  
}