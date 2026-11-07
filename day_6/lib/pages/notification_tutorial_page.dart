import 'package:flutter/material.dart';
import 'package:day_6/services/notification_service.dart';

class NotificationTutorialPage extends StatefulWidget {
  const NotificationTutorialPage({Key? key}) : super(key: key);

  @override
  State<NotificationTutorialPage> createState() =>
      _NotificationTutorialPageState();
}

class _NotificationTutorialPageState extends State<NotificationTutorialPage> {
  final NotificationService _notificationService = NotificationService();
  int _delaySeconds = 5;

  @override
  void initState() {
    super.initState();
    // Initialize notifications
    _notificationService.initialize();
  }

  void _sendInstantNotification() {
    _notificationService.showInstantNotification(
      title: 'Hello!',
      body: 'This is an instant notification sent right now.',
      payload: 'instant_notification_payload',
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('✓ Instant notification sent!')),
    );
  }

  void _sendScheduledNotification() {
    final scheduledTime = DateTime.now().add(Duration(seconds: _delaySeconds));

    _notificationService.scheduleNotification(
      title: 'Scheduled Notification',
      body: 'This notification was scheduled $_delaySeconds seconds from now.',
      scheduledTime: scheduledTime,
      payload: 'scheduled_notification_payload',
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '✓ Notification scheduled for $_delaySeconds seconds from now!',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Notifications Tutorial'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Instant Notifications
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '1. Instant Notifications',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Send a notification immediately to the user. This appears as a popup/banner.',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _sendInstantNotification,
                      icon: const Icon(Icons.notifications_active),
                      label: const Text('Send Instant Notification'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Section 2: Scheduled Notifications
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '2. Scheduled Notifications',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Schedule a notification to appear at a specific time in the future. Great for reminders or time-based alerts.',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    // Delay slider
                    Row(
                      children: [
                        const Text('Delay (seconds):'),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Slider(
                            value: _delaySeconds.toDouble(),
                            min: 1,
                            max: 60,
                            divisions: 59,
                            label: '$_delaySeconds',
                            onChanged: (value) {
                              setState(() {
                                _delaySeconds = value.toInt();
                              });
                            },
                          ),
                        ),
                        Text(
                          '$_delaySeconds s',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: _sendScheduledNotification,
                      icon: const Icon(Icons.schedule),
                      label: const Text('Schedule Notification'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 48),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Section 3: Configuration Info
            Card(
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '⚙️ Configuration Requirements',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildConfigItem('📱 Android', [
                      'Permissions already configured in AndroidManifest.xml',
                      'Automatic setup via flutter_local_notifications',
                      'Works on Android 5.0+',
                    ]),
                    const SizedBox(height: 12),
                    _buildConfigItem('🍎 iOS', [
                      'Permissions requested at runtime',
                      'User must grant notification permission when app starts',
                      'Works on iOS 10.0+',
                    ]),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Section 4: Code Example
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '💻 Quick Code Reference',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildCodeSnippet(
                      'Initialize (in main.dart):',
                      'await NotificationService().initialize();',
                    ),
                    const SizedBox(height: 12),
                    _buildCodeSnippet(
                      'Send Instant:',
                      'NotificationService().showInstantNotification(\n'
                          '  title: \'Title\',\n'
                          '  body: \'Body\',\n'
                          ');',
                    ),
                    const SizedBox(height: 12),
                    _buildCodeSnippet(
                      'Schedule:',
                      'NotificationService().scheduleNotification(\n'
                          '  title: \'Title\',\n'
                          '  body: \'Body\',\n'
                          '  scheduledTime: DateTime.now().add(\n'
                          '    Duration(seconds: 5),\n'
                          '  ),\n'
                          ');',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildConfigItem(String platform, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          platform,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),
        ...items
            .map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '• ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(item, style: const TextStyle(fontSize: 13)),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ],
    );
  }

  Widget _buildCodeSnippet(String title, String code) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Text(
            code,
            style: const TextStyle(
              fontFamily: 'Courier',
              fontSize: 12,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }
}
