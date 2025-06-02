import 'dart:ui';

import 'package:app_t_shop/features/personalization/models/address_model.dart';
import 'package:app_t_shop/features/shop/models/cart_item_model.dart';
import 'package:app_t_shop/utils/constants/enums.dart';
import 'package:app_t_shop/utils/helpers/helper_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderModel{
  final String id;
  final String userId;
  final OrderStatus status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel?  address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;

  OrderModel({
    required this.id,
    this.userId = '',
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = 'Paypal',
    this.address,
    this.deliveryDate,
    required this.items
  });

  Color get statusColor {
    switch (status) {
      case OrderStatus.processing:
        return Colors.orange;
      case OrderStatus.shipped:
        return Colors.blue;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.pending:
        return Colors.black;
      case OrderStatus.canceled:
        return Colors.red;
    }
  }


  String get orderStatusText {
    switch (status) {
      case OrderStatus.processing:
        return 'Đang xử lý';
      case OrderStatus.shipped:
        return 'Đang giao hàng';
      case OrderStatus.delivered:
        return 'Giao hàng thành công';
      case OrderStatus.pending:
        return 'Chờ xác nhận';
      case OrderStatus.canceled:
        return 'Đơn hàng bị hủy';
    }
  }

  /// Getter ngày giao dự kiến = ngày đặt + 3 ngày
  DateTime get estimatedDeliveryDate => orderDate.add(const Duration(days: 3));

  // Thay đổi phần formatterDeliveryDate nếu muốn dùng estimatedDeliveryDate:
  String get formatterEstimatedDeliveryDate => THelperFunctions.getFormattedDate(estimatedDeliveryDate);

  String get formatterOrderDate => THelperFunctions.getFormattedDate(orderDate);

  String get formatterDeliveryDate => deliveryDate != null ? THelperFunctions.getFormattedDate(deliveryDate!) : '';

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'userId':userId,
      'status':status.toString(),
      'totalAmount':totalAmount,
      'orderDate':orderDate,
      'paymentMethod':paymentMethod,
      'address':address?.toJson(),
      'deliveryDate':deliveryDate,
      'items':items.map((item) => item.toJson()).toList(),
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot){
    final data = snapshot.data() as Map<String, dynamic>;

    return OrderModel(
        id: data['id'] as String,
        userId: data['userId'] as String,
        status: OrderStatus.values.firstWhere((e) => e.toString() == data['status']),
        totalAmount: data['totalAmount'] as double,
        orderDate: (data ['orderDate'] as Timestamp).toDate(),
        paymentMethod: data['paymentMethod'] as String,
        address: AddressModel.fromMap(data['address'] as Map<String, dynamic>),
        deliveryDate: data['deliveryDate'] == null ? null : (data['deliveryDate'] as Timestamp).toDate(),
        items: (data['items'] as List<dynamic>).map((itemData) => CartItemModel.fromJson(itemData as Map<String, dynamic>)).toList()
    );
  }


}