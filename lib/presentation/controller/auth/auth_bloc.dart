import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthBloc() : super(InitialAuthState()){
    on<SignInWithGoogleEvent>((event, emit) {
      mapEventToState(event);
    });
    on<SignOutEvent>((event, emit) {
      mapEventToState(event);
    });
  }

  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is SignInWithGoogleEvent) {
      yield* _mapSignInWithGoogleEventToState();
    } else if (event is SignOutEvent) {
      yield* _mapSignOutEventToState();
    }
  }

  Stream<AuthState> _mapSignInWithGoogleEventToState() async* {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential authResult =
        await _auth.signInWithCredential(credential);
        final User? user = authResult.user;

        if (user != null) {
          yield AuthenticatedState(user.displayName ?? '');
        } else {
          yield UnauthenticatedState();
        }
      } else {
        yield UnauthenticatedState();
      }
    } catch (_) {
      yield UnauthenticatedState();
    }
  }

  Stream<AuthState> _mapSignOutEventToState() async* {
    await _auth.signOut();
    await _googleSignIn.signOut();
    yield UnauthenticatedState();
  }
}