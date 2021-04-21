import 'dart:io';

import 'package:Selfy_made/Screens/Home%20Screen/data.dart';
import 'package:chopper/chopper.dart';

part 'product_api_service.chopper.dart';
@ChopperApi(baseUrl:'/products')
abstract class ProductsApiService extends ChopperService{
  @Get(headers:{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
    })
    Future<Response> getAllProducts( @Header(HttpHeaders.authorizationHeader) String authToken);

    @Get(headers:{
        'Content-Type': 'application/json',
        'Accept': 'application/json',
    },
    path:'/cart/get'
    )
    Future<Response> getAllCartItems( @Header(HttpHeaders.authorizationHeader) String authToken);

    @Get(path:'/{id}',headers:{ HttpHeaders.authorizationHeader: 'Bearer 4|7TNbpdn8gFzg2YQv4v3WJ3j4Q8ipOX0bmrfMrFvg'})
    Future<Response<Product>> getProduct(@Path('id') int id);

    @Post(headers:{ HttpHeaders.authorizationHeader: 'Bearer 4|7TNbpdn8gFzg2YQv4v3WJ3j4Q8ipOX0bmrfMrFvg'},path:'files')
    @Multipart()
    Future<Response<Product>> addProduct(@Body() Map<String,dynamic> product,{@PartFile('files') List<File> files});

    @Delete(path:'/{id}',headers:{ HttpHeaders.authorizationHeader: 'Bearer 4|7TNbpdn8gFzg2YQv4v3WJ3j4Q8ipOX0bmrfMrFvg'})
    Future<Response<Product>> deleteProduct(@Path('id') int id);

    static ProductsApiService create(){
        final client = ChopperClient(baseUrl:'http://ec0504a2d6ce.ngrok.io/api',
                services:[
                    _$ProductsApiService(),
                ],
                converter:JsonConverter()
        );
        return _$ProductsApiService(client);
    }
}

