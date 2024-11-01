import 'package:app_t_shop/features/shop/models/banner_model.dart';
import 'package:app_t_shop/features/shop/models/category_model.dart';
import 'package:app_t_shop/routers/routers.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';

class TDummyData {
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

  static final List<BannerModel> banners = [
    BannerModel(imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
    BannerModel(imageUrl: TImages.banner3, targetScreen: TRoutes.favourites, active: true),
    BannerModel(imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
    BannerModel(imageUrl: TImages.banner5, targetScreen: TRoutes.settings, active: true),
    BannerModel(imageUrl: TImages.banner6, targetScreen: TRoutes.userAddress, active: true),
    BannerModel(imageUrl: TImages.banner8, targetScreen: TRoutes.checkout, active: false),
  ];


  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Thể thao', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Nội thất', image: TImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Điện tử', image: TImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Quần áo', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Động vật', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(id: '6', name: 'Giày dép', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(id: '7', name: 'Mỹ phẩm', image: TImages.cosmeticsIcon, isFeatured: true),
    CategoryModel(id: '17', name: 'Trang sức', image: TImages.jeweleryIcon, isFeatured: true),

    CategoryModel(id: '8', name: 'Giày thể thao', image: TImages.sportIcon, isFeatured: false, parentId: '1'),
    CategoryModel(id: '9', name: 'Bộ đồ thể thao', image: TImages.sportIcon, isFeatured: false, parentId: '1'),
    CategoryModel(id: '10', name: 'Dụng cụ thể thao', image: TImages.sportIcon, isFeatured: false, parentId: '1'),

    CategoryModel(id: '11', name: 'Nội thất phòng ngủ', image: TImages.furnitureIcon, isFeatured: false, parentId: '5'),
    CategoryModel(id: '12', name: 'Nội thất phòng bếp', image: TImages.furnitureIcon, isFeatured: false, parentId: '5'),
    CategoryModel(id: '13', name: 'Nội thất văn phòng', image: TImages.furnitureIcon, isFeatured: false, parentId: '5'),

    CategoryModel(id: '14', name: 'Laptop', image: TImages.electronicsIcon, isFeatured: false, parentId: '2'),
    CategoryModel(id: '15', name: 'Điện thoại', image: TImages.electronicsIcon, isFeatured: false, parentId: '2'),

    CategoryModel(id: '16', name: 'Áo sơ mi', image: TImages.clothIcon, isFeatured: false, parentId: '3'),
  ];
}
