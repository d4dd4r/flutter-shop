import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/cubits/cubit.dart';
import 'package:shop/helpers/helpers.dart';
import 'package:shop/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  final int pageCount = BottomNavigatorHelper.navigationWidgetOptions.length;
  final List<int> _renderedScreens = [];
  final Map<int, Widget> _rendered = {};

  @override
  Widget build(BuildContext context) {
    final bottomNavigatorCubit = context.bloc<BottomNavigatorCubit>();

    return BlocBuilder<BottomNavigatorCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: state,
              children: List.generate(
                  pageCount, (int index) => pageGenerator(state, index)),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: state,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: BottomNavigatorHelper.navigatorItems,
            onTap: (index) {
              bottomNavigatorCubit.setValue(index);
            },
          ),
        );
      },
    );
  }

  Widget pageGenerator(int currentIndex, int pageIndex) {
    final isPageNotRendered = !_renderedScreens.contains(pageIndex);
    final isEmptyPage = currentIndex != pageIndex && isPageNotRendered;
    final page =
        BottomNavigatorHelper.navigationWidgetOptions.elementAt(pageIndex);

    if (currentIndex == pageIndex && isPageNotRendered) {
      _renderedScreens.add(pageIndex);
      _rendered[pageIndex] = NavigationPage(child: page);
    }

    return isEmptyPage ? Container() : _rendered[pageIndex];
  }
}
