import 'dart:async';


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:formz/formz.dart';
import 'package:upstanders/login/repository/authentication_repository.dart';
import 'package:upstanders/login/validator/email_validator.dart';
import 'package:upstanders/login/validator/pin_confirm_validator.dart';
import 'package:upstanders/login/validator/pin_validator.dart';
import 'package:upstanders/register/models/create_account.dart';

part 'create_account_event.dart';
part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
   CreateAccountBloc(
    // @required AuthenticationRepository authenticationRepository,
    )  : 
  // _authenticationRepository = authenticationRepository,
        super(const CreateAccountState());
 

  AuthenticationRepository _authenticationRepository = AuthenticationRepository();

  // CreateAccountBloc(CreateAccountState initialState) : super(initialState);

  @override
  Stream<CreateAccountState> mapEventToState(
    CreateAccountEvent event,
  ) async* {
    if (event is SendOTP) {
      yield* _mapSendOTPToState(event, state);
    } else if (event is VerifyOTP) {
      yield* _mapVerifyOTPToState(event, state);
    } 
    // else if (event is SignUpPinConfirmChanged) {
    //   yield _mapPinConfirmChangedToState(event, state);
    // } else if (event is SignUpSubmitted) {
    //   yield* _mapSignUpSubmittedToState(event, state);
    // }
  }

  Stream<CreateAccountState> _mapSendOTPToState(
    SendOTP event,
    CreateAccountState state,
  ) async*{

  
     yield state.copyWith(registrationStatus: RegistrationStatus.sendingOTP);
    var res =  await _authenticationRepository.sendOTP(
         createAccount :state.createAccount
        );
        if(res['status'] == 200){
          yield state.copyWith(registrationStatus: RegistrationStatus.sentOTP);

        }else{
          yield state.copyWith(registrationStatus: RegistrationStatus.failure );
        }
      //   try {
      //   await _authenticationRepository.sendOTP(
      //    createAccount :state.createAccount
      //   );
      //   yield state.copyWith(registrationStatus: RegistrationStatus.sentOTP);
      // } on Exception catch (_) {
      //   yield state.copyWith(registrationStatus: RegistrationStatus.failure );
      // }

     
    
     
  }



Stream<CreateAccountState> _mapVerifyOTPToState(
    VerifyOTP event,
    CreateAccountState state,
  ) async*{

  
     yield state.copyWith(registrationStatus: RegistrationStatus.verifyingOTP);
      // var res =  await _authenticationRepository.verifyOTP(
      //    createAccount :state.createAccount
      //   );
      //   if(res['status'] == 200){
      //     yield state.copyWith(registrationStatus: RegistrationStatus.verifiedOTP);

      //   }else{
      //     yield state.copyWith(registrationStatus: RegistrationStatus.failure );
      //   }
      try {
        var res =  await _authenticationRepository.verifyOTP(
         createAccount :state.createAccount
        );
        yield state.copyWith(registrationStatus: RegistrationStatus.verifiedOTP);
      } on Exception catch (_) {
        yield state.copyWith(registrationStatus: RegistrationStatus.failure );
      }
    
     
  }
}

 



