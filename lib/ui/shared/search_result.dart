import 'package:flutter/material.dart';

import '../../../../application/app/constants/custom_colors.dart';
import '../../application/models/movie/movie.dart';
import 'movie_tile.dart';

class SearchResult extends StatelessWidget {
  final List<MovieData> listMovies;
  final Function(int?) onTap;
  const SearchResult({
    super.key,
    required this.listMovies,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            listMovies.isEmpty
                ? Center(
                    child: Text(
                      'No Result Found',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: CustomColors.white,
                          ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Search Result',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: CustomColors.white,
                          ),
                    ),
                  ),
            ListView.builder(
              controller: ScrollController(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final movie = listMovies[index];
                return InkWell(
                  onTap: () => onTap(movie.id),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: MovieTile(
                      movieData: movie,
                    ),
                  ),
                );
              },
              itemCount: listMovies.length,
            ),
          ],
        ),
      ),
    );
  }
}
