import 'package:dio/dio.dart';

final favoriteVideoResponse = Response(
  requestOptions: RequestOptions(path: ''),
  statusCode: 204,
);

final emptyFavoriteVideosResponse = Response(
  requestOptions: RequestOptions(path: ''),
  data: [],
  statusCode: 200,
);

final firstVideoListResponse = Response(
  requestOptions: RequestOptions(path: ''),
  data: [firstVideo],
  statusCode: 200,
);

final firstVideoResponse = Response(
  requestOptions: RequestOptions(path: ''),
  data: firstVideo,
  statusCode: 200,
);
const String firstVideoId = '84962753-5a59-4c0b-a9c0-9fe377880489';
final firstVideo = {
  "id": "84962753-5a59-4c0b-a9c0-9fe377880489",
  "nome": "Por que aprender .net?",
  "url": "https://www.youtube.com/watch?v=xnXE4rIIRqw&t=1899s",
  "thumbUrl":
      "https://thumbs.dreamstime.com/b/quality-assurance-service-guarantee-standard-internet-business-technology-concept-123053344.jpg",
  "descricao":
      "Vamos falar sobre o mercado atual de .net, e o quanto queremos vc para trabalhar conosco",
  "createdAt": "2022-08-19T12:15:42.334Z",
  "duracao": "1:05",
  "dataPublicacao": "2022-08-19T14:10:24.000Z",
  "topico": ".net",
  "tags": [".net", "aulão", "professora Stella", "professora Pedro"]
};

final loggedVideosResponse = Response(
  requestOptions: RequestOptions(path: ''),
  data: loggedVideos,
  statusCode: 200,
);

final publicVideosResponse = Response(
  requestOptions: RequestOptions(path: ''),
  data: publicVideos,
  statusCode: 200,
);

final List<dynamic> publicVideos = [
  {
    "id": "84962753-5a59-4c0b-a9c0-9fe377880489",
    "nome": "Por que aprender .net?",
    "url": "https://www.youtube.com/watch?v=xnXE4rIIRqw&t=1899s",
    "thumbUrl":
        "https://thumbs.dreamstime.com/b/quality-assurance-service-guarantee-standard-internet-business-technology-concept-123053344.jpg",
    "descricao":
        "Vamos falar sobre o mercado atual de .net, e o quanto queremos vc para trabalhar conosco",
    "createdAt": "2022-08-19T12:15:42.334Z",
    "duracao": "1:05",
    "dataPublicacao": "2022-08-19T14:10:24.000Z",
    "topico": ".net",
    "tags": [".net", "aulão", "professora Stella", "professora Pedro"]
  },
  {
    "id": "07351445-fe55-43c9-97e2-7308a09dba43",
    "nome": "Live - Por que devo optar por .NET?",
    "url": "https://www.youtube.com/watch?v=SZEuknaeAUw",
    "thumbUrl": "https://miro.medium.com/max/1400/1*7I6oONv2fGLQJcNEFA4QSw.png",
    "descricao":
        "Se você ainda tem dúvidas sobre .NET e quer aprender um pouco mais sobre esse framework e sobre o nosso curso, a nossa live te ajuda!",
    "createdAt": "2022-09-05T11:08:21.763Z",
    "duracao": "1h16m",
    "dataPublicacao": "2022-09-05T11:08:21.763Z",
    "topico": ".NET",
    "tags": ["NET"]
  }
];

final List<dynamic> loggedVideos = [
  {
    "id": "0db47ecb-264c-4bc5-962a-f28e63a66141",
    "nome": "Aula de introdução",
    "url":
        "https://us06web.zoom.us/rec/play/99z_-DWZL_q42lEUWHcjRFAWqxRvcrjxxWK-Fr6xdPnTdha3oSBceNnK5ucOEEPBq9GYKeWF9H5x5tRD.7YsDFIf8qqpFUs85?startTime=1656971187000&_x_zm_rtaid=Dt5TU_aoRE6oRt_uLS3RNw.1660911109136.0f5cf87bce55d86d0ad622b20a7291a6&_x_zm_rhtaid=498",
    "thumbUrl":
        "https://docs.flutter.dev/assets/images/flutter-logo-sharing.png",
    "descricao": "Aula de introdução da turma de flutter, 2a edição",
    "createdAt": "2022-08-19T12:12:52.998Z",
    "duracao": "1:05",
    "dataPublicacao": "2022-08-19T12:12:52.998Z",
    "topico": "semana 01",
    "tags": ["flutter", "aula inaugural", "professor roberto"]
  },
  {
    "id": "a8a9dc7e-c412-442f-88c6-223874653f5b",
    "nome": "Introdução ao ambiente de Flutter",
    "url":
        "https://us06web.zoom.us/rec/play/99z_-DWZL_q42lEUWHcjRFAWqxRvcrjxxWK-Fr6xdPnTdha3oSBceNnK5ucOEEPBq9GYKeWF9H5x5tRD.7YsDFIf8qqpFUs85?startTime=1656971187000&_x_zm_rtaid=Dt5TU_aoRE6oRt_uLS3RNw.1660911109136.0f5cf87bce55d86d0ad622b20a7291a6&_x_zm_rhtaid=498",
    "thumbUrl": "https://miro.medium.com/max/1200/0*7A4v8VShCt1HzuVV.png",
    "descricao": "Iniciação do nosso ambiente de flutter",
    "createdAt": "2022-08-19T12:14:15.953Z",
    "duracao": "1:05",
    "dataPublicacao": "2022-08-19T12:14:15.953Z",
    "topico": "semana 01",
    "tags": ["flutter", "iniciacão do ambiente", "professor roberto"]
  },
  {
    "id": "84962753-5a59-4c0b-a9c0-9fe377880489",
    "nome": "Por que aprender .net?",
    "url": "https://www.youtube.com/watch?v=xnXE4rIIRqw&t=1899s",
    "thumbUrl":
        "https://thumbs.dreamstime.com/b/quality-assurance-service-guarantee-standard-internet-business-technology-concept-123053344.jpg",
    "descricao":
        "Vamos falar sobre o mercado atual de .net, e o quanto queremos vc para trabalhar conosco",
    "createdAt": "2022-08-19T12:15:42.334Z",
    "duracao": "1:05",
    "dataPublicacao": "2022-08-19T14:10:24.000Z",
    "topico": ".net",
    "tags": [".net", "aulão", "professora Stella", "professora Pedro"]
  },
  {
    "id": "9657f91f-0bfb-468e-9a51-a84f5bc41e24",
    "nome":
        "Apresentação dos professores - apresentar cronograma, dinamica e ementa do curso",
    "url":
        "https://us06web.zoom.us/rec/play/LO-wdjwbkHQkCfNC5SnQVoesMajhxEP9N6gzOMYUwGhzF7ZPRxZCk7BU2258qslBiSKdYI7-ZlnH0sDe.ahJzL_F40RFuvQOW?startTime=1656971187000&_x_zm_rtaid=H1mchooyQ5iEdUnrU9ffFQ.1661513185144.46d84ba7debac8c97b6edc409b3e8a46&_x_zm_rhtaid=388",
    "thumbUrl":
        "https://www.opus-software.com.br/wp-content/uploads/2021/01/imagem-destaque-Flutter.jpg",
    "descricao":
        "Apresentação dos professores + bate papo sobre como será o curso",
    "createdAt": "2022-08-26T11:28:22.151Z",
    "duracao": "2h41",
    "dataPublicacao": "2022-08-26T11:28:22.151Z",
    "topico": "string",
    "tags": ["Flutter", "Raro Academy"]
  },
  {
    "id": "c43d4e1f-8655-4e59-b8fd-931ad3599b52",
    "nome": "Nivelamento - Dart - Lógica de programação",
    "url":
        "https://us06web.zoom.us/rec/share/yvOz1Ene2psnHgSbBctnQtnP8xRkwIM7S-FaMYaojD9Aob-XiH6XnkLj1kUxSlxi.2lXdM1iO8MUonh91?startTime=1657057782000",
    "thumbUrl":
        "https://koenig-media.raywenderlich.com/uploads/2021/05/dartpad-1.png",
    "descricao": "Aula sobre lógica de programação e o orientação a objeto",
    "createdAt": "2022-08-26T11:34:09.443Z",
    "duracao": "1h50m",
    "dataPublicacao": "2022-08-26T11:34:09.443Z",
    "topico": "SEMANA 01",
    "tags": ["Flutter", "Raro Academy", "Roberto"]
  },
  {
    "id": "d306a5fa-38da-4f9e-8fb6-28f83182ac29",
    "nome": "Nivelamento - Dart - Lógica de programação",
    "url":
        "https://us06web.zoom.us/rec/share/e-mdCs9vPFrssDej3w53Yfl12No2O7hSz3-b5DI7GtEHEj-YA-55erJbM-aYCIR3.NGTdIiwHYd0Z9AzV?startTime=1657144193000",
    "thumbUrl":
        "https://koenig-media.raywenderlich.com/uploads/2021/05/dartpad-1.png",
    "descricao": "Continuação sobre nivelamento em dart + POO",
    "createdAt": "2022-08-26T11:39:35.865Z",
    "duracao": "2h01m",
    "dataPublicacao": "2022-08-26T11:39:35.865Z",
    "topico": "SEMANA 01",
    "tags": ["Flutter", "Raro Academy", "Roberto"]
  },
  {
    "id": "07351445-fe55-43c9-97e2-7308a09dba43",
    "nome": "Live - Por que devo optar por .NET?",
    "url": "https://www.youtube.com/watch?v=SZEuknaeAUw",
    "thumbUrl": "https://miro.medium.com/max/1400/1*7I6oONv2fGLQJcNEFA4QSw.png",
    "descricao":
        "Se você ainda tem dúvidas sobre .NET e quer aprender um pouco mais sobre esse framework e sobre o nosso curso, a nossa live te ajuda!",
    "createdAt": "2022-09-05T11:08:21.763Z",
    "duracao": "1h16m",
    "dataPublicacao": "2022-09-05T11:08:21.763Z",
    "topico": ".NET",
    "tags": ["NET"]
  },
  {
    "id": "4453245d-6b37-40d6-9f26-9ec437177473",
    "nome": "Introdução ao Flutter",
    "url":
        "https://us06web.zoom.us/rec/share/S8I9mYhh4_fkh-MEDdvY_ExNIEdDNc1aKkpUF0leYf-VW3xhNiQCsUbQ2shPnI7M.rGDuu9VUyTuP38L2?startTime=1657576414000",
    "thumbUrl": "https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg",
    "descricao": "Aula introdutória ao mundo do Flutter",
    "createdAt": "2022-09-05T11:16:51.181Z",
    "duracao": "1h50m",
    "dataPublicacao": "2022-09-05T11:16:51.181Z",
    "topico": "SEMANA 02",
    "tags": ["SEMANA 02", "FLUTTER", "Roberto"]
  },
  {
    "id": "1967ddd6-85fb-4c2e-87ae-e6706503234d",
    "nome": "Conhecendo Widgets básicos do Flutter",
    "url":
        "https://us06web.zoom.us/rec/share/UzGmFgTm86bWq3qOrnSecatMQfbtGJzK5-h5RcpTcahqadQfjlMqqwY9Dk_i03BP.CaS9EurwU-S3ESx_?startTime=1657662494000",
    "thumbUrl": "https://miro.medium.com/max/1152/1*v9mkbMfIbe3cnvqfo-dXyA.png",
    "descricao": "Principais widgets do Flutter",
    "createdAt": "2022-09-05T11:21:41.841Z",
    "duracao": "2h05m",
    "dataPublicacao": "2022-09-05T11:21:41.841Z",
    "topico": "SEMANA 02",
    "tags": ["SEMANA 02", "FLUTTER", "Roberto", "Widgets"]
  },
  {
    "id": "ce312f79-288f-49ca-9245-baa935e5a23d",
    "nome": "Manipulação de Column,Row,Stacks e Containers",
    "url":
        "https://us06web.zoom.us/rec/share/tvkqz6GLVJrTrIxEZTL8E4yTVpiuhJf7F2rwcAZXx7beRCk8YF8n93P7vuY6_3Aw.xRaToHbtAil-lOqq?startTime=1657749034000",
    "thumbUrl": "https://miro.medium.com/max/1152/1*v9mkbMfIbe3cnvqfo-dXyA.png",
    "descricao": "Principais widgets do Flutter",
    "createdAt": "2022-09-05T11:23:03.752Z",
    "duracao": "2h10m",
    "dataPublicacao": "2022-09-05T11:23:03.752Z",
    "topico": "SEMANA 02",
    "tags": ["SEMANA 02", "FLUTTER", "Roberto", "Widgets"]
  },
  {
    "id": "bdb3210f-a152-4df2-8db9-791b098e1bc2",
    "nome": "Manipulação de Column,Row,Stacks e Containers",
    "url":
        "https://us06web.zoom.us/rec/share/ffnrCjBm-OYpFN5y1cnkKCHJAj14t3QdQ7p7S4jEBnj5q9qYtf77r6biFcStRvdr.RPrEBB5GdB4SM26T?startTime=1657835220000",
    "thumbUrl": "https://miro.medium.com/max/1152/1*v9mkbMfIbe3cnvqfo-dXyA.png",
    "descricao": "Principais widgets do Flutter",
    "createdAt": "2022-09-05T11:24:37.702Z",
    "duracao": "2h10m",
    "dataPublicacao": "2022-09-05T11:24:37.702Z",
    "topico": "AULA 03 - SEMANA 02",
    "tags": ["SEMANA 02", "FLUTTER", "Roberto", "Widgets"]
  },
  {
    "id": "4b53ca3f-944f-4ba0-a6bc-cacde5749943",
    "nome": "Manipulação de Column,Row,Stacks e Containers",
    "url":
        "https://us06web.zoom.us/rec/share/TFM3-R5nY1AEvnAY6Y9Xn7-TpYr3OjdzvGVZin8OVwggWHye6cc8WOO-_-wz4V9M.hcoy6983La8z6uzv?startTime=1657922843000",
    "thumbUrl": "https://miro.medium.com/max/1152/1*v9mkbMfIbe3cnvqfo-dXyA.png",
    "descricao": "Principais widgets do Flutter",
    "createdAt": "2022-09-05T11:26:11.391Z",
    "duracao": "2h10m",
    "dataPublicacao": "2022-09-05T11:26:11.391Z",
    "topico": "AULA 05 - SEMANA 02",
    "tags": ["SEMANA 02", "FLUTTER", "Roberto", "Widgets"]
  },
  {
    "id": "ff351949-4ba1-410a-b786-0e530637bcec",
    "nome": "Git e GitFlow",
    "url":
        "https://us06web.zoom.us/rec/share/5QpZFkiSyVBtnVawha8GlutPmeYV8FZ3tVIGwMq4hFMrGmSopleZ28WW4JTP52Cf.pE2AYe5ZMLHr709h?startTime=1657972214000",
    "thumbUrl":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Git-logo.svg/1200px-Git-logo.svg.png",
    "descricao": "Aula sobre a principal ferramenta de versionamento de versão",
    "createdAt": "2022-09-05T11:28:07.489Z",
    "duracao": "4h",
    "dataPublicacao": "2022-09-05T11:28:07.489Z",
    "topico": "AULA 02 - SÁBADO",
    "tags": ["SEMANA 02", "Marcela", "Git", "GitFlow"]
  }
];

final authLoginResponse = Response(
  requestOptions: RequestOptions(path: ''),
  data: authLogin,
  statusCode: 200,
);

final authLogin = {
  "access_token":
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOnsiaWQiOiJkODhlZTY5Yy0wZjY4LTQ4ZjgtYmVhZi0zMWVhYjY3NjhhOTAiLCJhZG1pbiI6ZmFsc2UsIm5vbWUiOiJNYXJjb3MiLCJlbWFpbCI6Im1hcmtpbXdyc0Bob3RtYWlsLmNvbSIsImZvdG8iOiJodHRwczovL2Nsb3VkZmxhcmUtaXBmcy5jb20vaXBmcy9RbWQzVzVEdWhnSGlyTEhHVml4aTZWNzZMaENrWlV6NnBuRnQ1QUpCaXl2SHllL2F2YXRhci83MTIuanBnIn0sImlhdCI6MTY2MjczNDQ0OCwiZXhwIjoxNjYyNzU2MDQ4fQ.zOFMlqAwte91zWB9Er9zt5MNYMGI3_4zSpbG_AKxGik",
  "nome": "test",
  "admin": false,
  "foto":
      "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/712.jpg",
  "id": "d88ee69c-0f68-48f8-beaf-31eab6768a90"
};

final authRegisterResponse = Response(
  requestOptions: RequestOptions(path: ''),
  data: authRegister,
  statusCode: 201,
);

final authRegister = {
  "nome": "test",
  "email": "test",
  "senha": "4c6d3fc4835040507b891d618909e0734a2b3c0452af6075cbe8c6bfd796dc92",
  "foto":
      "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/983.jpg",
  "turma": {
    "id": "55402f9b-ca01-4cb4-ae36-dc85d7e154b8",
    "nome": "Flutter edição 2",
    "descricao": "Flutter edição 2"
  },
  "id": "cd6b468f-2a71-4698-9156-fc5b803c5bd7",
  "admin": false
};

final authCodResponse = Response(
  requestOptions: RequestOptions(path: ''),
  statusCode: 201,
);

final authRecoverResponse = Response(
  requestOptions: RequestOptions(path: ''),
  statusCode: 201,
);
