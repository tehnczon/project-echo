import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text("Privacy and Policy"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SectionTitle("1. Introduction"),
              SectionText(
                  "This Privacy Policy outlines how ECHO collects, uses, and protects your personal information. By using the app, you agree to the practices described in this policy."),

              SectionTitle("2. Information We Collect"),
              SectionBullet("Personal information during registration (e.g., username, age, gender, location)."),
              SectionBullet("Health-related preferences you choose to share."),
              SectionBullet("User-generated content such as posts and comments."),
              SectionBullet("Technical data (device type, OS version, usage logs)."),

              SectionTitle("3. How We Use Your Information"),
              SectionBullet("To provide personalized content and features."),
              SectionBullet("To improve the platform and user experience."),
              SectionBullet("To monitor safety and enforce community guidelines."),
              SectionBullet("To generate anonymized insights for advocacy and support."),

              SectionTitle("4. Data Sharing and Disclosure"),
              SectionText(
                  "We do not sell or share your personal data with third parties. Limited information may be shared with trusted partners to improve app functionality, subject to confidentiality agreements."),

              SectionTitle("5. Data Security"),
              SectionText(
                  "We implement industry-standard security measures to protect your data. However, no digital system is completely secure, and we advise caution when sharing sensitive information."),

              SectionTitle("6. Your Rights"),
              SectionBullet("You may view, update, or delete your account information at any time."),
              SectionBullet("You may request the deletion of your data by contacting our support team."),
              SectionBullet("You have the right to withdraw consent for data use."),

              SectionTitle("7. Children's Privacy"),
              SectionText(
                  "ECHO is not intended for individuals under 13. We do not knowingly collect data from children. If we become aware of such data, it will be deleted immediately."),

              SectionTitle("8. Changes to This Policy"),
              SectionText(
                  "We may update this Privacy Policy from time to time. We will notify users of significant changes. Continued use of the app indicates acceptance of any changes."),

              SectionTitle("9. Contact Us"),
              SectionText(
                  "If you have any questions or concerns about this Privacy Policy, please contact us at support@echoapp.org."),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;

  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SectionText extends StatelessWidget {
  final String text;

  const SectionText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}

class SectionBullet extends StatelessWidget {
  final String text;

  const SectionBullet(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("•  ", style: TextStyle(fontSize: 18)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
