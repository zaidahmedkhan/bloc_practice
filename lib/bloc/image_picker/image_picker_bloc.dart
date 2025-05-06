import 'package:bloc_practice/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_practice/bloc/image_picker/image_picker_state.dart';
import 'package:bloc_practice/utils/image_picker_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerState()) {
    on<CameraCapture>(cameraCapture);
  }

  void cameraCapture(
    CameraCapture event,
    Emitter<ImagePickerState> states,
  ) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }
}
