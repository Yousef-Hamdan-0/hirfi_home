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
          TranslationData.changeLanguage: "اللغات"
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
          TranslationData.changeLanguage: "Languages"
        }
      };
}
