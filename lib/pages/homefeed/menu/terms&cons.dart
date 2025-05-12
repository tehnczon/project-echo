import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text("Terms and Conditions"),
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
              SectionTitle("1. Acceptance of Terms"),
              SectionText(
                  "By using ECHO, you agree to abide by these terms. If you do not agree, please do not use the app."),

              SectionTitle("2. Purpose of the App"),
              SectionText(
                  "ECHO is a support and advocacy platform for people living with HIV (PLHIV) and those seeking HIV-related health information. It aims to foster a safe, stigma-free, and respectful space."),

              SectionTitle("3. User Responsibilities"),
              SectionBullet("Provide accurate information during registration."),
              SectionBullet("Use respectful, non-discriminatory language."),
              SectionBullet("Do not share content that promotes hate, misinformation, or harmful behavior."),
              SectionBullet("Respect the privacy and identities of other users."),

              SectionTitle("4. Privacy and Data"),
              SectionText(
                  "Your personal data (e.g., age, gender, location) is collected to improve services and generate anonymized statistics."),
              SectionText(
                  "Sensitive data is stored securely and never shared without consent."),
              SectionText(
                  "You may request deletion of your data at any time."),

              SectionTitle("5. Content Ownership"),
              SectionText(
                  "You retain ownership of the content you post. By posting on ECHO, you grant us a license to display and distribute your content within the app for community engagement."),

              SectionTitle("6. Moderation and Removal"),
              SectionText(
                  "Posts and accounts may be removed if they violate our community guidelines or harm the safety of others. Repeated violations may result in a ban."),

              SectionTitle("7. Location Sharing (Optional)"),
              SectionText(
                  "You may optionally share your region to help us improve support services and connect you with relevant content. Exact geolocation is never required or collected."),

              SectionTitle("8. Changes to Terms"),
              SectionText(
                  "We may update these terms from time to time. Continued use of ECHO indicates your acceptance of any changes."),
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
