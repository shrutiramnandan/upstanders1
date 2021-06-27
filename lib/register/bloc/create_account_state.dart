part of 'create_account_bloc.dart';

enum RegistrationStatus { unknown, sendingOTP,verifyingOTP,sentOTP, verifiedOTP,gotCurrentLocation, verifiedIdentity, failure, done }

class CreateAccountState extends Equatable {
  const CreateAccountState({
    this.registrationStatus = RegistrationStatus.unknown,
    this.createAccount
  });

   

 
  final RegistrationStatus registrationStatus;
  final CreateAccount createAccount;


  CreateAccountState copyWith({
    RegistrationStatus registrationStatus,
  }) {
    return CreateAccountState(
      registrationStatus:registrationStatus ?? this.registrationStatus,
      createAccount: createAccount??this.createAccount
    
    );
  }

  @override
  List<Object> get props => [registrationStatus,createAccount];
}
