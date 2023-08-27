import 'package:fahrplanauskunft/core/constants/constants.dart';
import 'package:fahrplanauskunft/features/search/domain/entities/start_point.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class DetailsScreen extends StatelessWidget {
  final StartPoint startPoint;
  const DetailsScreen({super.key, required this.startPoint});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() => AppBar(title: Text(startPoint.name));

  Center _buildIconView() {
    bool isStop = startPoint.type == 'stop';

    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: COLOR_PURPLE,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        width: 72,
        height: 72,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        child: Icon(
          isStop ? Ionicons.bus_sharp : Ionicons.home_sharp,
          color: Colors.white,
        ),
      ),
    );
  }

  Text _buildSubtitleText(String text) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
    );
  }

  Text _buildTitleText(String text) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
    );
  }

  Column _buildSuburbText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [_buildTitleText(startPoint.name)],
    );
  }

  Column _buildStopTexts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildTitleText(startPoint.disassembledName),
        const SizedBox(height: 4),
        _buildSubtitleText(startPoint.name),
      ],
    );
  }

  Padding _buildTextsView(bool isStop) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: isStop ? _buildStopTexts() : _buildSuburbText(),
    );
  }

  Container _buildBody() {
    bool isStop = startPoint.type == 'stop';

    return Container(
      margin: const EdgeInsets.all(16),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildIconView(),
              _buildTextsView(isStop),
              const SizedBox(height: 32),
              _buildCoordinatesView(),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildCoordinatesView() {
    double coordX = startPoint.coord[0];
    double coordY = startPoint.coord[1];
    return Column(
      children: [
        _buildTitleText(COORDINATES),
        _buildSubtitleText('X: $coordX'),
        const SizedBox(height: 4),
        _buildSubtitleText('Y: $coordY'),
      ],
    );
  }
}
