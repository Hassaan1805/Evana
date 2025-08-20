class DriverApplication {
  final String? id;
  final PersonalInfo personalInfo;
  final VehicleInfo vehicleInfo;
  final RegistrationStatus registrationStatus;
  final ApplicationInfo applicationInfo;

  DriverApplication({
    this.id,
    required this.personalInfo,
    required this.vehicleInfo,
    required this.registrationStatus,
    required this.applicationInfo,
  });

  Map<String, dynamic> toMap() {
    return {
      'personalInfo': personalInfo.toMap(),
      'vehicleInfo': vehicleInfo.toMap(),
      'registrationStatus': registrationStatus.toMap(),
      'applicationInfo': applicationInfo.toMap(),
    };
  }

  factory DriverApplication.fromMap(Map<String, dynamic> map, String id) {
    return DriverApplication(
      id: id,
      personalInfo: PersonalInfo.fromMap(map['personalInfo']),
      vehicleInfo: VehicleInfo.fromMap(map['vehicleInfo']),
      registrationStatus: RegistrationStatus.fromMap(map['registrationStatus']),
      applicationInfo: ApplicationInfo.fromMap(map['applicationInfo']),
    );
  }
}

class PersonalInfo {
  final String fullName;
  final String phoneNumber;
  final String email;
  final String address;

  PersonalInfo({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'address': address,
    };
  }

  factory PersonalInfo.fromMap(Map<String, dynamic> map) {
    return PersonalInfo(
      fullName: map['fullName'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      email: map['email'] ?? '',
      address: map['address'] ?? '',
    );
  }
}

class VehicleInfo {
  final String vehicleNumber;
  final String licenseNumber;
  final String vehicleType;

  VehicleInfo({
    required this.vehicleNumber,
    required this.licenseNumber,
    required this.vehicleType,
  });

  Map<String, dynamic> toMap() {
    return {
      'vehicleNumber': vehicleNumber,
      'licenseNumber': licenseNumber,
      'vehicleType': vehicleType,
    };
  }

  factory VehicleInfo.fromMap(Map<String, dynamic> map) {
    return VehicleInfo(
      vehicleNumber: map['vehicleNumber'] ?? '',
      licenseNumber: map['licenseNumber'] ?? '',
      vehicleType: map['vehicleType'] ?? '',
    );
  }
}

class RegistrationStatus {
  final String status; // pending, approved, rejected
  final DateTime? submittedAt;
  final bool documentsUploaded;
  final bool phoneVerified;
  final bool backgroundCheckCompleted;

  RegistrationStatus({
    required this.status,
    this.submittedAt,
    required this.documentsUploaded,
    required this.phoneVerified,
    required this.backgroundCheckCompleted,
  });

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'submittedAt': submittedAt,
      'documentsUploaded': documentsUploaded,
      'phoneVerified': phoneVerified,
      'backgroundCheckCompleted': backgroundCheckCompleted,
    };
  }

  factory RegistrationStatus.fromMap(Map<String, dynamic> map) {
    return RegistrationStatus(
      status: map['status'] ?? 'pending',
      submittedAt: map['submittedAt']?.toDate(),
      documentsUploaded: map['documentsUploaded'] ?? false,
      phoneVerified: map['phoneVerified'] ?? false,
      backgroundCheckCompleted: map['backgroundCheckCompleted'] ?? false,
    );
  }
}

class ApplicationInfo {
  final String city;
  final String platform;
  final String driverType;

  ApplicationInfo({
    required this.city,
    required this.platform,
    required this.driverType,
  });

  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'platform': platform,
      'driverType': driverType,
    };
  }

  factory ApplicationInfo.fromMap(Map<String, dynamic> map) {
    return ApplicationInfo(
      city: map['city'] ?? '',
      platform: map['platform'] ?? '',
      driverType: map['driverType'] ?? '',
    );
  }
}
