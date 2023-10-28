import 'package:fahrplanauskunft/features/search/presentation/providers/start_point_provider.dart';
import 'package:fahrplanauskunft/core/constants/constants.dart';
import 'package:fahrplanauskunft/core/enums/api_error.dart';
import 'package:fahrplanauskunft/features/search/domain/entities/start_point.dart';
import 'package:fahrplanauskunft/features/search/domain/usecases/search_start_point_use_case.dart';
import 'package:fahrplanauskunft/features/search/presentation/widgets/custom_search_bar.dart';
import 'package:fahrplanauskunft/features/search/presentation/widgets/start_point_card.dart';
import 'package:fahrplanauskunft/locator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String previousSearchedText = '';

  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller.addListener(_controllerListener);
    super.initState();
  }

  void _controllerListener() {
    // if new text is not empty and different from previous searched text, make api call
    if (previousSearchedText != _controller.text) {
      previousSearchedText = _controller.text;
      if (_controller.text.isNotEmpty) {
        locator<SearchStartPointUseCase>().call(params: _controller.text);
      } else {
        Provider.of<StartPointProvider>(context, listen: false).results = [];
      }
    }
  }

  Container _buildBody() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(children: [
        CustomSearchBar(
          controller: _controller,
          hintText: HOME_SCREEN_SEARCH_TEXT,
        ),
        _buildSearchView(),
      ]),
    );
  }

  AppBar _buildAppBar() => AppBar(title: const Text(HOME_SCREEN_TITLE));

  Expanded _buildSearchView() {
    return Expanded(
      child: Consumer<StartPointProvider>(
        builder: (context, value, child) {
          bool isSearched = value.isSearched;
          List<StartPoint> startPoints = value.results;
          bool isErrorOccured = value.apiError != null;

          return isErrorOccured
              ? _buildErrorText(value.apiError!)
              : isSearched
                  ? _buildLoadingWidget()
                  : _buildSearchResultsView(startPoints);
        },
      ),
    );
  }

  Widget _buildSearchResultsView(List<StartPoint> startPoints) {
    bool isResultNotFound =
        startPoints.isEmpty && previousSearchedText.isNotEmpty;

    return isResultNotFound
        ? _buildResultNotFoundText()
        : _buildResultListView(startPoints);
  }

  Padding _buildResultNotFoundText() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Text(
        SEARCHED_TEXT_NOT_FOUND,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  ListView _buildResultListView(List<StartPoint> startPoints) {
    return ListView.builder(
      itemCount: startPoints.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return StartPointItem(
          startPoint: startPoints[index],
        );
      },
    );
  }

  Center _buildLoadingWidget() =>
      const Center(child: CircularProgressIndicator.adaptive());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildErrorText(ApiError apiError) {
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        apiError.name,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
