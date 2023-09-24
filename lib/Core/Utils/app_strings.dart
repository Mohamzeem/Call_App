class AppStrings {
  AppStrings();

//~ Globals
  static String fontFamily = 'MouseMemoirs';
  static const String defaultEmail = '@gmail.com';
  static String? userId = '';
  static String? role = '';
  static const String defaultAppPhoto =
      "https://firebasestorage.googleapis.com/v0/b/call-me-98459.appspot.com/o/icons8-account-40.png?alt=media&token=07e51d3d-b60c-4f84-ad0a-f35a747545f3";

  //~ Firebase Collections
  static const String usersCollection = 'Users';
  static const String profileCollection = 'Profile';
  static const String profileDetailsDoc = 'profileDetails';
  static const String coachingSessionsCollection = 'Coaching Sessions';
  static const String fastCoachingSessionsCollection = 'Fast Coaching Sessions';
  static const String employeesCollection = 'Employees';
  static String notificationsCollection = 'Notifications';
}
