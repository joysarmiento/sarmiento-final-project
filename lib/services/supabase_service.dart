import 'package:supabase_flutter/supabase_flutter.dart';

/// Wraps the Supabase calls the app needs. Auth methods live here now;
/// once your Story and Memory tables exist, add their CRUD methods here
/// too (addStory, getStoriesForUser, addMemory, getMemoriesForStory, ...)
/// so screens never call Supabase directly.
///
/// Requires `Supabase.initialize(...)` to have already run in main.dart.
class SupabaseService {
  SupabaseService._();
  static final SupabaseService instance = SupabaseService._();

  SupabaseClient get _client => Supabase.instance.client;

  User? get currentUser => _client.auth.currentUser;
  bool get isSignedIn => currentUser != null;

  /// Creates the auth user and stashes [name] in its metadata. Once your
  /// Profile table exists, also insert a row there keyed by the new
  /// user's id (response.user!.id) so name/quote/profile_picture have a
  /// permanent home outside auth metadata.
  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _client.auth.signUp(
      email: email,
      password: password,
      data: {'name': name},
    );
    if (response.user == null) {
      throw const AuthException('Sign up failed. Please try again.');
    }
  }

  /// Note: the Log in mockup labels this field "Email / Username", but
  /// Supabase auth signs in with email by default. For the MVP, treat this
  /// as an email field. True username sign-in would need a lookup table
  /// mapping username -> email, which is extra scope beyond the proposal.
  Future<void> signIn({
    required String emailOrUsername,
    required String password,
  }) async {
    await _client.auth.signInWithPassword(
      email: emailOrUsername,
      password: password,
    );
  }

  Future<void> resetPasswordForEmail(String email) async {
    await _client.auth.resetPasswordForEmail(email);
  }

  Future<void> signOut() => _client.auth.signOut();
}
