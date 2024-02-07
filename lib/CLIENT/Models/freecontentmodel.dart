// import 'package:flutter/foundation.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
//
// class FreeContentModel {
//   bool? status;
//   List<FreeContentData>? freeContentData;
//
//   FreeContentModel({this.status, this.freeContentData});
//
//   FreeContentModel.fromJson(Map<String, dynamic> json) {
//     try {
//       status = json['status'];
//       if (json['data'] != null) {
//         freeContentData = <FreeContentData>[];
//         json['data'].forEach((v) {
//           freeContentData!.add(new FreeContentData.fromJson(v));
//         });
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     try {
//       data['status'] = this.status;
//       if (this.freeContentData != null) {
//         data['data'] = this.freeContentData!.map((v) => v.toJson()).toList();
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//     return data;
//   }
// }
//
// class FreeContentData {
//   int? id;
//   String? name;
//   String? videoUrl;
//   String? crew;
//   late YoutubePlayerController youtubePlayerController;
//
//   FreeContentData({this.id, this.name, this.videoUrl, this.crew});
//
//   FreeContentData.fromJson(Map<String, dynamic> json) {
//     try {
//       id = json['id'];
//       name = json['name'];
//       videoUrl = json['video_url'];
//       crew = json['crew'];
//       if (videoUrl != null)
//       {
//         late String subString, videoId, videoUrls;
//         videoUrls = videoUrl ?? "";
//         if (videoUrls.toString().contains("embed")) {
//           subString =
//               videoUrls.substring(videoUrls.toString().lastIndexOf("/"));
//           videoId = subString.substring(1);
//         }
//         youtubePlayerController =YoutubePlayerController(
//             initialVideoId: videoId,
//             flags: YoutubePlayerFlags(
//                 autoPlay: false,
//                 loop: true,
//                 mute: false
//             )
//         );
//
//       }
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     try {
//       data['id'] = this.id;
//       data['name'] = this.name;
//       data['video_url'] = this.videoUrl;
//       data['crew'] = this.crew;
//       data['youtubePlayerController'] = this.youtubePlayerController;
//     } catch (e) {
//       if (kDebugMode) {
//         print(e);
//       }
//     }
//     return data;
//   }
// }
//

class FreeContentDataModel {
  int? id;
  String? video;
  String? title;
  int? month;

  FreeContentDataModel({this.id, this.video, this.title, this.month});

  FreeContentDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    video = json['video'];
    title = json['title'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video'] = this.video;
    data['title'] = this.title;
    data['month'] = this.month;
    return data;
  }
}