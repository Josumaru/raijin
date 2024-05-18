import 'dart:io';

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

    if (status.isGranted) {
      final baseStorage = await getExternalStorageDirectory();
      final String url = params!.url;
      final String fileName = params.fileName;
      final String path =
          '${baseStorage!.path}/${params.fileName.split('Episode').first.trim()}';
      final existingTask = await FlutterDownloader.loadTasks();
      final bool isQueue = existingTask!
          .any((task) => task.filename == fileName && task.progress < 100);
      final bool isDownloaded = existingTask
          .any((task) => task.filename == fileName && task.progress == 100);

      if (isQueue) {
        ToastUseCase(fToast: sl<FToast>())
            .call(params: 'In Progress ${params.fileName} ');
      } else if (isDownloaded) {
        // FlutterDownloader.open(taskId: taskId);
        ToastUseCase(fToast: sl<FToast>())
            .call(params: '${params.fileName} Already Downloaded');
      } else {
        final folder = Directory(path);

        if (!(await folder.exists())) {
          await folder.create(recursive: true);
        }
        _download(url: url, path: path, fileName: fileName);
        ToastUseCase(fToast: sl<FToast>())
            .call(params: 'Dowloading ${params.fileName}');
      }
    }
  }

  void _download({
    required String url,
    required String path,
    required String fileName,
  }) async {
    await FlutterDownloader.enqueue(
      url: url,
      savedDir: path,
      allowCellular: true,
      openFileFromNotification: true,
      showNotification: true,
      fileName: '$fileName.mkv',
    );
  }
}

class DownloadParams {
  const DownloadParams({
    required this.fileName,
    required this.url,
  });
  final String fileName;
  final String url;
}
