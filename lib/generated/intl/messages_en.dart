// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "create_account":
            MessageLookupByLibrary.simpleMessage("  Create account"),
        "dont_have_an_account":
            MessageLookupByLibrary.simpleMessage("Don\'t have an account?"),
        "email": MessageLookupByLibrary.simpleMessage("Email"),
        "full_name": MessageLookupByLibrary.simpleMessage("Full name"),
        "have_an_account":
            MessageLookupByLibrary.simpleMessage("Have a registred account?"),
        "or": MessageLookupByLibrary.simpleMessage("or"),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "sign_in": MessageLookupByLibrary.simpleMessage("Sign in"),
        "sign_in_with_facebook":
            MessageLookupByLibrary.simpleMessage("Sign in with Facebook"),
        "sign_in_with_google":
            MessageLookupByLibrary.simpleMessage("Sign in with Google"),
        "sign_out": MessageLookupByLibrary.simpleMessage("Sign out"),
        "signup": MessageLookupByLibrary.simpleMessage("Sign up")
      };
}
