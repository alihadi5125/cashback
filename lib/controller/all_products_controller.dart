import 'package:cashback/model/all_shops_model.dart';

class AllProductsController {
  static AllStores data = AllStores(
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
