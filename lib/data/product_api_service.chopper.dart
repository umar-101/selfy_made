// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$ProductsApiService extends ProductsApiService {
  _$ProductsApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = ProductsApiService;

  Future<Response> getAllProducts(String authToken) {
    final $url = '/products';
    final $headers = {
      'authorization': authToken,
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getAllCartItems(String authToken) {
    final $url = '/products/cart/get';
    final $headers = {
      'authorization': authToken,
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response<Product>> getProduct(int id) {
    final $url = '/products/${id}';
    final $headers = {
      'authorization': 'Bearer 4|7TNbpdn8gFzg2YQv4v3WJ3j4Q8ipOX0bmrfMrFvg'
    };
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<Product, Product>($request);
  }

  Future<Response<Product>> addProduct(Map<String, dynamic> product,
      {List<File> files}) {
    final $url = '/products/files';
    final $headers = {
      'authorization': 'Bearer 4|7TNbpdn8gFzg2YQv4v3WJ3j4Q8ipOX0bmrfMrFvg'
    };
    final $body = product;
    final $parts = <PartValue>[PartValueFile<List<File>>('files', files)];
    final $request = Request('POST', $url, client.baseUrl,
        body: $body, parts: $parts, multipart: true, headers: $headers);
    return client.send<Product, Product>($request);
  }

  Future<Response<Product>> deleteProduct(int id) {
    final $url = '/products/${id}';
    final $headers = {
      'authorization': 'Bearer 4|7TNbpdn8gFzg2YQv4v3WJ3j4Q8ipOX0bmrfMrFvg'
    };
    final $request = Request('DELETE', $url, client.baseUrl, headers: $headers);
    return client.send<Product, Product>($request);
  }
}
