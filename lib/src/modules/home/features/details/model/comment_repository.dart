import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:rarovideowall/src/modules/home/features/details/model/comment_model.dart';
import 'package:rarovideowall/src/modules/home/interfaces/comment_repository_interface.dart';
import 'package:rarovideowall/src/shared/global_states/logged_state/logged_state.dart';
import 'package:rarovideowall/src/shared/interfaces/api_service.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';

class CommentRepository implements ICommentRepository {
  ApiService service;
  LoggedState loggedState;

  CommentRepository({
    required this.service,
    required this.loggedState,
  });

  @override
  Future<Either<Failure, List<CommentModel>>> getComments(
      String videoId) async {
    try {
      Response response = await service.request(
        '/videos/$videoId/comentarios',
        'GET',
        queryParams: {
          'pagina': 1,
          'itensPorPagina': 100,
        },
      );
      List<CommentModel> listComments = _getListComments(response.data);
      return Right(listComments);
    } on Failure catch (fail) {
      log(fail.message);
      return Left(fail);
    } catch (err, stackTrace) {
      log('Erro inesperado ao buscar os comentários.');
      log(stackTrace.toString());
      return Left(Failure(
        'Erro inesperado ao buscar os comentários.',
        object: err,
        stackTrace: stackTrace,
      ));
    }
  }

  @override
  Future<Either<Failure, CommentModel>> postComment(
      String videoId, String commentMessage) async {
    try {
      if (!loggedState.isLogged) {
        throw Failure('Usuário precisa estar logado.');
      }
      Response response = await service.request(
        '/videos/$videoId/comentarios',
        'POST',
        body: {'texto': commentMessage},
      );
      return (Right(CommentModel.fromMap(response.data)));
    } on Failure catch (fail) {
      log(fail.message);
      return Left(fail);
    } catch (err, stackTrace) {
      log('Erro inesperado ao criar um comentário.');
      log(stackTrace.toString());
      return Left(Failure(
        'Erro inesperado ao criar um comentário.',
        object: err,
        stackTrace: stackTrace,
      ));
    }
  }

  @override
  Future<Either<Failure, CommentModel>> editComment(
      String videoId, String commentId, String commentMessage) async {
    try {
      if (!loggedState.isLogged) {
        throw Failure('Usuário precisa estar logado.');
      }
      Response response = await service.request(
        '/videos/$videoId/comentarios/$commentId',
        'PATCH',
        body: {'texto': commentMessage},
      );
      return (Right(CommentModel.fromMap(response.data)));
    } on Failure catch (fail) {
      log(fail.message);
      return Left(fail);
    } catch (err, stackTrace) {
      log('Erro inesperado ao editar um comentário.');
      log(stackTrace.toString());
      return Left(Failure(
        'Erro inesperado ao editar um comentário.',
        object: err,
        stackTrace: stackTrace,
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteComment(
      String videoId, String commentId) async {
    try {
      if (!loggedState.isLogged) {
        throw Failure('Usuário precisa estar logado.');
      }
      Response response = await service.request(
        '/videos/$videoId/comentarios/$commentId',
        'DELETE',
      );
      return (Right(response.statusCode == 204));
    } on Failure catch (fail) {
      log(fail.message);
      return Left(fail);
    } catch (err, stackTrace) {
      log('Erro inesperado ao deletar o comentário.');
      log(stackTrace.toString());
      return Left(Failure(
        'Erro inesperado ao deletar o comentário.',
        object: err,
        stackTrace: stackTrace,
      ));
    }
  }

  @override
  Future<Either<Failure, bool>> voteComment(
    String videoId,
    String commentId, {
    isUpVote = true,
    resetVote = false,
  }) async {
    try {
      if (!loggedState.isLogged) {
        throw Failure('Usuário precisa estar logado.');
      }
      Response response = await service.request(
        '/videos/$videoId/comentarios/$commentId/votes',
        resetVote ? 'DELETE' : 'PUT',
        body: resetVote ? null : {'vote': isUpVote ? 'up' : 'down'},
      );
      return (Right(response.statusCode == 200));
    } on Failure catch (fail) {
      log(fail.message);
      return Left(fail);
    } catch (err, stackTrace) {
      log('Erro inesperado ao votar um comentário.');
      log(stackTrace.toString());
      return Left(Failure(
        'Erro inesperado ao votar um comentário.',
        object: err,
        stackTrace: stackTrace,
      ));
    }
  }

  List<CommentModel> _getListComments(List<dynamic> data) {
    List<CommentModel> listComments =
        data.map((comment) => CommentModel.fromMap(comment)).toList();

    listComments.sort((commentA, commentB) {
      int commentADate =
          DateTime.parse(commentA.createdAt).microsecondsSinceEpoch;
      int commentBDate =
          DateTime.parse(commentB.createdAt).microsecondsSinceEpoch;
      return commentBDate.compareTo(commentADate);
    });
    return listComments;
  }
}
