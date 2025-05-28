import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirfi_home/helper/translation/translation_data.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          TranslationData.notification.tr,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                TranslationData.oneNew.tr,
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 24, right: 24),
        children: [
          _buildSectionTitle(TranslationData.today.tr, onTap: () {}),
          const SizedBox(height: 8),
          NotificationTile(
            icon: Icons.new_releases_rounded,
            title: TranslationData.newCraftsman.tr,
            subtitle: 'استكشف هذا الحرفي',
            time: 'ساعتين',
            iconBackground: Colors.green.shade100,
            iconColor: Colors.green.shade700,
          ),
          const SizedBox(height: 30),
          _buildSectionTitle(TranslationData.yesterday.tr, onTap: () {}),
          const SizedBox(height: 8),
          NotificationTile(
            icon: Icons.celebration,
            title: 'Welcome to Hirfi Home!',
            subtitle: TranslationData.thanksForJoining.tr,
            time: '1 يوم',
            iconBackground: Colors.green.shade100,
            iconColor: Colors.green.shade700,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, {required VoidCallback onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
        TextButton(
          onPressed: onTap,
          child: Text(TranslationData.markAllAsRead.tr,
              style: TextStyle(color: Colors.blue)),
        )
      ],
    );
  }
}

class NotificationTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;
  final Color iconBackground;
  final Color iconColor;

  const NotificationTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.iconBackground,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: iconBackground,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.grey),
      ),
      trailing: Text(time, style: const TextStyle(color: Colors.grey)),
      contentPadding: const EdgeInsets.symmetric(vertical: 6),
    );
  }
}
