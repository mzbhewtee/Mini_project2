//this class contains the list of all the patients as list of type DoctorAppointmentList Class

class DoctorAppointmentList {
  final String name;
  final String checkupType;


  DoctorAppointmentList({required this.name, required this.checkupType});
}
List<DoctorAppointmentList> patients = [

  DoctorAppointmentList(
      name: "Hilda Dokubor",
      checkupType: "General CheckUp"),
  DoctorAppointmentList(
      name: "Beauty Ikudehinbu",
      checkupType: "General CheckUp"),
  DoctorAppointmentList(
      name: "John Doe",
      checkupType: "PreNup"),
  DoctorAppointmentList(
      name: "Belinda Kelly",
      checkupType: "PreNatal"),


];


