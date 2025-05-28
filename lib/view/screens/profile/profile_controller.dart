import 'package:get/get.dart';
import 'package:hirfi_home/data/repositroy/user_profile_repo.dart';

class ProfileController extends GetxController {
  final UserProfileRepository repository; // ✅ استخدم final هنا
  ProfileController(this.repository);
  RxString name = ''.obs;
  RxString Photo = ''.obs;
  @override
  void onInit() {
    super.onInit();
    fetchAndStoreUserInfo();
  }

  Future<void> fetchAndStoreUserInfo() async {
    try {
      final profile = await repository.getProfile();
      if (profile != null) {
        Photo.value = profile.profilePicture!;
        print('Name: ${profile.name}');
        name.value = profile.name;
      } else {
        print('No profile found.');
      }
    } catch (e) {
      print('Failed to fetch basic info: $e');
    }
  }
}
