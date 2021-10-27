import './abstract.ninateka.service.dart';
import '../product.dart' show Product, VideoDescriptor;

class ProductsService extends AbstractNinatekaService {
  @override
  Uri get resourceUri {
    return Uri.parse('/products');
  }

  Future<Product> getProduct(num id) =>
      doGetValueObject<Product>(Uri.parse('/$id?platform=BROWSER'));

  Future<VideoDescriptor> getVideoDescriptor(num id) =>
      doGetValueObject<VideoDescriptor>(
          Uri.parse('/$id/videos/playlist?platform=BROWSER&videoType=MOVIE'));
}
