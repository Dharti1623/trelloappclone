import 'package:serverpod/server.dart';
import 'package:trelloappclone_server/src/generated/protocol.dart';

class ActivityEndpoint extends Endpoint {
  Future<bool> createActivity(Session session, Activity activity) async {
    await Activity.insert(session, activity);
    return true;
  }

/*  Future<List<Activity>> getActivities(Session session, Cardlist crd) async {
  List<Activity> activities =
  await Activity.find(session, where: (a) => a.cardId.equals(crd.id));
  return activities;
  }*/
}