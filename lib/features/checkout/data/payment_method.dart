import 'package:lakoe_pos/features/checkout/data/payment_method_model.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

List<PaymentCategory> paymentMethod = [
  PaymentCategory(
    categoryName: "E-WALLET",
    methods: [
      PaymentMethodCheckout(name: "LinkAja", logo: TImages.linkaja),
      PaymentMethodCheckout(name: "OVO", logo: TImages.ovo),
      PaymentMethodCheckout(name: "ShopeePay", logo: TImages.shopeepay),
      PaymentMethodCheckout(name: "Dana", logo: TImages.dana),
    ],
  ),
  PaymentCategory(
    categoryName: "VIRTUAL_ACCOUNT",
    methods: [
      PaymentMethodCheckout(
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
Masukkan **Kartu ATM** BCA, lalu **masukkan PIN**.
Pilih menu **Transaksi Lainnya**, kemudian pilih **Transfer**.
Pilih menu **ke Rekening BCA Virtual Account**.
Masukkan nomor **Virtual Account** dan tekan **Benar** untuk melanjutkan.
Tekan **Ya** jika sudah benar. Transaksi Anda telah selesai.
""",
          ),
        ],
      ),
      PaymentMethodCheckout(
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
      PaymentMethodCheckout(
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
      PaymentMethodCheckout(
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
