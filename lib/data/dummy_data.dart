import 'package:app_t_shop/features/shop/models/banner_model.dart';
import 'package:app_t_shop/features/shop/models/brand_model.dart';
import 'package:app_t_shop/features/shop/models/category_model.dart';
import 'package:app_t_shop/features/shop/models/product_model.dart';
import 'package:app_t_shop/features/shop/screens/all_product/product_attribute_model.dart';
import 'package:app_t_shop/features/shop/screens/all_product/product_variation_model.dart';
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

  static final List<ProductModel> products = [

  ProductModel(
    id: '001',
    title: 'Green Nike sports shoe',
    stock: 15,
    price: 135,
    isFeatured: true,
    thumbnail: TImages.productImage11,
    description: 'Green Nike sports shoe',
    brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
    images: [TImages.productImage1, TImages.productImage23, TImages.productImage21, TImages.productImage9],
    salePrice: 30,
    sku: 'ABR4568',
    categoryId: '1',
    productAttributes: [
      ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
      ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
    ],
    productVariations: [
      ProductVariationModel(
        id: '1',
        stock: 34,
        price: 134,
        salePrice: 122.6,
        image: TImages.productImage1,
        description: 'This is a Product description for Green Nike sports shoe.',
        attributeValues: {'Color': 'Green', 'Size': 'EU 34'},),
      ProductVariationModel(
          id: '2',
          stock: 15,
          price: 132,
          image: TImages.productImage23,
          description: 'This is a Product description for Green Nike sports shoe.',
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
      ProductVariationModel(
          id: '3',
          stock: 0,
          price: 345,
          image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
      ProductVariationModel(
          id: '4',
          stock: 222,
          price: 132,
          image: TImages.productImage1,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
      ProductVariationModel(
          id: '5',
          stock: 0,
          price: 132,
          image: TImages.productImage21,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
      ProductVariationModel(
          id: '6',
          stock: 11,
          price: 132,
          image: TImages.productImage21,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),

    ],
    productType: 'ProductType.variable',
  ),
    ProductModel(
      id: '002',
      title: 'Green Nike sports shoe',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: TImages.productImage69,
      description: 'This is a Product description for Green Nike sports shoe.',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
      images: [TImages.productImage68, TImages.productImage69, TImages.productImage5],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['UE34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),

      ],
      productType: 'ProductType.single',
    ),

    ProductModel(
      id: '003',
      title: 'Leather brown Jacket',
      stock: 15,
      price: 38000,
      isFeatured: true,
      thumbnail: TImages.productImage64,
      description: 'This is a Product description for Green Nike sports shoe.',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
      images: [TImages.productImage64, TImages.productImage65, TImages.productImage66, TImages.productImage67],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['UE34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),

    ProductModel(
      id: '004',
      title: '4 Color collar t-shirt dry fit',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: TImages.productImage60,
      description: 'This is a Product description for 4 Color collar t-shirt dry fit.',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
      images: [TImages.productImage60, TImages.productImage61, TImages.productImage62, TImages.productImage63],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['UE34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 34,
            price: 134,
            image: TImages.productImage60,
            description: 'This is a Product description for 4 Color collar t-shirt dry fit.',
            attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
        ProductVariationModel(
            id: '2',stock: 15, image: TImages.productImage60, price: 132, attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
        ProductVariationModel(
            id: '3',stock: 0, image: TImages.productImage61, price: 234, attributeValues: {'Color': 'Yellow', 'Size': 'EU 30'}),
        ProductVariationModel(
            id: '4',stock: 222, image: TImages.productImage61, price: 345, attributeValues: {'Color': 'BLue', 'Size': 'EU 34'}),
        ProductVariationModel(
            id: '5',stock: 0, image: TImages.productImage62, price: 654, attributeValues: {'Color': 'Yellow', 'Size': 'EU 32'}),
        ProductVariationModel(
            id: '6',stock: 45, image: TImages.productImage62, price: 111, attributeValues: {'Color': 'BLue', 'Size': 'EU 34'}),
        ProductVariationModel(
            id: '7',stock: 65, image: TImages.productImage63, price: 231, attributeValues: {'Color': 'BLue', 'Size': 'EU 36'}),
        ProductVariationModel(
            id: '8',stock: 11, image: TImages.productImage63, price: 342, attributeValues: {'Color': 'Yellow', 'Size': 'EU 31'}),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '005',
      title: 'Nike Air Jordon Shoes',
      stock: 15,
      price: 35,
      isFeatured: false,
      thumbnail: TImages.productImage10,
      description: 'This is a Product description for Nike Air Jordon Shoes.',
      brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike',productsCount: 265,isFeatured: true),
      images: [TImages.productImage7, TImages.productImage8, TImages.productImage9, TImages.productImage10],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['UE34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 16,
            price: 36,
            image: TImages.productImage8,
            description: 'This is a Product description for 4 Color collar t-shirt dry fit.',
            attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
        ProductVariationModel(
            id: '2',stock: 15, image: TImages.productImage7, price: 132, attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
        ProductVariationModel(
            id: '3',stock: 0, image: TImages.productImage9, price: 234, attributeValues: {'Color': 'Yellow', 'Size': 'EU 30'}),
        ProductVariationModel(
            id: '4',stock: 222, image: TImages.productImage7, price: 345, attributeValues: {'Color': 'BLue', 'Size': 'EU 34'}),
        ProductVariationModel(
            id: '5',stock: 0, image: TImages.productImage9, price: 654, attributeValues: {'Color': 'Yellow', 'Size': 'EU 32'}),
        ProductVariationModel(
            id: '6',stock: 45, image: TImages.productImage8, price: 111, attributeValues: {'Color': 'BLue', 'Size': 'EU 34'}),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '006',
      title: 'SAMSUNG Galaxy S9',
      stock: 15,
      price: 750,
      isFeatured: false,
      thumbnail: TImages.productImage11,
      description: 'This is a Product description for SAMSUNG Galaxy S9.',
      brand: BrandModel(id: '7', image: TImages.appleLogo, name: 'Samsung'),
      images: [TImages.productImage11, TImages.productImage12, TImages.productImage13, TImages.productImage12],
      salePrice: 60,
      sku: 'ABR4568',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['UE34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),

    ProductModel(
      id: '009',
      title: 'Nike Air Jordon 19 Blue',
      stock: 15,
      price: 750,
      isFeatured: false,
      thumbnail: TImages.productImage19,
      description: 'This is a Product description for SAMSUNG Galaxy S9.',
      brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike'),
      images: [TImages.productImage19, TImages.productImage20, TImages.productImage21, TImages.productImage22],
      salePrice: 200,
      sku: 'ABR4568',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['UE34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
  ];
}

