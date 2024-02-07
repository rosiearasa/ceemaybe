class User {
  late int id;
  String firstName;
  String lastName;
  int age;
  DateTime dateJoined;

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'age': age,
      'dateJoined': dateJoined,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    return User(
        map['firstName'], map['lastName'], map['age'], map['dateJoined']);
  }

  User(this.firstName, this.lastName, this.age, this.dateJoined);
}
