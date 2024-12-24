class ChangePasswordBody {
  String username;
  String currentPassword;
  String newPassword;
  String confirmNewPassword;

  ChangePasswordBody({required this.username, required this.currentPassword, required this.newPassword, required this.confirmNewPassword});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['currentPassword'] = currentPassword;
    data['newPassword'] = newPassword;
    data['confirmNewPassword'] = confirmNewPassword;
    return data;
  }
}
