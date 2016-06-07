namespace * airr

/* AIRR DATA TYPES */

struct Study {
    1: optional string id
    2: optional string title
    3: optional string labName
    4: optional string correspondence
    5: optional string doi
}

enum Origin {
    HUMAN,
    ANIMAL,
    SYNTHETIC
}

enum Sex {
    MALE,
    FEMALE
}

struct Subject {
    1: optional string id
    2: optional Origin origin
    3: optional Sex sex
    4: optional i32 age
}

struct Sample {
    1: optional string id
    2: optional string type
    3: optional string source
    // sample collection datetime
    4: optional string dt
}

enum Locus {
    IGH,
    IGK,
    IGL,
    TRB,
    TRA,
    TRG,
    TRD
}

struct Chain {
    1: optional string id
    2: optional string ntSeq
    3: optional Locus locus
    4: optional string vAllele
    5: optional string dAllele
    6: optional string jAllele
    7: optional string alignment
    8: optional string ntCDR3
}


/* AIRR REPOSITORY INTERFACE */


struct FindCdr3Req {
    // amino acid string to search the repository for
    1: required string cdr3
    2: required Locus locus

    // specify the set of Study objects to query for CDR3; null implies all
    // available studies in the repository
    3: optional list<string> studyIds
}


struct FindCdr3Resp {
    1: required bool found
    2: optional list<string> specificities
}


service Repository {
    // searches the repository for matching CDR3 sequences
    FindCdr3Resp findCdr3(1: FindCdr3Req req)
}
