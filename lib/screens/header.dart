import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget{
  const Header({super.key, required this.time, required this.userCount});

  final String time;
  final int userCount;

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 28),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      "Stroll Bonfire",
                      style: theme.textTheme.titleLarge?.copyWith(
                          shadows: [
                            Shadow(
                                offset: const Offset(0, 1),
                                blurRadius: 12,
                                color: Colors.black.withOpacity(0.5)
                            )
                          ]
                      )
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset('assets/icons/ic_arrow_down.svg', width: 5, height: 8),
                ],
              ),
              const SizedBox(height: 3),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/ic_clock.svg', width: 16, height: 16),
                    const SizedBox(width: 4),
                    Text(time, style: const TextStyle(color: Colors.white, fontSize: 12)),
                    const SizedBox(width: 14),
                    SvgPicture.asset('assets/icons/ic_user_16.svg', width: 16, height: 16, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),),
                    const SizedBox(width: 4),
                    Text("$userCount", style: const TextStyle(color: Colors.white, fontSize: 12)),
                  ]
              )
            ]
        )
    );
  }

}