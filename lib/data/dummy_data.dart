import 'package:app_t_shop/features/authentication/models/user/user_model.dart';
import 'package:app_t_shop/features/shop/models/category_model.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';

class TDummyData{
  /*static final List<BannerModel> banners = [

  ];

  static final UserModel user = UserModel(
    id: id,
    username: username,
    email: email,
    firstName: firstName,
    lastName: lastName,
    phoneNumber: phoneNumber,
    profilePicture: profilePicture,

  );*/

  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Sports', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Furniture', image: TImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Electronics', image: TImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Clothes', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(id: '6', name: 'Shoes', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(id: '7', name: 'Cosmetics', image: TImages.cosmeticsIcon, isFeatured: true),
    CategoryModel(id: '14', name: 'Jewelery', image: TImages.jeweleryIcon, isFeatured: true),

    CategoryModel(id: '8', name: 'Sports Shoes', image: TImages.sportIcon, isFeatured: false,parentId: '1'),
    CategoryModel(id: '9', name: 'Track suits', image: TImages.sportIcon, isFeatured: false,parentId: '1'),
    CategoryModel(id: '10', name: 'Sports Equipments', image: TImages.sportIcon, isFeatured: false,parentId: '1'),

    CategoryModel(id: '11', name: 'Bedroom furniture', image: TImages.furnitureIcon, isFeatured: false,parentId: '5'),
    CategoryModel(id: '12', name: 'Kitchen furniture', image: TImages.furnitureIcon, isFeatured: false,parentId: '5'),
    CategoryModel(id: '13', name: 'Office furniture', image: TImages.furnitureIcon, isFeatured: false,parentId: '5'),

    CategoryModel(id: '14', name: 'Laptop', image: TImages.electronicsIcon, isFeatured: false,parentId: '2'),
    CategoryModel(id: '15', name: 'Mobile', image: TImages.electronicsIcon, isFeatured: false,parentId: '2'),

    CategoryModel(id: '16', name: 'Shirt', image: TImages.clothIcon, isFeatured: false,parentId: '3'),
  ];
}