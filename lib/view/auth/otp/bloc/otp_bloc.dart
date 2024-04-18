import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'otp_event.dart';
part 'otp_state.dart';

@singleton
class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpInitial()) {
    on<OtpEvent>((event, emit) {});
  }
}
