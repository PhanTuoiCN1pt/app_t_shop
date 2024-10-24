import 'package:app_t_shop/common/widgets/images/circular_image.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircularImage(image: TImages.user,width: 50,height: 50,padding: 0,),
      title: Text('Phan Van Tuoi', style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),),
      subtitle: Text('phantuoi1xa@gmail.com',style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),
      trailing: IconButton(onPressed: (){}, icon: const Icon(Iconsax.edit,color: Colors.white,)),
    );
  }
}