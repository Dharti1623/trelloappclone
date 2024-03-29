import 'package:serverpod/server.dart';
import 'package:trelloappclone_server/src/generated/protocol.dart';

class CommentEndpoint extends Endpoint {
  Future<Comment> createComment(Session session, Comment comment) async {
    await Comment.insert(session, comment);
    return comment;
  }

  Future<bool> updateComment(Session session, Comment comment) async {
    return await session.db.update(comment);
  }

  Future<bool> deleteComment(Session session, Comment comment) async {
    return await Comment.deleteRow(session, comment);
  }
}
