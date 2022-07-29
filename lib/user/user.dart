class Users {
  // String image;
  String name;
  String email;
  String sem;
  String phone;
  String aboutMeDescription;

  // Constructor
  Users({
    //required this.image,
    required this.name,
    required this.email,
    required this.sem,
    required this.phone,
    required this.aboutMeDescription,
  });

  Users copy({
    //String? imagePath,
    String? name,
    String? phone,
    String? sem,
    String? email,
    String? about,
  }) =>
      Users(
        // image: imagePath ?? this.image,
        name: name ?? this.name,
        email: email ?? this.email,
        sem: sem ?? this.sem,
        phone: phone ?? this.phone,
        aboutMeDescription: about ?? this.aboutMeDescription,
      );

  static Users fromJson(Map<String, dynamic> json) => Users(
        // image: json['imagePath'],
        name: json['name'],
        email: json['email'],
        sem: json['sem'],
        aboutMeDescription: json['about'],
        phone: json['phone'],
      );

  Map<String, dynamic> toJson() => {
        //'imagePath': image,
        'name': name,
        'email': email,
        'sem': sem,
        'about': aboutMeDescription,
        'phone': phone,
      };
}
