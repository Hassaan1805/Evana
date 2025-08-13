import 'package:flutter/material.dart';

class SafetyScreen extends StatelessWidget {
  const SafetyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safety & Security'),
        backgroundColor: const Color(0xFFE91E63), // Pink theme for women empowerment
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Emergency Features
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.emergency, color: Colors.red[600], size: 28),
                        const SizedBox(width: 12),
                        Text(
                          'Emergency Features',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildSafetyFeature(
                      icon: Icons.phone,
                      title: 'Emergency Contacts',
                      description: 'Quick access to emergency contacts and helpline',
                      onTap: () => _showEmergencyContacts(context),
                    ),
                    const Divider(),
                    _buildSafetyFeature(
                      icon: Icons.location_on,
                      title: 'Live Location Sharing',
                      description: 'Share your ride location with trusted contacts',
                      onTap: () => _showLocationSharing(context),
                    ),
                    const Divider(),
                    _buildSafetyFeature(
                      icon: Icons.shield,
                      title: 'SOS Alert',
                      description: 'Instant alert to emergency services and contacts',
                      onTap: () => _showSOSFeature(context),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Driver Verification
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.verified_user, color: Colors.green[600], size: 28),
                        const SizedBox(width: 12),
                        Text(
                          'Driver Verification',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildSafetyFeature(
                      icon: Icons.badge,
                      title: 'Verified Women Drivers',
                      description: 'All drivers undergo thorough background verification',
                      onTap: () => _showDriverVerification(context),
                    ),
                    const Divider(),
                    _buildSafetyFeature(
                      icon: Icons.star_rate,
                      title: 'Community Ratings',
                      description: 'Driver ratings and reviews by women riders',
                      onTap: () => _showCommunityRatings(context),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Ride Safety
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.security, color: Colors.blue[600], size: 28),
                        const SizedBox(width: 12),
                        Text(
                          'Ride Safety',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildSafetyFeature(
                      icon: Icons.route,
                      title: 'Route Tracking',
                      description: 'Real-time GPS tracking for all rides',
                      onTap: () => _showRouteTracking(context),
                    ),
                    const Divider(),
                    _buildSafetyFeature(
                      icon: Icons.group,
                      title: 'Community Support',
                      description: 'Connect with women riders community',
                      onTap: () => _showCommunitySupport(context),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Safety Tips
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.pink[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lightbulb, color: Colors.orange[600]),
                      const SizedBox(width: 8),
                      Text(
                        'Safety Tips',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildSafetyTip('Always verify driver details before starting the ride'),
                  _buildSafetyTip('Share your trip details with trusted contacts'),
                  _buildSafetyTip('Trust your instincts - if something feels wrong, speak up'),
                  _buildSafetyTip('Keep emergency contacts easily accessible'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSafetyFeature({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.grey[700]),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }

  Widget _buildSafetyTip(String tip) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, size: 16, color: Colors.green[600]),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              tip,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  void _showEmergencyContacts(BuildContext context) {
    // TODO: Implement emergency contacts feature
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Emergency contacts feature coming soon!')),
    );
  }

  void _showLocationSharing(BuildContext context) {
    // TODO: Implement location sharing feature
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Location sharing feature coming soon!')),
    );
  }

  void _showSOSFeature(BuildContext context) {
    // TODO: Implement SOS feature
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('SOS feature coming soon!')),
    );
  }

  void _showDriverVerification(BuildContext context) {
    // TODO: Implement driver verification display
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Driver verification details coming soon!')),
    );
  }

  void _showCommunityRatings(BuildContext context) {
    // TODO: Implement community ratings feature
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Community ratings feature coming soon!')),
    );
  }

  void _showRouteTracking(BuildContext context) {
    // TODO: Implement route tracking feature
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Route tracking feature coming soon!')),
    );
  }

  void _showCommunitySupport(BuildContext context) {
    // TODO: Implement community support feature
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Community support feature coming soon!')),
    );
  }
}
