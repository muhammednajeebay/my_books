
class BookModel {
    final String? key;
    final String? name;
    final String? subjectType;
    final String? solrQuery;
    final int? workCount;
    final List<Work>? works;

    BookModel({
        this.key,
        this.name,
        this.subjectType,
        this.solrQuery,
        this.workCount,
        this.works,
    });

    BookModel copyWith({
        String? key,
        String? name,
        String? subjectType,
        String? solrQuery,
        int? workCount,
        List<Work>? works,
    }) => 
        BookModel(
            key: key ?? this.key,
            name: name ?? this.name,
            subjectType: subjectType ?? this.subjectType,
            solrQuery: solrQuery ?? this.solrQuery,
            workCount: workCount ?? this.workCount,
            works: works ?? this.works,
        );

    factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        key: json["key"],
        name: json["name"],
        subjectType: json["subject_type"],
        solrQuery: json["solr_query"],
        workCount: json["work_count"],
        works: json["works"] == null ? [] : List<Work>.from(json["works"]!.map((x) => Work.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
        "subject_type": subjectType,
        "solr_query": solrQuery,
        "work_count": workCount,
        "works": works == null ? [] : List<dynamic>.from(works!.map((x) => x.toJson())),
    };
}

class Work {
    final String? key;
    final String? title;
    final int? editionCount;
    final int? coverId;
    final String? coverEditionKey;
    final List<String>? subject;
    final List<String>? iaCollection;
    final bool? printdisabled;
    final String? lendingEdition;
    final String? lendingIdentifier;
    final List<Author>? authors;
    final int? firstPublishYear;
    final String? ia;
    final bool? publicScan;
    final bool? hasFulltext;
    final Availability? availability;

    Work({
        this.key,
        this.title,
        this.editionCount,
        this.coverId,
        this.coverEditionKey,
        this.subject,
        this.iaCollection,
        this.printdisabled,
        this.lendingEdition,
        this.lendingIdentifier,
        this.authors,
        this.firstPublishYear,
        this.ia,
        this.publicScan,
        this.hasFulltext,
        this.availability,
    });

    Work copyWith({
        String? key,
        String? title,
        int? editionCount,
        int? coverId,
        String? coverEditionKey,
        List<String>? subject,
        List<String>? iaCollection,
        bool? printdisabled,
        String? lendingEdition,
        String? lendingIdentifier,
        List<Author>? authors,
        int? firstPublishYear,
        String? ia,
        bool? publicScan,
        bool? hasFulltext,
        Availability? availability,
    }) => 
        Work(
            key: key ?? this.key,
            title: title ?? this.title,
            editionCount: editionCount ?? this.editionCount,
            coverId: coverId ?? this.coverId,
            coverEditionKey: coverEditionKey ?? this.coverEditionKey,
            subject: subject ?? this.subject,
            iaCollection: iaCollection ?? this.iaCollection,
            printdisabled: printdisabled ?? this.printdisabled,
            lendingEdition: lendingEdition ?? this.lendingEdition,
            lendingIdentifier: lendingIdentifier ?? this.lendingIdentifier,
            authors: authors ?? this.authors,
            firstPublishYear: firstPublishYear ?? this.firstPublishYear,
            ia: ia ?? this.ia,
            publicScan: publicScan ?? this.publicScan,
            hasFulltext: hasFulltext ?? this.hasFulltext,
            availability: availability ?? this.availability,
        );

    factory Work.fromJson(Map<String, dynamic> json) => Work(
        key: json["key"],
        title: json["title"],
        editionCount: json["edition_count"],
        coverId: json["cover_id"],
        coverEditionKey: json["cover_edition_key"],
        subject: json["subject"] == null ? [] : List<String>.from(json["subject"]!.map((x) => x)),
        iaCollection: json["ia_collection"] == null ? [] : List<String>.from(json["ia_collection"]!.map((x) => x)),
        printdisabled: json["printdisabled"],
        lendingEdition: json["lending_edition"],
        lendingIdentifier: json["lending_identifier"],
        authors: json["authors"] == null ? [] : List<Author>.from(json["authors"]!.map((x) => Author.fromJson(x))),
        firstPublishYear: json["first_publish_year"],
        ia: json["ia"],
        publicScan: json["public_scan"],
        hasFulltext: json["has_fulltext"],
        availability: json["availability"] == null ? null : Availability.fromJson(json["availability"]),
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "title": title,
        "edition_count": editionCount,
        "cover_id": coverId,
        "cover_edition_key": coverEditionKey,
        "subject": subject == null ? [] : List<dynamic>.from(subject!.map((x) => x)),
        "ia_collection": iaCollection == null ? [] : List<dynamic>.from(iaCollection!.map((x) => x)),
        "printdisabled": printdisabled,
        "lending_edition": lendingEdition,
        "lending_identifier": lendingIdentifier,
        "authors": authors == null ? [] : List<dynamic>.from(authors!.map((x) => x.toJson())),
        "first_publish_year": firstPublishYear,
        "ia": ia,
        "public_scan": publicScan,
        "has_fulltext": hasFulltext,
        "availability": availability?.toJson(),
    };
}

class Author {
    final String? key;
    final String? name;

    Author({
        this.key,
        this.name,
    });

    Author copyWith({
        String? key,
        String? name,
    }) => 
        Author(
            key: key ?? this.key,
            name: name ?? this.name,
        );

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        key: json["key"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "name": name,
    };
}

class Availability {
    final String? status;
    final bool? availableToBrowse;
    final bool? availableToBorrow;
    final bool? availableToWaitlist;
    final bool? isPrintdisabled;
    final bool? isReadable;
    final bool? isLendable;
    final bool? isPreviewable;
    final String? identifier;
    final String? isbn;
    final dynamic oclc;
    final String? openlibraryWork;
    final String? openlibraryEdition;
    final dynamic lastLoanDate;
    final dynamic numWaitlist;
    final dynamic lastWaitlistDate;
    final bool? isRestricted;
    final bool? isBrowseable;
    final Src? src;
    final String? errorMessage;

    Availability({
        this.status,
        this.availableToBrowse,
        this.availableToBorrow,
        this.availableToWaitlist,
        this.isPrintdisabled,
        this.isReadable,
        this.isLendable,
        this.isPreviewable,
        this.identifier,
        this.isbn,
        this.oclc,
        this.openlibraryWork,
        this.openlibraryEdition,
        this.lastLoanDate,
        this.numWaitlist,
        this.lastWaitlistDate,
        this.isRestricted,
        this.isBrowseable,
        this.src,
        this.errorMessage,
    });

    Availability copyWith({
        String? status,
        bool? availableToBrowse,
        bool? availableToBorrow,
        bool? availableToWaitlist,
        bool? isPrintdisabled,
        bool? isReadable,
        bool? isLendable,
        bool? isPreviewable,
        String? identifier,
        String? isbn,
        dynamic oclc,
        String? openlibraryWork,
        String? openlibraryEdition,
        dynamic lastLoanDate,
        dynamic numWaitlist,
        dynamic lastWaitlistDate,
        bool? isRestricted,
        bool? isBrowseable,
        Src? src,
        String? errorMessage,
    }) => 
        Availability(
            status: status ?? this.status,
            availableToBrowse: availableToBrowse ?? this.availableToBrowse,
            availableToBorrow: availableToBorrow ?? this.availableToBorrow,
            availableToWaitlist: availableToWaitlist ?? this.availableToWaitlist,
            isPrintdisabled: isPrintdisabled ?? this.isPrintdisabled,
            isReadable: isReadable ?? this.isReadable,
            isLendable: isLendable ?? this.isLendable,
            isPreviewable: isPreviewable ?? this.isPreviewable,
            identifier: identifier ?? this.identifier,
            isbn: isbn ?? this.isbn,
            oclc: oclc ?? this.oclc,
            openlibraryWork: openlibraryWork ?? this.openlibraryWork,
            openlibraryEdition: openlibraryEdition ?? this.openlibraryEdition,
            lastLoanDate: lastLoanDate ?? this.lastLoanDate,
            numWaitlist: numWaitlist ?? this.numWaitlist,
            lastWaitlistDate: lastWaitlistDate ?? this.lastWaitlistDate,
            isRestricted: isRestricted ?? this.isRestricted,
            isBrowseable: isBrowseable ?? this.isBrowseable,
            src: src ?? this.src,
            errorMessage: errorMessage ?? this.errorMessage,
        );

    factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        status: json["status"],
        availableToBrowse: json["available_to_browse"],
        availableToBorrow: json["available_to_borrow"],
        availableToWaitlist: json["available_to_waitlist"],
        isPrintdisabled: json["is_printdisabled"],
        isReadable: json["is_readable"],
        isLendable: json["is_lendable"],
        isPreviewable: json["is_previewable"],
        identifier: json["identifier"],
        isbn: json["isbn"],
        oclc: json["oclc"],
        openlibraryWork: json["openlibrary_work"],
        openlibraryEdition: json["openlibrary_edition"],
        lastLoanDate: json["last_loan_date"],
        numWaitlist: json["num_waitlist"],
        lastWaitlistDate: json["last_waitlist_date"],
        isRestricted: json["is_restricted"],
        isBrowseable: json["is_browseable"],
        src: srcValues.map[json["__src__"]]!,
        errorMessage: json["error_message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "available_to_browse": availableToBrowse,
        "available_to_borrow": availableToBorrow,
        "available_to_waitlist": availableToWaitlist,
        "is_printdisabled": isPrintdisabled,
        "is_readable": isReadable,
        "is_lendable": isLendable,
        "is_previewable": isPreviewable,
        "identifier": identifier,
        "isbn": isbn,
        "oclc": oclc,
        "openlibrary_work": openlibraryWork,
        "openlibrary_edition": openlibraryEdition,
        "last_loan_date": lastLoanDate,
        "num_waitlist": numWaitlist,
        "last_waitlist_date": lastWaitlistDate,
        "is_restricted": isRestricted,
        "is_browseable": isBrowseable,
        "__src__": srcValues.reverse[src],
        "error_message": errorMessage,
    };
}

enum Src {
    CORE_MODELS_LENDING_GET_AVAILABILITY
}

final srcValues = EnumValues({
    "core.models.lending.get_availability": Src.CORE_MODELS_LENDING_GET_AVAILABILITY
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
