import 'package:flutter/material.dart';
import 'package:projecho/pages/homefeed/comment_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1; // Default to Home

  void _onTabTapped(int index) {
    if (index == 0) {
      Navigator.pushNamed(context, '/profile');
    } else if (index == 4) {
      _showBottomMenu(); // Show modal menu
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  void _showBottomMenu() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Wrap(
                spacing: 80,
                runSpacing: 40,
                children: [
                  _MenuItem(
                    icon: Icons.feedback_outlined,
                    label: 'Feedback',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/feedback');
                    },
                  ),
                  _MenuItem(
                    icon: Icons.insights_outlined,
                    label: 'Insight',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/insights');
                    },
                  ),
                  _MenuItem(
                    icon: Icons.info_outline,
                    label: 'About Echo',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/about');
                    },
                  ),
                  _MenuItem(
                    icon: Icons.article_outlined,
                    label: 'Terms and Condition',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/terms');
                    },
                  ),
                  _MenuItem(
                    icon: Icons.logout,
                    label: 'Log out',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "echo",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                      letterSpacing: 1,
                    ),
                  ),
                  const Icon(Icons.search, size: 28),
                ],
              ),
            ),
            const Divider(height: 1),
            // Content
            Expanded(
  child: ListView.builder(
    padding: const EdgeInsets.only(bottom: 70),
    itemCount: 10,
    itemBuilder: (context, index) {
      return PostCard(postId: index);
    },
  ),
)

          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blueAccent,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle, size: 36), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: ''),
        ],
      ),
    );
  }
}

// Bottom Menu Item Widget
class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _MenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 36, color: Colors.black87),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

// Sample PostCard Widget
class PostCard extends StatelessWidget {
  final int postId;
  const PostCard({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                CircleAvatar(child: Text('🙂')),
                SizedBox(width: 8),
                Text("Lorem Mars", style: TextStyle(fontWeight: FontWeight.bold)),
                Spacer(),
                Icon(Icons.more_vert),
              ],
            ),
            const SizedBox(height: 8),
            const Text("Title", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur at lacus ac leo.",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.arrow_downward_outlined, size: 20),
                const SizedBox(width: 4),
                const Text('12'),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => CommentScreen(postId: postId)),
                    );
                  },
                  child: const Icon(Icons.chat_bubble_outline, size: 20),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
