import '../../domain/entities/product.dart';

const sampleProducts = <Product>[
  Product(
    id: '1',
    name: 'مسكن للصداع ٥٠٠ مجم',
    description: 'أقراص لتسكين الصداع والآلام الخفيفة، علبة ١٠ أقراص',
    details:
    'أقراص لتسكين الصداع والآلام الخفيفة، علبة تحتوي على ١٠ أقراص. يُستخدم حسب إرشادات الطبيب أو الصيدلي.',
    size: '١٠ أقراص',
    category: 'مسكنات',
    price: 35,
    color: ProductColor.teal,
  ),
  Product(
    id: '2',
    name: 'فيتامين د٣ ٥٠٠٠ وحدة',
    description: 'مكمل غذائي كبسولات، علبة ٣٠ كبسولة',
    details:
    'مكمل غذائي على شكل كبسولات، علبة تحتوي على ٣٠ كبسولة. يُستخدم حسب إرشادات الطبيب أو الصيدلي.',
    size: '٣٠ كبسولة',
    category: 'مكملات غذائية',
    price: 85,
    color: ProductColor.amber,
  ),
  Product(
    id: '3',
    name: 'شراب للكحة',
    description: 'شراب بنكهة الليمون، عبوة ١٢٠ مل',
    details:
    'شراب بنكهة الليمون يساعد على تهدئة الكحة، عبوة ١٢٠ مل. يُستخدم حسب إرشادات الطبيب أو الصيدلي.',
    size: '١٢٠ مل',
    category: 'أدوية الجهاز التنفسي',
    price: 60,
    color: ProductColor.purple,
  ),
  Product(
    id: '4',
    name: 'كريم مرطب للبشرة',
    description: 'كريم يومي للبشرة الجافة، أنبوب ٥٠ جم',
    details:
    'كريم يومي لترطيب البشرة الجافة، أنبوب ٥٠ جم. يُستخدم حسب إرشادات الطبيب أو الصيدلي.',
    size: '٥٠ جم',
    category: 'العناية بالبشرة',
    price: 70,
    color: ProductColor.pink,
  ),
  Product(
    id: '5',
    name: 'أقراص للحموضة',
    description: 'أقراص مضغ لتخفيف الحموضة وعسر الهضم، علبة ٢٤ قرص',
    details:
    'أقراص مضغ لتخفيف الحموضة وعسر الهضم، علبة تحتوي على ٢٤ قرص. يُستخدم حسب إرشادات الطبيب أو الصيدلي.',
    size: '٢٤ قرص',
    category: 'الجهاز الهضمي',
    price: 30,
    color: ProductColor.amber,
  ),
  Product(
    id: '6',
    name: 'قطرة للعين',
    description: 'قطرة مرطبة لجفاف العين، عبوة ١٠ مل',
    details:
    'قطرة مرطبة لتخفيف جفاف العين، عبوة ١٠ مل. يُستخدم حسب إرشادات الطبيب أو الصيدلي.',
    size: '١٠ مل',
    category: 'العناية بالعيون',
    price: 45,
    color: ProductColor.teal,
  ),
  Product(
    id: '7',
    name: 'مرهم للجروح',
    description: 'مرهم مطهر للجروح والخدوش، أنبوب ٣٠ جم',
    details:
    'مرهم مطهر للجروح والخدوش، أنبوب ٣٠ جم. يُستخدم حسب إرشادات الطبيب أو الصيدلي.',
    size: '٣٠ جم',
    category: 'الإسعافات الأولية',
    price: 40,
    color: ProductColor.pink,
  ),
  Product(
    id: '8',
    name: 'فيتامين سي ١٠٠٠ مجم',
    description: 'أقراص فوارة تدعم المناعة، علبة ٢٠ قرص',
    details:
    'أقراص فوارة تدعم المناعة، علبة تحتوي على ٢٠ قرص. يُستخدم حسب إرشادات الطبيب أو الصيدلي.',
    size: '٢٠ قرص',
    category: 'مكملات غذائية',
    price: 75,
    color: ProductColor.purple,
  ),
];