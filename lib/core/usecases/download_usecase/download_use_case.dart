import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:raijin/core/services/injection_container.dart';
import 'package:raijin/core/usecases/toast_usecase/toas_use_case.dart';
import 'package:raijin/core/usecases/use_case.dart';
import 'package:path_provider/path_provider.dart';

class DownloadUseCase extends UseCase<void, DownloadParams> {
  @override
  Future call({required params}) async {
    final status = await Permission.storage.request();

    ToastUseCase(fToast: sl<FToast>()).call(params: status.toString());
    if (status.isGranted) {
      final baseStorage = await getExternalStorageDirectory();
      await FlutterDownloader.enqueue(
        url: params!.url,
        savedDir: '${baseStorage!.path}/${params.path}',
        allowCellular: true,
        openFileFromNotification: true,
        showNotification: true,
        fileName: params.fileName,
      );
    }
  }
}

class DownloadParams {
  const DownloadParams({
    required this.fileName,
    required this.url,
    required this.path,
  });
  final String fileName;
  final String url;
  final String path;
}
