import 'package:hirfi_home/data/model/workinghours_model.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_fetch_service.dart';
import 'package:hirfi_home/data/service/subabase_service/supabase_send_service.dart';

class WorkingHoursRepository {
  final SupabaseFetchService _fetchService;
  final SupabaseSendService _sendService;

  WorkingHoursRepository(this._fetchService, this._sendService);

  Future<List<WorkingHoursModel>> getWorkingHours(String craftsmanId) async {
    final response = await _fetchService.fetchList(
      'workinghours',
      WorkingHoursModel.columns,
      'craftman_id',
      craftsmanId,
    );
    return response.map((map) => WorkingHoursModel.fromMap(map)).toList();
  }

  Future<void> insertOrUpdate(List<WorkingHoursModel> hoursList) async {
    for (final entry in hoursList) {
      await _sendService.upsert(
        'workinghours',
        entry.toMap(),
        ['craftman_id', 'day_of_week'],
      );
    }
  }

  Future<void> deleteByCraftsman(String craftsmanId) async {
    await _sendService.delete('workinghours', 'craftman_id', craftsmanId);
  }
}
