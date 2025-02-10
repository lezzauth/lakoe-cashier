import 'package:lakoe_pos/features/checkout/data/payment_method_model.dart';
import 'package:lakoe_pos/utils/constants/image_strings.dart';

List<PaymentCategory> paymentMethodPurchasePackage = [
  PaymentCategory(
    categoryName: "E-Wallet",
    methods: [
      PaymentMethodCheckout(name: "LinkAja", logo: TImages.linkaja),
      // PaymentMethodCheckout(name: "OVO", logo: TImages.ovo),
      // PaymentMethodCheckout(name: "ShopeePay", logo: TImages.shopeepay),
      PaymentMethodCheckout(name: "Dana", logo: TImages.dana),
    ],
  ),
  PaymentCategory(
    categoryName: "Virtual Account",
    methods: [
      PaymentMethodCheckout(
        name: "BCA",
        logo: TImages.bca,
        paymentMedia: [
          PaymentMedia(
            mediaName: "BCA Mobile",
            steps: """
Buka aplikasi **BCA Mobile** dan login.
Pilih menu **m-Transfer**, kemudian pilih **BCA Virtual Account**.
Masukkan nomor **Virtual Account** dan tekan **Send**.
Konfirmasi detail transaksi dan masukkan **PIN** untuk menyelesaikan.
""",
          ),
          PaymentMedia(
            mediaName: "KlikBCA",
            steps: """
Akses situs **KlikBCA** dan login.
Pilih menu **Transfer Dana**, kemudian pilih **Transfer ke BCA Virtual Account**.
Masukkan nomor **Virtual Account** dan lanjutkan sesuai instruksi.
Konfirmasi detail transaksi dan selesaikan proses transfer.
""",
          ),
          PaymentMedia(
            mediaName: "ATM BCA",
            steps: """
Masukkan **Kartu ATM BCA** dan **PIN**.
Pilih menu **Transaksi Lainnya**, kemudian pilih **Transfer**.
Pilih **ke Rekening BCA Virtual Account**.
Masukkan nomor **Virtual Account** dan tekan **Benar**.
Konfirmasi detail transaksi dan tekan **Ya** untuk menyelesaikan.
""",
          ),
        ],
      ),
      PaymentMethodCheckout(
        name: "Mandiri",
        logo: TImages.mandiri,
        paymentMedia: [
          PaymentMedia(
            mediaName: "Livin' by Mandiri",
            steps: """
Buka aplikasi **Livin' by Mandiri** dan login.
Pilih menu **Pembayaran**, kemudian pilih **Multi Payment**.
Pilih penyedia jasa **Xendit**.
Masukkan nomor **Virtual Account** dan jumlah pembayaran.
Konfirmasi detail transaksi dan masukkan **PIN** untuk menyelesaikan.
""",
          ),
          PaymentMedia(
            mediaName: "Mandiri Internet Banking",
            steps: """
Akses situs **Mandiri Internet Banking** dan login.
Pilih menu **Pembayaran**, kemudian pilih **Multi Payment**.
Masukkan nomor **Virtual Account** dan lanjutkan sesuai instruksi.
Konfirmasi detail transaksi dan selesaikan proses pembayaran.
""",
          ),
          PaymentMedia(
            mediaName: "ATM Mandiri",
            steps: """
Masukkan **Kartu ATM Mandiri** dan **PIN**.
Pilih menu **Bayar/Beli**, kemudian pilih **Multi Payment**.
Masukkan kode perusahaan jika diminta, lalu nomor **Virtual Account**.
Masukkan jumlah pembayaran.
Konfirmasi detail transaksi dan tekan **Ya** untuk menyelesaikan.
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
Buka aplikasi **BRImo** dan login.
Pilih menu **Pembayaran**, kemudian pilih **BRIVA**.
Masukkan nomor **BRIVA** (Virtual Account) dan jumlah pembayaran.
Konfirmasi detail transaksi dan masukkan **PIN** untuk menyelesaikan.
""",
          ),
          PaymentMedia(
            mediaName: "Internet Banking BRI",
            steps: """
Akses situs **Internet Banking BRI** dan login.
Pilih menu **Pembayaran**, kemudian pilih **BRIVA**.
Masukkan nomor **BRIVA** dan jumlah pembayaran.
Konfirmasi detail transaksi dan lanjutkan sesuai instruksi.
""",
          ),
          PaymentMedia(
            mediaName: "ATM BRI",
            steps: """
Masukkan **Kartu ATM BRI** dan **PIN**.
Pilih menu **Transaksi Lain**, kemudian pilih **Pembayaran**.
Pilih **Lainnya**, lalu pilih **BRIVA**.
Masukkan nomor **BRIVA** dan konfirmasi detail transaksi.
Tekan **Ya** untuk menyelesaikan.
""",
          ),
        ],
      ),
      PaymentMethodCheckout(
        name: "BNI",
        logo: TImages.bni,
        paymentMedia: [
          PaymentMedia(
            mediaName: "BNI Mobile Banking",
            steps: """
Buka aplikasi **BNI Mobile Banking** dan login.
Pilih menu **Transfer**, kemudian pilih **Virtual Account Billing**.
Masukkan nomor **Virtual Account** dan jumlah pembayaran.
Konfirmasi detail transaksi dan masukkan **Password Transaksi** untuk menyelesaikan.
""",
          ),
          PaymentMedia(
            mediaName: "Internet Banking BNI",
            steps: """
Akses situs **Internet Banking BNI** dan login.
Pilih menu **Transfer**, kemudian pilih **Virtual Account Billing**.
Masukkan nomor **Virtual Account** dan lanjutkan sesuai instruksi.
Konfirmasi detail transaksi dan selesaikan proses pembayaran.
""",
          ),
          PaymentMedia(
            mediaName: "ATM BNI",
            steps: """
Masukkan **Kartu ATM BNI** dan **PIN**.
Pilih menu **Transfer**, kemudian pilih **Virtual Account Billing**.
Masukkan nomor **Virtual Account** dan jumlah pembayaran.
Konfirmasi detail transaksi dan tekan **Ya** untuk menyelesaikan.
""",
          ),
        ],
      ),
//       PaymentMethodCheckout(
//         name: "BSI",
//         logo: TImages.bsi,
//         paymentMedia: [
//           PaymentMedia(
//             mediaName: "BYOND",
//             steps: """
// Buka aplikasi **BYOND by BSI** dan login.
// Pilih **Menu Utama** → **Bayar & Beli**.
// Pilih **Virtual Account**.
// Pilih rekening sumber dana.
// Masukkan nomor VA dan verifikasi nominal tagihan.
// Konfirmasi dengan **PIN BYOND**.
// """,
//           ),
//           PaymentMedia(
//             mediaName: "BSI Net",
//             steps: """
// Login ke **BSI Net Banking**.
// Pilih **Pembayaran** → **Virtual Account Billing**.
// Pilih rekening debet.
// Masukkan nomor VA dan nominal tagihan.
// Konfirmasi dengan **OTP/PIN**.
// """,
//           ),
//           PaymentMedia(
//             mediaName: "ATM BSI",
//             steps: """
// Masukkan kartu ATM BSI dan PIN.
// Pilih **Menu Lainnya** → **Transfer** → **Virtual Account Billing**.
// Pilih rekening sumber dana.
// Masukkan nomor VA.
// Periksa nominal tagihan yang muncul di layar.
// Konfirmasi transaksi.
// """,
//           ),
//         ],
//       ),
    ],
  )
];
