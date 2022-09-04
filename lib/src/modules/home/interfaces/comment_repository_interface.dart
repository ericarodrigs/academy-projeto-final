import 'package:dartz/dartz.dart';
import 'package:rarovideowall/src/modules/home/features/details/model/comment_model.dart';
import 'package:rarovideowall/src/shared/models/failure.dart';

abstract class ICommentRepository {
  Future<Either<Failure, List<CommentModel>>> getComments(String videoId);

  Future<Either<Failure, CommentModel>> postComment(
    String videoId,
    String commentMessage,
  );

  Future<Either<Failure, CommentModel>> editComment(
    String videoId,
    String commentId,
    String commentMessage,
  );

  Future<Either<Failure, bool>> deleteComment(
    String videoId,
    String commentId,
  );

  Future<Either<Failure, bool>> voteComment(
    String videoId,
    String commentId, {
    isUpVote = true,
    resetVote = false,
  });
}
