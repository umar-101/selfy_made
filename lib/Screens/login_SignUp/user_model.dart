class UserModel{
    final int id;
    final String username;
    final String phoneNumber;
    final String email;
    final String authToken;
    final String profileImage;

    UserModel({ this.id,this.username,  this.phoneNumber, this.email ,this.authToken,this.profileImage});

    factory UserModel.fromJson(Map<String,dynamic>json){
        if(json['user'] != null){
            return UserModel(
                    id:json['user']['id'],
                    email:json['user']['email'],
                    username: json['user']['name'],
                    authToken: json['auth_token'],
                    phoneNumber: json['user']['phoneNumber'],
                    profileImage: json['user']['profile_photo_url'],
            );
        }
        return UserModel(
                    id:json['id'],
                    email:json['email'],
                    username: json['username'],
                    authToken: json['authToken'],
                    phoneNumber: json['phoneNumber'],
                    profileImage: json['profile_photo_url'],
        );

    }
    Map<String,dynamic> toJson(){
        return {
            'id':this.id,
            'username':this.username,
            'phoneNumber':this.phoneNumber,
            'email':this.email,
            'authToken':this.authToken,
            'profileImage':this.profileImage
        };
    }
}
