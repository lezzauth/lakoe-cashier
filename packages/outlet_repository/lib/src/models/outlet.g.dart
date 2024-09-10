// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OutletModelImpl _$$OutletModelImplFromJson(Map<String, dynamic> json) =>
    _$OutletModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$OutletModelImplToJson(_$OutletModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$DetailCustomerCountImpl _$$DetailCustomerCountImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailCustomerCountImpl(
      orders: (json['orders'] as num).toInt(),
    );

Map<String, dynamic> _$$DetailCustomerCountImplToJson(
        _$DetailCustomerCountImpl instance) =>
    <String, dynamic>{
      'orders': instance.orders,
    };

_$DetailCustomerOwnerImpl _$$DetailCustomerOwnerImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailCustomerOwnerImpl(
      coin: (json['coin'] as num).toInt(),
      ownerId: json['ownerId'] as String,
    );

Map<String, dynamic> _$$DetailCustomerOwnerImplToJson(
        _$DetailCustomerOwnerImpl instance) =>
    <String, dynamic>{
      'coin': instance.coin,
      'ownerId': instance.ownerId,
    };

_$DetailCustomerOrderCountImpl _$$DetailCustomerOrderCountImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailCustomerOrderCountImpl(
      items: (json['items'] as num).toInt(),
    );

Map<String, dynamic> _$$DetailCustomerOrderCountImplToJson(
        _$DetailCustomerOrderCountImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

_$DetailCustomerOrderTransactionImpl
    _$$DetailCustomerOrderTransactionImplFromJson(Map<String, dynamic> json) =>
        _$DetailCustomerOrderTransactionImpl(
          id: json['id'] as String,
          no: (json['no'] as num).toInt(),
          paymentMethod: json['paymentMethod'] as String,
          status: json['status'] as String,
          paidAmount: json['paidAmount'] as String,
          paidFrom: json['paidFrom'] as String,
          amount: json['amount'] as String,
          change: json['change'] as String,
          accountNumber: json['accountNumber'] as String?,
          photo: json['photo'] as String?,
          orderId: json['orderId'] as String,
          outletId: json['outletId'] as String,
          createdAt: json['createdAt'] as String,
          updatedAt: json['updatedAt'] as String,
        );

Map<String, dynamic> _$$DetailCustomerOrderTransactionImplToJson(
        _$DetailCustomerOrderTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'no': instance.no,
      'paymentMethod': instance.paymentMethod,
      'status': instance.status,
      'paidAmount': instance.paidAmount,
      'paidFrom': instance.paidFrom,
      'amount': instance.amount,
      'change': instance.change,
      'accountNumber': instance.accountNumber,
      'photo': instance.photo,
      'orderId': instance.orderId,
      'outletId': instance.outletId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

_$DetailCustomerOrderImpl _$$DetailCustomerOrderImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailCustomerOrderImpl(
      id: json['id'] as String,
      no: (json['no'] as num).toInt(),
      status: json['status'] as String,
      price: json['price'] as String,
      customerId: json['customerId'] as String?,
      paymentStatus: json['paymentStatus'] as String,
      customerType: json['customerType'] as String,
      type: json['type'] as String,
      source: json['source'] as String,
      outletId: json['outletId'] as String,
      tableId: json['tableId'] as String?,
      cashierId: json['cashierId'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      transactions: (json['transactions'] as List<dynamic>)
          .map((e) => DetailCustomerOrderTransaction.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      count: DetailCustomerOrderCount.fromJson(
          json['_count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailCustomerOrderImplToJson(
        _$DetailCustomerOrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'no': instance.no,
      'status': instance.status,
      'price': instance.price,
      'customerId': instance.customerId,
      'paymentStatus': instance.paymentStatus,
      'customerType': instance.customerType,
      'type': instance.type,
      'source': instance.source,
      'outletId': instance.outletId,
      'tableId': instance.tableId,
      'cashierId': instance.cashierId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'transactions': instance.transactions,
      '_count': instance.count,
    };

_$DetailCustomerImpl _$$DetailCustomerImplFromJson(Map<String, dynamic> json) =>
    _$DetailCustomerImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String?,
      address: json['address'] as String?,
      phoneNumber: json['phoneNumber'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      orders: (json['orders'] as List<dynamic>)
          .map((e) => DetailCustomerOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
      owners: (json['owners'] as List<dynamic>)
          .map((e) => DetailCustomerOwner.fromJson(e as Map<String, dynamic>))
          .toList(),
      count:
          DetailCustomerCount.fromJson(json['_count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailCustomerImplToJson(
        _$DetailCustomerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'orders': instance.orders,
      'owners': instance.owners,
      '_count': instance.count,
    };

_$DetailSummaryImpl _$$DetailSummaryImplFromJson(Map<String, dynamic> json) =>
    _$DetailSummaryImpl(
      totalPrice: json['totalPrice'] as String,
      count: (json['count'] as num).toInt(),
      favorite: json['favorite'] as String,
    );

Map<String, dynamic> _$$DetailSummaryImplToJson(_$DetailSummaryImpl instance) =>
    <String, dynamic>{
      'totalPrice': instance.totalPrice,
      'count': instance.count,
      'favorite': instance.favorite,
    };

_$DetailCustomerOutletResponseImpl _$$DetailCustomerOutletResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DetailCustomerOutletResponseImpl(
      customer:
          DetailCustomer.fromJson(json['customer'] as Map<String, dynamic>),
      summary: DetailSummary.fromJson(json['summary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DetailCustomerOutletResponseImplToJson(
        _$DetailCustomerOutletResponseImpl instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'summary': instance.summary,
    };

_$OutletReportModelImpl _$$OutletReportModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OutletReportModelImpl(
      total_sales: OutletReportTotalSaleModel.fromJson(
          json['total_sales'] as Map<String, dynamic>),
      total_transactions: OutletReportTotalTransactionModel.fromJson(
          json['total_transactions'] as Map<String, dynamic>),
      timeWindow: OutletReportTimeWindow.fromJson(
          json['timeWindow'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OutletReportModelImplToJson(
        _$OutletReportModelImpl instance) =>
    <String, dynamic>{
      'total_sales': instance.total_sales,
      'total_transactions': instance.total_transactions,
      'timeWindow': instance.timeWindow,
    };

_$OutletReportTotalSaleModelImpl _$$OutletReportTotalSaleModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OutletReportTotalSaleModelImpl(
      current: json['current'] as String,
      past: json['past'] as String,
      diff: (json['diff'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OutletReportTotalSaleModelImplToJson(
        _$OutletReportTotalSaleModelImpl instance) =>
    <String, dynamic>{
      'current': instance.current,
      'past': instance.past,
      'diff': instance.diff,
    };

_$OutletReportTotalTransactionModelImpl
    _$$OutletReportTotalTransactionModelImplFromJson(
            Map<String, dynamic> json) =>
        _$OutletReportTotalTransactionModelImpl(
          current: (json['current'] as num).toInt(),
          past: (json['past'] as num).toInt(),
          diff: (json['diff'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$OutletReportTotalTransactionModelImplToJson(
        _$OutletReportTotalTransactionModelImpl instance) =>
    <String, dynamic>{
      'current': instance.current,
      'past': instance.past,
      'diff': instance.diff,
    };

_$OutletReportTimeWindowImpl _$$OutletReportTimeWindowImplFromJson(
        Map<String, dynamic> json) =>
    _$OutletReportTimeWindowImpl(
      current: TimeRange.fromJson(json['current'] as Map<String, dynamic>),
      past: TimeRange.fromJson(json['past'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OutletReportTimeWindowImplToJson(
        _$OutletReportTimeWindowImpl instance) =>
    <String, dynamic>{
      'current': instance.current,
      'past': instance.past,
    };

_$TimeRangeImpl _$$TimeRangeImplFromJson(Map<String, dynamic> json) =>
    _$TimeRangeImpl(
      start: json['start'] as String,
      end: json['end'] as String,
    );

Map<String, dynamic> _$$TimeRangeImplToJson(_$TimeRangeImpl instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
    };
