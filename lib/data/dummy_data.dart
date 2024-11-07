import 'package:app_t_shop/features/shop/models/banner_model.dart';
import 'package:app_t_shop/features/shop/models/brand_model.dart';
import 'package:app_t_shop/features/shop/models/category_model.dart';
import 'package:app_t_shop/features/shop/models/product_attribute_model.dart';
import 'package:app_t_shop/features/shop/models/product_model.dart';
import 'package:app_t_shop/features/shop/models/product_variation_model.dart';
import 'package:app_t_shop/routers/routers.dart';
import 'package:app_t_shop/utils/constants/image_strings.dart';

class TDummyData {


  static final List<BrandModel> brands = [
    BrandModel(id: '1', name: 'Nike', image: TImages.nikeLogo, isFeatured: true, productsCount: 265),
    BrandModel(id: '2', name: 'Adidas', image: TImages.adidasLogo, isFeatured: true, productsCount: 220),
    BrandModel(id: '3', name: 'Puma', image: TImages.pumaLogo, isFeatured: true, productsCount: 180),
    BrandModel(id: '4', name: 'Apple', image: TImages.appleLogo, isFeatured: true, productsCount: 200),
    BrandModel(id: '5', name: 'Acer', image: TImages.acerlogo, isFeatured: true, productsCount: 265),
    BrandModel(id: '6', name: 'Herman-miller', image: TImages.hermanMillerLogo, isFeatured: true, productsCount: 220),
    BrandModel(id: '7', name: 'Kenwood', image: TImages.kenwoodLogo, isFeatured: true, productsCount: 180),
    BrandModel(id: '8', name: 'Zara', image: TImages.zaraLogo, isFeatured: true, productsCount: 200),
    BrandModel(id: '9', name: 'Jordan', image: TImages.jordanLogo, isFeatured: true, productsCount: 180),
    BrandModel(id: '10', name: 'Ikea', image: TImages.ikeaLogo, isFeatured: true, productsCount: 200),
  ];



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

    // ProductModel(
    //   id: '001',
    //   title: 'Giày thể thao Nike Air Max',
    //   stock: 10,
    //   price: 250,
    //   isFeatured: true,
    //   thumbnail: TImages.productImage21,
    //   description: 'Đôi giày Nike Air Max, phong cách thể thao, cực kỳ thoải mái và bền bỉ.',
    //   brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
    //   images: [],
    //   salePrice: 210,
    //   sku: 'NIKE1234',
    //   categoryId: '1',
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Màu', values: ['Blue', 'Black', 'Green']),
    //     ProductAttributeModel(name: 'Size', values: ['40', '42', '44', '46']),
    //   ],
    //   productVariations: [
    //     ProductVariationModel(
    //         id: '1', stock: 20, price: 240, salePrice: 210, image: TImages.productImage21,
    //         description: 'Giày Nike Air Max màu Blue, size 40', attributeValues: {'Màu': 'Blue', 'Size': '40'}),
    //     ProductVariationModel(
    //         id: '2', stock: 15, price: 240, salePrice: 210, image: TImages.productImage22,
    //         description: 'Giày Nike Air Max màu Black, size 42', attributeValues: {'Màu': 'Black', 'Size': '42'}),
    //     ProductVariationModel(
    //         id: '3', stock: 0, price: 250, salePrice: 220, image: TImages.productImage23,
    //         description: 'Giày Nike Air Max màu Green, size 44', attributeValues: {'Màu': 'Green', 'Size': '44'}),
    //     ProductVariationModel(
    //         id: '4', stock: 5, price: 250, image: TImages.productImage9,
    //         description: 'Giày Nike Air Max màu Blue, size 46', attributeValues: {'Màu': 'Blue', 'Size': '46'}),
    //   ],
    //   productType: 'ProductType.variable',
    // ),
    //
    // ProductModel(
    //   id: '002',
    //   title: 'Áo khoác da nâu cổ điển',
    //   stock: 8,
    //   price: 320,
    //   isFeatured: true,
    //   thumbnail: TImages.productImage64,
    //   description: 'Áo khoác da chất lượng cao, màu nâu cổ điển, tạo phong cách mạnh mẽ.',
    //   brand: BrandModel(id: '2', image: TImages.zaraLogo, name: 'ZARA', productsCount: 150, isFeatured: true),
    //   images: [],
    //   salePrice: 290,
    //   sku: 'ZARA4567',
    //   categoryId: '2',
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Màu', values: ['Brown', 'Black']),
    //     ProductAttributeModel(name: 'Size', values: ['M', 'L', 'XL', 'XXL']),
    //   ],
    //   productVariations: [
    //     ProductVariationModel(
    //         id: '1', stock: 10, price: 300, salePrice: 290, image: TImages.productImage64,
    //         description: 'Áo khoác da màu Brown, size M', attributeValues: {'Màu': 'Brown', 'Size': 'M'}),
    //     ProductVariationModel(
    //         id: '2', stock: 12, price: 320, salePrice: 290, image: TImages.productImage65,
    //         description: 'Áo khoác da màu Black, size L', attributeValues: {'Màu': 'Black', 'Size': 'L'}),
    //     ProductVariationModel(
    //         id: '3', stock: 5, price: 340, image: TImages.productImage66,
    //         description: 'Áo khoác da màu Brown, size XL', attributeValues: {'Màu': 'Brown', 'Size': 'XL'}),
    //     ProductVariationModel(
    //         id: '4', stock: 3, price: 340, image: TImages.productImage64,
    //         description: 'Áo khoác da màu Black, size XXL', attributeValues: {'Màu': 'Black', 'Size': 'XXL'}),
    //   ],
    //   productType: 'ProductType.variable',
    // ),
    //
    // ProductModel(
    //   id: '003',
    //   title: 'Thức ăn cho cún cưng',
    //   stock: 20,
    //   price: 100,
    //   isFeatured: true,
    //   thumbnail: TImages.productImage18,
    //   description: 'Sản phẩm bestsale cho thú cưng',
    //   brand: BrandModel(id: '3', image: TImages.animalIcon, name: 'LoveDog', productsCount: 320, isFeatured: true),
    //   images: [],
    //   salePrice: 85,
    //   sku: 'ADI9876',
    //   categoryId: '5',
    //   productAttributes: [
    //
    //   ],
    //   productType: 'ProductType.single',
    // ),
    //
    // ProductModel(
    //   id: '004',
    //   title: 'iPhone 14 Series',
    //   stock: 100,
    //   price: 999,
    //   isFeatured: true,
    //   thumbnail: TImages.productImage52,
    //   description: 'Điện thoại iPhone 14 với thiết kế hiện đại, nhiều lựa chọn màu sắc.',
    //   brand: BrandModel(id: '6', image: TImages.appleLogo, name: 'Apple', productsCount: 300, isFeatured: true),
    //   images: [],
    //   salePrice: 950,
    //   sku: 'IPH1200',
    //   categoryId: '13',
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Màu', values: ['White', 'Black']),
    //     ProductAttributeModel(name: 'Size', values: ['64GB', '128GB', '256GB']),
    //   ],
    //   productVariations: [
    //     ProductVariationModel(
    //       id: '1',
    //       stock: 25,
    //       price: 980,
    //       salePrice: 930,
    //       image: TImages.productImage52,
    //       description: '',
    //       attributeValues: {'Màu': 'Black', 'Size': '64GB'},
    //     ),
    //     ProductVariationModel(
    //       id: '2',
    //       stock: 20,
    //       price: 990,
    //       image: TImages.productImage53,
    //       description: '',
    //       attributeValues: {'Màu': 'White', 'Size': '128GB'},
    //     ),
    //     ProductVariationModel(
    //       id: '3',
    //       stock: 30,
    //       price: 999,
    //       image: TImages.productImage52,
    //       description: '',
    //       attributeValues: {'Màu': 'Black', 'Size': '256GB'},
    //     ),
    //     ProductVariationModel(
    //       id: '4',
    //       stock: 25,
    //       price: 999,
    //       image: TImages.productImage53,
    //       description: '',
    //       attributeValues: {'Màu': 'White', 'Size': '128GB'},
    //     ),
    //     ProductVariationModel(
    //       id: '5',
    //       stock: 20,
    //       price: 1200,
    //       image: TImages.productImage53,
    //       description: '',
    //       attributeValues: {'Màu': 'White', 'Size': '256GB'},
    //     ),
    //     ProductVariationModel(
    //       id: '6',
    //       stock: 25,
    //       price: 1280,
    //       salePrice: 1030,
    //       image: TImages.productImage52,
    //       description: '',
    //       attributeValues: {'Màu': 'Black', 'Size': '128GB'},
    //     ),
    //   ],
    //   productType: 'ProductType.variable',
    // ),
    //
    // ProductModel(
    //   id: '005',
    //   title: 'Bộ đồ thể thao',
    //   stock: 30,
    //   price: 70,
    //   isFeatured: true,
    //   thumbnail: TImages.productImage26,
    //   description: 'Bộ đồ thể thao dáng slim fit, phong cách và thoải mái cho mọi dịp.',
    //   brand: BrandModel(id: '5', image: TImages.nikeLogo, name: 'Nike', productsCount: 90),
    //   images: [],
    //   salePrice: 65,
    //   sku: 'LEV5678',
    //   categoryId: '4',
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Màu', values: ['Blue', 'Black', 'Red', 'Green']),
    //     ProductAttributeModel(name: 'Size', values: ['S', 'L', 'M', 'XL']),
    //   ],
    //   productVariations: [
    //     ProductVariationModel(
    //         id: '1', stock: 20, price: 70, salePrice: 65, image: TImages.productImage25,
    //         description: 'Bộ đồ thể thao màu xanh, size S', attributeValues: {'Màu': 'Blue', 'Size': 'S'}),
    //     ProductVariationModel(
    //         id: '2', stock: 15, price: 70, salePrice: 65, image: TImages.productImage24,
    //         description: 'Bộ đồ thể thao màu đen, size M', attributeValues: {'Màu': 'Black', 'Size': 'M'}),
    //     ProductVariationModel(
    //         id: '3', stock: 10, price: 70, image: TImages.productImage25,
    //         description: 'Bộ đồ thể thao màu xanh, size L', attributeValues: {'Màu': 'Blue', 'Size': 'L'}),
    //     ProductVariationModel(
    //         id: '4', stock: 5, price: 70, image: TImages.productImage26,
    //         description: 'Bộ đồ thể thao màu đỏ, size XL', attributeValues: {'Màu': 'Red', 'Size': 'XL'}),
    //     ProductVariationModel(
    //         id: '5', stock: 5, price: 80, image: TImages.productImage27,
    //         description: 'Bộ đồ thể thao màu xanh lá cây, size S', attributeValues: {'Màu': 'Green', 'Size': 'S'}),
    //     ProductVariationModel(
    //         id: '6', stock: 5, price: 75, image: TImages.productImage27,
    //         description: 'Bộ đồ thể thao màu xanh lá cây, size L', attributeValues: {'Màu': 'Green', 'Size': 'L'}),
    //   ],
    //   productType: 'ProductType.variable',
    // ),
    //
    // ProductModel(
    //   id: '006',
    //   title: 'Nội thất phòng ngủ',
    //   stock: 25,
    //   price: 120,
    //   isFeatured: true,
    //   thumbnail: TImages.productImage32,
    //   description: 'Nội thất phòng ngủ.',
    //   brand: BrandModel(id: '6', image: TImages.ikeaLogo, name: 'Ikea', productsCount: 50),
    //   images: [TImages.productImage32, TImages.productImage33, TImages.productImage34, TImages.productImage35],
    //   salePrice: 110,
    //   sku: 'CAS1234',
    //   categoryId: '6',
    //   productAttributes: [
    //
    //   ],
    //   productType: 'ProductType.single',
    // ),
    //
    // ProductModel(
    //   id: '007',
    //   title: 'Dụng cụ thể thao',
    //   stock: 60,
    //   price: 40,
    //   isFeatured: true,
    //   thumbnail: TImages.productImage28,
    //   description: '',
    //   brand: BrandModel(id: '3', image: TImages.adidasLogo, name: 'Adidas', productsCount: 220),
    //   images: [TImages.productImage28, TImages.productImage29, TImages.productImage30, TImages.productImage31],
    //   salePrice: 35,
    //   sku: 'ADI4321',
    //   categoryId: '7',
    //   productAttributes: [
    //
    //   ],
    //   productType: 'ProductType.single',
    // ),
    //
    // ProductModel(
    //   id: '008',
    //   title: 'Dép thời trang',
    //   stock: 40,
    //   price: 150,
    //   isFeatured: true,
    //   thumbnail: TImages.productImage12,
    //   description: 'Dép thời trang hỗ trợ tối đa cho người đi bộ, nhẹ và bền.',
    //   brand: BrandModel(id: '7', image: TImages.pumaLogo, name: 'Asics', productsCount: 100),
    //   images: [],
    //   salePrice: 130,
    //   sku: 'ASC9987',
    //   categoryId: '8',
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Màu', values: ['White', 'Green']),
    //     ProductAttributeModel(name: 'Size', values: ['40', '42', '44', '46']),
    //   ],
    //   productVariations: [
    //     ProductVariationModel(
    //         id: '1', stock: 15, price: 150, salePrice: 130, image: TImages.productImage77,
    //         description: 'Dép thời trang màu trắng, size 40', attributeValues: {'Màu': 'White', 'Size': '40'}),
    //     ProductVariationModel(
    //         id: '2', stock: 20, price: 150, salePrice: 130, image: TImages.productImage74,
    //         description: 'Dép thời trang màu đen, size 42', attributeValues: {'Màu': 'White', 'Size': '42'}),
    //     ProductVariationModel(
    //         id: '3', stock: 10, price: 150, image: TImages.productImage75,
    //         description: 'Dép thời trang màu xanh, size 44', attributeValues: {'Màu': 'Green', 'Size': '44'}),
    //     ProductVariationModel(
    //         id: '4', stock: 5, price: 150, image: TImages.productImage76,
    //         description: 'Dép thời trang màu đen, size 46', attributeValues: {'Màu': 'Green', 'Size': '46'}),
    //   ],
    //   productType: 'ProductType.variable',
    // ),
    //
    // ProductModel(
    //   id: '009',
    //   title: 'Giường ngủ phong cách hiện đại',
    //   stock: 15,
    //   price: 300,
    //   isFeatured: true,
    //   thumbnail: TImages.productImage43,
    //   description: 'Giường ngủ bọc nệm phong cách hiện đại, tạo cảm giác thoải mái và êm ái.',
    //   brand: BrandModel(id: '8', image: TImages.ikeaLogo, name: 'FurniHome', productsCount: 30),
    //   images: [TImages.productImage43, TImages.productImage44, TImages.productImage45, TImages.productImage46],
    //   salePrice: 280,
    //   sku: 'BED1234',
    //   categoryId: '9',
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Màu', values: ['Black', 'Grey', 'Brown']),
    //   ],
    //   productType: 'ProductType.single',
    // ),
    //
    // ProductModel(
    //   id: '010',
    //   title: 'Bedroom Bed',
    //   stock: 20,
    //   price: 350,
    //   isFeatured: true,
    //   thumbnail: TImages.productImage32,
    //   description: 'Giường ngủ sang trọng với khung chắc chắn, màu sắc thanh lịch.',
    //   brand: BrandModel(id: '2', image: TImages.ikeaLogo, name: 'Home Decor'),
    //   images: [],
    //   salePrice: 299,
    //   sku: 'BED1234',
    //   categoryId: '2',
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Size', values: ['Queen', 'King']),
    //     ProductAttributeModel(name: 'Màu', values: ['Black', 'Grey', 'Brown']),
    //   ],
    //   productVariations: [
    //     ProductVariationModel(
    //       id: '1',
    //       stock: 5,
    //       price: 299,
    //       image: TImages.productImage43,
    //       attributeValues: {'Màu': 'Black', 'Size': 'Queen'},
    //     ),
    //     ProductVariationModel(
    //       id: '2',
    //       stock: 10,
    //       price: 320,
    //       image: TImages.productImage44,
    //       attributeValues: {'Màu': 'Grey', 'Size': 'King'},
    //     ),
    //     ProductVariationModel(
    //       id: '3',
    //       stock: 5,
    //       price: 350,
    //       image: TImages.productImage45,
    //       attributeValues: {'Màu': 'Brown', 'Size': 'King'},
    //     ),
    //   ],
    //   productType: 'ProductType.variable',
    // ),
    //
    //
    // ProductModel(
    //   id: '011',
    //   title: 'Bàn ăn',
    //   stock: 15,
    //   price: 250,
    //   isFeatured: true,
    //   thumbnail: TImages.productImage37,
    //   description: 'Bàn ăn hiện đại cho không gian bếp gia đình.',
    //   brand: BrandModel(id: '3', image: TImages.ikeaLogo, name: 'Home Decor', productsCount: 75, isFeatured: true),
    //   images: [],
    //   salePrice: 220,
    //   sku: 'KDT002',
    //   categoryId: '11',
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Màu', values: ['White', 'Black']),
    //     ProductAttributeModel(name: 'Size', values: ['4-Seater', '6-Seater']),
    //   ],
    //   productVariations: [
    //     ProductVariationModel(
    //       id: '1',
    //       stock: 10,
    //       price: 240,
    //       salePrice: 210,
    //       image: TImages.productImage36,
    //       description: 'Bàn ăn trắng thanh lịch, 4 chỗ ngồi.',
    //       attributeValues: {'Màu': 'White', 'Size': '4-Seater'},
    //     ),
    //     ProductVariationModel(
    //       id: '2',
    //       stock: 5,
    //       price: 250,
    //       image: TImages.productImage37,
    //       description: 'Bàn ăn đen hiện đại, 6 chỗ ngồi.',
    //       attributeValues: {'Màu': 'Black', 'Size': '6-Seater'},
    //     ),
    //     ProductVariationModel(
    //       id: '2',
    //       stock: 5,
    //       price: 250,
    //       image: TImages.productImage38,
    //       description: 'Bàn ăn đen hiện đại, 6 chỗ ngồi.',
    //       attributeValues: {'Màu': 'Black', 'Size': '6-Seater'},
    //     ),
    //   ],
    //   productType: 'ProductType.variable',
    // ),
    //
    // ProductModel(
    //   id: '012',
    //   title: 'Áo phông cổ bẻ',
    //   stock: 40,
    //   price: 20,
    //   isFeatured: true,
    //   thumbnail: TImages.productImage54,
    //   description: 'Áo phông cổ bẻ phong cách thời trang, phù hợp cho các hoạt động hàng ngày.',
    //   brand: BrandModel(id: '11', image: TImages.zaraLogo, name: 'FashionWear', productsCount: 60),
    //   images: [],
    //   salePrice: 18,
    //   sku: 'SHIRT123',
    //   categoryId: '2',
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Màu', values: ['Blue', 'Red', 'Yellow', 'Green', 'Black']),
    //     ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L', 'XL']),
    //   ],
    //   productVariations: [
    //     ProductVariationModel(
    //         id: '1', stock: 10, price: 20, salePrice: 18, image: TImages.productImage54,
    //         description: '', attributeValues: {'Màu': 'Blue', 'Size': 'S'}),
    //     ProductVariationModel(
    //         id: '2', stock: 15, price: 20, salePrice: 18, image: TImages.productImage55,
    //         description: '', attributeValues: {'Màu': 'Blue', 'Size': 'M'}),
    //     ProductVariationModel(
    //         id: '3', stock: 8, price: 20, salePrice: 18, image: TImages.productImage5,
    //         description: '', attributeValues: {'Màu': 'Black', 'Size': 'L'}),
    //     ProductVariationModel(
    //         id: '3', stock: 8, price: 20, salePrice: 18, image: TImages.productImage4,
    //         description: '', attributeValues: {'Màu': 'Blue', 'Size': 'L'}),
    //     ProductVariationModel(
    //         id: '3', stock: 8, price: 20, salePrice: 18, image: TImages.productImage3,
    //         description: '', attributeValues: {'Màu': 'Black', 'Size': 'L'}),
    //   ],
    //   productType: 'ProductType.variable',
    // ),
    //
    //
    //
    // ProductModel(
    //   id: '013',
    //   title: 'Dép đi trong nhà',
    //   stock: 60,
    //   price: 10,
    //   isFeatured: false,
    //   thumbnail: TImages.productImage74,
    //   description: 'Dép mềm mại, thoải mái và an toàn cho việc sử dụng trong nhà.',
    //   brand: BrandModel(id: '13', image: TImages.adidasLogo, name: 'HomeComfort', productsCount: 25),
    //   images: [TImages.productImage74, TImages.productImage75, TImages.productImage76, TImages.productImage77],
    //   salePrice: 8,
    //   sku: 'SLIPPER10',
    //   categoryId: '13',
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L']),
    //   ],
    //   productType: 'ProductType.single',
    // ),

    // ProductModel(
    //   id: '014',
    //   title: 'Acer Laptop',
    //   stock: 30,
    //   price: 900,
    //   isFeatured: true,
    //   thumbnail: TImages.productImage47,
    //   description: 'Laptop Acer cấu hình mạnh mẽ cho công việc và giải trí.',
    //   brand: BrandModel(id: '4', image: TImages.acerlogo, name: 'Acer', productsCount: 200, isFeatured: true),
    //   images: [],
    //   salePrice: 850,
    //   sku: 'ACL003',
    //   categoryId: '5',
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Size', values: ['13-inch', '15-inch']),
    //   ],
    //   productVariations: [
    //     ProductVariationModel(
    //       id: '1',
    //       stock: 15,
    //       price: 870,
    //       salePrice: 820,
    //       image: TImages.productImage48,
    //       description: 'Laptop Acer 13-inch, màn hình Full HD.',
    //       attributeValues: {'Size': '13-inch'},
    //     ),
    //     ProductVariationModel(
    //       id: '2',
    //       stock: 15,
    //       price: 900,
    //       image: TImages.productImage50,
    //       description: 'Laptop Acer 15-inch, màn hình 4K UHD.',
    //       attributeValues: {'Size': '15-inch'},
    //     ),
    //   ],
    //   productType: 'ProductType.variable',
    // ),
    //
    // ProductModel(
    //   id: '015',
    //   title: 'Office Desk Set',
    //   stock: 25,
    //   price: 450,
    //   isFeatured: true,
    //   thumbnail: TImages.productImage41,
    //   description: 'Bộ bàn làm việc hiện đại cho văn phòng, tiện nghi và phong cách.',
    //   brand: BrandModel(id: '5', image: TImages.ikeaLogo, name: 'Ikea', productsCount: 50, isFeatured: true),
    //   images: [],
    //   salePrice: 420,
    //   sku: 'ODS001',
    //   categoryId: '12',
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Màu', values: ['White', 'Black', 'Brown']),
    //     ProductAttributeModel(name: 'Size', values: ['Vừa', 'Lớn']),
    //   ],
    //   productVariations: [
    //     ProductVariationModel(
    //       id: '1',
    //       stock: 10,
    //       price: 430,
    //       salePrice: 400,
    //       image: TImages.productImage41,
    //       description: '',
    //       attributeValues: {'Màu': 'Brown', 'Size': 'Vừa'},
    //     ),
    //     ProductVariationModel(
    //       id: '2',
    //       stock: 8,
    //       price: 450,
    //       image: TImages.productImage42,
    //       description: '',
    //       attributeValues: {'Màu': 'White', 'Size': 'Lớn'},
    //     ),
    //     ProductVariationModel(
    //       id: '3',
    //       stock: 7,
    //       price: 440,
    //       image: TImages.productImage40,
    //       description: '',
    //       attributeValues: {'Màu': 'Black', 'Size': 'Vừa'},
    //     ),ProductVariationModel(
    //       id: '3',
    //       stock: 7,
    //       price: 440,
    //       image: TImages.productImage39,
    //       description: '',
    //       attributeValues: {'Màu': 'White', 'Size': 'Vừa'},
    //     ),
    //   ],
    //   productType: 'ProductType.variable',
    // ),
    //
    // ProductModel(
    //   id: '016',
    //   title: 'iPhone 12 Series',
    //   stock: 100,
    //   price: 999,
    //   isFeatured: true,
    //   thumbnail: TImages.productImage70,
    //   description: 'Điện thoại iPhone 12 với thiết kế hiện đại, nhiều lựa chọn màu sắc.',
    //   brand: BrandModel(id: '6', image: TImages.appleLogo, name: 'Apple', productsCount: 300, isFeatured: true),
    //   images: [],
    //   salePrice: 950,
    //   sku: 'IPH1200',
    //   categoryId: '13',
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Màu', values: ['Red', 'Blue', 'Green', 'Black']),
    //     ProductAttributeModel(name: 'Size', values: ['64GB', '128GB', '256GB']),
    //   ],
    //   productVariations: [
    //     ProductVariationModel(
    //       id: '1',
    //       stock: 25,
    //       price: 980,
    //       salePrice: 930,
    //       image: TImages.productImage70,
    //       description: 'iPhone 12 màu đỏ, dung lượng 64GB.',
    //       attributeValues: {'Màu': 'Red', 'Size': '64GB'},
    //     ),
    //     ProductVariationModel(
    //       id: '2',
    //       stock: 20,
    //       price: 990,
    //       image: TImages.productImage71,
    //       description: 'iPhone 12 màu xanh, dung lượng 128GB.',
    //       attributeValues: {'Màu': 'Blue', 'Size': '128GB'},
    //     ),
    //     ProductVariationModel(
    //       id: '3',
    //       stock: 30,
    //       price: 999,
    //       image: TImages.productImage72,
    //       description: 'iPhone 12 màu xanh lá, dung lượng 256GB.',
    //       attributeValues: {'Màu': 'Green', 'Size': '256GB'},
    //     ),
    //     ProductVariationModel(
    //       id: '4',
    //       stock: 25,
    //       price: 999,
    //       image: TImages.productImage73,
    //       description: 'iPhone 12 màu đen, dung lượng 128GB.',
    //       attributeValues: {'Màu': 'Black', 'Size': '128GB'},
    //     ),
    //     ProductVariationModel(
    //       id: '5',
    //       stock: 20,
    //       price: 1200,
    //       image: TImages.productImage71,
    //       description: 'iPhone 12 màu xanh, dung lượng 128GB.',
    //       attributeValues: {'Màu': 'Blue', 'Size': '256GB'},
    //     ),
    //     ProductVariationModel(
    //       id: '6',
    //       stock: 25,
    //       price: 1280,
    //       salePrice: 1030,
    //       image: TImages.productImage70,
    //       description: 'iPhone 12 màu đỏ, dung lượng 128GB.',
    //       attributeValues: {'Màu': 'Red', 'Size': '128GB'},
    //     ),
    //   ],
    //   productType: 'ProductType.variable',
    // ),

    ProductModel(
      id: '017',
      title: 'Blue T-shirt without Collar',
      stock: 50,
      price: 25,
      isFeatured: false,
      thumbnail: TImages.productImage69,
      description: 'Áo thun màu xanh không cổ, thoáng mát và thời trang.',
      brand: BrandModel(id: '7', image: TImages.pumaLogo, name: 'Urban Wear', productsCount: 180, isFeatured: true),
      images: [],
      salePrice: 20,
      sku: 'TSH004',
      categoryId: '14',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 15,
          price: 23,
          salePrice: 19,
          image: TImages.productImage68,
          description: 'Áo thun xanh size S.',
          attributeValues: {'Size': 'S'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 20,
          price: 24,
          image: TImages.productImage69,
          description: 'Áo thun xanh size M.',
          attributeValues: {'Size': 'M'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 10,
          price: 25,
          image: TImages.productImage54,
          description: 'Áo thun xanh size L.',
          attributeValues: {'Size': 'L'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 5,
          price: 25,
          image: TImages.productImage54,
          description: 'Áo thun xanh size XL.',
          attributeValues: {'Size': 'XL'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '018',
      title: 'Samsung S9',
      stock: 100,
      price: 999,
      isFeatured: true,
      thumbnail: TImages.productImage11,
      description: 'Điện thoại Samsung S9 với thiết kế hiện đại, nhiều lựa chọn màu sắc.',
      brand: BrandModel(id: '6', image: TImages.appleLogo, name: 'Samsung', productsCount: 300, isFeatured: true),
      images: [],
      salePrice: 950,
      sku: 'IPH1200',
      categoryId: '13',
      productAttributes: [
        ProductAttributeModel(name: 'Màu', values: ['White', 'Black']),
        ProductAttributeModel(name: 'Size', values: ['64GB', '128GB', '256GB']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 25,
          price: 980,
          salePrice: 930,
          image: TImages.productImage11,
          description: '',
          attributeValues: {'Màu': 'Black', 'Size': '64GB'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 20,
          price: 990,
          image: TImages.productImage13,
          description: '',
          attributeValues: {'Màu': 'White', 'Size': '128GB'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 30,
          price: 999,
          image: TImages.productImage12,
          description: '',
          attributeValues: {'Màu': 'Black', 'Size': '256GB'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 25,
          price: 999,
          image: TImages.productImage13,
          description: '',
          attributeValues: {'Màu': 'White', 'Size': '128GB'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 20,
          price: 1200,
          image: TImages.productImage13,
          description: '',
          attributeValues: {'Màu': 'White', 'Size': '256GB'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 25,
          price: 1280,
          salePrice: 1030,
          image: TImages.productImage12,
          description: '',
          attributeValues: {'Màu': 'Black', 'Size': '128GB'},
        ),
      ],
      productType: 'ProductType.variable',
    ),

  ];
}

