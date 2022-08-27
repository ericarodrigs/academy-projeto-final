import 'package:flutter/material.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';
import 'package:rarovideowall/src/shared/services/dio_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  ApiService service = DioService.instance;

  @override
  void initState() {
    super.initState();
    service.delete(
        '/videos/84962753-5a59-4c0b-a9c0-9fe377880489/comentarios/5b41b651-0507-4f78-9de1-fa8d19a0d025',
        headers: {
          'Authorization':
              'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOnsiaWQiOiJhY2Y0NTBlZS0wZmViLTRiZTctYjgzMy1hMjMzYzFiMWU2MGYiLCJhZG1pbiI6ZmFsc2UsIm5vbWUiOiJzdHJpbmciLCJlbWFpbCI6InN0cmluZyIsImZvdG8iOiJodHRwczovL2Nsb3VkZmxhcmUtaXBmcy5jb20vaXBmcy9RbWQzVzVEdWhnSGlyTEhHVml4aTZWNzZMaENrWlV6NnBuRnQ1QUpCaXl2SHllL2F2YXRhci81OTEuanBnIn0sImlhdCI6MTY2MTQ0ODAwNiwiZXhwIjoxNjYxNDY5NjA2fQ.vjz_2OG3DWX8G-vT8-V9aFJI3Y0jByJP0tRi1tma-2Q'
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
