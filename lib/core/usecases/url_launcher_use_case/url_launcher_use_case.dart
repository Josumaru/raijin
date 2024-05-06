import 'package:raijin/core/usecases/use_case.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUseCase extends UseCase {
  @override
  Future call({required params}) async {
    final uri = Uri.parse(params);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $uri');
    }
  }
}
