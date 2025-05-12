import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const MaterialApp(home: InsightsScreen()));
}

class InsightsScreen extends StatelessWidget {
  const InsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
  backgroundColor: const Color.fromARGB(255, 230, 230, 230),
  appBar: AppBar(
    title: const Text("Insights"),

    backgroundColor: const Color.fromARGB(255, 230, 230, 230),
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  ),
  body: SafeArea(
    child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // ... rest of your UI remains here ...

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'assets/onboarding/onboarding_image.PNG',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          
          const Text(
            "Every number tells a story.",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold
            ),
            
          ),
          const SizedBox(height: 8),
          const Text(
            "Here’s how our PLHIV community is growing and what support they value most.",
          ),
          const SizedBox(height: 0),
          const InfoCard(
            title: "PLHIV Registered",
            value: "1,253",
            subText: "+5.4%",
            subTextColor: Colors.green,
            
          ),
          const SizedBox(height: 16),
          const Text("Gender Identity Breakdown",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          const SizedBox(height: 16),
          const GenderPieChart(),
          const SizedBox(height: 16),
          const Text("Age Groups"),
          AgeGroupBar(),
          const SizedBox(height: 16),
          const Text("Support Needs"),
          SupportNeedsBar(),
          const SizedBox(height: 32),
        ],
      ),
    ),
  ),
),

    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
    );
  }
}

class GenderPieChart extends StatelessWidget {
  const GenderPieChart({super.key});

  final List<Map<String, dynamic>> genderData = const [
    {"label": "Male", "value": 57.0, "color": Colors.green},
    {"label": "Female", "value": 35.0, "color": Colors.teal},
    {"label": "Non-binary", "value": 8.0, "color": Colors.orange},
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: 30,
                  sections: genderData.map((data) {
                    return PieChartSectionData(
                      color: data["color"],
                      value: data["value"],
                      showTitle: false,
                      radius: 50,
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 24,
              children: genderData.map((data) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: data["color"],
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text("${data["label"]} (${data["value"]}%)",
                        style: const TextStyle(fontSize: 14)),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}


class AgeGroupBar extends StatelessWidget {
  final List<Map<String, dynamic>> ageGroups = [
    {"label": "18–24", "percent": 22},
    {"label": "25–34", "percent": 44},
    {"label": "35–44", "percent": 23},
    {"label": "45+", "percent": 11},
  ];

  AgeGroupBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ageGroups.map((age) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              SizedBox(width: 60, child: Text(age["label"])),
              Expanded(
                child: LinearProgressIndicator(
                  value: age["percent"] / 100,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                ),
              ),
              const SizedBox(width: 10),
              Text("${age["percent"]}%")
            ],
          ),
        );
      }).toList(),
    );
  }
}

class SupportNeedsBar extends StatelessWidget {
  final List<Map<String, dynamic>> supportNeeds = [
    {"label": "Peer connection", "percent": 47},
    {"label": "Health education", "percent": 32},
    {"label": "Mental health", "percent": 21},
  ];

  SupportNeedsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: supportNeeds.map((need) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              SizedBox(width: 120, child: Text(need["label"])),
              Expanded(
                child: LinearProgressIndicator(
                  value: need["percent"] / 100,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
              const SizedBox(width: 10),
              Text("${need["percent"]}%")
            ],
          ),
        );
      }).toList(),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final String subText;
  final Color subTextColor;

  const InfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.subText,
    required this.subTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text(subText, style: TextStyle(color: subTextColor, fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
