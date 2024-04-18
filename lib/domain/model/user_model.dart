class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? login;
  final String? phone;
  final int? bonus;
  final String? token;
  final String? avatar;
  final String? password;
  final String? confirmPassword;
  final int? regionId;
  final String? companyName;
  final bool? isBusiness;

  const UserModel({
    this.id,
    this.name,
    this.phone,
    this.bonus,
    this.login,
    this.email,
    this.token,
    this.avatar,
    this.regionId,
    this.password,
    this.confirmPassword,
    this.companyName,
    this.isBusiness,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        login: json['login'] as String?,
        token: json['token'] as String?,
        bonus: json['bonus'] as int?,
        avatar: json['avatar'] as String?,
        password: json['password'] as String?,
        confirmPassword: json['confirm_password'] as String?,
        phone: json['phone'] as String?,
        regionId: json['region_id'] as int?,
        companyName: json['company_name'] as String?,
        isBusiness: json['is_business'] as bool?,
      );

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        if (name != null) 'name': name,
        if (login != null) 'login': login,
        if (email != null) 'email': email,
        if (token != null) 'token': token,
        if (avatar != null) 'avatar': avatar,
        if (bonus != null) 'bonus': bonus,
        if (password != null) 'password': password,
        if (phone != null) 'phone': phone,
        if (regionId != null) 'region_id': regionId,
        if (companyName != null) 'company_name': companyName,
        if (isBusiness != null) 'is_business': isBusiness,
      };
}
