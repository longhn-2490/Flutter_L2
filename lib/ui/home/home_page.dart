import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lession_2/ui/home/home_view_model.dart';
import 'package:flutter_lession_2/ui/widget/util.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../../data/model/loadmore_data.dart';
import '../../data/model/movie_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<HomeViewModel>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: size.height * 0.09,
          title: Text(
            'Popular',
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        body: FutureBuilder<List<MovieData>>(
          future: viewModel.getMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return showLoader();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return _buildErrorRetry();
              }
              List<MovieData> movies = snapshot.data ?? [];
              return ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () => _onMoviePressed(
                        context, movies.elementAt(index).id ?? -1),
                    child: _buildMovieItem(context, movies.elementAt(index))),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
              );
            }
            return const SizedBox();
          },
        ));
  }

  Widget _buildMovieItem(BuildContext context, MovieData movie) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.width * 0.03),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageUrl: movie.getImagePath(),
            width: size.width / 4,
            height: size.height / 5,
            fit: BoxFit.cover,
          ),
           SizedBox(
            width: size.width * 0.04,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  movie.title ?? "",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  movie.overview ?? "",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  softWrap: true,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildErrorRetry() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          showError(),
          GestureDetector(child: showRefresh(), onTap: () => setState(() {}))
        ],
      );

  void _onMoviePressed(BuildContext context, int id) {
    Navigator.pushNamed(context, '/Detail', arguments: id);
  }
}
