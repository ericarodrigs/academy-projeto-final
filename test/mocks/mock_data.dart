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

///**--------------------------------------------
/// **               Comments data
///*---------------------------------------------**/

const myFirstCommentId = '927f4a4e-9f88-461b-9ced-750e8d0c5441';

final commentsMock = [
  {
    "id": "9997c712-2f57-4893-b4bf-30d3fe6783b2",
    "texto": "video muito bom. Parabéns ao professor roberto!!!",
    "editado": false,
    "createdAt": "2022-08-19T12:25:08.060Z",
    "aluno": {
      "id": "5f498a45-ea8c-4632-9d7a-ec6c21a416d5",
      "admin": false,
      "nome": "paulo do flutter",
      "email": "paulo.flutter@rarolabs.com.br",
      "senha":
          "2e8597687cf5edc1fb91b5aaec8339bc0fb337d009869b0cbe942063c5c31f47",
      "foto":
          "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1123.jpg"
    },
    "upVotes": 2,
    "downVotes": 2
  },
  {
    "id": "59fd6880-8c0b-490e-b832-7e7442fffb30",
    "texto": "Esse comentário será alterado",
    "editado": false,
    "createdAt": "2022-09-05T19:25:56.237Z",
    "aluno": {
      "id": "27ab382f-d935-46fa-ab16-f75e1762e96a",
      "admin": false,
      "nome": "marcelo",
      "email": "marcelo@gmail.com",
      "senha":
          "6844098a7fc3e3768b9a3594c3ee16ebe1af693619b14d071e32add6c728656f",
      "foto":
          "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1023.jpg"
    },
    "upVotes": 0,
    "downVotes": 6
  },
  {
    "id": "927f4a4e-9f88-461b-9ced-750e8d0c5441",
    "texto": "Mais um teste editado",
    "editado": true,
    "createdAt": "2022-09-07T23:54:19.841Z",
    "aluno": {
      "id": "d88ee69c-0f68-48f8-beaf-31eab6768a90",
      "admin": false,
      "nome": "Marcos",
      "email": "markimwrs@hotmail.com",
      "senha":
          "69952e29722c655c45c85c964cc411b97ac62d04ec6135a353712b6a2a7eabeb",
      "foto":
          "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/712.jpg"
    },
    "upVotes": 3,
    "downVotes": 0
  },
  {
    "id": "05227301-9c3c-40a4-9545-ada3172b850b",
    "texto": "mais um",
    "editado": false,
    "createdAt": "2022-09-08T22:26:58.056Z",
    "aluno": {
      "id": "77aae133-aa91-4512-bed3-d4d6417bf1e5",
      "admin": false,
      "nome": "erica r",
      "email": "ericar@e.com",
      "senha":
          "15e31178aaea84acbf821f6922f18bd5df27a31c229ab1998ae2a59c21d4a444",
      "foto":
          "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/199.jpg"
    },
    "upVotes": 2,
    "downVotes": 1
  },
  {
    "id": "b4851a70-0bf8-4ea0-b507-cf7ce5c3dc02",
    "texto": "Belo comentário erica kkkk",
    "editado": false,
    "createdAt": "2022-09-09T02:13:08.550Z",
    "aluno": {
      "id": "d88ee69c-0f68-48f8-beaf-31eab6768a90",
      "admin": false,
      "nome": "Marcos",
      "email": "markimwrs@hotmail.com",
      "senha":
          "69952e29722c655c45c85c964cc411b97ac62d04ec6135a353712b6a2a7eabeb",
      "foto":
          "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/712.jpg"
    },
    "upVotes": 1,
    "downVotes": 0
  },
  {
    "id": "0d62ae69-0c87-47db-a297-276a548fab2a",
    "texto": "Esse video ai,   bao",
    "editado": false,
    "createdAt": "2022-09-09T16:15:06.349Z",
    "aluno": {
      "id": "a4529ab4-3e1c-4b21-b663-883a02a97450",
      "admin": false,
      "nome": "xisde",
      "email": "xisde",
      "senha":
          "6844098a7fc3e3768b9a3594c3ee16ebe1af693619b14d071e32add6c728656f",
      "foto":
          "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/278.jpg"
    },
    "upVotes": 1,
    "downVotes": 1
  },
  {
    "id": "fa33583f-8ab7-4175-9a84-964f0ffac71b",
    "texto": "legal o video ",
    "editado": false,
    "createdAt": "2022-09-10T01:39:37.194Z",
    "aluno": {
      "id": "d88ee69c-0f68-48f8-beaf-31eab6768a90",
      "admin": false,
      "nome": "Marcos",
      "email": "markimwrs@hotmail.com",
      "senha":
          "69952e29722c655c45c85c964cc411b97ac62d04ec6135a353712b6a2a7eabeb",
      "foto":
          "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/712.jpg"
    },
    "upVotes": 1,
    "downVotes": 1
  },
  {
    "id": "0635f1d6-18ca-4a98-82cd-1de7376835e2",
    "texto": "edit",
    "editado": true,
    "createdAt": "2022-09-10T20:24:51.336Z",
    "aluno": {
      "id": "77aae133-aa91-4512-bed3-d4d6417bf1e5",
      "admin": false,
      "nome": "erica r",
      "email": "ericar@e.com",
      "senha":
          "15e31178aaea84acbf821f6922f18bd5df27a31c229ab1998ae2a59c21d4a444",
      "foto":
          "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/199.jpg"
    },
    "upVotes": 2,
    "downVotes": 1
  },
  {
    "id": "276259e2-2056-477d-913f-dcb2634900d5",
    "texto": "Excelente vídeo 👏",
    "editado": false,
    "createdAt": "2022-09-11T16:56:02.096Z",
    "aluno": {
      "id": "767621ac-9d0f-4e1d-9da1-4625897f9f42",
      "admin": false,
      "nome": "Renato da Costa",
      "email": "renato11@gmail.com",
      "senha":
          "f8d3d0a6593e5a6a8c9f1fd23683f7ebf82768762db75e212df35e3610ee3ec0",
      "foto":
          "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/216.jpg"
    },
    "upVotes": 1,
    "downVotes": 0
  },
  {
    "id": "4215a41d-98d8-4b51-b9f4-23a5ea0b1fbf",
    "texto": "boa alterado",
    "editado": true,
    "createdAt": "2022-09-12T02:18:43.449Z",
    "aluno": {
      "id": "8b628e8b-9278-4780-9c0c-abc28c13b0ed",
      "admin": false,
      "nome": "Guilherme Gomes",
      "email": "guiraro@raro.com",
      "senha":
          "88cd8e7d3e4ef71e4901f2de814211c324f721b76155a36abd30fd3311a67343",
      "foto":
          "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/463.jpg"
    },
    "upVotes": 2,
    "downVotes": 1
  },
  {
    "id": "37cd1001-fa89-45d7-ba60-1a53796e343c",
    "texto": "hmm",
    "editado": true,
    "createdAt": "2022-09-12T23:03:54.898Z",
    "aluno": {
      "id": "06f65126-3f8e-44aa-a2d7-03b65df383c8",
      "admin": false,
      "nome": "dns",
      "email": "dns@dns.com",
      "senha":
          "5522ed45188cf465232e9e5440ffb41fbd889e215d2a331be44ccb231c1de16a",
      "foto":
          "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/347.jpg"
    },
    "upVotes": 0,
    "downVotes": 0
  },
  {
    "id": "a65f3a4a-acf5-44ae-8318-0cb5b950b1cf",
    "texto": "Um novo comentario editado",
    "editado": true,
    "createdAt": "2022-09-13T01:37:11.892Z",
    "aluno": {
      "id": "d88ee69c-0f68-48f8-beaf-31eab6768a90",
      "admin": false,
      "nome": "Marcos",
      "email": "markimwrs@hotmail.com",
      "senha":
          "69952e29722c655c45c85c964cc411b97ac62d04ec6135a353712b6a2a7eabeb",
      "foto":
          "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/712.jpg"
    },
    "upVotes": 1,
    "downVotes": 0
  },
  {
    "id": "840f9cac-e857-4bd6-8b4d-179255b72867",
    "texto": "QA é importante",
    "editado": true,
    "createdAt": "2022-09-13T01:39:07.407Z",
    "aluno": {
      "id": "a4529ab4-3e1c-4b21-b663-883a02a97450",
      "admin": false,
      "nome": "xisde",
      "email": "xisde",
      "senha":
          "6844098a7fc3e3768b9a3594c3ee16ebe1af693619b14d071e32add6c728656f",
      "foto":
          "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/278.jpg"
    },
    "upVotes": 1,
    "downVotes": 0
  },
  {
    "id": "f78aac5e-099b-4ce6-8b29-cc73990c3605",
    "texto": "obrigado Raro Academy",
    "editado": false,
    "createdAt": "2022-09-13T03:23:45.775Z",
    "aluno": {
      "id": "099c0dcc-560d-47f0-8868-f0217021e9c5",
      "admin": false,
      "nome": "Gabi",
      "email": "gabi@gmail.com",
      "senha":
          "0a8bec82e585f6beed4f3a3881e36ccb57a731ff433a6b23bdae1a24921feb28",
      "foto":
          "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/611.jpg"
    },
    "upVotes": 0,
    "downVotes": 0
  }
];

final commentsMockResponse = Response(
  data: commentsMock,
  requestOptions: RequestOptions(path: ''),
  statusCode: 200,
);

final postCommentMock = {
  "texto": "test",
  "video": {
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
    "tags": [".net", "aulão", "professora Stella", "professora Pedro"],
    "turma": null
  },
  "aluno": {
    "id": "d88ee69c-0f68-48f8-beaf-31eab6768a90",
    "admin": false,
    "nome": "Marcos",
    "email": "markimwrs@hotmail.com",
    "senha": "69952e29722c655c45c85c964cc411b97ac62d04ec6135a353712b6a2a7eabeb",
    "foto":
        "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/712.jpg",
    "turma": {
      "id": "55402f9b-ca01-4cb4-ae36-dc85d7e154b8",
      "nome": "Flutter edição 2",
      "descricao": "Flutter edição 2"
    }
  },
  "id": "a48735e2-4c80-419a-8685-f5220053b27f",
  "editado": false,
  "createdAt": "2022-09-13T15:13:14.412Z"
};

final postCommentsMockResponse = Response(
  data: postCommentMock,
  requestOptions: RequestOptions(path: ''),
  statusCode: 200,
);

final editCommentMock = {
  "id": "927f4a4e-9f88-461b-9ced-750e8d0c5441",
  "texto": "test2",
  "editado": true,
  "createdAt": "2022-09-07T23:54:19.841Z"
};

final editCommentMockResponse = Response(
  data: editCommentMock,
  requestOptions: RequestOptions(path: ''),
  statusCode: 200,
);

final deleteCommentMockResponse = Response(
  requestOptions: RequestOptions(path: ''),
  statusCode: 204,
);

final voteCommentMockResponse = Response(
  requestOptions: RequestOptions(path: ''),
  statusCode: 200,
);
