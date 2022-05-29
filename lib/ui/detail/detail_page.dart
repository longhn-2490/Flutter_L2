import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lession_2/data/model/movie_data.dart';
import 'package:flutter_lession_2/ui/detail/detail_view_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

import '../widget/util.dart';

class DetailPage extends StatefulWidget {
  int id;

  DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var viewModel = context.read<DetailViewModel>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: size.height * 0.085,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Movie Detail",
            style: Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<MovieData>(
            future: viewModel.getMovieDetail(widget.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return showLoader();
              }
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return _buildErrorRetry();
                }
                var movie = snapshot.data;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildHeaderImage(size, movie),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      _buildTitleWidget(size, movie),
                      SizedBox(
                        height: size.height * 0.011,
                      ),
                      _buildReviewTrailerWidget(size, movie),
                      _buildGenreReleaseWidget(size, movie),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.05),
                        child: Text(
                          movie?.overview ?? "",
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox();
            })
        // body: CustomPaint(
        //   size: Size(double.infinity, double.infinity),
        //   painter: ShapePainter(),
        //   child: Container(),
        // ),
        );
  }

  Widget _buildGenreReleaseWidget(Size size, MovieData? movie) => Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Text(
                  "Genre",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  movie?.getGenre() ?? "",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
          const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    "Release",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(
                        fontSize: 19,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    movie?.releaseDate ?? "",
                    style:
                    Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      const Divider(
        height: 3,
        color: Colors.black54,
      ),
    ],
  );

  Widget _buildReviewTrailerWidget(Size size, MovieData? movie) => Column(
        children: [
          const Divider(
            height: 3,
            color: Colors.black54,
          ),
          SizedBox(
            height: size.height * 0.09,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/reviews.svg',
                      width: 33,
                    ),
                    Text(
                      "Reviews",
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
                const VerticalDivider(
                  width: 3,
                  color: Colors.black54,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/trailer.svg',
                      width: 33,
                    ),
                    Text(
                      "Trailers",
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            height: 3,
            color: Colors.black54,
          ),
        ],
      );

  Widget _buildTitleWidget(Size size, MovieData? movie) => Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                movie?.title ?? "",
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            CircularPercentIndicator(
              radius: 18.0,
              lineWidth: 4.5,
              percent: (movie?.voteAverage ?? 0.0) / 10,
              center: Text(movie?.voteAverage.toString() ?? "0.0"),
              progressColor: Colors.black,
            )
          ],
        ),
      );

  Widget _buildHeaderImage(Size size, MovieData? movie) => SizedBox(
        height: size.height / 3.5,
        width: size.width,
        child: Stack(
          children: [
            ClipPath(
              clipper: QuadrangleClipper(),
              child: CachedNetworkImage(
                imageUrl: movie?.getBackImagePath() ?? "",
                fit: BoxFit.cover,
                width: size.width,
              ),
            ),
            Positioned(
              bottom: 0,
              left: size.width * 0.05,
              child: CachedNetworkImage(
                imageUrl: movie?.getImagePath() ?? "",
                width: size.width / 4,
                height: size.height / 5,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      );

  Widget _buildErrorRetry() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          showError(),
          GestureDetector(child: showRefresh(), onTap: () => setState(() {}))
        ],
      );
}

class QuadrangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height * 3 / 4);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(QuadrangleClipper oldClipper) => false;
}
