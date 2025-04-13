import 'package:demo_project/utils/size_config.dart';
import 'package:flutter/material.dart';

class FreeTrailPage extends StatefulWidget {
  const FreeTrailPage({super.key});

  @override
  State<FreeTrailPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<FreeTrailPage> {
  @override
  void initState() {
    super.initState();
    // TODO: Implement API call here to fetch book categories and book lists
  }

  final List<_Feature> features = const [
    _Feature("Unlimited audiobook access", true),
    _Feature("Personalized recommendations", true),
    _Feature("Offline downloads", true),
    _Feature("Exclusive early access to new releases", false),
    _Feature("Free monthly bonus content", false),
    _Feature("Priority customer support", false),
    _Feature("7-day free trial (₹2, refunded immediately)", false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Image.asset("assets/home_tab_assets/home_backgroung.png"),

              const SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: FreeTrialCard(),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: SubscriptionCard(),
              ),

              const SizedBox(height: 10),

            ],
          ),
        ),
      ),
    );
  }

  Widget FreeTrialCard()=> Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.amber.shade50,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.orangeAccent),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("🎁 Free Trial - Just Pay \$2", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text("Enjoy 7 days of unlimited access to audiobooks absolutely free!", style: TextStyle(fontSize: 14)),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          child: const Text("Start Free Trial"),
        ),
      ],
    ),
  );

  Widget SubscriptionCard()=>Container(
    decoration: BoxDecoration(
      color: Colors.brown.shade900,
      borderRadius: BorderRadius.circular(12),
    ),
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("1 Month Plan", style: TextStyle(color: Colors.white70, fontSize: 16)),
        const SizedBox(height: 8),
        Row(
          children: [
            Text("₹ 99", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            const Text("/ month", style: TextStyle(color: Colors.white70, fontSize: 16)),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(8)),
              child: const Text("Save 16%", style: TextStyle(color: Colors.white, fontSize: 12)),
            )
          ],
        ),
        const Divider(color: Colors.white30, height: 24),
        const Text("Features:", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...features.map((f) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(f.isAvailable ? Icons.check : Icons.close, color: f.isAvailable ? Colors.green : Colors.red, size: 18),
            const SizedBox(width: 8),
            Expanded(child: Text(f.title, style: TextStyle(color: Colors.white, fontSize: 14))),
          ],
        )).toList(),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            child: const Text("Subscribe", style: TextStyle(color: Colors.brown)),
          ),
        ),
      ],
    ),
  );
}



class _Feature {
  final String title;
  final bool isAvailable;
  const _Feature(this.title, this.isAvailable);
}
