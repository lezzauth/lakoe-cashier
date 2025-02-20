import 'package:order_repository/order_repository.dart';
import 'package:owner_repository/owner_repository.dart';

class TemplateOrderModel {
  OrderModel order;
  OwnerProfileModel ownerProfile;

  TemplateOrderModel()
      : order = OrderModel(
          id: "883794cb-1f36-49f9-a8cb-cb71453d8e14",
          no: 0,
          status: "COMPLETED",
          price: "20000",
          customerId: null,
          paymentStatus: "PAID",
          customerType: "GUEST",
          type: "DINEIN",
          source: "CASHIER",
          outletId: "ae3bf4f9-7eab-41b3-8cd9-ff8ded72f89b",
          tableId: null,
          cashierId: "46279fff-897c-4d09-8848-d55136c3400b",
          createdAt: DateTime.now().toIso8601String(),
          closedAt: DateTime.now().toIso8601String(),
          updatedAt: DateTime.now().toIso8601String(),
          customer: null,
          charges: [
            OrderCharge(
              id: "d753d65d-f0da-40b7-89ae-e6f60b225be2",
              orderId: "883794cb-1f36-49f9-a8cb-cb71453d8e14",
              name: "PB1",
              type: "TAX",
              amount: "2000",
              isPercentage: true,
              percentageValue: 10,
              createdAt: DateTime.now().toIso8601String(),
              updatedAt: DateTime.now().toIso8601String(),
            ),
          ],
          discount: [],
          cashier: OrderCashier(
            id: "46279fff-897c-4d09-8848-d55136c3400b",
            status: "OPEN",
            initialBalance: "100000",
            finalBalance: "122000",
            outletId: "ae3bf4f9-7eab-41b3-8cd9-ff8ded72f89b",
            operatorId: "f2dbe91f-49ec-4664-be4c-dcf8a4e63565",
            openedAt: DateTime.now().toIso8601String(),
            closedAt: null,
            operator: OrderOperator(name: "Abel Fay"),
          ),
          table: null,
          transactions: [
            Transactions(
              id: "1f72f594-9708-4065-8f9f-1c967c89d75b",
              paymentMethod: "CASH",
              status: "PAID",
              paidAmount: "25000",
              paidFrom: "CASHIER",
              amount: "22000",
              change: "3000",
              accountNumber: null,
              photo: null,
              externalId: null,
              approvalCode: null,
              orderId: "883794cb-1f36-49f9-a8cb-cb71453d8e14",
              outletId: "ae3bf4f9-7eab-41b3-8cd9-ff8ded72f89b",
              createdAt: DateTime.now().toIso8601String(),
              updatedAt: DateTime.now().toIso8601String(),
            ),
          ],
          items: [
            OrderItem(
              id: "1",
              notes: "Gulanya sedikit",
              price: "5000",
              quantity: 1,
              orderId: "order_1",
              productId: "product_1",
              createdAt: DateTime.now().toIso8601String(),
              updatedAt: DateTime.now().toIso8601String(),
              product: OrderItemProduct(
                name: "Kopi Hitam",
                price: "5000",
                images: [],
              ),
            ),
            OrderItem(
              id: "2",
              notes: '',
              price: "5000",
              quantity: 1,
              orderId: "order_2",
              productId: "product_2",
              createdAt: DateTime.now().toIso8601String(),
              updatedAt: DateTime.now().toIso8601String(),
              product: OrderItemProduct(
                name: "Es Teh",
                price: "5000",
                images: [],
              ),
            ),
            OrderItem(
              id: "3",
              notes: '',
              price: "10000",
              quantity: 1,
              orderId: "order_2",
              productId: "product_2",
              createdAt: DateTime.now().toIso8601String(),
              updatedAt: DateTime.now().toIso8601String(),
              product: OrderItemProduct(
                name: "Mie Goreng",
                price: "10000",
                images: [],
              ),
            ),
          ],
        ),
        ownerProfile = OwnerProfileModel(
          id: "owner_001",
          name: "Najib",
          phoneNumber: "+628123456789",
          packageName: "LITE",
          outlets: [
            Outlet(
              logo: "",
              name: "Warmindo Cak Tho",
              address: "Tebet,Jakarta Selatan, DKI Jakarta",
            ),
          ],
          createdAt: DateTime.now().toIso8601String(),
          updatedAt: DateTime.now().toIso8601String(),
        );
}
