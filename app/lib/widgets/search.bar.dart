import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:model.ninateka.pl/model.ninateka.pl.dart'
    show SearchService, SearchQueryParameters, SearchRecord;

import './search.record.card.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final searchService = SearchService();
  List<SearchRecord> results = [];

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) async {
        if (query == '') {
          results = [];
          return;
        }
        final response = await searchService
            .getSearchResults(SearchQueryParameters(searchPhrase: query));
        results = response.records!;
      },
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        // FloatingSearchBarAction(
        //   showIfOpened: false,
        //   child: CircularButton(
        //     icon: const Icon(Icons.place),
        //     onPressed: () {},
        //   ),
        // ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: results.map((searchRecord) {
                return SearchRecordCard(searchRecord);
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
