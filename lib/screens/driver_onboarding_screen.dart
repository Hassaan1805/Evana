import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DriverOnboardingScreen extends StatefulWidget {
  const DriverOnboardingScreen({super.key});

  @override
  State<DriverOnboardingScreen> createState() => _DriverOnboardingScreenState();
}

class _DriverOnboardingScreenState extends State<DriverOnboardingScreen> {
  int currentStep = 0;
  final PageController _pageController = PageController();
  final _formKey = GlobalKey<FormState>();
  String _selectedVehicleType = 'Scooty/Scooter';
  bool _isSubmitting = false;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _vehicleNumberController =
      TextEditingController();
  final TextEditingController _licenseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join as Driver'),
        backgroundColor: const Color(0xFFE91E63),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Progress indicator
          Container(
            padding: const EdgeInsets.all(16),
            color: const Color(0xFFE91E63),
            child: Row(
              children: List.generate(4, (index) {
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    height: 4,
                    decoration: BoxDecoration(
                      color: index <= currentStep
                          ? Colors.white
                          : Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                );
              }),
            ),
          ),

          // Content
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentStep = index;
                });
              },
              children: [
                _buildWelcomeStep(),
                _buildPersonalInfoStep(),
                _buildVehicleInfoStep(),
                _buildVerificationStep(),
              ],
            ),
          ),

          // Navigation buttons
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                if (currentStep > 0)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: const Text('Previous'),
                    ),
                  ),
                if (currentStep > 0) const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isSubmitting ? null : () {
                      if (currentStep < 3) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        _completeOnboarding();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE91E63),
                      foregroundColor: Colors.white,
                    ),
                    child: _isSubmitting 
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text(currentStep < 3 ? 'Next' : 'Complete Registration'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.pink[50],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.directions_bike,
              size: 80,
              color: Colors.pink[400],
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'Welcome to Evana Driver!',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFE91E63),
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Join our community of empowered women drivers in Jaipur. Earn flexible income while supporting other women\'s safe mobility.',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // Benefits
          _buildBenefitCard(
            icon: Icons.schedule,
            title: 'Flexible Hours',
            description: 'Work when you want, earn on your schedule',
          ),
          const SizedBox(height: 16),
          _buildBenefitCard(
            icon: Icons.security,
            title: 'Safe Environment',
            description: 'Women-only network for safety and comfort',
          ),
          const SizedBox(height: 16),
          _buildBenefitCard(
            icon: Icons.group,
            title: 'Community Support',
            description: 'Join a supportive network of women drivers',
          ),
          const SizedBox(height: 16),
          _buildBenefitCard(
            icon: Icons.account_balance_wallet,
            title: 'Fair Earnings',
            description: 'Competitive rates with transparent pricing',
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personal Information',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Help us get to know you better',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 32),
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Full Name *',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Phone Number *',
              prefixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email Address *',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _addressController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Address *',
              prefixIcon: Icon(Icons.location_on),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.blue[200]!),
            ),
            child: Row(
              children: [
                Icon(Icons.info, color: Colors.blue[600]),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Your information will be kept secure and used only for verification purposes.',
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleInfoStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vehicle Information',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tell us about your scooty/vehicle',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 32),

          TextFormField(
            controller: _vehicleNumberController,
            decoration: const InputDecoration(
              labelText: 'Vehicle Registration Number *',
              prefixIcon: Icon(Icons.directions_bike),
              border: OutlineInputBorder(),
              hintText: 'RJ 14 XX 1234',
            ),
          ),
          const SizedBox(height: 20),

          TextFormField(
            controller: _licenseController,
            decoration: const InputDecoration(
              labelText: 'Driving License Number *',
              prefixIcon: Icon(Icons.credit_card),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),

          // Vehicle type selection
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vehicle Type *',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 12),
                _buildVehicleOption(
                    'Scooty/Scooter', Icons.directions_bike, _selectedVehicleType == 'Scooty/Scooter'),
                _buildVehicleOption('Motorcycle', Icons.motorcycle, _selectedVehicleType == 'Motorcycle'),
              ],
            ),
          ),

          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.green[200]!),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.eco, color: Colors.green[600]),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Eco-Friendly Rides',
                        style: TextStyle(
                          color: Colors.green[800],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Scooty rides are perfect for Jaipur\'s streets and help reduce carbon footprint!',
                  style: TextStyle(
                    color: Colors.green[700],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVerificationStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.green[50],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.verified_user,
              size: 80,
              color: Colors.green[400],
            ),
          ),
          const SizedBox(height: 32),
          Text(
            'Verification Process',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'We\'ll verify your documents to ensure safety for all our users.',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          _buildVerificationStepCard(
            icon: Icons.upload_file,
            title: 'Document Upload',
            description:
                'Upload photos of your license and vehicle registration',
            isCompleted: false,
          ),
          const SizedBox(height: 16),
          _buildVerificationStepCard(
            icon: Icons.phone_callback,
            title: 'Phone Verification',
            description: 'We\'ll send you an OTP to verify your phone number',
            isCompleted: false,
          ),
          const SizedBox(height: 16),
          _buildVerificationStepCard(
            icon: Icons.security,
            title: 'Background Check',
            description: 'Quick background verification for safety',
            isCompleted: false,
          ),
          const SizedBox(height: 16),
          _buildVerificationStepCard(
            icon: Icons.check_circle,
            title: 'Approval',
            description: 'Get approved and start earning within 24-48 hours',
            isCompleted: false,
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.pink[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.pink[200]!),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.group, color: Colors.pink[600]),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Join Our Community',
                        style: TextStyle(
                          color: Colors.pink[800],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Once approved, you\'ll get access to our driver WhatsApp group for support and community connection.',
                  style: TextStyle(
                    color: Colors.pink[700],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBenefitCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.pink[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.pink[400]),
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
        ],
      ),
    );
  }

  Widget _buildVehicleOption(String title, IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedVehicleType = title;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.pink[50] : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.pink[300]! : Colors.grey[300]!,
          ),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: isSelected ? Colors.pink[400] : Colors.grey[600],
          ),
          title: Text(title),
          trailing: isSelected
              ? Icon(Icons.check_circle, color: Colors.pink[400])
              : null,
        ),
      ),
    );
  }

  Widget _buildVerificationStepCard({
    required IconData icon,
    required String title,
    required String description,
    required bool isCompleted,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isCompleted ? Colors.green[50] : Colors.grey[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: isCompleted ? Colors.green[400] : Colors.grey[400],
            ),
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
          if (isCompleted) Icon(Icons.check_circle, color: Colors.green[400]),
        ],
      ),
    );
  }

  void _completeOnboarding() async {
    // Validate required fields
    if (_nameController.text.trim().isEmpty ||
        _phoneController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        _addressController.text.trim().isEmpty ||
        _vehicleNumberController.text.trim().isEmpty ||
        _licenseController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all required fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      // Create driver data object
      final driverData = {
        'personalInfo': {
          'fullName': _nameController.text.trim(),
          'phoneNumber': _phoneController.text.trim(),
          'email': _emailController.text.trim(),
          'address': _addressController.text.trim(),
        },
        'vehicleInfo': {
          'vehicleNumber': _vehicleNumberController.text.trim(),
          'licenseNumber': _licenseController.text.trim(),
          'vehicleType': _selectedVehicleType,
        },
        'registrationStatus': {
          'status': 'pending', // pending, approved, rejected
          'submittedAt': FieldValue.serverTimestamp(),
          'documentsUploaded': false,
          'phoneVerified': false,
          'backgroundCheckCompleted': false,
        },
        'applicationInfo': {
          'city': 'Jaipur',
          'platform': 'Evana',
          'driverType': 'women_driver',
        },
      };

      // Save to Firestore
      await FirebaseFirestore.instance
          .collection('driver_applications')
          .add(driverData);

      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration submitted successfully! We\'ll contact you within 24 hours for document verification.'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 4),
          ),
        );
        Navigator.of(context).pop();
      }
    } catch (e) {
      // Show error message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration failed: ${e.toString()}'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _vehicleNumberController.dispose();
    _licenseController.dispose();
    super.dispose();
  }
}
