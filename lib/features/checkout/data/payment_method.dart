import 'package:point_of_sales_cashier/features/checkout/data/payment_method_model.dart';
import 'package:point_of_sales_cashier/utils/constants/image_strings.dart';

List<PaymentCategory> paymentMethod = [
  PaymentCategory(
    categoryName: "E-Wallet",
    methods: [
      PaymentMethod(name: "LinkAja", logo: TImages.linkaja),
      PaymentMethod(name: "OVO", logo: TImages.ovo),
      PaymentMethod(name: "ShopeePay", logo: TImages.shopeepay),
      PaymentMethod(name: "Dana", logo: TImages.dana),
    ],
  ),
  PaymentCategory(
    categoryName: "Bank Transfer",
    methods: [
      PaymentMethod(
        name: "BCA",
        logo: TImages.bca,
        paymentMedia: [
          PaymentMedia(
            mediaName: "BCA Mobile",
            steps: """
Buka aplikasi **BCA Mobile**, lalu login.
Pilih menu **m-Transfer**, kemudian pilih **BCA Virtual Account**.
Masukkan nomor **Virtual Account** dan tekan **Send**.
Konfirmasi detail transaksi dan masukkan **PIN** untuk menyelesaikan.
""",
          ),
          PaymentMedia(
            mediaName: "myBCA",
            steps: """
Buka aplikasi **myBCA**, lalu login.
Pilih menu **m-Transfer**, kemudian pilih **BCA Virtual Account**.
Masukkan nomor **Virtual Account** dan tekan **Send**.
Konfirmasi detail transaksi dan masukkan **PIN** untuk menyelesaikan.
""",
          ),
          PaymentMedia(
            mediaName: "ATM",
            steps: """
Buka aplikasi **ATM**, lalu login.
Pilih menu **m-Transfer**, kemudian pilih **BCA Virtual Account**.
Masukkan nomor **Virtual Account** dan tekan **Send**.
Konfirmasi detail transaksi dan masukkan **PIN** untuk menyelesaikan.
""",
          ),
        ],
      ),
      PaymentMethod(
        name: "Mandiri",
        logo: TImages.mandiri,
        paymentMedia: [
          PaymentMedia(
            mediaName: "Livin",
            steps: """
Buka aplikasi **BCA Mobile**, lalu login.
Pilih menu **m-Transfer**, kemudian pilih **BCA Virtual Account**.
Masukkan nomor **Virtual Account** dan tekan **Send**.
Konfirmasi detail transaksi dan masukkan **PIN** untuk menyelesaikan.
""",
          ),
          PaymentMedia(
            mediaName: "Mandiri",
            steps: """
Buka aplikasi **BCA Mobile**, lalu login.
Pilih menu **m-Transfer**, kemudian pilih **BCA Virtual Account**.
Masukkan nomor **Virtual Account** dan tekan **Send**.
Konfirmasi detail transaksi dan masukkan **PIN** untuk menyelesaikan.
""",
          ),
          PaymentMedia(
            mediaName: "ATM",
            steps: """
Buka aplikasi **BCA Mobile**, lalu login.
Pilih menu **m-Transfer**, kemudian pilih **BCA Virtual Account**.
Masukkan nomor **Virtual Account** dan tekan **Send**.
Konfirmasi detail transaksi dan masukkan **PIN** untuk menyelesaikan.
""",
          ),
        ],
      ),
      PaymentMethod(
        name: "BRI",
        logo: TImages.bri,
        paymentMedia: [
          PaymentMedia(
            mediaName: "BRImo",
            steps: """
Buka aplikasi **BCA Mobile**, lalu login.
Pilih menu **m-Transfer**, kemudian pilih **BCA Virtual Account**.
Masukkan nomor **Virtual Account** dan tekan **Send**.
Konfirmasi detail transaksi dan masukkan **PIN** untuk menyelesaikan.
""",
          ),
          PaymentMedia(
            mediaName: "BRI",
            steps: """
Buka aplikasi **BCA Mobile**, lalu login.
Pilih menu **m-Transfer**, kemudian pilih **BCA Virtual Account**.
Masukkan nomor **Virtual Account** dan tekan **Send**.
Konfirmasi detail transaksi dan masukkan **PIN** untuk menyelesaikan.
""",
          ),
          PaymentMedia(
            mediaName: "ATM",
            steps: """
Buka aplikasi **BCA Mobile**, lalu login.
Pilih menu **m-Transfer**, kemudian pilih **BCA Virtual Account**.
Masukkan nomor **Virtual Account** dan tekan **Send**.
Konfirmasi detail transaksi dan masukkan **PIN** untuk menyelesaikan.
""",
          ),
        ],
      ),
      PaymentMethod(
        name: "BNI",
        logo: TImages.bni,
        paymentMedia: [
          PaymentMedia(
            mediaName: "BNI",
            steps: """
Buka aplikasi **BCA Mobile**, lalu login.
Pilih menu **m-Transfer**, kemudian pilih **BCA Virtual Account**.
Masukkan nomor **Virtual Account** dan tekan **Send**.
Konfirmasi detail transaksi dan masukkan **PIN** untuk menyelesaikan.
""",
          ),
          PaymentMedia(
            mediaName: "BNI Mobile",
            steps: """
Buka aplikasi **BCA Mobile**, lalu login.
Pilih menu **m-Transfer**, kemudian pilih **BCA Virtual Account**.
Masukkan nomor **Virtual Account** dan tekan **Send**.
Konfirmasi detail transaksi dan masukkan **PIN** untuk menyelesaikan.
""",
          ),
          PaymentMedia(
            mediaName: "ATM",
            steps: """
Buka aplikasi **BCA Mobile**, lalu login.
Pilih menu **m-Transfer**, kemudian pilih **BCA Virtual Account**.
Masukkan nomor **Virtual Account** dan tekan **Send**.
Konfirmasi detail transaksi dan masukkan **PIN** untuk menyelesaikan.
""",
          ),
        ],
      ),
    ],
  ),
];
