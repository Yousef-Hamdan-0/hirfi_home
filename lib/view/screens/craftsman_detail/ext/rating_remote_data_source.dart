import 'package:supabase_flutter/supabase_flutter.dart';

class RatingRemoteDataSource {
   final SupabaseClient supabase;

  RatingRemoteDataSource({required this.supabase});

  Future<void> submitRating({
    required String userId,
    required String craftsmanId,
    required int rating,
  }) async {
    final existingRating = await supabase
        .from('craftsman_ratings')
        .select()
        .eq('user_id', userId)
        .eq('craftsman_id', craftsmanId)
        .maybeSingle();

    if (existingRating == null) {
      await supabase.from('craftsman_ratings').insert({
        'user_id': userId,
        'craftsman_id': craftsmanId,
        'rating': rating,
      });
    } else {
      await supabase
          .from('craftsman_ratings')
          .update({'rating': rating}).eq('id', existingRating['id']);
    }

    final ratings = await supabase
        .from('craftsman_ratings')
        .select('rating')
        .eq('craftsman_id', craftsmanId);

    final ratingsList = ratings as List;
    final totalRatings = ratingsList.length;
    final sumRatings =
        ratingsList.fold<int>(0, (sum, item) => sum + (item['rating'] as int));
    final averageRating = totalRatings > 0 ? sumRatings / totalRatings : 0.0;

    await supabase.from('craftsman').update({
      'rating': averageRating,
      'reviews_count': totalRatings,
    }).eq('id', craftsmanId);
  }
}