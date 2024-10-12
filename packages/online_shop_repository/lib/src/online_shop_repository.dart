import 'package:app_data_provider/app_data_provider.dart';
import 'package:dio/dio.dart';
import 'package:dio_provider/dio_provider.dart';
import 'package:online_shop_repository/src/dto/create_order.dart';
import 'package:online_shop_repository/src/dto/find_all_order.dart';
import 'package:online_shop_repository/src/models/order.dart';
import 'package:online_shop_repository/src/models/order_create.dart';
import 'package:online_shop_repository/src/models/order_detail.dart';
import 'package:online_shop_repository/src/models/tracking.dart';

abstract class OnlineShopRepository {
  Future<List<OrderModel>> findAll({
    String? outletId,
    required FindAllOrderDto dto,
  });
  Future<OrderCreateModel> create({
    String? outletId,
    required CreateOrderDto dto,
  });
  Future<Tracking> track({
    String? outletId,
    required String orderId,
  });
  Future<OrderDetailModel> findOne({
    String? outletId,
    required String orderId,
  });
  Future<void> proceed({
    String? outletId,
    required String orderId,
  });
}

class OnlineShopRepositoryImpl implements OnlineShopRepository {
  final String _baseURL = "/onlineshop";
  final Dio _dio = DioProvider().dio;
  final AppDataProvider _appDataProvider = AppDataProvider();

  @override
  Future<List<OrderModel>> findAll({
    String? outletId,
    required FindAllOrderDto dto,
  }) async {
    final outlet = await _getOutletId(outletId: outletId);

    final response = await _dio
        .get<List<dynamic>>("$_baseURL/$outlet/orders?${dto.toQueryString()}");

    return response.data!.map((e) => OrderModel.fromJson(e)).toList();
  }

  @override
  Future<OrderCreateModel> create({
    String? outletId,
    required CreateOrderDto dto,
  }) async {
    final outlet = await _getOutletId(outletId: outletId);

    final response =
        await _dio.post("$_baseURL/$outlet/orders", data: dto.toJson());

    return OrderCreateModel.fromJson(response.data);
  }

  @override
  Future<OrderDetailModel> findOne({
    String? outletId,
    required String orderId,
  }) async {
    final outlet = await _getOutletId(outletId: outletId);

    final response = await _dio.get("$_baseURL/$outlet/orders/$orderId");

    return OrderDetailModel.fromJson(response.data);
  }

  @override
  Future<void> proceed({String? outletId, required String orderId}) async {
    final outlet = await _getOutletId(outletId: outletId);

    final response =
        await _dio.post("$_baseURL/$outlet/orders/$orderId/procced");

    return response.data;
  }

  @override
  Future<Tracking> track({
    String? outletId,
    required String orderId,
  }) async {
    final outlet = await _getOutletId(outletId: outletId);

    final response = await _dio.get("$_baseURL/$outlet/orders/$orderId/track");

    return Tracking.fromJson(response.data);
  }

  Future<String> _getOutletId({String? outletId}) async {
    final outlet = outletId ?? await _appDataProvider.outletId;
    return outlet;
  }
}
