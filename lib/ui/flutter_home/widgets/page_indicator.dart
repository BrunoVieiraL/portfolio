import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;

  void _handlePreviousPage() {
    if (currentPageIndex == 0) {
      onUpdateCurrentPageIndex(tabController.length - 1);
    } else {
      onUpdateCurrentPageIndex(currentPageIndex - 1);
    }
  }

  void _handleNextPage() {
    if (currentPageIndex == tabController.length - 1) {
      onUpdateCurrentPageIndex(0);
    } else {
      onUpdateCurrentPageIndex(currentPageIndex + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: _handlePreviousPage,
            icon: const Icon(Icons.arrow_left_rounded, size: 32.0),
          ),
          TabPageSelector(
            controller: tabController,
            color: colorScheme.surface,
            selectedColor: Colors.red,
          ),
          IconButton(
            splashRadius: 16.0,
            padding: EdgeInsets.zero,
            onPressed: _handleNextPage,
            icon: const Icon(Icons.arrow_right_rounded, size: 32.0),
          ),
        ],
      ),
    );
  }
}
