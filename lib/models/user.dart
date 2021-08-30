class Patient {
  // static const ID = "id";
  // static const NAME = "name";
  // static const EMAIL = "email";
  // static const PIC = "pic";

  final String email;
  final String firstName;
  final int age;
  final String lastName;
  final String gender;
  final bool isanonymous;
  final String picture;
  Patient(
      {this.email,
      this.firstName,
      this.age,
      this.lastName,
      this.gender,
      this.isanonymous,
      this.picture});
}
