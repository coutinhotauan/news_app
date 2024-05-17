import 'package:ds/ds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/presentation/controllers/home/home_cubit.dart';
import 'package:news_app/features/home/presentation/widgets/carousel/home_carousel_widget.dart';
import 'package:news_app/features/home/presentation/widgets/feedback_states/home_failure_state_widget.dart';
import 'package:news_app/features/home/presentation/widgets/feedback_states/home_loading_state_widget.dart';

class HomePage extends StatefulWidget {
  final HomeCubit homeCubit;

  const HomePage({
    super.key,
    required this.homeCubit,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.homeCubit.initHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: DSNavigationBar(
        onDestinationSelected: (int index) {},
        selectedIndex: 0,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: widget.homeCubit,
        builder: (context, state) {
          switch (state) {
            case HomeInitialState() || HomeLoadingState():
              return const HomeLoadingStateWidget();
            case HomeFailureState():
              return HomeFailureStateWidget();
            default:
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    HomeCarousel(
                      headlines: (state as HomeSuccessState).headlines,
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
