import '../../domain/entities/doctor.dart';

const doctorCategoryAll = 'الكل';

const doctorCategories = <String>[
  doctorCategoryAll,
  'الباطنة',
  'القلب',
  'الأطفال',
  'العظام',
];

const sampleDoctors = <Doctor>[
  Doctor(
    id: '1',
    name: 'د. سارة منصور',
    specialty: 'استشاري الباطنة',
    category: 'الباطنة',
    nextSlot: 'اليوم ٤:٣٠ م',
  ),
  Doctor(
    id: '2',
    name: 'د. كريم عادل',
    specialty: 'استشاري أمراض القلب',
    category: 'القلب',
    nextSlot: 'غدًا ١٠:٠٠ ص',
  ),
  Doctor(
    id: '3',
    name: 'د. منى فاروق',
    specialty: 'أخصائي طب الأطفال',
    category: 'الأطفال',
    nextSlot: 'غدًا ١٢:٣٠ م',
  ),
  Doctor(
    id: '4',
    name: 'د. يوسف حسن',
    specialty: 'استشاري جراحة العظام',
    category: 'العظام',
    nextSlot: 'الخميس ٩:٠٠ ص',
  ),
];