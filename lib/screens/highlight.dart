import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/blocs/blocs.dart';
import 'package:shop/widgets/widgets.dart';

class HighlightScreen extends StatelessWidget {
  static const routeName = 'highlight_list';

  @override
  Widget build(BuildContext context) {
    final highlightBlock = BlocProvider.of<HighlightBloc>(context);
    if (highlightBlock.state is StartHighlightList) {
      highlightBlock.add(FetchList());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Shop'),
      ),
      body: BlocBuilder<HighlightBloc, HighlightState>(
        builder: (_, state) {
          if (state is LoadingHighlightList) {
            return Center(
              child: const CircularProgressIndicator(),
            );
          }

          if (state is LoadedHighlightList) {
            return HighlightList(list: state.list);
          }

          return Center(
            child: const Text('Список пуст'),
          );
        },
      ),
    );
  }
}
