import 'package:firebase_auth/firebase_auth.dart';

import 'alias_engine.dart';
import 'slur_filter.dart';

class AuthService {
	final FirebaseAuth _auth = FirebaseAuth.instance;

	// Get current user
	User? get currentUser => _auth.currentUser;

	// Get current user's display name (username)
	String? get username => currentUser?.displayName;

	// Get current user's UID
	String? get uid => currentUser?.uid;

	// Ensure user is signed in (anonymous if needed)
	// Future<User?> ensureSignedIn() async {
	// 	var user = _auth.currentUser;
	// 	user ??= (await _auth.signInAnonymously()).user;
	// 	return user;
	// }

	// Sign in with username (sets displayName, signs in anonymously if needed)
	Future<String?> signInWithUsername(String username) async {
		if (SlurFilter.containsSlur(username)) {
			return "Don't be a dick.";
		}
		try {
			User? user = _auth.currentUser;
			user ??= (await _auth.signInAnonymously()).user;
			if (user == null) {
				return 'Unable to sign in.';
			}
			await user.updateDisplayName(username);
			await user.reload();
			final refreshedUser = _auth.currentUser;
			final refreshedDisplayName = refreshedUser?.displayName?.trim();
			if (refreshedDisplayName == null || refreshedDisplayName.isEmpty) {
				return 'Could not set username. Please try a different username.';
			}
			return null; // Success
		} on FirebaseAuthException catch (error) {
			return error.message ?? error.code;
		} catch (_) {
			return 'Something went wrong. Please try again.';
		}
	}

	// Generate a suggested username
	String generateSuggestedUsername() {
		var suggestion = AliasEngine.name;

		return suggestion;
	}

  Future<void> deleteCurrentUser() async {
    await _auth.currentUser!.delete();
  }
}