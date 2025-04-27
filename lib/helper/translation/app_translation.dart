import 'package:get/get_navigation/get_navigation.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          //Onboarding
          TranslationData.meetCraftsmanOnline: "قابل الحرفي عبر الإنترنت",
          TranslationData.meetCraftsmanOnlineExplanation:
              "تواصل مع حرفيين مهرة عبر الإنترنت للحصول على خدمات حرفية مريحة وعالية الجودة.",
          TranslationData.connectWithSpecialists: "تواصل مع المتخصصين",
          TranslationData.connectWithSpecialistsExplanation:
              "تواصل مع حرفيين متخصصين عبر الإنترنت للحصول على خدمات مهارية مريحة وشاملة.",
          TranslationData.thousandsOfOnlineCraftsmenSpecialists:
              "آلاف الحرفيين المتخصصين عبر الإنترنت",
          TranslationData.thousandsOfOnlineCraftsmenSpecialistsExplanation:
              "استكشف مجموعة واسعة من الحرفيين المهرة عبر الإنترنت، يقدمون خبرات متنوعة ومصممة لتناسب احتياجاتك.",
          TranslationData.next: "التالي",
          TranslationData.skip: "تخطي",
          TranslationData.welcome: "مرحباً 👋",
          TranslationData.welcomeExplanation:
              "إذا كان لديك حساب بالفعل، أدخل بريدك الإلكتروني أدناه.",
          TranslationData.loginViaEmail: "تسجيل الدخول عبر البريد الإلكتروني",
          TranslationData.iDontHaveAnAccount: "ليس لدي حساب!",
          TranslationData.areYouACraftsman: "هل أنت حرفي؟",
          TranslationData.iAmACraftsman: "أنا حرفي",
          //End Onboarding
          TranslationData.changeLanguage: "اللغات",
          TranslationData.send: "إرسال",
          //Auth
          TranslationData.createAccount: "إنشاء حساب",
          TranslationData.weAreHereToHelpYou: "نحن هنا لمساعدتك!",
          TranslationData.yourName: "اسمك",
          TranslationData.yourEmail: "بريدك الإلكتروني",
          TranslationData.phoneNumber: "رقم الهاتف",
          TranslationData.password: "كلمة المرور",
          TranslationData.iAgreeWith: "أوافق على",
          TranslationData.termsCondition: "الشروط والأحكام",
          TranslationData.or: "أو",
          TranslationData.doYouHaveAnAccount: "هل لديك حساب بالفعل؟",
          TranslationData.signIn: "تسجيل الدخول",
          TranslationData.forgotPassword: "هل نسيت كلمة المرور؟",
          TranslationData.signUp: "إنشاء حساب",
          TranslationData.hiWelcomeBack: "مرحبًا، أهلاً بعودتك!",
          TranslationData.hopeYouAreDoingFine: "أتمنى أن تكون بخير.",
          TranslationData.doNotHaveAnAccountYet: "ليس لديك حساب بعد؟",
          TranslationData.pleaseEnterYourName: "يرجى إدخال الإسم.",
          TranslationData.pleaseEnterYourEmail: "يرجى إدخال البريد الإلكتروني.",
          TranslationData.phoneNumberCannotBeEmpty:
              "رقم الهاتف لا يمكن أن يكون فارغًا.",
          TranslationData.passwordIsRequired: "كلمة المرور مطلوبة.",
          TranslationData.thePasswordMustNotBeLessThan8Characters:
              "يجب ألا تقل كلمة المرور عن 8 أحرف.",
          TranslationData.passwordPattern:
              "أدخل كلمة مرور فيها 8 خانات على الأقل، وحرف كبير، وحرف صغير، ورقم، ورمز خاص.",
          //End Auth

          //Static Pages
          TranslationData.termsWelcomeToHirfiHome:
              "مرحبًا بك في Hirfi Home! قبل استخدام تطبيقنا، يرجى قراءة هذه الشروط والأحكام بعناية. باستخدامك للتطبيق، فإنك توافق على الالتزام بهذه الشروط.",
          TranslationData.definitions: "1. التعاريف",
          TranslationData.definitionsUser: "-)المستخدم: أي شخص يستخدم التطبيق للبحث عن خدمات المهنيين أو طلبها.",
          TranslationData.definitionsTradesperson: "-)المهني: أي مقدم خدمة مسجّل يقدم خدمات الصيانة والإصلاح من خلال التطبيق.",
          TranslationData.definitionsApp: "-)التطبيق: منصة Hirfi Home التي تربط المستخدمين بالمهنيين وتسمح لهم بطلب الخدمات.",
          TranslationData.termsOfUse: "2. شروط الاستخدام",
          TranslationData.termsOfUseOlder: "-)يجب أن يكون عمر المستخدمين 18 عامًا أو أكثر أو الحصول على موافقة ولي الأمر لاستخدام التطبيق.",
          TranslationData.termsOfUseIllegal: "-)لا يجوز استخدام التطبيق لأي أنشطة غير قانونية أو احتيالية.",
          TranslationData.termsOfUseInformation: "-)يتحمل المستخدمون مسؤولية تقديم معلومات دقيقة عند التسجيل أو التواصل مع المهنيين.",
          TranslationData.termsOfUseDelete: "-)يحتفظ التطبيق بالحق في تعليق أو حذف أي حساب ينتهك هذه الشروط.",
          TranslationData.bookingAndPayment: "3. الحجز والدفع",
          TranslationData.bookingAndPaymentTradesperson: "-)يتيح التطبيق للمستخدمين التواصل مع المهنيين، ولكن يتم الدفع مباشرةً بين المستخدم والمهني حسب الاتفاق.",
          TranslationData.bookingAndPaymentDisputes: "-)التطبيق غير مسؤول عن أي نزاعات مالية بين المستخدمين والمهنيين.",
          TranslationData.bookingAndPaymentRecommended: "-)يُنصح بمناقشة أسعار الخدمة مع المهني قبل تأكيد الطلب.",
          TranslationData.disclaimer: "4. إخلاء المسؤولية",
          TranslationData.disclaimerMediator: "-)يعمل التطبيق كوسيط بين المستخدمين والمهنيين ولا يضمن جودة الخدمات المقدمة.",
          TranslationData.disclaimerDamages: "-)التطبيق غير مسؤول عن أي أضرار أو خسائر أو مشكلات ناتجة عن خدمات المهنيين.",
          TranslationData.disclaimerResponsible: "-)يتحمل المستخدمون مسؤولية اتخاذ قرارات مدروسة عند اختيار المهني بناءً على التقييمات والمعلومات المتاحة.",
          //End Static Pages
        },
        "en": {
          //Onboarding
          TranslationData.meetCraftsmanOnline: "Meet Craftsman Online",
          TranslationData.meetCraftsmanOnlineExplanation:
              "Connect with Skilled Craftsman Online for Convenient and High-Quality Craft Services.",
          TranslationData.connectWithSpecialists: "Connect with Specialists",
          TranslationData.connectWithSpecialistsExplanation:
              "Connect with Specialized Craftsmen Online for Convenient and Comprehensive Skilled Services.",
          TranslationData.thousandsOfOnlineCraftsmenSpecialists:
              "Thousands of Online Craftsmen Specialists",
          TranslationData.thousandsOfOnlineCraftsmenSpecialistsExplanation:
              "Explore a Vast Array of Online Skilled Craftsmen, Offering an Extensive Range of Expertise Tailored to Your Needs.",
          TranslationData.next: "Next",
          TranslationData.skip: "Skip",
          TranslationData.welcome: "Welcome 👋",
          TranslationData.welcomeExplanation:
              "If you are already have account, enter your email below.",
          TranslationData.loginViaEmail: "Log in via email",
          TranslationData.iDontHaveAnAccount: "I don't have an account!",
          TranslationData.areYouACraftsman: "Are you a craftsman ?",
          TranslationData.iAmACraftsman: "I am a craftsman",
          //End Onboarding
          TranslationData.changeLanguage: "Languages",
          TranslationData.send: "send",
          //Auth
          TranslationData.createAccount: "Create Account",
          TranslationData.weAreHereToHelpYou: "We are here to help you!",
          TranslationData.yourName: "Your Name",
          TranslationData.yourEmail: "Your Email",
          TranslationData.phoneNumber: "Phone Number",
          TranslationData.password: "Password",
          TranslationData.iAgreeWith: "I agree with",
          TranslationData.termsCondition: "Terms & Condition",
          TranslationData.or: "or",
          TranslationData.doYouHaveAnAccount: "Do you have an account ?",
          TranslationData.signIn: "Sign In",
          TranslationData.forgotPassword: "Forgot password?",
          TranslationData.signUp: "Sign Up",
          TranslationData.hiWelcomeBack: "Hi, Welcome Back!",
          TranslationData.hopeYouAreDoingFine: "Hope you’re doing fine.",
          TranslationData.doNotHaveAnAccountYet: "Don’t have an account yet?",
          TranslationData.pleaseEnterYourName: "Please enter your Name.",
          TranslationData.pleaseEnterYourEmail: "Please enter your email.",
          TranslationData.phoneNumberCannotBeEmpty:
              "Phone number cannot be empty.",
          TranslationData.passwordIsRequired: "Please enter your email.",
          TranslationData.thePasswordMustNotBeLessThan8Characters:
              "The password must not be less than 8 characters.",
          TranslationData.passwordPattern:
              "Enter a password with at least 8 characters, a capital letter, a small letter, a number, and a special sign.",
          //End Auth

          //Static Pages
          TranslationData.termsWelcomeToHirfiHome:
              "Welcome to Hirfi home! Before using our app, please read these terms and conditions carefully. By using the app, you agree to comply with these terms.",
          TranslationData.definitions: "1. Definitions",
          TranslationData.definitionsUser: "-)User: Any person using the app to search for or request tradesperson services.",
          TranslationData.definitionsTradesperson: "-)Tradesperson: Any registered service provider offering maintenance and repair services through the app.",
          TranslationData.definitionsApp: "-)App: The Hirfi home platform that connects users with tradespeople and allows them to request services.",
          TranslationData.termsOfUse: "2. Terms of Use",
          TranslationData.termsOfUseOlder: "-)Users must be *18 years or older* or have parental consent to use the app.",
          TranslationData.termsOfUseIllegal: "-)The app must not be used for illegal or fraudulent activities.",
          TranslationData.termsOfUseInformation: "-)Users are responsible for providing accurate information when registering or communicating with tradespeople.",
          TranslationData.termsOfUseDelete: "-)The app reserves the right to suspend or delete any account that violates these terms.",
          TranslationData.bookingAndPayment: "3. Booking and Payment",
          TranslationData.bookingAndPaymentTradesperson: "-)The app allows users to connect with tradespeople, but payments are made directly between the user and the tradesperson as agreed.",
          TranslationData.bookingAndPaymentDisputes: "-)The app is not responsible for any financial disputes between users and tradespeople.",
          TranslationData.bookingAndPaymentRecommended: "-)It is recommended to discuss service pricing with the tradesperson before confirming a request.",
          TranslationData.disclaimer: "4. Disclaimer",
          TranslationData.disclaimerMediator: "-)The app acts as a mediator between users and tradespeople and does not guarantee service quality.",
          TranslationData.disclaimerDamages: "-)The app is not responsible for any damages, losses, or issues arising from tradesperson services.",
          TranslationData.disclaimerResponsible: "-)Users are responsible for making informed decisions when selecting a tradesperson based on available ratings and information.",
          //End Static Pages
        }
      };
}
