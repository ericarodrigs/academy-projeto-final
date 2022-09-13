import 'package:flutter_test/flutter_test.dart';
import 'package:rarovideowall/src/shared/global_states/videos_state/videos_state.dart';
import 'package:rarovideowall/src/shared/models/video_model.dart';

void main() {
  late VideosState state;
  setUpAll(() {
    state = VideosState.instance;
  });

  VideoModel video1 = VideoModel(
      id: '1',
      name: 'testvideo1',
      url: 'url',
      thumbUrl: 'url',
      description: 'description',
      createdAt: 'creator1',
      duration: '1:20',
      publicationDate: '01/01/2022',
      topic: 'tests',
      tags: ['tag']);
  VideoModel video2 = VideoModel(
      id: '2',
      name: 'testvideo2',
      url: 'url',
      thumbUrl: 'url',
      description: 'description',
      createdAt: 'creator2',
      duration: '2:20',
      publicationDate: '02/02/2022',
      topic: 'tests',
      tags: ['tag']);
  VideoModel video3 = VideoModel(
      id: '3',
      name: 'testvideo3',
      url: 'url',
      thumbUrl: 'url',
      description: 'description',
      createdAt: 'creator3',
      duration: '3:20',
      publicationDate: '03/03/2022',
      topic: 'tests',
      tags: ['tag']);

  group('testing the methods syncVideos, and syncFavoriteVideos.', () {
    test(
        'The list of videos must be increased according to the list of videos passed in the syncVideos method when it is called.',
        () {
      state.syncVideos([video1, video2, video3]);
      expect(state.videos.length, 3);
    });

    test(
        'The list of favorite videos must be incremented with the list of videos passed in the syncFavoriteVideos method when it is called',
        () {
      state.syncFavoriteVideos([video1, video2]);
      expect(state.favoriteVideos.length, 2);
    });
  });
}
