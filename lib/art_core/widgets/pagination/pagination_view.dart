import 'package:flutter/material.dart';

class PaginationView<T> extends StatelessWidget {
  final bool isLoading;
  final bool hasError;
  final bool endScrol;
  final String? errorMessage;
  final List<T> items;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final VoidCallback onLoadMore;
  final ScrollController scrollController;

  const PaginationView({
    Key? key,
    required this.isLoading,
    required this.hasError,
    required this.endScrol,
    this.errorMessage,
    required this.items,
    required this.itemBuilder,
    required this.onLoadMore,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          controller: scrollController,
          itemCount: items.length + (hasMoreItems ? 1 : 0),
          itemBuilder: (context, index) {
            if (index == items.length && hasMoreItems) {
              return _buildLoadingIndicator();
            }
            return itemBuilder(context, index);
          },
        ),
        if (isLoading) _buildLoadingIndicator(),
        if (hasError) _buildErrorMessage(errorMessage!),
      ],
    );
  }

  bool get hasMoreItems => !isLoading && !hasError && items.isNotEmpty &&endScrol ;

  Widget _buildLoadingIndicator() =>
      const Center(child: CircularProgressIndicator());

  Widget _buildErrorMessage(String errorMessage) => Center(
        child: Text(
          errorMessage,
          style: const TextStyle(color: Colors.red),
        ),
      );

  // ScrollController get _scrollController =>
  //     ScrollController()..addListener(_onScroll);
  //
  // void _onScroll() {
  //   // print("_onScroll");
  //   if (!_scrollController.hasClients || isLoading || hasError) {
  //     return;
  //   }
  //
  //   if (_isBottom) {
  //     print("_onScroll  _isBottom ");
  //
  //     onLoadMore();
  //   }
  // }
  //
  // bool get _isBottom {
  //   return _scrollController.position.pixels ==
  //       _scrollController.position.maxScrollExtent;
  // }
}
