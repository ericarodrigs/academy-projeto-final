import 'package:flutter_test/flutter_test.dart';
import 'package:rarovideowall/src/modules/home/features/details/model/comment_model.dart';
import 'package:rarovideowall/src/modules/home/features/details/model/comment_repository.dart';
import 'package:rarovideowall/src/modules/home/interfaces/comment_repository_interface.dart';
import 'package:rarovideowall/src/modules/login_module/features/login/model/login_user_model.dart';
import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';
import 'package:rarovideowall/src/shared/interfaces/login_repository_interface.dart';
import 'package:rarovideowall/src/shared/repositories/login_repository.dart';

import '../../../../../../mocks/api_service_test/api_service_test.generate.dart';
import '../../../../../../mocks/local_storage_service_test/local_storage_service_test.generate.dart';
import '../../../../../../mocks/mock_data.dart';

void main() {
  late ICommentRepository commentRepository;
  late ILoginRepository loginRepository;
  setUpAll(() {
    final apiStubs = ApiServiceStubs();
    final storageService = LocalStorageServiceStubs();
    commentRepository = CommentRepository(
      service: apiStubs.mock,
      loggedState: LoggedState.instance,
    );
    loginRepository = LoginRepository(
      apiService: apiStubs.mock,
      localStorageService: storageService.mock,
      loggedState: LoggedState.instance,
    );
    apiStubs.registerStubs();
    storageService.registerStubs();
  });

  group('CommentRepository tests: ', () {
    test(
        'Should return list of commentsMock reversed when getComments is called with firstVideoId',
        () async {
      final respComments = commentsMock
          .map((comment) => CommentModel.fromMap(comment))
          .toList()
          .reversed
          .toList();
      (await commentRepository.getComments(firstVideoId)).fold(
        (l) => expect(l, null),
        (resp) => expect(resp, respComments),
      );
    });

    test(
        'Should return Failure when postCOmment, editComment, deleteComment and vote comment is called without login.',
        () async {
      (await commentRepository.postComment(firstVideoId, 'test')).fold(
        (l) => expect(l.message, 'Usuário precisa estar logado.'),
        (r) => expect(r, null),
      );
      (await commentRepository.editComment(
              firstVideoId, myFirstCommentId, 'test2'))
          .fold(
        (l) => expect(l.message, 'Usuário precisa estar logado.'),
        (r) => expect(r, null),
      );
      (await commentRepository.deleteComment(firstVideoId, myFirstCommentId))
          .fold(
        (l) => expect(l.message, 'Usuário precisa estar logado.'),
        (r) => expect(r, null),
      );
      (await commentRepository.voteComment(firstVideoId, myFirstCommentId))
          .fold(
        (l) => expect(l.message, 'Usuário precisa estar logado.'),
        (r) => expect(r, null),
      );
    });

    group('Logged tests - ', () {
      setUpAll(() {
        loginRepository.login(LoginUserModel(email: 'test', password: 'test'));
      });
      test(
          'Should return a postCommentsMock reversed when postComment is called with firstVideoId, myFirstCommentId and is logged',
          () async {
        (await commentRepository.postComment(firstVideoId, 'test')).fold(
          (l) => expect(l, null),
          (resp) => expect(resp, CommentModel.fromMap(postCommentMock)),
        );
      });

      test(
          'Should return a editCommentsMock when editComment is called with firstVideoId, myFirstCommentId and is logged',
          () async {
        (await commentRepository.editComment(
                firstVideoId, myFirstCommentId, 'test2'))
            .fold(
          (l) => expect(l, null),
          (resp) => expect(resp, CommentModel.fromMap(editCommentMock)),
        );
      });

      test(
          'Should return true when deleteComment is called with firstVideoId, myFirstCommentId and is logged',
          () async {
        (await commentRepository.deleteComment(firstVideoId, myFirstCommentId))
            .fold(
          (l) => expect(l, null),
          (resp) => expect(resp, true),
        );
      });

      test(
          'Should return true when voteComment is called with firstVideoId, myFirstCommentId, isUpVote true,  resetVote false and is logged',
          () async {
        (await commentRepository.voteComment(firstVideoId, myFirstCommentId))
            .fold(
          (l) => expect(l, null),
          (resp) => expect(resp, true),
        );
      });

      test(
          'Should return true when voteComment is called with firstVideoId, myFirstCommentId, isUpVote false,  resetVote false and is logged',
          () async {
        (await commentRepository.voteComment(firstVideoId, myFirstCommentId,
                isUpVote: false))
            .fold(
          (l) => expect(l, null),
          (resp) => expect(resp, true),
        );
      });

      test(
          'Should return true when voteComment is called with firstVideoId, myFirstCommentId, resetVote true and is logged',
          () async {
        (await commentRepository.voteComment(firstVideoId, myFirstCommentId,
                resetVote: true))
            .fold(
          (l) => expect(l, null),
          (resp) => expect(resp, true),
        );
      });
    });
  });
}
