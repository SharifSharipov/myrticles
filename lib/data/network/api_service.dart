import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myrticles/data/models/user_model/user_model.dart';
import 'package:myrticles/utils/constants/constants.dart';

import '../models/universal_data/universal_data.dart';

class ApiService {
  final _dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    headers: {
      "Content-type": "Aplication/json",
    },
    connectTimeout: Duration(seconds: TimeOutConstants.connectTimeout),
    receiveTimeout: Duration(seconds: TimeOutConstants.receiveTimeout),
    sendTimeout: Duration(seconds: TimeOutConstants.sendTimeout),
  ));
  ApiService() {
    _init();
  }
  _init() {
    _dio.interceptors.add(InterceptorsWrapper(onError: (error, handler) async {
      debugPrint("ERORGA KIRDI${error.message}va ${error.response}");
      return handler.next(error);
    }, onRequest: (requestOptions, handler) async {
      debugPrint("JAVVOB KELDI:${requestOptions.path}");
      return handler.next(requestOptions);
    }, onResponse: (response, handler) async {
      debugPrint("JAVOB KELDI:${response.requestOptions.path}");
      return handler.next(response);
    }));
  }
  ///-----------------------AUTHENTICATION-------------------------
   Future<UniversalData>sendToGmail({required String email,required String passowrd})async{
    Response response;
    try{
      response =await _dio.post("/gmail",
        data: {
          "gmail": email,
          "password":passowrd,
        },
      );
      if((response.statusCode!>=200)&&(response.statusCode!<300)){
        return UniversalData(data: response.data["message"]);
      }
      return UniversalData(error: "other error");
    } on DioException catch(e){
        if(e.response!=null){
          return UniversalData(data: e.response!.data);
        }else{
          return UniversalData(error:e.message!);
        }
    } catch (e){
      return UniversalData(error: e.toString());
    }
   }

  Future<UniversalData>confirmCode({required String code})async{
    Response response;
    try{
      response =await _dio.post("/password",
        data: {
          "checkPass": code,
        },
      );
      if((response.statusCode!>=200)&&(response.statusCode!<300)){
        return UniversalData(data: response.data["message"]);
      }
      return UniversalData(error: "other error");
    } on DioException catch(e){
      if(e.response!=null){
        return UniversalData(data: e.response!.data);
      }else{
        return UniversalData(error:e.message!);
      }
    } catch (e){
      return UniversalData(error: e.toString());
    }
  }
  Future<UniversalData>register({required Usermodel usermodel,required XFile xFile})async{
    Response response;
    _dio.options.headers = {
      "Accept": "multipart/form-data",
    };
    try{
      response =await _dio.post("/register",
        data: usermodel.getFromdata(xFile),
      );
      if((response.statusCode!>=200)&&(response.statusCode!<300)){
        return UniversalData(data: response.data["message"]);
      }
      return UniversalData(error: "other error");
    } on DioException catch(e){
      if(e.response!=null){
        return UniversalData(data: e.response!.data);
      }else{
        return UniversalData(error:e.message!);
      }
    } catch (e){
      return UniversalData(error: e.toString());
    }
  }
  Future<UniversalData>loginUser({required String email,required String passowrd})async{
    Response response;
    try{
      response =await _dio.post("/login",
        data: {
          "gmail": email,
          "password":passowrd,
        },
      );
      if((response.statusCode!>=200)&&(response.statusCode!<300)){
        return UniversalData(data: response.data["message"]);
      }
      return UniversalData(error: "other error");
    } on DioException catch(e){
      if(e.response!=null){
        return UniversalData(data: e.response!.data);
      }else{
        return UniversalData(error:e.message!);
      }
    } catch (e){
      return UniversalData(error: e.toString());
    }
  }
}
