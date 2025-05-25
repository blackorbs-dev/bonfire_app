import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/header.dart';
import '../screens/bottom_bar.dart';
import '../providers/main_providers.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider);
    final selectedIndex = ref.watch(selectedOptionProvider);
    final options = [
      "The peace in the early mornings",
      "The magical golden hours",
      "Wind-down time after dinners",
      "The serenity past midnight"
    ];
    final theme = Theme.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            width: double.infinity,
            fit: BoxFit.fitWidth
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter, end: Alignment.bottomCenter,
                    stops: const [0, 0.3, 0.6],
                    colors: [ Colors.black.withOpacity(0.5), Colors.transparent, Colors.black ]
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Header(time: '22h 00m', userCount: 103),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: userAsync.when(
                      data: (user) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(width: 10),
                                  CircleAvatar(backgroundImage: AssetImage(user.profileImage), radius: 25),
                                  const SizedBox(width: 10),
                                  Flexible(child: Padding(
                                      padding: const EdgeInsets.only(top: 6, right: 28),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${user.name}, ${user.age}",
                                            style: TextStyle(color: theme.colorScheme.onPrimary, fontSize: 11, fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            "What is your favorite time of the day?",
                                            style: TextStyle(fontSize: 20, color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      )
                                  ))
                                ]
                            ),
                            const SizedBox(height: 6),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                '“Mine is definitely the peace in the morning.”',
                                style: TextStyle(fontStyle: FontStyle.italic, color: theme.colorScheme.secondaryContainer.withOpacity(0.8)),
                              ),
                            ),
                            GridView.count(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                shrinkWrap: true,
                                childAspectRatio: 2.7,
                                children: options.mapIndexed((index, item) {

                                  final isSelected = selectedIndex == index;

                                  return GestureDetector(
                                      onTap: () => ref.read(selectedOptionProvider.notifier).state = index,
                                      child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: isSelected ? theme.colorScheme.primary : Colors.transparent,
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.circular(12),
                                            color: theme.colorScheme.surface,
                                          ),
                                          child: Row(
                                              children: [
                                                Container(
                                                    alignment: Alignment.center,
                                                    padding: const EdgeInsets.all(6),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: isSelected ? theme.colorScheme.primary : Colors.transparent,
                                                        border: Border.all(
                                                            color: isSelected ? theme.colorScheme.primary : theme.colorScheme.onSurface
                                                        )
                                                    ),
                                                    child: Text(
                                                      String.fromCharCode(65 + index),
                                                      style: TextStyle(fontSize: 14, color: isSelected?Colors.white:theme.colorScheme.onSurface),
                                                    )
                                                ),
                                                const SizedBox(width: 10),
                                                Expanded(
                                                    child: Text(
                                                      options[index],
                                                      style: TextStyle(color: theme.colorScheme.onSurface),
                                                    )
                                                )
                                              ]
                                          )
                                      )
                                  );
                                }).toList()
                            ),
                            const SizedBox(height: 8),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded( child: Text(
                                      "Pick your option.\nSee who has a similar mind.",
                                      style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 12)
                                  )),
                                  IconButton(
                                    icon: SvgPicture.asset('assets/icons/ic_microphone.svg'),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: SvgPicture.asset('assets/icons/ic_arrow_forward.svg'),
                                    onPressed: () {},
                                    padding: EdgeInsets.zero,
                                  )
                                ]
                            )
                          ]
                      ),
                      loading: () => Container(
                          constraints: const BoxConstraints(minHeight: 400),
                          child: const Center(
                              child: CircularProgressIndicator()
                          )
                      ),
                      error: (err, _) => Text('Error: $err'),
                    )
                )
              ]
            )
          )
        ]
      ),
      bottomNavigationBar: const BottomBar()
    );
  }
}
