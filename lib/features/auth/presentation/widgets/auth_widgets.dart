import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:raijin/core/constants/navigators.dart';
import 'package:raijin/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:raijin/features/auth/presentation/widgets/login_widget.dart';
import 'package:raijin/features/auth/presentation/widgets/register_widget.dart';

// ignore: must_be_immutable
class AuthWidget extends StatelessWidget {
  AuthWidget({
    super.key,
  });
  late final ScrollController _controller = ScrollController();
  final GlobalKey<FormState> _loginFormState = GlobalKey<FormState>();
  final GlobalKey<FormState> _registerFormState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        child: Column(
          children: [            
            LoginWidget(
              setPage: () => _setPage(
                context: context,
                page: 1,
              ),
              formState: _loginFormState,
            ),
            RegisterWidget(
              setPage: () => _setPage(context: context, page: 0),
              formState: _registerFormState,
            ),
          ],
        ),
      ),
    );
  }

  void _setPage({required BuildContext context, required int page}) async {
    await _controller.animateTo(
      MediaQuery.of(context).size.height * page,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }
}
