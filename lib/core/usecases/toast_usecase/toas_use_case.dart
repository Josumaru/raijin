import 'package:fluttertoast/fluttertoast.dart';
import 'package:raijin/core/commons/widgets/toast_widget.dart';
import 'package:raijin/core/usecases/use_case.dart';

class ToastUseCase extends UseCase {
  ToastUseCase({required this.fToast});
  final FToast fToast;

  @override
  Future call({required params}) async {
    fToast.removeCustomToast();
    fToast.showToast(
      child: ToastWidget(
        message: params,
      ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 10),
    );
  }
}
