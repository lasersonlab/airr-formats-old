namespace * vdjserver

enum Aminoacid
{
	Aminoacid__,
	Aminoacid_A,
	Aminoacid_Ala,
	Aminoacid_Arg,
	Aminoacid_Asn,
	Aminoacid_Asp,
	Aminoacid_C,
	Aminoacid_Cys,
	Aminoacid_D,
	Aminoacid_E,
	Aminoacid_F,
	Aminoacid_G,
	Aminoacid_Gln,
	Aminoacid_Glu,
	Aminoacid_Gly,
	Aminoacid_H,
	Aminoacid_His,
	Aminoacid_I,
	Aminoacid_Ile,
	Aminoacid_K,
	Aminoacid_L,
	Aminoacid_Leu,
	Aminoacid_Lys,
	Aminoacid_M,
	Aminoacid_Met,
	Aminoacid_N,
	Aminoacid_P,
	Aminoacid_Phe,
	Aminoacid_Pro,
	Aminoacid_Q,
	Aminoacid_R,
	Aminoacid_S,
	Aminoacid_Ser,
	Aminoacid_Stop,
	Aminoacid_T,
	Aminoacid_Thr,
	Aminoacid_Trp,
	Aminoacid_Tyr,
	Aminoacid_V,
	Aminoacid_Val,
	Aminoacid_W,
	Aminoacid_X,
	Aminoacid_Y,
	Aminoacid_a,
	Aminoacid_c,
	Aminoacid_d,
	Aminoacid_e,
	Aminoacid_f,
	Aminoacid_g,
	Aminoacid_h,
	Aminoacid_i,
	Aminoacid_k,
	Aminoacid_l,
	Aminoacid_m,
	Aminoacid_n,
	Aminoacid_p,
	Aminoacid_q,
	Aminoacid_r,
	Aminoacid_s,
	Aminoacid_t,
	Aminoacid_v,
	Aminoacid_w,
	Aminoacid_x,
	Aminoacid_y,
}

enum Nucleotide_ambiguous
{
	Nucleotide_ambiguous_B,
	Nucleotide_ambiguous_D,
	Nucleotide_ambiguous_H,
	Nucleotide_ambiguous_K,
	Nucleotide_ambiguous_M,
	Nucleotide_ambiguous_N,
	Nucleotide_ambiguous_R,
	Nucleotide_ambiguous_S,
	Nucleotide_ambiguous_V,
	Nucleotide_ambiguous_W,
	Nucleotide_ambiguous_Y,
	Nucleotide_ambiguous_b,
	Nucleotide_ambiguous_d,
	Nucleotide_ambiguous_h,
	Nucleotide_ambiguous_k,
	Nucleotide_ambiguous_m,
	Nucleotide_ambiguous_n,
	Nucleotide_ambiguous_r,
	Nucleotide_ambiguous_s,
	Nucleotide_ambiguous_v,
	Nucleotide_ambiguous_w,
	Nucleotide_ambiguous_y,
}

enum Nucleotide_defined
{
	Nucleotide_defined_A,
	Nucleotide_defined_C,
	Nucleotide_defined_G,
	Nucleotide_defined_T,
	Nucleotide_defined_U,
	Nucleotide_defined_a,
	Nucleotide_defined_c,
	Nucleotide_defined_g,
	Nucleotide_defined_t,
	Nucleotide_defined_u,
}

enum Segment_type
{
	Segment_type_D,
	Segment_type_J,
	Segment_type_V,
}

struct UnspecifiedType
{
	1 : required string baseObjectType,
	2 : required binary object,
}

struct aa_substitutionType
{
	1 : required Aminoacid gl_aa,
	2 : required Aminoacid read_aa,
	3 : required i64 read_pos0,
}

struct alignerType
{
	1 : required i64 aligner_id,
	2 : required string name,
	3 : optional string parameters,
	4 : optional i64 run_id,
	5 : optional UnspecifiedType uri,
	6 : optional string version,
}

struct generatorType
{
	1 : required string name,
	2 : required i64 time_gmt,
	3 : required string version,
}

struct germline_dbType
{
	1 : required i64 gl_db_id,
	2 : required string name,
	3 : required string species,
	4 : optional UnspecifiedType uri,
	5 : required string version,
}

struct gl_seg_matchType
{
	1 : required i64 aligner_id,
	2 : required i64 gl_db_id,
	3 : required i64 gl_pos0,
	4 : required i64 gl_seg_match_id,
	5 : required string name,
	6 : required string num_system,
	7 : required Segment_type type,
}

struct metaType
{
	1 : optional alignerType aligner,
	2 : required generatorType generator,
	3 : optional germline_dbType germline_db,
}

struct regionType
{
	1 : required i64 aligner_id,
	2 : optional i64 deletions,
	3 : optional string identity,
	4 : optional i64 insertions,
	5 : optional bool inverted,
	6 : optional bool mutated_invariant,
	7 : required string name,
	8 : optional string num_system,
	9 : optional bool out_frame_indel,
	10 : optional bool out_frame_vdj,
	11 : required i64 read_len,
	12 : required i64 read_pos0,
	13 : optional i64 score,
	14 : optional bool stop_codon,
	15 : optional i64 substitutions,
}

struct segment_matchType
{
	1 : optional list<aa_substitutionType> aa_substitution,
	2 : required string btop,
	3 : optional i64 deletions,
	4 : required i64 gl_len,
	5 : required list<gl_seg_matchType> gl_seg_match,
	6 : optional string identity,
	7 : optional i64 insertions,
	8 : optional bool inverted,
	9 : optional bool mutated_invariant,
	10 : optional bool out_frame_indel,
	11 : optional bool out_frame_vdj,
	12 : required i64 read_len,
	13 : required i64 read_pos0,
	14 : optional i64 score,
	15 : required i64 segment_match_id,
	16 : optional bool stop_codon,
	17 : optional i64 substitutions,
}

struct combinationType
{
	1 : optional list<regionType> region,
	2 : required list<i64> segments,
}

struct vdj_alignmentType
{
	1 : required list<combinationType> combination,
	2 : required list<segment_matchType> segment_match,
}

struct readType
{
	1 : required string read_id,
	2 : optional vdj_alignmentType vdj_alignment,
}

struct read_resultsType
{
	1 : required readType read,
}

struct vdjmlType
{
	1 : required metaType meta,
	2 : required read_resultsType read_results,
	3 : required double version,
}

