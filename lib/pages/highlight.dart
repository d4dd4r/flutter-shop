import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/blocs/blocs.dart';
import 'package:shop/widgets/widgets.dart';

class HighlightPage extends StatelessWidget {
  static const _loadingHighlightList = const Center(
    child: const CircularProgressIndicator(),
  );

  static const _emptyHighlightList = const Center(
    child: const Text('Список пуст'),
  );

  static _errorHighlightList(String error) => Center(
        child: Text(error),
      );

  final String appTitle;

  const HighlightPage({@required this.appTitle}) : assert(appTitle != null);

  @override
  Widget build(BuildContext context) {
    print('HighlightPage [build]');
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: BlocBuilder<HighlightBloc, HighlightState>(
        builder: (_, state) {
          if (state is EmptyHighlightList) return _emptyHighlightList;

          if (state is LoadingHighlightList) return _loadingHighlightList;

          if (state is LoadedHighlightList)
            return HighlightList(list: state.list);

          if (state is ErrorHighlightList)
            return _errorHighlightList(state.error);

          return _loadingHighlightList;
        },
      ),
    );
  }
}
