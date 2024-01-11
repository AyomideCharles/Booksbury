// import 'dart:convert';

// // // Books booksFromJson(String str) => Books.fromJson(json.decode(str));

// // // String booksToJson(Books data) => json.encode(data.toJson());

// // // class Books {
// // //     String kind;
// // //     int totalItems;
// // //     List<Item> items;

// // //     Books({
// // //         required this.kind,
// // //         required this.totalItems,
// // //         required this.items,
// // //     });

// // //     factory Books.fromJson(Map<String, dynamic> json) => Books(
// // //         kind: json["kind"],
// // //         totalItems: json["totalItems"],
// // //         items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
// // //     );

// // //     Map<String, dynamic> toJson() => {
// // //         "kind": kind,
// // //         "totalItems": totalItems,
// // //         "items": List<dynamic>.from(items.map((x) => x.toJson())),
// // //     };
// // // }

// // // class Item {
// // //     Kind kind;
// // //     String id;
// // //     String etag;
// // //     String selfLink;
// // //     VolumeInfo volumeInfo;
// // //     SaleInfo saleInfo;
// // //     AccessInfo accessInfo;
// // //     SearchInfo? searchInfo;

// // //     Item({
// // //         required this.kind,
// // //         required this.id,
// // //         required this.etag,
// // //         required this.selfLink,
// // //         required this.volumeInfo,
// // //         required this.saleInfo,
// // //         required this.accessInfo,
// // //         this.searchInfo,
// // //     });

// // //     factory Item.fromJson(Map<String, dynamic> json) => Item(
// // //         kind: kindValues.map[json["kind"]]!,
// // //         id: json["id"],
// // //         etag: json["etag"],
// // //         selfLink: json["selfLink"],
// // //         volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
// // //         saleInfo: SaleInfo.fromJson(json["saleInfo"]),
// // //         accessInfo: AccessInfo.fromJson(json["accessInfo"]),
// // //         searchInfo: json["searchInfo"] == null ? null : SearchInfo.fromJson(json["searchInfo"]),
// // //     );

// // //     Map<String, dynamic> toJson() => {
// // //         "kind": kindValues.reverse[kind],
// // //         "id": id,
// // //         "etag": etag,
// // //         "selfLink": selfLink,
// // //         "volumeInfo": volumeInfo.toJson(),
// // //         "saleInfo": saleInfo.toJson(),
// // //         "accessInfo": accessInfo.toJson(),
// // //         "searchInfo": searchInfo?.toJson(),
// // //     };
// // // }

// // // class AccessInfo {
// // //     Country country;
// // //     Viewability viewability;
// // //     bool embeddable;
// // //     bool publicDomain;
// // //     TextToSpeechPermission textToSpeechPermission;
// // //     Epub epub;
// // //     Pdf pdf;
// // //     String webReaderLink;
// // //     AccessViewStatus accessViewStatus;
// // //     bool quoteSharingAllowed;

// // //     AccessInfo({
// // //         required this.country,
// // //         required this.viewability,
// // //         required this.embeddable,
// // //         required this.publicDomain,
// // //         required this.textToSpeechPermission,
// // //         required this.epub,
// // //         required this.pdf,
// // //         required this.webReaderLink,
// // //         required this.accessViewStatus,
// // //         required this.quoteSharingAllowed,
// // //     });

// // //     factory AccessInfo.fromJson(Map<String, dynamic> json) => AccessInfo(
// // //         country: countryValues.map[json["country"]]!,
// // //         viewability: viewabilityValues.map[json["viewability"]]!,
// // //         embeddable: json["embeddable"],
// // //         publicDomain: json["publicDomain"],
// // //         textToSpeechPermission: textToSpeechPermissionValues.map[json["textToSpeechPermission"]]!,
// // //         epub: Epub.fromJson(json["epub"]),
// // //         pdf: Pdf.fromJson(json["pdf"]),
// // //         webReaderLink: json["webReaderLink"],
// // //         accessViewStatus: accessViewStatusValues.map[json["accessViewStatus"]]!,
// // //         quoteSharingAllowed: json["quoteSharingAllowed"],
// // //     );

// // //     Map<String, dynamic> toJson() => {
// // //         "country": countryValues.reverse[country],
// // //         "viewability": viewabilityValues.reverse[viewability],
// // //         "embeddable": embeddable,
// // //         "publicDomain": publicDomain,
// // //         "textToSpeechPermission": textToSpeechPermissionValues.reverse[textToSpeechPermission],
// // //         "epub": epub.toJson(),
// // //         "pdf": pdf.toJson(),
// // //         "webReaderLink": webReaderLink,
// // //         "accessViewStatus": accessViewStatusValues.reverse[accessViewStatus],
// // //         "quoteSharingAllowed": quoteSharingAllowed,
// // //     };
// // // }

// // // enum AccessViewStatus {
// // //     NONE,
// // //     SAMPLE
// // // }

// // // final accessViewStatusValues = EnumValues({
// // //     "NONE": AccessViewStatus.NONE,
// // //     "SAMPLE": AccessViewStatus.SAMPLE
// // // });

// // // enum Country {
// // //     NG
// // // }

// // // final countryValues = EnumValues({
// // //     "NG": Country.NG
// // // });

// // // class Epub {
// // //     bool isAvailable;

// // //     Epub({
// // //         required this.isAvailable,
// // //     });

// // //     factory Epub.fromJson(Map<String, dynamic> json) => Epub(
// // //         isAvailable: json["isAvailable"],
// // //     );

// // //     Map<String, dynamic> toJson() => {
// // //         "isAvailable": isAvailable,
// // //     };
// // // }

// // // class Pdf {
// // //     bool isAvailable;
// // //     String? acsTokenLink;

// // //     Pdf({
// // //         required this.isAvailable,
// // //         this.acsTokenLink,
// // //     });

// // //     factory Pdf.fromJson(Map<String, dynamic> json) => Pdf(
// // //         isAvailable: json["isAvailable"],
// // //         acsTokenLink: json["acsTokenLink"],
// // //     );

// // //     Map<String, dynamic> toJson() => {
// // //         "isAvailable": isAvailable,
// // //         "acsTokenLink": acsTokenLink,
// // //     };
// // // }

// // // enum TextToSpeechPermission {
// // //     ALLOWED
// // // }

// // // final textToSpeechPermissionValues = EnumValues({
// // //     "ALLOWED": TextToSpeechPermission.ALLOWED
// // // });

// // // enum Viewability {
// // //     NO_PAGES,
// // //     PARTIAL
// // // }

// // // final viewabilityValues = EnumValues({
// // //     "NO_PAGES": Viewability.NO_PAGES,
// // //     "PARTIAL": Viewability.PARTIAL
// // // });

// // // enum Kind {
// // //     BOOKS_VOLUME
// // // }

// // // final kindValues = EnumValues({
// // //     "books#volume": Kind.BOOKS_VOLUME
// // // });

// // // class SaleInfo {
// // //     Country country;
// // //     Saleability saleability;
// // //     bool isEbook;

// // //     SaleInfo({
// // //         required this.country,
// // //         required this.saleability,
// // //         required this.isEbook,
// // //     });

// // //     factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
// // //         country: countryValues.map[json["country"]]!,
// // //         saleability: saleabilityValues.map[json["saleability"]]!,
// // //         isEbook: json["isEbook"],
// // //     );

// // //     Map<String, dynamic> toJson() => {
// // //         "country": countryValues.reverse[country],
// // //         "saleability": saleabilityValues.reverse[saleability],
// // //         "isEbook": isEbook,
// // //     };
// // // }

// // // enum Saleability {
// // //     NOT_FOR_SALE
// // // }

// // // final saleabilityValues = EnumValues({
// // //     "NOT_FOR_SALE": Saleability.NOT_FOR_SALE
// // // });

// // // class SearchInfo {
// // //     String textSnippet;

// // //     SearchInfo({
// // //         required this.textSnippet,
// // //     });

// // //     factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
// // //         textSnippet: json["textSnippet"],
// // //     );

// // //     Map<String, dynamic> toJson() => {
// // //         "textSnippet": textSnippet,
// // //     };
// // // }

// class VolumeInfo {
//   String title;
//   List<String> authors;
//   String? publisher;
//   String publishedDate;
//   String? description;
//   // List<IndustryIdentifier>? industryIdentifiers;
//   // ReadingModes readingModes;
//   int pageCount;
//   // PrintType printType;
//   // MaturityRating maturityRating;
//   bool allowAnonLogging;
//   String contentVersion;
//   // PanelizationSummary panelizationSummary;
//   ImageLinks imageLinks;
//   // Language language;
//   String previewLink;
//   String infoLink;
//   String canonicalVolumeLink;
//   List<String>? categories;
//   int? averageRating;
//   int? ratingsCount;
//   String? subtitle;

//   VolumeInfo({
//     required this.title,
//     required this.authors,
//     this.publisher,
//     required this.publishedDate,
//     this.description,
//     // this.industryIdentifiers,
//     // required this.readingModes,
//     required this.pageCount,
//     // required this.printType,
//     // required this.maturityRating,
//     required this.allowAnonLogging,
//     required this.contentVersion,
//     // required this.panelizationSummary,
//     required this.imageLinks,
//     // required this.language,
//     required this.previewLink,
//     required this.infoLink,
//     required this.canonicalVolumeLink,
//     this.categories,
//     this.averageRating,
//     this.ratingsCount,
//     this.subtitle,
//   });

//   factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
//         title: json["title"],
//         authors: List<String>.from(json["authors"].map((x) => x)),
//         publisher: json["publisher"],
//         publishedDate: json["publishedDate"],
//         description: json["description"],
//         // industryIdentifiers: json["industryIdentifiers"] == null ? [] : List<IndustryIdentifier>.from(json["industryIdentifiers"]!.map((x) => IndustryIdentifier.fromJson(x))),
//         // readingModes: ReadingModes.fromJson(json["readingModes"]),
//         pageCount: json["pageCount"],
//         // printType: printTypeValues.map[json["printType"]]!,
//         // maturityRating: maturityRatingValues.map[json["maturityRating"]]!,
//         allowAnonLogging: json["allowAnonLogging"],
//         contentVersion: json["contentVersion"],
//         // panelizationSummary: PanelizationSummary.fromJson(json["panelizationSummary"]),
//         imageLinks: ImageLinks.fromJson(json["imageLinks"]),
//         // language: languageValues.map[json["language"]]!,
//         previewLink: json["previewLink"],
//         infoLink: json["infoLink"],
//         canonicalVolumeLink: json["canonicalVolumeLink"],
//         categories: json["categories"] == null
//             ? []
//             : List<String>.from(json["categories"]!.map((x) => x)),
//         averageRating: json["averageRating"],
//         ratingsCount: json["ratingsCount"],
//         subtitle: json["subtitle"],
//       );

//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "authors": List<dynamic>.from(authors.map((x) => x)),
//         "publisher": publisher,
//         "publishedDate": publishedDate,
//         "description": description,
//         // "industryIdentifiers": industryIdentifiers == null ? [] : List<dynamic>.from(industryIdentifiers!.map((x) => x.toJson())),
//         // "readingModes": readingModes.toJson(),
//         "pageCount": pageCount,
//         // "printType": printTypeValues.reverse[printType],
//         // "maturityRating": maturityRatingValues.reverse[maturityRating],
//         "allowAnonLogging": allowAnonLogging,
//         "contentVersion": contentVersion,
//         // "panelizationSummary": panelizationSummary.toJson(),
//         "imageLinks": imageLinks.toJson(),
//         // "language": languageValues.reverse[language],
//         "previewLink": previewLink,
//         "infoLink": infoLink,
//         "canonicalVolumeLink": canonicalVolumeLink,
//         "categories": categories == null
//             ? []
//             : List<dynamic>.from(categories!.map((x) => x)),
//         "averageRating": averageRating,
//         "ratingsCount": ratingsCount,
//         "subtitle": subtitle,
//       };
// }

// class ImageLinks {
//   String smallThumbnail;
//   String thumbnail;

//   ImageLinks({
//     required this.smallThumbnail,
//     required this.thumbnail,
//   });

//   factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
//         smallThumbnail: json["smallThumbnail"],
//         thumbnail: json["thumbnail"],
//       );

//   Map<String, dynamic> toJson() => {
//         "smallThumbnail": smallThumbnail,
//         "thumbnail": thumbnail,
//       };
// }

// // // class IndustryIdentifier {
// // //     Type type;
// // //     String identifier;

// // //     IndustryIdentifier({
// // //         required this.type,
// // //         required this.identifier,
// // //     });

// // //     factory IndustryIdentifier.fromJson(Map<String, dynamic> json) => IndustryIdentifier(
// // //         type: typeValues.map[json["type"]]!,
// // //         identifier: json["identifier"],
// // //     );

// // //     Map<String, dynamic> toJson() => {
// // //         "type": typeValues.reverse[type],
// // //         "identifier": identifier,
// // //     };
// // // }

// // // enum Type {
// // //     ISBN_10,
// // //     ISBN_13,
// // //     OTHER
// // // }

// // // final typeValues = EnumValues({
// // //     "ISBN_10": Type.ISBN_10,
// // //     "ISBN_13": Type.ISBN_13,
// // //     "OTHER": Type.OTHER
// // // });

// // // enum Language {
// // //     EN
// // // }

// // // final languageValues = EnumValues({
// // //     "en": Language.EN
// // // });

// // // enum MaturityRating {
// // //     NOT_MATURE
// // // }

// // // final maturityRatingValues = EnumValues({
// // //     "NOT_MATURE": MaturityRating.NOT_MATURE
// // // });

// // // class PanelizationSummary {
// // //     bool containsEpubBubbles;
// // //     bool containsImageBubbles;

// // //     PanelizationSummary({
// // //         required this.containsEpubBubbles,
// // //         required this.containsImageBubbles,
// // //     });

// // //     factory PanelizationSummary.fromJson(Map<String, dynamic> json) => PanelizationSummary(
// // //         containsEpubBubbles: json["containsEpubBubbles"],
// // //         containsImageBubbles: json["containsImageBubbles"],
// // //     );

// // //     Map<String, dynamic> toJson() => {
// // //         "containsEpubBubbles": containsEpubBubbles,
// // //         "containsImageBubbles": containsImageBubbles,
// // //     };
// // // }

// // // enum PrintType {
// // //     BOOK
// // // }

// // // final printTypeValues = EnumValues({
// // //     "BOOK": PrintType.BOOK
// // // });

// // // class ReadingModes {
// // //     bool text;
// // //     bool image;

// // //     ReadingModes({
// // //         required this.text,
// // //         required this.image,
// // //     });

// // //     factory ReadingModes.fromJson(Map<String, dynamic> json) => ReadingModes(
// // //         text: json["text"],
// // //         image: json["image"],
// // //     );

// // //     Map<String, dynamic> toJson() => {
// // //         "text": text,
// // //         "image": image,
// // //     };
// // // }

// // // class EnumValues<T> {
// // //     Map<String, T> map;
// // //     late Map<T, String> reverseMap;

// // //     EnumValues(this.map);

// // //     Map<T, String> get reverse {
// // //         reverseMap = map.map((k, v) => MapEntry(v, k));
// // //         return reverseMap;
// // //     }
// // // }

class VolumeInfo {
  String title;
  List<String> authors;
  String? publisher;
  String? publishedDate;
  String? description;
  int pageCount;
  bool allowAnonLogging;
  String? contentVersion;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;
  List<String> categories;
  int? averageRating;
  int? ratingsCount;
  String? subtitle;

  ImageLinks? imageLinks;

  VolumeInfo({
    required this.title,
    required this.authors,
    this.publisher,
    required this.publishedDate,
    this.description,
    required this.pageCount,
    required this.allowAnonLogging,
    required this.contentVersion,
    required this.previewLink,
    required this.infoLink,
    required this.canonicalVolumeLink,
    required this.categories,
    this.averageRating,
    this.ratingsCount,
    this.subtitle,
    this.imageLinks,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) {
    return VolumeInfo(
      title: json['title'],
      authors: List<String>.from(json['authors']),
      publisher: json['publisher'],
      publishedDate: json['publishedDate'],
      description: json['description'],
      pageCount: json['pageCount'],
      allowAnonLogging: json['allowAnonLogging'],
      contentVersion: json['contentVersion'],
      previewLink: json['previewLink'],
      infoLink: json['infoLink'],
      canonicalVolumeLink: json['canonicalVolumeLink'],
      categories: List<String>.from(json['categories']),
      // categories: json['categories'] != null
      //     ? List<String>.from(json['categories'])
      //     : null,
      averageRating: json['averageRating'],
      ratingsCount: json['ratingsCount'],
      subtitle: json['subtitle'],

      imageLinks: json['imageLinks'] != null
          ? ImageLinks.fromJson(json['imageLinks'])
          : null,
    );
  }
}

class ImageLinks {
  String? smallThumbnail;
  String? thumbnail;

  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  factory ImageLinks.fromJson(Map<String, dynamic> json) {
    return ImageLinks(
      smallThumbnail: json['smallThumbnail'],
      thumbnail: json['thumbnail'],
    );
  }
}
