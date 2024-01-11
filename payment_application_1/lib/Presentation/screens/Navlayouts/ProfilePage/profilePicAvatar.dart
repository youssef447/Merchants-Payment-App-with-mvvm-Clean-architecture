part of 'myProfileScreen.dart';

class ProfilePicAvatar extends StatelessWidget {
  const ProfilePicAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: AppColors.defaultColor,
          child: CircleAvatar(
            radius: 45,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(45),
              child: DefaultCachedImage(
                imgUrl: currentUser.profileIimageUrl!,
              ),
            ),
          ),
        ),
        const Icon(
          Icons.add_a_photo,
          color: AppColors.defaultAddbtnColor,
        ),
      ],
    );
  }
}
