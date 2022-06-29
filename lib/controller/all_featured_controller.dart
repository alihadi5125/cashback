import 'package:cashback/model/all_featured_model.dart';
class AllFeatureController {
  static AllFeatured data = AllFeatured(
      data: [],
      meta: Meta(
          pagination: Pagination(
              currentPage: 0,
              links: Links(next: ''),
              perPage: 0,
              count: 0,
              total: 9,
              totalPages: 34)));
}
