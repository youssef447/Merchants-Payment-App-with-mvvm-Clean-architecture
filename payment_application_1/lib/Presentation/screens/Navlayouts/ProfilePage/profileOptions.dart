part of 'myProfileScreen.dart';

class ProfileOptions extends StatelessWidget {
  const ProfileOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        ProfileCubit cubit = ProfileCubit.get(context);
        return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: const Icon(
                  Icons.language_outlined,
                  color: AppColors.defaultAddbtnColor,
                ),
                title: const Text(
                  'change language',
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'English',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors.defaultAddbtnColor,
                          ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.defaultAddbtnColor,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              color: AppColors.defaultAddbtnColor,
            ),
            InkWell(
              onTap: () {
                cubit.signOut(context);
              },
              child: const ListTile(
                leading: Icon(Icons.logout_outlined),
                title: Text('Sign Out'),
              ),
            ),
            const Divider(
              color: AppColors.defaultAddbtnColor,
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                leading: Icon(
                  Icons.delete_outlined,
                  color: Colors.red,
                ),
                title: Text('Delete Account'),
              ),
            ),
          ],
        );
      },
    );
  }
}
