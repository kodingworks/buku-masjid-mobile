import 'package:buku_masjid/features/settings/settings.dart';

class GetOnboardingDataUseCase {
  List<IntroBoard> call() {
    return const [
      IntroBoard(
        id: 1,
        title: 'Surganya Pecinta Guppy',
        description: 'Nikmati Video Guppy keren, indah, '
            'dan eksotis dari breeder terbaik.',
        imageAsset: '',
      ),
      IntroBoard(
        id: 2,
        title: 'Lelang Guppy Terbesar di Indonesia',
        description: 'Breeder, Seller, Penghobi Guppy di seluruh'
            ' Indonesia semua ada di sini.',
        imageAsset: '',
      ),
      IntroBoard(
        id: 3,
        title: 'Sistem Lelang Terbaik',
        description:
            'Anti Bid & Run, Anti Seller Bodong, & Anti Lelang Manipulatif',
        imageAsset: '',
      ),
      IntroBoard(
        id: 4,
        title: 'Maju Terus Indonesia',
        description:
            'Semoga para Seller makmur dan Semoga para Buyer berbahagia.\n'
            'KEBERUNTUNGAN UNTUK KITA SEMUA',
        imageAsset: '',
      ),
    ];
  }
}
