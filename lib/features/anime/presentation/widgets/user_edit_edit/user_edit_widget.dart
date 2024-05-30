import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:raijin/core/constants/border_radius.dart';
import 'package:raijin/core/constants/colors.dart';
import 'package:raijin/core/constants/font.dart';
import 'package:raijin/core/services/injection_container.dart';
import 'package:raijin/core/usecases/toast_usecase/toas_use_case.dart';
import 'package:raijin/features/anime/data/models/user_preferences_model/user_preferences_model.dart';
import 'package:raijin/features/anime/presentation/blocs/anime_preferences/anime_preferences_bloc.dart';
import 'package:image_picker/image_picker.dart';

class UserEditWidget extends StatefulWidget {
  const UserEditWidget({super.key});

  @override
  State<UserEditWidget> createState() => _UserEditWidgetState();
}

class _UserEditWidgetState extends State<UserEditWidget> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formState;
  late User _user;
  late String? _downloadUrl;
  late bool _loading;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formState = GlobalKey<FormState>();
    _downloadUrl = null;
    _loading = false;
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _upload() async {
    _alert(message: 'Select image');
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (image == null) return;
    _loading = true;
    setState(() {});
    final file = await image.readAsBytes();

    final storageRef = FirebaseStorage.instance.ref();
    final imageRef = storageRef.child('profile/${_user.uid}.jpg');
    final uploadTask = await imageRef.putData(file);
    final TaskSnapshot snapshot = uploadTask;
    _downloadUrl = await snapshot.ref.getDownloadURL();
    _loading = false;
    setState(() {});
    _alert(message: 'Images Uploaded');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<AnimePreferencesBloc, AnimePreferencesState>(
            builder: (context, state) {
              _user = sl<FirebaseAuth>().currentUser!;
              _nameController.text = _user.displayName!;
              _emailController.text = _user.email!;
              _downloadUrl ??= state.preferences.photoPath!;
              return Padding(
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Form(
                    key: _formState,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _downloadUrl != null && _downloadUrl != ''
                            ? CachedNetworkImage(
                                errorWidget: (context, url, error) {
                                  return Text(error.toString());
                                },
                                progressIndicatorBuilder:
                                    (context, url, progress) {
                                  return CircleAvatar(
                                    backgroundColor:
                                        onBackgroundColor(context: context),
                                    // backgroundImage: imageProvider,
                                    radius: 80,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: CircleAvatar(
                                            radius: 20,
                                            backgroundColor: backgroundColor(
                                              context: context,
                                            ),
                                            child: InkWell(
                                              onTap: _upload,
                                              borderRadius: kMainBorderRadius,
                                              child: Icon(
                                                Iconsax.gallery_edit,
                                                color: onBackgroundColor(
                                                  context: context,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                imageUrl: _downloadUrl!,
                                imageBuilder: (context, imageProvider) {
                                  return CircleAvatar(
                                    backgroundColor:
                                        onBackgroundColor(context: context),
                                    backgroundImage: imageProvider,
                                    radius: 80,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: CircleAvatar(
                                            // backgroundImage: Image.file(File.f),
                                            radius: 20,
                                            backgroundColor: backgroundColor(
                                              context: context,
                                            ),
                                            child: InkWell(
                                              onTap: _upload,
                                              borderRadius: kMainBorderRadius,
                                              child: Icon(
                                                Iconsax.gallery_edit,
                                                color: onBackgroundColor(
                                                  context: context,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              )
                            : CircleAvatar(
                                radius: 80,
                                backgroundColor:
                                    onBackgroundColor(context: context),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Text(
                                        _user.displayName![0].toUpperCase(),
                                        style: bodySmall(context: context)
                                            .copyWith(
                                          color:
                                              backgroundColor(context: context),
                                          fontSize: 40,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: CircleAvatar(
                                        // backgroundImage: AssetImage(_file),
                                        radius: 20,
                                        backgroundColor: backgroundColor(
                                          context: context,
                                        ),
                                        child: InkWell(
                                          onTap: _upload,
                                          borderRadius: kMainBorderRadius,
                                          child: Icon(
                                            Iconsax.gallery_edit,
                                            color: onBackgroundColor(
                                              context: context,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _nameController,
                          validator: (value) =>
                              value!.isEmpty ? 'Username cannot empty' : null,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Iconsax.user,
                            ),
                            label: Text("Name"),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _emailController,
                          readOnly: true,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Iconsax.direct_normal,
                            ),
                            label: Text("E-Mail"),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formState.currentState!.validate()) {
                                final name = _nameController.text;
                                UserPreferencesModel preferences =
                                    UserPreferencesModel(
                                  photoPath: _downloadUrl!,
                                  username: name,
                                  resolution: state.preferences.resolution,
                                  theme: state.preferences.theme,
                                  playback: state.preferences.playback,
                                  server: state.preferences.server,
                                );

                                if (_downloadUrl != null && !_loading) {
                                  context.read<AnimePreferencesBloc>().add(
                                        AnimePreferencesEvent.setPreferences(
                                          preferences: preferences,
                                        ),
                                      );
                                  Navigator.of(context).pop();
                                } else {
                                  _alert(message: 'Upload failed');
                                }
                              }
                            },
                            child: _loading
                                ? Center(
                                    child:
                                        LoadingAnimationWidget.discreteCircle(
                                      color:
                                          onBackgroundColor(context: context),
                                      size: 24,
                                    ),
                                  )
                                : const Text('Save'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

void _alert({required String message}) {
  sl<ToastUseCase>()(params: message);
}
