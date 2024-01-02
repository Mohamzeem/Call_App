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
  static const String chatCollection = 'Chat';
  static const String usersCollection = 'Users';
  static const String profileDocument = 'Profile';
  static const String profileDetailsCollection = 'profileDetails';
  static const String coachingSessionsCollection = 'Coaching Sessions';
  static const String fastCoachingSessionsCollection = 'Fast Coaching Sessions';
  static const String employeesCollection = 'Employees';
  static String notificationsCollection = 'Notifications';

  //~ Agora
  static String agoraAppId = 'd0e95cf95b5347e39735b2da6d1884a3';

  //~ Zego Cloud
  static const int zegoAppID = 873584565;
  static const String zegoAppSign =
      '25389dba7fe01f88621a96d6b7c1075c4841dd562e7f7d499d76b924731287bf';
}
