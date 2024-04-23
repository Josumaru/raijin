import 'package:flutter/material.dart';
import 'package:raijin/core/usecases/more_usecase/more_use_case.dart';
import 'package:raijin/features/anime/presentation/widgets/more_widgets/more_widget.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key, required MoreUseCaseParams moreUseCaseParams}) : _moreUseCaseParams = moreUseCaseParams;
  final MoreUseCaseParams _moreUseCaseParams;
  @override
  Widget build(BuildContext context) {
    return MoreWidget(moreUseCaseParams: _moreUseCaseParams,);
  }
}
