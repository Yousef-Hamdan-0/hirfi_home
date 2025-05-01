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
          TranslationData.theEmailAddressYouEnteredIsInvalid:
              "البريد الإلكتروني الذي أدخلته غير صحيح.",
          TranslationData.phoneNumberPattern:
              "رقم الهاتف الذي أدخلته غير صالح. يرجى التأكد من إدخاله بشكل صحيح.",
          TranslationData.phoneNumberLength:
              "يجب ألا يقل رقم الهاتف عن 9 أرقام.",
          //Otp
          TranslationData.verifyCode: "تأكيد الرمز",
          TranslationData.enterTheCode:
              "أدخل الرمز الذي أرسلناه للتو إلى رقم هاتفك المسجل",
          TranslationData.verify: "تحقق",
          TranslationData.resendCodeAfter: "إعادة إرسال الرمز بعد",
          TranslationData.congratulations: "مبروك!",
          TranslationData.congratulationsExplanation:
              "تم تجهيز حسابك بنجاح. سيتم تحويلك إلى الصفحة الرئيسية خلال ثوانٍ قليلة...",
          //End Otp
          //End Auth
          //Create Profile
          TranslationData.fillYourProfile: "املأ ملفك الشخصي",
          TranslationData.gender: " الجنس",
          TranslationData.createProfile: "إنشاء ملف شخصي",
          //Create Profile End
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
          TranslationData.theEmailAddressYouEnteredIsInvalid:
              "The email address you entered is invalid.",
          TranslationData.phoneNumberPattern:
              "The phone number you entered is invalid. Please make sure it is correct.",
          TranslationData.phoneNumberLength:
              "The phone number must not be less than 9 digits.",
          //Otp
          TranslationData.verifyCode: "Verify Code",
          TranslationData.enterTheCode:
              "Enter the the code we just sent you on your registered Phone Number",
          TranslationData.verify: "Verify",
          TranslationData.resendCodeAfter: "resend code after",
          TranslationData.congratulations: "Congratulations",
          TranslationData.congratulationsExplanation:
              "Your account is ready to use. You will be redirected to the Home Page in a few seconds...",
          //End Otp
          //End Auth
          //Create Profile
          TranslationData.fillYourProfile: "Fill Your Profile",
          TranslationData.gender: "Gender",
          TranslationData.createProfile: "Create Profile",
          //Create Profile End
        }
      };
}
