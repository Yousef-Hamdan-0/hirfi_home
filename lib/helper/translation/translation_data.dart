import 'package:get/get.dart';

class TranslationData {
  static const String chats = "chats";
  static const String editProfile = "editProfile";
  static const String favorites = "favorites";
  static const String supportAndHelp = "supportAndHelp";
  static String goToMap = "goToMap";
  static String goToMapQuestion = "هل تريد الإنتقال إلى الخريطة؟";
  static String changeLanguage = 'changeLanguage';
  static String today = "today";
  static String createYourAccount = 'createYourAccount';
  static String cansel = 'cansel';
  static String ok = 'ok';
  static String selectDay = 'selectDay';
  static String signInYourAccount = "signInYourAccount";
  static String send = "send";
  static String dontHaveAccount = 'dontHaveAccount';
  static String next = 'next';
  static String skip = 'skip';
  static String loginViaEmail = 'loginViaEmail';
  static String iDontHaveAnAccount = 'iDontHaveAnAccount';
  static String areYouACraftsman = 'areYouACraftsman';
  static String iAmACraftsman = 'iAmACraftsman';
  static String map = "map";
  static String notification2 = "Notification";
  static String oneNew = "1 New";
  static String markAllAsRead = "Mark all as read";
  static String newCraftsman = "New craftsman";
  static String thanksForJoining =
      "Thanks for joining us — enjoy your experience!";
  static String yesterday = "YESTERDAY";
  //Onboarding
  static String meetCraftsmanOnline = "meetCraftsmanOnline";
  static String meetCraftsmanOnlineExplanation =
      "Connect with Skilled Craftsman Online for Convenient and High-Quality Craft Services.";
  static String connectWithSpecialists = "connectWithSpecialists";
  static String connectWithSpecialistsExplanation =
      "Connect with Specialized Craftsmen Online for Convenient and Comprehensive Skilled Services.";
  static String thousandsOfOnlineCraftsmenSpecialists =
      "thousandsOfOnlineCraftsmenSpecialists";
  static String thousandsOfOnlineCraftsmenSpecialistsExplanation =
      "Explore a Vast Array of Online Skilled Craftsmen, Offering an Extensive Range of Expertise Tailored to Your Needs.";
  static String welcome = 'welcome';
  static String welcomeExplanation =
      'If you are alrady have account,enter your email below.';

  //auth
  static String createAccount = "createAccount";
  static String weAreHereToHelpYou = "weAreHereToHelpYou";
  static String yourName = "yourName";
  static String yourEmail = "yourEmail";
  static String phoneNumber = "phoneNumber";
  static String password = "password";
  static String iAgreeWith = "iAgreeWith";
  static String termsCondition = "termsCondition";
  static String or = "or";
  static String doYouHaveAnAccount = "doYouHaveAnAccount";
  static String signIn = 'signIn';
  static String forgotPassword = "forgotPassword";
  //Forgot Password
  static String enterYourPhoneNumberWeWillSendYouAVerificationCode =
      "enterYourPhoneNumberWeWillSendYouAVerificationCode";
  //End Forgot Password
  static String signUp = 'signUp';
  static String hiWelcomeBack = "hiWelcomeBack";
  static String hopeYouAreDoingFine = "hopeYouAreDoingFine";
  static String doNotHaveAnAccountYet = "doNotHaveAnAccountYet";
  static String pleaseEnterYourName = "pleaseEnterYourName";
  static String pleaseEnterYourEmail = "pleaseEnterYourEmail";
  static String phoneNumberCannotBeEmpty = "phoneNumberCannotBeEmpty";
  static String passwordIsRequired = "passwordIsRequired";
  static String thePasswordMustNotBeLessThan8Characters =
      "thePasswordMustNotBeLessThan8Characters";
  static String passwordPattern = "passwordPattern";
  static String theEmailAddressYouEnteredIsInvalid =
      "theEmailAddressYouEnteredIsInvalid";
  static String phoneNumberPattern =
      "the_phone_number_you_entered_is_invalid_please_make_sure_it_is_correct";
  static String phoneNumberLength =
      "the_phone_number_must_not_be_less_than_9_digits";
  //Otp
  static String verifyCode = "verifyCode";
  static String enterTheCode = "enterTheCode";
  static String verify = "verify";
  static String resendCodeAfter = "resendCodeAfter";
  static String congratulations = "congratulations";
  static String congratulationsExplanation = "congratulationsExplanation";
  //End Otp
  //profile
  //create Profile
  static String fillYourProfile = "fillYourProfile";
  static String dateOfBirth = "Date of Birth";
  static String gender = "gender";
  static String male = "male";
  static String female = "female";
  static String createProfile = "createProfile";
  //create Profile end
  //Create craftsman Profile
  static String ocupationType = "ocupationType";
  static String workingTime = "workingTime";
  static String days = "days";
  static String hours = "hours";
  static String aboutMe = "aboutMe";
  static String exApoutMe = "exApoutMe";
  static String addLocation = "addLocation";
  static String allDays = "allDays";
  static String sunday = "sunday";
  static String monday = "monday";
  static String tuesday = "tuesday";
  static String wednesday = "wednesday";
  static String thursday = "thursday";
  static String friday = "friday";
  static String saturday = "saturday";
  static String pleaseSelectAtLeastOneDay = "pleaseSelectAtLeastOneDay";
  static Map<String, String> get occupationTypesMap => {
        mechanic: mechanic.tr,
        plumber: plumber.tr,
        electrician: electrician.tr,
        blacksmith: blacksmith.tr,
        carpenter: carpenter.tr,
        builder: builder.tr,
        custom: custom.tr,
      };
  static Map<String, String> get genderMap => {
        male: male.tr,
        female: female.tr,
      };
  //Create craftsman Profile End
  static String profile = "prfile";
  //End Profile
  //End auth
  //Occupation
  static String custom = "custom";
  static String mechanic = "mechanic";
  static String plumber = "plumber";
  static String electrician = "electrician";
  static String blacksmith = "blacksmith";
  static String carpenter = "carpenter";
  static String builder = "builder";
  //Occupation End
  //Settings
  //LogOut
  static String logOut = "logOut";
  static String sureLogOut = "sureLogOut";
  static String YesLogout = "YesLogout";
  //End LogOut
  //End Settings
  //Static Pages
  static String termsAndConditionsText = "termsAndConditionsText";
  static String definitions = "definitions";
  static String definitionsUser = "definitionsUser";
  static String definitionsTradesperson = "definitionsTradesperson";
  static String definitionsApp = "definitionsApp";
  static String termsOfUse = "termsOfUse";
  static String termsOfUseOlder = "termsOfUseOlder";
  static String termsOfUseIllegal = "termsOfUseIllegal";
  static String termsOfUseInformation = "termsOfUseInformation";
  static String termsOfUseDelete = "termsOfUseDelete";
  static String bookingAndPayment = "bookingAndPayment";
  static String bookingAndPaymentTradesperson = "bookingAndPaymentTradesperson";
  static String bookingAndPaymentDisputes = "bookingAndPaymentDisputes";
  static String bookingAndPaymentRecommended = "bookingAndPaymentRecommended";
  static String disclaimer = "disclaimer";
  static String disclaimerMediator = "disclaimerMediator";
  static String disclaimerDamages = "disclaimerDamages";
  static String disclaimerResponsible = "disclaimerResponsible";
  static String privacyAndSecurity = "privacyAndSecurity";
  static String privacyAndSecurityPrivacyPolicy =
      "privacyAndSecurityPrivacyPolicy";
  static String privacyAndSecurityProhibited = "privacyAndSecurityProhibited";
  static String changesToTerms = "changesToTerms";
  static String changesToTermsModify = "changesToTermsModify";
  static String changesToTermsContinuing = "changesToTermsContinuing";
  static String contactAndSupport = "contactAndSupport";
  static String contactAndSupportEmail = "contactAndSupportEmail";
  static String contactAndSupportNumber = "contactAndSupportNumber";
  static String contactAndSupportChat = "contactAndSupportChat";
  static String contactAndSupportThank = "contactAndSupportThank";
  static String helpAndSupport = "helpAndSupport";
  static String helpAndSupportText = "helpAndSupportText";
  static String frequentlyAskedQuestions = "frequentlyAskedQuestions";
  static String fAQSearch = "fAQSearch";
  static String fAQSearchText = "fAQSearchText";
  static String fAQContact = "fAQContact";
  static String fAQContactText = "fAQSearchText";
  static String fAQRequest = "fAQRequest";
  static String fAQRequestText = "fAQRequestText";
  static String fAQQuality = "fAQQuality";
  static String fAQQualityText = "fAQQualityText";
  static String fAQIssue = "fAQIssue";
  static String fAQIssueText = "fAQIssueText";
  static String contactUs = "contactUs";
  static String cookiesPolicy = "cookiesPolicy";
  static String cookiesPolicyLastUpdated = "cookiesPolicyLastUpdated";
  static String cookiesPolicyText = "cookiesPolicyText";
  static String cookiesPolicyDefinition = "cookiesPolicyDefinition";
  static String howHirfiHomeUsesCookies = "howHirfiHomeUsesCookies";
  static String essentialCookies = "essentialCookies";
  static String essentialCookiesSecurely = "essentialCookiesSecurely";
  static String essentialCookiesServices = "essentialCookiesServices";
  static String functionalCookies = "functionalCookies";
  static String functionalCookiesLanguage = "functionalCookiesLanguage";
  static String functionalCookiesEfficient = "functionalCookiesEfficient";
  static String performanceAndAnalyticsCookies =
      "performanceAndAnalyticsCookies";
  static String performanceAndAnalyticsCookiesAnonymous =
      "performanceAndAnalyticsCookiesAnonymous";
  static String performanceAndAnalyticsCookiesQuality =
      "performanceAndAnalyticsCookiesQuality";
  static String marketingAndAdvertisingCookies =
      "marketingAndAdvertisingCookies";
  static String marketingAndAdvertisingCookiesTargeted =
      "marketingAndAdvertisingCookiesTargeted";
  static String marketingAndAdvertisingCookiesMeasure =
      "marketingAndAdvertisingCookiesMeasure";
  static String privacyAndSecurityCookies = "privacyAndSecurityCookies";
  static String privacyAndSecurityCookiesPolicy =
      "privacyAndSecurityCookiesPolicy";
  static String privacyAndSecurityCookiesSharing =
      "privacyAndSecurityCookiesSharing";
  static String changesToTermsCookies = "changesToTermsCookies";
  static String changesToTermsCookiesUpdate = "changesToTermsCookiesUpdate";
  static String changesToTermsCookiesContinuing =
      "changesToTermsCookiesContinuing";
  static String about = "about";
  static String aboutText = "aboutText";
  static String version = "version";
  //End Static Pages

  //Settings
  static String settings = "settings";
  static String personalDetails = "personalDetails";
  static String changePassword = "changePassword";
  static String notification = "notification";
  static String darkMode = "darkMode";
  static String languages = "languages";
  static String rateApp = "rateApp";
  static String feedback = "feedback";
  static String logout = "logout";
  static String createNewPassword = "createNewPassword";
  static String yourNewPassword = "yourNewPassword";
  static String confirmPassword = "confirmPassword";
  //End Settings

  //wait
  static String pleaseWait =
      "pleaseWaitUntilYourAccountIsApprovedByTheAdministration.";
  //End Wait

  //home
  static String reviews = "reviews";
  static String categories = "categories";
  static String seeAll = "seeAll";
  static String centersAndStores = "centersAndStores";
  //end home

  //Search
  static String searchCraftsman = "searchCraftsman";
  //End Search

  //Craftsmen Details
  static String craftsmenDetails = "craftsmenDetails";
  static const String patients = "patients";
  static const String experience = "experience";
  static const String rating = "rating";
  static const String location = "location";
  static String rateCraftsman = "rateCraftsman";
  static String message = "message";
  //end Craftsmen Details
}
