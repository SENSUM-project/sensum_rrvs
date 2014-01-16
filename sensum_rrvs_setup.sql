--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
-- Name: SENSUM multi-resolution database support for Remote Rapid Visual Screening (RRVS)
-- Version: 0.1
-- Date: 13.12.13
-- Author: M. Wieland
-- DBMS: PostgreSQL9.2 / PostGIS2.0
-- SENSUM data model: tested on version 0.8 (sensum_db_v08)
-- Description: Adjusts the basic SENSUM data model to fit the SENSUM indicators used for a RRVS of buildings
-- Currently implemented indicators: GEM Taxonomy v2.0
--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Setup table structure of object.main_detail table to fit GEM Taxonomy v2.0 --
--------------------------------------------------------------------------------
ALTER TABLE object.main_detail ADD COLUMN MAT_TYPE character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_mat_type FOREIGN KEY (MAT_TYPE) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN MAT_TYPE SET DEFAULT 'MAT99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN MAT_TECH character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_mat_tech FOREIGN KEY (MAT_TECH) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN MAT_TECH SET DEFAULT 'MATT99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN MAT_PROP character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_mat_prop FOREIGN KEY (MAT_PROP) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN MAT_PROP SET DEFAULT 'MATP99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN LLRS character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_llrs FOREIGN KEY (LLRS) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN LLRS SET DEFAULT 'L99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN LLRS_DUCT character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_llrs_duct FOREIGN KEY (LLRS_DUCT) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN LLRS_DUCT SET DEFAULT 'DU99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN HEIGHT character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_height FOREIGN KEY (HEIGHT) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN HEIGHT SET DEFAULT 'H99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN HEIGHT_NUMERIC_1 integer;

ALTER TABLE object.main_detail ADD COLUMN YR_BUILT character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_yr_built FOREIGN KEY (YR_BUILT) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN YR_BUILT SET DEFAULT 'Y99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN YR_DESTR character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_yr_destr FOREIGN KEY (YR_DESTR) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN YR_DESTR SET DEFAULT 'YD99'::character varying;
  
ALTER TABLE object.main_detail ADD COLUMN OCCUPY character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_occupy FOREIGN KEY (OCCUPY) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN OCCUPY SET DEFAULT 'OC99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN OCCUPY_DT character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_occupy_dt FOREIGN KEY (OCCUPY_DT) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN OCCUPY_DT SET DEFAULT 'OCCDT99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN POSITION character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_position FOREIGN KEY (POSITION) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN POSITION SET DEFAULT 'BP99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN PLAN_SHAPE character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_plan_shape FOREIGN KEY (PLAN_SHAPE) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN PLAN_SHAPE SET DEFAULT 'PLF99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN STR_IRREG character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_str_irreg FOREIGN KEY (STR_IRREG) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN STR_IRREG SET DEFAULT 'IR99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN STR_IRREG_DT character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_str_irreg_dt FOREIGN KEY (STR_IRREG_DT) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN STR_IRREG_DT SET DEFAULT 'IRP99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN STR_IRREG_TYPE character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_str_irreg_type FOREIGN KEY (STR_IRREG_TYPE) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN STR_IRREG_TYPE SET DEFAULT 'IRT99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN NONSTRCEXW character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_nonstrcexw FOREIGN KEY (NONSTRCEXW) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN NONSTRCEXW SET DEFAULT 'EW99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN ROOF_SHAPE character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_roof_shape FOREIGN KEY (ROOF_SHAPE) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN ROOF_SHAPE SET DEFAULT 'R99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN ROOFCOVMAT character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_roofcovmat FOREIGN KEY (ROOFCOVMAT) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN ROOFCOVMAT SET DEFAULT 'RMT99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN ROOFSYSMAT character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_roofsysmat FOREIGN KEY (ROOFSYSMAT) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN ROOFSYSMAT SET DEFAULT 'RSM99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN ROOFSYSTYP character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_roofsystyp FOREIGN KEY (ROOFSYSTYP) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN ROOFSYSTYP SET DEFAULT 'RST99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN ROOF_CONN character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_roof_conn FOREIGN KEY (ROOF_CONN) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN ROOF_CONN SET DEFAULT 'RCN99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN FLOOR_MAT character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_floor_mat FOREIGN KEY (FLOOR_MAT) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN FLOOR_MAT SET DEFAULT 'F99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN FLOOR_TYPE character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_floor_type FOREIGN KEY (FLOOR_TYPE) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN FLOOR_TYPE SET DEFAULT 'FT99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN FLOOR_CONN character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_floor_conn FOREIGN KEY (FLOOR_CONN) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN FLOOR_CONN SET DEFAULT 'FWC99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN FOUNDN_SYS character varying(254);
ALTER TABLE object.main_detail ADD CONSTRAINT fk_founn_sys FOREIGN KEY (FOUNDN_SYS) REFERENCES taxonomy.dic_attribute_value (attribute_value) MATCH SIMPLE;
ALTER TABLE object.main_detail ALTER COLUMN FOUNDN_SYS SET DEFAULT 'FOS99'::character varying;

ALTER TABLE object.main_detail ADD COLUMN COMMENT character varying(254);

------------------------------------------------------------------------------------------
-- Setup table structure of object.main_detail_qualifier table to fit GEM Taxonomy v2.0 --
------------------------------------------------------------------------------------------
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_MAT_TYPE integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_MAT_TECH integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_MAT_PROP integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_LLRS integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_LLRS_DUCT integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_HEIGHT integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_YR_BUILT integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_YR_DESTR integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_OCCUPY integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_OCCUPY_DT integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_POSITION integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_PLAN_SHAPE integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_STR_IRREG integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_STR_IRREG_DT integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_STR_IRREG_TYPE integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_NONSTRCEXW integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_ROOF_SHAPE integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_ROOFCOVMAT integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_ROOFSYSMAT integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_ROOFSYSTYP integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_ROOF_CONN integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_FLOOR_MAT integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_FLOOR_TYPE integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_FLOOR_CONN integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN BP_FOUNDN_SYS integer;
ALTER TABLE object.main_detail_qualifier ADD COLUMN VT_YR_BUILT1 timestamp with time zone;
ALTER TABLE object.main_detail_qualifier ADD COLUMN VT_YR_BUILT2 timestamp with time zone;
ALTER TABLE object.main_detail_qualifier ADD COLUMN VT_YR_DESTR1 timestamp with time zone;
ALTER TABLE object.main_detail_qualifier ADD COLUMN VT_YR_DESTR2 timestamp with time zone;

-----------------------------------------------------------
-- Delete not needed default columns from basic db model --
-----------------------------------------------------------
DROP VIEW object.ve_resolution1;
DROP VIEW object.ve_resolution2;
DROP VIEW object.ve_resolution3;
ALTER TABLE object.main_detail DROP COLUMN attribute_type_code;
ALTER TABLE object.main_detail DROP COLUMN attribute_value;
ALTER TABLE object.main_detail DROP COLUMN attribute_numeric_1;
ALTER TABLE object.main_detail DROP COLUMN attribute_numeric_2;
ALTER TABLE object.main_detail DROP COLUMN attribute_text_1;

ALTER TABLE object.main_detail_qualifier DROP COLUMN qualifier_type_code;
ALTER TABLE object.main_detail_qualifier DROP COLUMN qualifier_value;
ALTER TABLE object.main_detail_qualifier DROP COLUMN qualifier_numeric_1;
ALTER TABLE object.main_detail_qualifier DROP COLUMN qualifier_text_1;
ALTER TABLE object.main_detail_qualifier DROP COLUMN qualifier_timestamp_1;
ALTER TABLE object.main_detail_qualifier DROP COLUMN qualifier_timestamp_2;

-------------------------------------------------------------------------
-- Load GEM Taxonomy v2.0 attributes and values to the taxonomy tables --
-------------------------------------------------------------------------
INSERT INTO taxonomy.dic_qualifier_type( gid, code, description, extended_description ) VALUES ( 2, 'QUALITY', 'Assessment of quality of attribute information', null ); 
INSERT INTO taxonomy.dic_qualifier_type( gid, code, description, extended_description ) VALUES ( 1, 'BELIEF', 'Uncertainty measured as subjective degree of belief', null ); 
INSERT INTO taxonomy.dic_qualifier_type( gid, code, description, extended_description ) VALUES ( 3, 'SOURCE', 'Source of information', null ); 
INSERT INTO taxonomy.dic_qualifier_type( gid, code, description, extended_description ) VALUES ( 4, 'VALIDTIME', 'Valid time of real-world object (e.g., construction period)', 'use VT_YR_BUILT1 and/or VT_YR_BUILT2 to define start of lifetime of object. use VT_YR_DESTR1 and/or VT_YR_DESTR2 to define end of lifetime of object.' ); 

INSERT INTO taxonomy.dic_qualifier_value( gid, qualifier_type_code, qualifier_value, description, extended_description ) VALUES ( 1, 'BELIEF', 'BLOW', null, null ); 
INSERT INTO taxonomy.dic_qualifier_value( gid, qualifier_type_code, qualifier_value, description, extended_description ) VALUES ( 2, 'BELIEF', 'BHIGH', null, null ); 
INSERT INTO taxonomy.dic_qualifier_value( gid, qualifier_type_code, qualifier_value, description, extended_description ) VALUES ( 3, 'BELIEF', 'BP', 'Percentage 1-100 - use add_numeric_1 to enter belief value', null ); 
INSERT INTO taxonomy.dic_qualifier_value( gid, qualifier_type_code, qualifier_value, description, extended_description ) VALUES ( 4, 'BELIEF', 'B99', 'Unknown', null ); 
INSERT INTO taxonomy.dic_qualifier_value( gid, qualifier_type_code, qualifier_value, description, extended_description ) VALUES ( 5, 'QUALITY', 'QLOW', null, null ); 
INSERT INTO taxonomy.dic_qualifier_value( gid, qualifier_type_code, qualifier_value, description, extended_description ) VALUES ( 6, 'QUALITY', 'QMEDIUM', null, null ); 
INSERT INTO taxonomy.dic_qualifier_value( gid, qualifier_type_code, qualifier_value, description, extended_description ) VALUES ( 7, 'QUALITY', 'QHIGH', null, null ); 
INSERT INTO taxonomy.dic_qualifier_value( gid, qualifier_type_code, qualifier_value, description, extended_description ) VALUES ( 8, 'SOURCE', 'SPRE', 'Previous knowledge', null ); 
INSERT INTO taxonomy.dic_qualifier_value( gid, qualifier_type_code, qualifier_value, description, extended_description ) VALUES ( 9, 'SOURCE', 'SMEAS', 'Measured in objective way', null ); 
INSERT INTO taxonomy.dic_qualifier_value( gid, qualifier_type_code, qualifier_value, description, extended_description ) VALUES ( 10, 'SOURCE', 'SOBS', 'Visual observation', null ); 
INSERT INTO taxonomy.dic_qualifier_value( gid, qualifier_type_code, qualifier_value, description, extended_description ) VALUES ( 11, 'SOURCE', 'SINF', 'Inferred', null ); 
INSERT INTO taxonomy.dic_qualifier_value( gid, qualifier_type_code, qualifier_value, description, extended_description ) VALUES ( 12, 'VALIDTIME', 'VT_YR_BUILT1', 'Start timestamp of lifetime', null ); 
INSERT INTO taxonomy.dic_qualifier_value( gid, qualifier_type_code, qualifier_value, description, extended_description ) VALUES ( 13, 'VALIDTIME', 'VT_YR_BUILT2', 'Optional second start timestamp of lifetime to define a timeinterval', null ); 
INSERT INTO taxonomy.dic_qualifier_value( gid, qualifier_type_code, qualifier_value, description, extended_description ) VALUES ( 14, 'VALIDTIME', 'VT_YR_DESTR1', 'End timestamp of lifetime', null ); 
INSERT INTO taxonomy.dic_qualifier_value( gid, qualifier_type_code, qualifier_value, description, extended_description ) VALUES ( 15, 'VALIDTIME', 'VT_YR_DESTR2', 'Optional second end timestamp of lifetime to define a timeinterval', null ); 

INSERT INTO taxonomy.dic_taxonomy( gid, code, description, extended_description, version_date ) VALUES ( 1, 'GEM20', 'GEM Building Taxonomy V2.0', null, '2013-03-12' ); 
INSERT INTO taxonomy.dic_taxonomy( gid, code, description, extended_description, version_date ) VALUES ( 2, 'SENSUM', 'SENSUM Indicators', null, '2013-11-12' ); 

INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 19, 'ROOFSYSTYP', 'Roof System Type', null, 'GEM20', 4, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 20, 'ROOF_CONN', 'Roof Connections', null, 'GEM20', 5, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 1, 'MAT_TYPE', 'Material Type', null, 'GEM20', 1, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 2, 'MAT_TECH', 'Material Technology', null, 'GEM20', 2, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 3, 'MAT_PROP', 'Material Property', null, 'GEM20', 3, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 21, 'FLOOR_MAT', 'Floor Material', null, 'GEM20', 1, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 4, 'LLRS', 'Type of Lateral Load-Resisting System', null, 'GEM20', 1, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 5, 'LLRS_DUCT', 'System Ductility', null, 'GEM20', 2, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 22, 'FLOOR_TYPE', 'Floor System Type', null, 'GEM20', 2, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 6, 'HEIGHT', 'Height', null, 'GEM20', 1, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 23, 'FLOOR_CONN', 'Floor Connections', null, 'GEM20', 3, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 7, 'YR_BUILT', 'Date of Construction or Retrofit', null, 'GEM20', 1, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 24, 'FOUNDN_SYS', 'Foundation System', null, 'GEM20', 1, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 8, 'OCCUPY', 'Building Occupancy Class - General', null, 'GEM20', 1, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 9, 'OCCUPY_DT', 'Building Occupancy Class - Detail', null, 'GEM20', 2, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 10, 'POSITION', 'Building Position within a Block', null, 'GEM20', 1, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 25, 'YR_DESTR', 'Date of Destruction', null, 'SENSUM', 1, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 11, 'PLAN_SHAPE', 'Shape of the Building Plan', null, 'GEM20', 1, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 12, 'STR_IRREG', 'Regular or Irregular', null, 'GEM20', 1, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 13, 'STR_IRREG_DT', 'Plan Irregularity or Vertical Irregularity', null, 'GEM20', 2, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 14, 'STR_IRREG_TYPE', 'Type of Irregularity', null, 'GEM20', 3, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 15, 'NONSTRCEXW', 'Exterior walls', null, 'GEM20', 1, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 16, 'ROOF_SHAPE', 'Roof Shape', null, 'GEM20', 1, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 17, 'ROOFCOVMAT', 'Roof Covering', null, 'GEM20', 2, null ); 
INSERT INTO taxonomy.dic_attribute_type( gid, code, description, extended_description, taxonomy_code, attribute_level, attribute_order ) VALUES ( 18, 'ROOFSYSMAT', 'Roof System Material', null, 'GEM20', 3, null ); 

INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 92, 'LLRS', 'LH', 'LH - Hybrid lateral load-resisting system', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 93, 'LLRS', 'LO', 'LO - Other lateral load-resisting system', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 94, 'LLRS_DUCT', 'DU99', 'DU99 - Ductility unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 95, 'LLRS_DUCT', 'DUC', 'DUC - Ductile', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 96, 'LLRS_DUCT', 'DNO', 'DNO - Non-ductile', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 97, 'LLRS_DUCT', 'DBD', 'DBD - Equipped with base isolation and/or energy dissipation devices', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 1, 'MAT_TYPE', 'MAT99', 'MAT99 - Unknown material', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 2, 'MAT_TYPE', 'C99', 'C99 - Concrete, unknown reinforcement', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 3, 'MAT_TYPE', 'CU', 'CU - Concrete, unreinforced', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 4, 'MAT_TYPE', 'CR', 'CR - Concrete, reinforced', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 5, 'MAT_TYPE', 'SRC', 'SRC - Concrete, composite with steel section', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 6, 'MAT_TYPE', 'S', 'S - Steel', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 7, 'MAT_TYPE', 'ME', 'ME - Metal (except steel)', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 8, 'MAT_TYPE', 'M99', 'M99 - Masonry, unknown reinforcement', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 9, 'MAT_TYPE', 'MUR', 'MUR - Masonry, unreinforced', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 10, 'MAT_TYPE', 'MCF', 'MCF - Masonry, confined', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 11, 'MAT_TYPE', 'MR', 'MR - Masonry, reinforced', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 12, 'MAT_TYPE', 'E99', 'E99 - Earth, unknown reinforcement', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 13, 'MAT_TYPE', 'EU', 'EU - Earth, unreinforced', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 14, 'MAT_TYPE', 'ER', 'ER - Earth, reinforced', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 15, 'MAT_TYPE', 'W', 'W - Wood', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 32, 'MAT_TECH', 'STRUB', 'STRUB - Rubble (field stone) or semi-dressed stone', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 16, 'MAT_TYPE', 'MATO', 'MATO - Other material', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 31, 'MAT_TECH', 'ST99', 'ST99 - Stone, unknown technology', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 30, 'MAT_TECH', 'ADO', 'ADO - Adobe blocks', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 29, 'MAT_TECH', 'MUN99', 'MUN99 - Masonry unit, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 33, 'MAT_TECH', 'STDRE', 'STDRE - Dressed stone', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 34, 'MAT_TECH', 'CL99', 'CL99 - Fired clay unit, unknown type', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 35, 'MAT_TECH', 'CLBRS', 'CLBRS - Fired clay solid bricks', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 36, 'MAT_TECH', 'CLBRH', 'CLBRH - Fired clay hollow bricks', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 37, 'MAT_TECH', 'CLBLH', 'CLBLH - Fired clay hollow blocks or tiles', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 38, 'MAT_TECH', 'CB99', 'CB99 - Concrete blocks, unknown type', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 98, 'HEIGHT', 'H99', 'H99 - Number of storeys unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 17, 'MAT_TECH', 'CT99', 'CT99 - Unknown concrete technology', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 18, 'MAT_TECH', 'CIP', 'CIP - Cast-in-place concrete', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 19, 'MAT_TECH', 'PC', 'PC - Precast concrete', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 20, 'MAT_TECH', 'CIPPS', 'CIPPS - Cast-in-place prestressed concrete', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 21, 'MAT_TECH', 'PCPS', 'PCPS - Precast prestressed concrete', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 22, 'MAT_TECH', 'S99', 'S99 - Steel, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 23, 'MAT_TECH', 'SL', 'SL - Cold-formed steel members', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 24, 'MAT_TECH', 'SR', 'SR - Hot-rolled steel members', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 25, 'MAT_TECH', 'SO', 'SO - Steel, other', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 26, 'MAT_TECH', 'ME99', 'ME99 - Metal, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 27, 'MAT_TECH', 'MEIR', 'MEIR - Iron', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 28, 'MAT_TECH', 'MEO', 'MEO - Metal, other', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 39, 'MAT_TECH', 'CBS', 'CBS - Concrete blocks, solid', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 40, 'MAT_TECH', 'CBH', 'CBH - Concrete blocks, hollow', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 41, 'MAT_TECH', 'MO', 'MO - Masonry unit, other', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 42, 'MAT_TECH', 'MR99', 'MR99 - Masonry reinforcement, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 43, 'MAT_TECH', 'RS', 'RS - Steel reinforced', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 99, 'HEIGHT', 'H', 'H - Number of storeys above ground', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 44, 'MAT_TECH', 'RW', 'RW - Wood-reinforced', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 45, 'MAT_TECH', 'RB', 'RB - Bamboo-, cane- or rope-reinforcement', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 46, 'MAT_TECH', 'RCM', 'RCM - Fibre reinforcing mesh', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 100, 'HEIGHT', 'HB', 'HB - Number of storeys below ground', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 47, 'MAT_TECH', 'RCB', 'RCB - Reinforced concrete bands', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 48, 'MAT_TECH', 'ET99', 'ET99 - Unknown earth technology', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 49, 'MAT_TECH', 'ETR', 'ETR - Rammed earth', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 101, 'HEIGHT', 'HF', 'HF - Height of ground floor level above grade', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 50, 'MAT_TECH', 'ETC', 'ETC - Cob or wet construction', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 51, 'MAT_TECH', 'ETO', 'ETO - Earth technology, other', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 52, 'MAT_TECH', 'W99', 'W99 - Wood, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 53, 'MAT_TECH', 'WHE', 'WHE - Heavy wood', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 54, 'MAT_TECH', 'WLI', 'WLI - Light wood members', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 55, 'MAT_TECH', 'WS', 'WS - Solid wood', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 56, 'MAT_TECH', 'WWD', 'WWD - Wattle and daub', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 57, 'MAT_TECH', 'WBB', 'WBB - Bamboo', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 58, 'MAT_TECH', 'WO', 'WO - Wood, other', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 103, 'YR_BUILT', 'Y99', 'Y99 - Year unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 104, 'YR_BUILT', 'YEX', 'YEX - Exact  date of construction or retrofit', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 106, 'YR_BUILT', 'YPRE', 'YPRE - Latest possible date of construction or retrofit', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 60, 'MAT_PROP', 'SC99', 'SC99 - Steel connections, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 62, 'MAT_PROP', 'WEL', 'WEL - Welded connections', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 63, 'MAT_PROP', 'RIV', 'RIV - Riveted connections', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 64, 'MAT_PROP', 'BOL', 'BOL - Bolted connections', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 65, 'MAT_PROP', 'MO99', 'MO99 - Mortar type unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 66, 'MAT_PROP', 'MON', 'MON - No mortar', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 67, 'MAT_PROP', 'MOM', 'MOM - Mud mortar', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 68, 'MAT_PROP', 'MOL', 'MOL - Lime mortar', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 69, 'MAT_PROP', 'MOC', 'MOC - Cement mortar', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 70, 'MAT_PROP', 'MOCL', 'MOCL - Cement: lime mortar', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 71, 'MAT_PROP', 'SP99', 'SP99 - Stone, unknown type', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 109, 'OCCUPY', 'RES', 'RES - Residential', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 72, 'MAT_PROP', 'SPLI', 'SPLI - Limestone', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 73, 'MAT_PROP', 'SPSA', 'SPSA - Sandstone', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 74, 'MAT_PROP', 'SPTU', 'SPTU - Tuff', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 75, 'MAT_PROP', 'SPSL', 'SPSL - Slate', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 76, 'MAT_PROP', 'SPGR', 'SPGR - Granite', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 77, 'MAT_PROP', 'SPBA', 'SPBA - Basalt', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 78, 'MAT_PROP', 'SPO', 'SPO - Stone, other type', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 80, 'MAT_TECH', 'MATT99', 'MATT99 - Unknown material technology', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 81, 'MAT_PROP', 'MATP99', 'MATP99 - Unknown material property', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 84, 'LLRS', 'LFM', 'LFM - Moment frame', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 82, 'LLRS', 'L99', 'L99 - Unknown lateral load-resisting system', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 83, 'LLRS', 'LN', 'LN - No lateral load-resisting system', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 85, 'LLRS', 'LFINF', 'LFINF - Infilled frame', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 86, 'LLRS', 'LFBR', 'LFBR - Braced frame', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 87, 'LLRS', 'LPB', 'LPN - Post and beam', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 88, 'LLRS', 'LWAL', 'LWAL - Wall', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 89, 'LLRS', 'LDUAL', 'LDUAL - Dual frame-wall system', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 90, 'LLRS', 'LFLS', 'LFLS - Flat slab/plate or infilled waffle slab', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 91, 'LLRS', 'LFLSINF', 'LFLSINF - Infilled flat slab/plate or infilled waffle slab', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 105, 'YR_BUILT', 'YBET', 'YBET - Upper and lower bound for the date of construction or retrofit', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 107, 'YR_BUILT', 'YAPP', 'YAPP - Approximate date of construction or retrofit', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 235, 'ROOFCOVMAT', 'RMT99', 'RMT99 - Unknown roof covering', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 147, 'OCCUPY_DT', 'MIX4', 'MIX4 - Mostly residential and industrial', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 148, 'OCCUPY_DT', 'MIX5', 'MIX5 - Mostly industrial and commercial', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 149, 'OCCUPY_DT', 'MIX6', 'MIX6 - Mostly industrial and residential', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 150, 'OCCUPY_DT', 'IND99', 'IND99 - Industiral, unknown type', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 236, 'ROOFCOVMAT', 'RMN', 'RMN - Concrete rood without additional covering', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 151, 'OCCUPY_DT', 'IND1', 'IND1 - Heavy industrial', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 152, 'OCCUPY_DT', 'IND2', 'IND2 - Light industrial', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 153, 'OCCUPY_DT', 'AGR99', 'AGR99 - Agriculture, unknown type', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 154, 'OCCUPY_DT', 'AGR1', 'AGR1 - Produce storage', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 155, 'OCCUPY_DT', 'AGR2', 'AGR2 - Animal shelter', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 156, 'OCCUPY_DT', 'AGR3', 'AGR3 - Agricultural processing', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 157, 'OCCUPY_DT', 'ASS99', 'ASS99 - Assembly, unknown type', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 158, 'OCCUPY_DT', 'ASS1', 'ASS1 - Religious gathering', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 159, 'OCCUPY_DT', 'ASS2', 'ASS2 - Arena', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 160, 'OCCUPY_DT', 'ASS3', 'ASS3 - Cinema or concert hall', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 161, 'OCCUPY_DT', 'ASS4', 'ASS4 - Other gatherings', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 162, 'OCCUPY_DT', 'GOV99', 'GOV99 - Government, unknown type', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 163, 'OCCUPY_DT', 'GOV1', 'GOV1 - Government, general services', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 164, 'OCCUPY_DT', 'GOV2', 'GOV2 - Government, emergency services', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 165, 'OCCUPY_DT', 'EDU99', 'EDU99 - Education, unknown type', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 166, 'OCCUPY_DT', 'EDU1', 'EDU1 - Pre-school facility', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 167, 'OCCUPY_DT', 'EDU2', 'EDU2 - School', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 196, 'STR_IRREG', 'IRIR', 'IRIR - Irregular structure', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 170, 'POSITION', 'BPD', 'BPD - Detached building', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 171, 'POSITION', 'BP1', 'BP1 - Adjoining building(s) on one side', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 197, 'STR_IRREG_DT', 'IRPP', 'IRPP - Plan irregularity - primary', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 172, 'POSITION', 'BP2', 'BP2 - Adjoining building(s) on two sides', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 173, 'POSITION', 'BP3', 'BP3 - Adjoining building(s) on three sides', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 198, 'STR_IRREG_DT', 'IRPS', 'IRPS - Plan irregularity - secondary', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 199, 'STR_IRREG_DT', 'IRVP', 'IRVP - Vertical irregularity - primary', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 200, 'STR_IRREG_DT', 'IRVS', 'IRVS - Vertical irregularity - secondary', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 201, 'STR_IRREG_TYPE', 'IRN', 'INR - No irregularity', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 202, 'STR_IRREG_TYPE', 'TOR', 'TOR - Torsion eccentricity', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 203, 'STR_IRREG_TYPE', 'REC', 'REC - Re-entrant corner', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 204, 'STR_IRREG_TYPE', 'IRHO', 'IRHO - Other plan irregularity', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 237, 'ROOFCOVMAT', 'RMT1', 'RMT1 - Clay or concrete tile roof covering', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 205, 'STR_IRREG_TYPE', 'SOS', 'SOS - Soft storey', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 206, 'STR_IRREG_TYPE', 'CRW', 'CRW - Cripple wall', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 207, 'STR_IRREG_TYPE', 'SHC', 'SHC - Short column', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 208, 'STR_IRREG_TYPE', 'POP', 'POP - Pounding potential', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 209, 'STR_IRREG_TYPE', 'SET', 'SET - Setback', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 210, 'STR_IRREG_TYPE', 'CHV', 'CHV - Change in vertical structure (includes large overhangs)', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 211, 'STR_IRREG_TYPE', 'IRVHO', 'IRVO - Other vertical irregularity', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 238, 'ROOFCOVMAT', 'RMT2', 'RMT2 - Fibre cement or metal tile roof covering', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 239, 'ROOFCOVMAT', 'RMT3', 'RMT3 - Membrane roof covering', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 240, 'ROOFCOVMAT', 'RMT4', 'RMT4 - Slate roof covering', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 212, 'NONSTRCEXW', 'EW99', 'EW99 - Unknown material of exterior walls', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 213, 'NONSTRCEXW', 'EWC', 'EWC - Concrete exterior walls', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 214, 'NONSTRCEXW', 'EWG', 'EWG - Glass exterior walls', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 215, 'NONSTRCEXW', 'EWE', 'EWE - Earthen exterior walls', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 216, 'NONSTRCEXW', 'EWMA', 'EWMA - Masonry exterior walls', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 241, 'ROOFCOVMAT', 'RMT5', 'RMT5 - Stone slab roof covering', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 242, 'ROOFCOVMAT', 'RMT6', 'RMT6 - Metal or asbestos sheet roof covering', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 243, 'ROOFCOVMAT', 'RMT7', 'RMT7 - Wooden or asphalt shingle roof covering', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 244, 'ROOFCOVMAT', 'RMT8', 'RMT8 - Vegetative roof covering', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 245, 'ROOFCOVMAT', 'RMT9', 'RMT9 - Earthen roof covering', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 228, 'ROOF_SHAPE', 'RSH4', 'RSH4 - Pitched with dormers', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 229, 'ROOF_SHAPE', 'RSH5', 'RSH5 - Monopitch', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 230, 'ROOF_SHAPE', 'RSH6', 'RSH6 - Sawtooth', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 231, 'ROOF_SHAPE', 'RSH7', 'RSH7 - Curved', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 232, 'ROOF_SHAPE', 'RSH8', 'RSH8 - Complex regular', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 233, 'ROOF_SHAPE', 'RSH9', 'RSH9 - Complex irregular', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 234, 'ROOF_SHAPE', 'RSHO', 'RSHO - Roof shape, other', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 246, 'ROOFCOVMAT', 'RMT10', 'RMT10 - Solar panelled roofs', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 247, 'ROOFCOVMAT', 'RMT11', 'RMT11 - Tensile membrane or fabric roof', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 248, 'ROOFCOVMAT', 'RMTO', 'RMTO - Roof covering, other', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 249, 'ROOFSYSMAT', 'RM', 'RM - Masonry roof', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 250, 'ROOFSYSMAT', 'RE', 'RE - Earthen roof', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 251, 'ROOFSYSMAT', 'RC', 'RC - Concrete roof', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 252, 'ROOFSYSMAT', 'RME', 'RME - Metal roof', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 253, 'ROOFSYSMAT', 'RWO', 'RWO - Wooden roof', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 254, 'ROOFSYSMAT', 'RFA', 'RFA - Fabric roof', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 255, 'ROOFSYSMAT', 'RO', 'RO - Roof material, other', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 256, 'ROOFSYSTYP', 'RM99', 'RM99 - Masonry roof, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 257, 'ROOFSYSTYP', 'RM1', 'RM1 - Vaulted masonry roof', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 258, 'ROOFSYSTYP', 'RM2', 'RM2 - Shallow-arched masonry roof', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 259, 'ROOFSYSTYP', 'RM3', 'RM3 - Composite masonry and concrete roof system', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 260, 'ROOFSYSTYP', 'RE99', 'RE99 - Earthen roof, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 261, 'ROOFSYSTYP', 'RE1', 'RE1 - Vaulted earthen roof, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 281, 'ROOF_CONN', 'RWCP', 'RWCP - Roof-wall diaphragm connection present', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 283, 'ROOF_CONN', 'RTDN', 'RTDN - Roof tie-down not provided', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 282, 'ROOF_CONN', 'RTD99', 'RTD99 - Roof tie-down unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 284, 'ROOF_CONN', 'RTDP', 'RTDP - Roof tie-down present', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 285, 'FLOOR_MAT', 'FN', 'FN - No elevated or suspended floor', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 286, 'FLOOR_MAT', 'F99', 'F99 - Floor material, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 288, 'FLOOR_MAT', 'FE', 'FE - Earthen floor', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 290, 'FLOOR_MAT', 'FME', 'FME - Metal floor', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 294, 'FLOOR_TYPE', 'FM1', 'FM1 - Vaulted masonry floor', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 297, 'FLOOR_TYPE', 'FE99', 'FE99 - Earthen floor, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 298, 'FLOOR_TYPE', 'FC99', 'FC99 - Concrete floor, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 134, 'OCCUPY_DT', 'COM3', 'COM3 - Offices, professional/technical services', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 135, 'OCCUPY_DT', 'COM4', 'COM4 - Hospital/medical clinic', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 136, 'OCCUPY_DT', 'COM5', 'COM5 - Entertainment', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 137, 'OCCUPY_DT', 'COM6', 'COM6 - Public building', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 138, 'OCCUPY_DT', 'COM7', 'COM7 - Covered parking garage', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 139, 'OCCUPY_DT', 'COM8', 'COM8 - Bus station', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 108, 'OCCUPY', 'OC99', 'OC99 - Unknown occupancy', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 110, 'OCCUPY', 'COM', 'COM - Commercial and public', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 111, 'OCCUPY', 'MIX', 'MIX - Mixed use', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 112, 'OCCUPY', 'IND', 'IND - Industrial', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 113, 'OCCUPY', 'AGR', 'AGR - Agriculture', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 114, 'OCCUPY', 'ASS', 'ASS - Assembly', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 115, 'OCCUPY', 'GOV', 'GOV - Government', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 116, 'OCCUPY', 'EDU', 'EDU - Education', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 117, 'OCCUPY', 'OCO', 'OCO - Other occupancy type', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 140, 'OCCUPY_DT', 'COM9', 'COM9 - Railway station', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 141, 'OCCUPY_DT', 'COM10', 'COM10 - Airport', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 142, 'OCCUPY_DT', 'COM11', 'COM11 - Recreation and leisure', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 143, 'OCCUPY_DT', 'MIX99', 'MIX99 - Mixed, unknown type', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 144, 'OCCUPY_DT', 'MIX1', 'MIX1 - Mostly residential and commercial', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 145, 'OCCUPY_DT', 'MIX2', 'MIX2 - Mostly commercial and residential', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 146, 'OCCUPY_DT', 'MIX3', 'MIX3 - Mostly commercial and industrial', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 176, 'PLAN_SHAPE', 'PLFSQO', 'PLFSQO - Square, with an opening in plan', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 177, 'PLAN_SHAPE', 'PLFR', 'PLFR - Rectangular, solid', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 178, 'PLAN_SHAPE', 'PLFRO', 'PLFRO - Rectangular, with an opening in plan', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 179, 'PLAN_SHAPE', 'PLFL', 'PLFL - L-shape', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 180, 'PLAN_SHAPE', 'PLFC', 'PLFC - Curved, solid', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 181, 'PLAN_SHAPE', 'PLFCO', 'PLFCO - Curved, with an opening in plan', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 182, 'PLAN_SHAPE', 'PLFD', 'PLFD - Triangular, solid', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 118, 'OCCUPY_DT', 'RES99', 'RES99 - Residential, unknown type', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 119, 'OCCUPY_DT', 'RES1', 'RES1 - Single dwelling', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 120, 'OCCUPY_DT', 'RES2', 'RES2 - Multi-unit, unknown type', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 121, 'OCCUPY_DT', 'RES2A', 'RES2A - 2 Units (duplex)', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 122, 'OCCUPY_DT', 'RES2B', 'RES2B - 3-4 Units', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 123, 'OCCUPY_DT', 'RES2C', 'RES2C - 5-9 Units', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 124, 'OCCUPY_DT', 'RES2D', 'RES2D - 10-19 Units', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 168, 'OCCUPY_DT', 'EDU3', 'EDU3 - College/university offices and/or classrooms', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 125, 'OCCUPY_DT', 'RES2E', 'RES2E - 20-49 Units', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 126, 'OCCUPY_DT', 'RES2F', 'RES2F - 50+ Units', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 127, 'OCCUPY_DT', 'RES3', 'RES3 - Temporary lodging', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 128, 'OCCUPY_DT', 'RES4', 'RES4 - Institutional housing', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 129, 'OCCUPY_DT', 'RES5', 'RES5 - Mobile home', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 130, 'OCCUPY_DT', 'RES6', 'RES6 - Informal housing', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 131, 'OCCUPY_DT', 'COM99', 'COM99 - Commercial and public, unknown type', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 132, 'OCCUPY_DT', 'COM1', 'COM1 - Retail trade', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 133, 'OCCUPY_DT', 'COM2', 'COM2 - Wholesale trade and storage (warehouse)', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 169, 'OCCUPY_DT', 'EDU4', 'EDU4 - College/university research facilities and/or labs', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 183, 'PLAN_SHAPE', 'PLFDO', 'PLFDO - Triangular, with an opening in plan', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 184, 'PLAN_SHAPE', 'PLFP', 'PLFP - Polygonal, solid (e.g. trapezoid, pentagon, hexagon)', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 262, 'ROOFSYSTYP', 'RC99', 'RC99 - Concrete roof, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 263, 'ROOFSYSTYP', 'RC1', 'RC1 - Cast-in-place beamless reinforced concrete roof', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 174, 'PLAN_SHAPE', 'PLF99', 'PLF99 - Unknown plan shape', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 175, 'PLAN_SHAPE', 'PLFSQ', 'PLFSQ - Square, solid', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 185, 'PLAN_SHAPE', 'PLFPO', 'PLFPO - Polygonal, with an opening in plan', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 217, 'NONSTRCEXW', 'EWME', 'EWME - Metal exterior walls', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 186, 'PLAN_SHAPE', 'PLFE', 'PLFE - E-shape', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 187, 'PLAN_SHAPE', 'PLFH', 'PLFH - H-shape', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 188, 'PLAN_SHAPE', 'PLFS', 'PLFS - S-shape', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 189, 'PLAN_SHAPE', 'PLFT', 'PLFT - T-shape', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 190, 'PLAN_SHAPE', 'PLFU', 'PLFU - U- or C-shape', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 191, 'PLAN_SHAPE', 'PLFX', 'PLFX - X-shape', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 192, 'PLAN_SHAPE', 'PLFY', 'PLFY - Y-shape', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 193, 'PLAN_SHAPE', 'PLFI', 'PLFI - Irregular plan shape', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 264, 'ROOFSYSTYP', 'RC2', 'RC2 - Cast-in-place beam-supported reinforced concrete roof', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 265, 'ROOFSYSTYP', 'RC3', 'RC3 - Precast concrete roof with reinforced concrete topping', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 194, 'STR_IRREG', 'IR99', 'IR99 - Unknown structural irregularity', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 195, 'STR_IRREG', 'IRRE', 'IRRE - Regular structure', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 266, 'ROOFSYSTYP', 'RC4', 'RC4 - Precast concrete roof without reinforced concrete topping', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 267, 'ROOFSYSTYP', 'RME99', 'RME99 - Metal roof, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 268, 'ROOFSYSTYP', 'RME1', 'RME1 - Metal beams or trusses supporting light roofing', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 269, 'ROOFSYSTYP', 'RME2', 'RME2 - Metal roof beams supporting precast concrete slabs', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 270, 'ROOFSYSTYP', 'RME3', 'RME3 - Composite steel roof deck and concrete slab', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 271, 'ROOFSYSTYP', 'RWO99', 'RWO99 - Wooden roof, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 218, 'NONSTRCEXW', 'EWV', 'EWV - Vegetative exterior walls', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 219, 'NONSTRCEXW', 'EWW', 'EWW - Wooden exterior walls', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 220, 'NONSTRCEXW', 'EWSL', 'EWSL - Stucco finish on light framing for exterior walls', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 221, 'NONSTRCEXW', 'EWPL', 'EWPL - Plastic/vinyl exterior walls, various', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 222, 'NONSTRCEXW', 'EWCB', 'EWCB - Cement-based boards for exterior walls', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 223, 'NONSTRCEXW', 'EWO', 'EWO - Material of exterior walls, other', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 272, 'ROOFSYSTYP', 'RWO1', 'RWO1 - Wooden structure with roof covering', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 273, 'ROOFSYSTYP', 'RWO2', 'RWO2 - Wooden beams or trusses with heavy roof covering', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 274, 'ROOFSYSTYP', 'RWO3', 'RWO3 - Wood-based sheets on rafters or purlins', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 224, 'ROOF_SHAPE', 'R99', 'R99 - Unknown roof shape', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 225, 'ROOF_SHAPE', 'RSH1', 'RSH1 - Flat', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 226, 'ROOF_SHAPE', 'RSH2', 'RSH2 - Pitched with gable ends', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 227, 'ROOF_SHAPE', 'RSH3', 'RSH3 - Pitched and hipped', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 275, 'ROOFSYSTYP', 'RWO4', 'RWO4 - Plywood panels or other light-weight panels for roof', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 276, 'ROOFSYSTYP', 'RWO5', 'RWO5 - Bamboo, straw or thatch roof', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 277, 'ROOFSYSTYP', 'RFA1', 'RFA1 - Inflatable or tensile membrane roof', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 278, 'ROOFSYSTYP', 'RFAO', 'RFAO - Fabric roof, other', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 279, 'ROOF_CONN', 'RWC99', 'RWC99 - Roof-wall diaphragm connection unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 280, 'ROOF_CONN', 'RWCN', 'RWCN - Roof-wall diaphragm connection not provided', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 287, 'FLOOR_MAT', 'FM', 'FM - Masonry floor', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 289, 'FLOOR_MAT', 'FC', 'FC - Concrete floor', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 291, 'FLOOR_MAT', 'FW', 'FW - Wooden floor', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 292, 'FLOOR_MAT', 'FO', 'FO - Floor material, other', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 304, 'FLOOR_TYPE', 'FME1', 'FME1 - Metal beams, trusses or joists supporting light flooring', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 305, 'FLOOR_TYPE', 'FME2', 'FME2 - Metal floor beams supporting precast concrete slabs', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 306, 'FLOOR_TYPE', 'FME3', 'FME3 - Composite steel deck and concrete slab', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 293, 'FLOOR_TYPE', 'FM99', 'FM99 - Masonry floor, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 295, 'FLOOR_TYPE', 'FM2', 'FM2 - Shallow-arched masonry floor', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 296, 'FLOOR_TYPE', 'FM3', 'FM3 - Composite cast-in-place reinforced concrete and masonry floor system', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 299, 'FLOOR_TYPE', 'FC1', 'FC1 - Cast-in-place beamless reinforced concrete floor', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 300, 'FLOOR_TYPE', 'FC2', 'FC2 - Cast-in-place beam-supported reinforced concrete floor', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 301, 'FLOOR_TYPE', 'FC3', 'FC3 - Precast concrete flor with reinforced concrete topping', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 302, 'FLOOR_TYPE', 'FC4', 'FC4 - Precast concrete floor without reinforced concrete topping', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 303, 'FLOOR_TYPE', 'FME99', 'FME99 - Metal floor, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 307, 'FLOOR_TYPE', 'FW99', 'FW99 - Wooden floor, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 308, 'FLOOR_TYPE', 'FW1', 'FW1 - Wooden beams or trusses and joists supporting light flooring', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 309, 'FLOOR_TYPE', 'FW2', 'FW2 - Wooden beams or trusses and joists supporting heavy flooring', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 310, 'FLOOR_TYPE', 'FW3', 'FW3 - Wood-based sheets on joists or beams', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 311, 'FLOOR_TYPE', 'FW4', 'FW4 - Plywood panels or other light-weight panels for floor', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 312, 'FLOOR_CONN', 'FWC99', 'FWC99 - Floor-wall diaphragm connection unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 313, 'FLOOR_CONN', 'FWCN', 'FWCN - Floor-wall diaphragm connection not provided', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 314, 'FLOOR_CONN', 'FWCP', 'FWCP - Floor-wall diaphragm connection present', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 315, 'FOUNDN_SYS', 'FOS99', 'FOS99 - Unknown foundation system', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 316, 'FOUNDN_SYS', 'FOSSL', 'FOSSL - Shallow foundation, with lateral capacity', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 317, 'FOUNDN_SYS', 'FOSN', 'FOSN - Shallow foundation, no lateral capacity', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 318, 'FOUNDN_SYS', 'FOSDL', 'FOSDL - Deep foundation, with lateral capacity', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 319, 'FOUNDN_SYS', 'FOSDN', 'FOSDN - Deep foundation, no lateral capacity', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 320, 'FOUNDN_SYS', 'FOSO', 'FOSO - Foundation, other', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 321, 'OCCUPY_DT', 'OCCDT99', 'OCCDT99 - Occupancy detail, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 322, 'POSITION', 'BP99', 'BP99 - Position, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 324, 'STR_IRREG_TYPE', 'IRT99', 'IRT99 - Structural irregularity type, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 323, 'STR_IRREG_DT', 'IRP99', 'IRP99 - Structural irregularity detail, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 357, 'ROOFSYSMAT', 'RSM99', 'RSM99 - Roof system material, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 358, 'ROOFSYSTYP', 'RST99', 'RST99 - Roof system type, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 360, 'ROOF_CONN', 'RCN99', 'RCN99 - Roof connection, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 361, 'FLOOR_TYPE', 'FT99', 'FT99 - Floor type, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 363, 'YR_DESTR', 'YDEX', 'YDEX - Exact  date of destruction', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 362, 'YR_DESTR', 'YD99', 'YD99 - Date of destruction, unknown', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 364, 'YR_DESTR', 'YDBET', 'YDBET - Upper and lower bound for the date of destruction', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 365, 'YR_DESTR', 'YDPRE', 'YDPRE - Latest possible date of destruction', null ); 
INSERT INTO taxonomy.dic_attribute_value( gid, attribute_type_code, attribute_value, description, extended_description ) VALUES ( 367, 'YR_DESTR', 'YDAPP', 'YDAPP - Approximate date of destruction', null ); 

INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 1, 'EQ', 'EQ - Earthquake', null, 'MAT_TYPE' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 2, 'EQ', 'EQ - Earthquake', null, 'MAT_TECH' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 3, 'EQ', 'EQ - Earthquake', null, 'MAT_PROP' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 4, 'EQ', 'EQ - Earthquake', null, 'LLRS' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 5, 'EQ', 'EQ - Earthquake', null, 'LLRS_DUCT' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 6, 'EQ', 'EQ - Earthquake', null, 'HEIGHT' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 7, 'EQ', 'EQ - Earthquake', null, 'YR_BUILT' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 8, 'EQ', 'EQ - Earthquake', null, 'OCCUPY' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 9, 'EQ', 'EQ - Earthquake', null, 'OCCUPY_DT' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 10, 'EQ', 'EQ - Earthquake', null, 'POSITION' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 11, 'EQ', 'EQ - Earthquake', null, 'PLAN_SHAPE' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 12, 'EQ', 'EQ - Earthquake', null, 'STR_IRREG' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 13, 'EQ', 'EQ - Earthquake', null, 'STR_IRREG_DT' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 14, 'EQ', 'EQ - Earthquake', null, 'STR_IRREG_TYPE' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 15, 'EQ', 'EQ - Earthquake', null, 'NONSTRCEXW' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 16, 'EQ', 'EQ - Earthquake', null, 'ROOF_SHAPE' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 17, 'EQ', 'EQ - Earthquake', null, 'ROOFCOVMAT' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 18, 'EQ\n', 'EQ - Earthquake', null, 'ROOFSYSMAT' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 19, 'EQ', 'EQ - Earthquake', null, 'ROOFSYSTYP' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 20, 'EQ', 'EQ - Earthquake', null, 'ROOF_CONN' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 21, 'EQ', 'EQ - Earthquake', null, 'FLOOR_MAT' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 22, 'EQ', 'EQ - Earthquake', null, 'FLOOR_TYPE' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 23, 'EQ', 'EQ - Earthquake', null, 'FLOOR_CONN' ); 
INSERT INTO taxonomy.dic_hazard( gid, code, description, extended_description, attribute_type_code ) VALUES ( 24, 'EQ', 'EQ - Earthquake', null, 'FOUNDN_SYS' ); 



------------------------------------------------
-- adjust resolution 1 view (high resolution) --
------------------------------------------------
CREATE OR REPLACE VIEW object.ve_resolution1 AS
SELECT 
a.survey_gid,
a.description,
a.source,
a.resolution,
b.*,
c.bp_mat_type,
c.bp_mat_tech,
c.bp_mat_prop,
c.bp_llrs,
c.bp_llrs_duct,
c.bp_height,
c.bp_yr_built,
c.bp_yr_destr,
c.bp_occupy,
c.bp_occupy_dt,
c.bp_position,
c.bp_plan_shape,
c.bp_str_irreg,
c.bp_str_irreg_dt,
c.bp_str_irreg_type,
c.bp_nonstrcexw,
c.bp_roof_shape,
c.bp_roofcovmat,
c.bp_roofsysmat,
c.bp_roofsystyp,
c.bp_roof_conn,
c.bp_floor_mat,
c.bp_floor_type,
c.bp_floor_conn,
c.bp_foundn_sys,
c.vt_yr_built1,
c.vt_yr_built2,
c.vt_yr_destr1,
c.vt_yr_destr2
FROM object.main AS a
JOIN object.main_detail AS b ON (a.gid = b.object_id)
JOIN object.main_detail_qualifier AS c ON (b.gid = c.detail_id)
WHERE a.resolution = 1
ORDER BY b.gid ASC;

ALTER VIEW object.ve_resolution1 ALTER COLUMN MAT_TYPE SET DEFAULT 'MAT99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN MAT_TECH SET DEFAULT 'MATT99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN MAT_PROP SET DEFAULT 'MATP99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN LLRS SET DEFAULT 'L99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN LLRS_DUCT SET DEFAULT 'DU99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN HEIGHT SET DEFAULT 'H99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN YR_BUILT SET DEFAULT 'Y99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN YR_DESTR SET DEFAULT 'YD99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN OCCUPY SET DEFAULT 'OC99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN OCCUPY_DT SET DEFAULT 'OCCDT99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN POSITION SET DEFAULT 'BP99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN PLAN_SHAPE SET DEFAULT 'PLF99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN STR_IRREG SET DEFAULT 'IR99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN STR_IRREG_DT SET DEFAULT 'IRP99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN STR_IRREG_TYPE SET DEFAULT 'IRT99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN NONSTRCEXW SET DEFAULT 'EW99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN ROOF_SHAPE SET DEFAULT 'R99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN ROOFCOVMAT SET DEFAULT 'RMT99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN ROOFSYSMAT SET DEFAULT 'RSM99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN ROOFSYSTYP SET DEFAULT 'RST99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN ROOF_CONN SET DEFAULT 'RCN99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN FLOOR_MAT SET DEFAULT 'F99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN FLOOR_TYPE SET DEFAULT 'FT99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN FLOOR_CONN SET DEFAULT 'FWC99'::character varying;
ALTER VIEW object.ve_resolution1 ALTER COLUMN FOUNDN_SYS SET DEFAULT 'FOS99'::character varying;

--------------------------------------------------
-- adjust resolution 2 view (medium resolution) --
--------------------------------------------------
CREATE OR REPLACE VIEW object.ve_resolution2 AS
SELECT 
a.survey_gid,
a.description,
a.source,
a.resolution,
b.*,
c.bp_mat_type,
c.bp_mat_tech,
c.bp_mat_prop,
c.bp_llrs,
c.bp_llrs_duct,
c.bp_height,
c.bp_yr_built,
c.bp_yr_destr,
c.bp_occupy,
c.bp_occupy_dt,
c.bp_position,
c.bp_plan_shape,
c.bp_str_irreg,
c.bp_str_irreg_dt,
c.bp_str_irreg_type,
c.bp_nonstrcexw,
c.bp_roof_shape,
c.bp_roofcovmat,
c.bp_roofsysmat,
c.bp_roofsystyp,
c.bp_roof_conn,
c.bp_floor_mat,
c.bp_floor_type,
c.bp_floor_conn,
c.bp_foundn_sys,
c.vt_yr_built1,
c.vt_yr_built2,
c.vt_yr_destr1,
c.vt_yr_destr2
FROM object.main AS a
JOIN object.main_detail AS b ON (a.gid = b.object_id)
JOIN object.main_detail_qualifier AS c ON (b.gid = c.detail_id)
WHERE a.resolution = 2
ORDER BY b.gid ASC;

ALTER VIEW object.ve_resolution2 ALTER COLUMN MAT_TYPE SET DEFAULT 'MAT99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN MAT_TECH SET DEFAULT 'MATT99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN MAT_PROP SET DEFAULT 'MATP99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN LLRS SET DEFAULT 'L99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN LLRS_DUCT SET DEFAULT 'DU99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN HEIGHT SET DEFAULT 'H99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN YR_BUILT SET DEFAULT 'Y99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN YR_DESTR SET DEFAULT 'YD99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN OCCUPY SET DEFAULT 'OC99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN OCCUPY_DT SET DEFAULT 'OCCDT99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN POSITION SET DEFAULT 'BP99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN PLAN_SHAPE SET DEFAULT 'PLF99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN STR_IRREG SET DEFAULT 'IR99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN STR_IRREG_DT SET DEFAULT 'IRP99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN STR_IRREG_TYPE SET DEFAULT 'IRT99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN NONSTRCEXW SET DEFAULT 'EW99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN ROOF_SHAPE SET DEFAULT 'R99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN ROOFCOVMAT SET DEFAULT 'RMT99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN ROOFSYSMAT SET DEFAULT 'RSM99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN ROOFSYSTYP SET DEFAULT 'RST99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN ROOF_CONN SET DEFAULT 'RCN99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN FLOOR_MAT SET DEFAULT 'F99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN FLOOR_TYPE SET DEFAULT 'FT99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN FLOOR_CONN SET DEFAULT 'FWC99'::character varying;
ALTER VIEW object.ve_resolution2 ALTER COLUMN FOUNDN_SYS SET DEFAULT 'FOS99'::character varying;

-----------------------------------------------
-- adjust resolution 3 view (low resolution) --
-----------------------------------------------
CREATE OR REPLACE VIEW object.ve_resolution3 AS
SELECT 
a.survey_gid,
a.description,
a.source,
a.resolution,
b.*,
c.bp_mat_type,
c.bp_mat_tech,
c.bp_mat_prop,
c.bp_llrs,
c.bp_llrs_duct,
c.bp_height,
c.bp_yr_built,
c.bp_yr_destr,
c.bp_occupy,
c.bp_occupy_dt,
c.bp_position,
c.bp_plan_shape,
c.bp_str_irreg,
c.bp_str_irreg_dt,
c.bp_str_irreg_type,
c.bp_nonstrcexw,
c.bp_roof_shape,
c.bp_roofcovmat,
c.bp_roofsysmat,
c.bp_roofsystyp,
c.bp_roof_conn,
c.bp_floor_mat,
c.bp_floor_type,
c.bp_floor_conn,
c.bp_foundn_sys,
c.vt_yr_built1,
c.vt_yr_built2,
c.vt_yr_destr1,
c.vt_yr_destr2
FROM object.main AS a
JOIN object.main_detail AS b ON (a.gid = b.object_id)
JOIN object.main_detail_qualifier AS c ON (b.gid = c.detail_id)
WHERE a.resolution = 3
ORDER BY b.gid ASC;

ALTER VIEW object.ve_resolution3 ALTER COLUMN MAT_TYPE SET DEFAULT 'MAT99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN MAT_TECH SET DEFAULT 'MATT99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN MAT_PROP SET DEFAULT 'MATP99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN LLRS SET DEFAULT 'L99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN LLRS_DUCT SET DEFAULT 'DU99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN HEIGHT SET DEFAULT 'H99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN YR_BUILT SET DEFAULT 'Y99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN YR_DESTR SET DEFAULT 'YD99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN OCCUPY SET DEFAULT 'OC99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN OCCUPY_DT SET DEFAULT 'OCCDT99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN POSITION SET DEFAULT 'BP99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN PLAN_SHAPE SET DEFAULT 'PLF99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN STR_IRREG SET DEFAULT 'IR99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN STR_IRREG_DT SET DEFAULT 'IRP99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN STR_IRREG_TYPE SET DEFAULT 'IRT99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN NONSTRCEXW SET DEFAULT 'EW99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN ROOF_SHAPE SET DEFAULT 'R99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN ROOFCOVMAT SET DEFAULT 'RMT99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN ROOFSYSMAT SET DEFAULT 'RSM99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN ROOFSYSTYP SET DEFAULT 'RST99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN ROOF_CONN SET DEFAULT 'RCN99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN FLOOR_MAT SET DEFAULT 'F99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN FLOOR_TYPE SET DEFAULT 'FT99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN FLOOR_CONN SET DEFAULT 'FWC99'::character varying;
ALTER VIEW object.ve_resolution3 ALTER COLUMN FOUNDN_SYS SET DEFAULT 'FOS99'::character varying;

-------------------------
-- make views editable --
-------------------------
CREATE OR REPLACE FUNCTION object.edit_resolution_views()
RETURNS TRIGGER AS 
$BODY$
BEGIN
      IF TG_OP = 'INSERT' THEN
       INSERT INTO object.main_detail (
	object_id,
	resolution2_id,
	resolution3_id,
	the_geom,
	mat_type,
	mat_tech,
	mat_prop,
	llrs,
	llrs_duct,
	height,
	height_numeric_1,
	yr_built,
	yr_destr,
	occupy,
	occupy_dt,
	position,
	plan_shape,
	str_irreg,
	str_irreg_dt,
	str_irreg_type,
	nonstrcexw,
	roof_shape,
	roofcovmat,
	roofsysmat,
	roofsystyp,
	roof_conn,
	floor_mat,
	floor_type,
	floor_conn,
	foundn_sys,
	comment) 
       VALUES (
	NEW.object_id,
	NEW.resolution2_id,
	NEW.resolution3_id,
	NEW.the_geom,
	NEW.mat_type,
	NEW.mat_tech,
	NEW.mat_prop,
	NEW.llrs,
	NEW.llrs_duct,
	NEW.height,
	NEW.height_numeric_1,
	NEW.yr_built,
	NEW.yr_destr,
	NEW.occupy,
	NEW.occupy_dt,
	NEW.position,
	NEW.plan_shape,
	NEW.str_irreg,
	NEW.str_irreg_dt,
	NEW.str_irreg_type,
	NEW.nonstrcexw,
	NEW.roof_shape,
	NEW.roofcovmat,
	NEW.roofsysmat,
	NEW.roofsystyp,
	NEW.roof_conn,
	NEW.floor_mat,
	NEW.floor_type,
	NEW.floor_conn,
	NEW.foundn_sys,
	NEW.comment);
       INSERT INTO object.main_detail_qualifier (
	detail_id,
        bp_mat_type,
	bp_mat_tech,
	bp_mat_prop,
	bp_llrs,
	bp_llrs_duct,
	bp_height,
	bp_yr_built,
	bp_yr_destr,
	bp_occupy,
	bp_occupy_dt,
	bp_position,
	bp_plan_shape,
	bp_str_irreg,
	bp_str_irreg_dt,
	bp_str_irreg_type,
	bp_nonstrcexw,
	bp_roof_shape,
	bp_roofcovmat,
	bp_roofsysmat,
	bp_roofsystyp,
	bp_roof_conn,
	bp_floor_mat,
	bp_floor_type,
	bp_floor_conn,
	bp_foundn_sys,
	vt_yr_built1,
	vt_yr_built2,
	vt_yr_destr1,
	vt_yr_destr2)
       VALUES (
	(SELECT max(gid) FROM object.main_detail),
	NEW.bp_mat_type,
	NEW.bp_mat_tech,
	NEW.bp_mat_prop,
	NEW.bp_llrs,
	NEW.bp_llrs_duct,
	NEW.bp_height,
	NEW.bp_yr_built,
	NEW.bp_yr_destr,
	NEW.bp_occupy,
	NEW.bp_occupy_dt,
	NEW.bp_position,
	NEW.bp_plan_shape,
	NEW.bp_str_irreg,
	NEW.bp_str_irreg_dt,
	NEW.bp_str_irreg_type,
	NEW.bp_nonstrcexw,
	NEW.bp_roof_shape,
	NEW.bp_roofcovmat,
	NEW.bp_roofsysmat,
	NEW.bp_roofsystyp,
	NEW.bp_roof_conn,
	NEW.bp_floor_mat,
	NEW.bp_floor_type,
	NEW.bp_floor_conn,
	NEW.bp_foundn_sys,
	NEW.vt_yr_built1,
	NEW.vt_yr_built2,
	NEW.vt_yr_destr1,
	NEW.vt_yr_destr2);
       RETURN NEW;
       
      ELSIF TG_OP = 'UPDATE' THEN
       UPDATE object.main_detail 
       SET 
	object_id=NEW.object_id,
	resolution2_id=NEW.resolution2_id,
	resolution3_id=NEW.resolution3_id,
	the_geom=NEW.the_geom,
	mat_type=NEW.mat_type,
	mat_tech=NEW.mat_tech,
	mat_prop=NEW.mat_prop,
	llrs=NEW.llrs,
	llrs_duct=NEW.llrs_duct,
	height=NEW.height,
	height_numeric_1=NEW.height_numeric_1,
	yr_built=NEW.yr_built,
	yr_destr=NEW.yr_destr,
	occupy=NEW.occupy,
	occupy_dt=NEW.occupy_dt,
	position=NEW.position,
	plan_shape=NEW.plan_shape,
	str_irreg=NEW.str_irreg,
	str_irreg_dt=NEW.str_irreg_dt,
	str_irreg_type=NEW.str_irreg_type,
	nonstrcexw=NEW.nonstrcexw,
	roof_shape=NEW.roof_shape,
	roofcovmat=NEW.roofcovmat,
	roofsysmat=NEW.roofsysmat,
	roofsystyp=NEW.roofsystyp,
	roof_conn=NEW.roof_conn,
	floor_mat=NEW.floor_mat,
	floor_type=NEW.floor_type,
	floor_conn=NEW.floor_conn,
	foundn_sys=NEW.foundn_sys,
	comment=NEW.comment
       WHERE gid=OLD.gid;
       UPDATE object.main_detail_qualifier 
       SET 
	bp_mat_type=NEW.bp_mat_type,
	bp_mat_tech=NEW.bp_mat_tech,
	bp_mat_prop=NEW.bp_mat_prop,
	bp_llrs=NEW.bp_llrs,
	bp_llrs_duct=NEW.bp_llrs_duct,
	bp_height=NEW.bp_height,
	bp_yr_built=NEW.bp_yr_built,
	bp_yr_destr=NEW.bp_yr_destr,
	bp_occupy=NEW.bp_occupy,
	bp_occupy_dt=NEW.bp_occupy_dt,
	bp_position=NEW.bp_position,
	bp_plan_shape=NEW.bp_plan_shape,
	bp_str_irreg=NEW.bp_str_irreg,
	bp_str_irreg_dt=NEW.bp_str_irreg_dt,
	bp_str_irreg_type=NEW.bp_str_irreg_type,
	bp_nonstrcexw=NEW.bp_nonstrcexw,
	bp_roof_shape=NEW.bp_roof_shape,
	bp_roofcovmat=NEW.bp_roofcovmat,
	bp_roofsysmat=NEW.bp_roofsysmat,
	bp_roofsystyp=NEW.bp_roofsystyp,
	bp_roof_conn=NEW.bp_roof_conn,
	bp_floor_mat=NEW.bp_floor_mat,
	bp_floor_type=NEW.bp_floor_type,
	bp_floor_conn=NEW.bp_floor_conn,
	bp_foundn_sys=NEW.bp_foundn_sys,
	vt_yr_built1=NEW.vt_yr_built1,
	vt_yr_built2=NEW.vt_yr_built2,
	vt_yr_destr1=NEW.vt_yr_destr1,
	vt_yr_destr2=NEW.vt_yr_destr2
       WHERE detail_id=OLD.gid;
       RETURN NEW;
       
      ELSIF TG_OP = 'DELETE' THEN
       DELETE FROM object.main_detail_qualifier WHERE detail_id=OLD.gid;
       DELETE FROM object.main_detail WHERE gid=OLD.gid;
       RETURN NULL;
      END IF;
      RETURN NEW;
END;
$BODY$ 
LANGUAGE 'plpgsql';


COMMENT ON FUNCTION object.edit_resolution_views() IS $body$
This function makes the resolution views editable and forwards the edits to the underlying tables.
$body$;

--DROP TRIGGER resolution1_trigger ON object.ve_resolution1;
CREATE TRIGGER resolution1_trigger
    INSTEAD OF INSERT OR UPDATE OR DELETE ON object.ve_resolution1 
      FOR EACH ROW 
      EXECUTE PROCEDURE object.edit_resolution_views();

--DROP TRIGGER resolution2_trigger ON object.ve_resolution2;
CREATE TRIGGER resolution2_trigger
    INSTEAD OF INSERT OR UPDATE OR DELETE ON object.ve_resolution2 
      FOR EACH ROW 
      EXECUTE PROCEDURE object.edit_resolution_views();

--DROP TRIGGER resolution3_trigger ON object.ve_resolution3;
CREATE TRIGGER resolution3_trigger
    INSTEAD OF INSERT OR UPDATE OR DELETE ON object.ve_resolution3 
      FOR EACH ROW 
      EXECUTE PROCEDURE object.edit_resolution_views();


-----------------------------------------------------------------------------------------
-- Link resolutions: Update once the resolution_ids in case some records already exist --
-----------------------------------------------------------------------------------------
-- Update resolution2_ids for resolution1 records based on spatial join
UPDATE object.main_detail SET resolution2_id=a.resolution2_id 
  FROM (SELECT res2.gid AS resolution2_id, res1.gid AS resolution1_id FROM (SELECT gid, the_geom FROM object.main_detail WHERE object_id=1) res1 
    LEFT JOIN (SELECT gid, the_geom FROM object.main_detail WHERE object_id=2) res2 
    ON ST_Contains(res2.the_geom, (SELECT ST_PointOnSurface(res1.the_geom)))) AS a
WHERE object.main_detail.gid=a.resolution1_id;

-- Update resolution3_ids for resolution1 records based on spatial join
UPDATE object.main_detail SET resolution3_id=a.resolution3_id 
  FROM (SELECT res3.gid AS resolution3_id, res1.gid AS resolution1_id FROM (SELECT gid, the_geom FROM object.main_detail WHERE object_id=1) res1
    LEFT JOIN (SELECT gid, the_geom FROM object.main_detail WHERE object_id=3) res3 
    ON ST_Contains(res3.the_geom, (SELECT ST_PointOnSurface(res1.the_geom)))) AS a
WHERE object.main_detail.gid=a.resolution1_id;

-- Update resolution3_ids for resolution2 records based on spatial join
UPDATE object.main_detail SET resolution3_id=a.resolution3_id 
  FROM (SELECT res3.gid AS resolution3_id, res2.gid AS resolution2_id FROM (SELECT gid, the_geom FROM object.main_detail WHERE object_id=2) res2
    LEFT JOIN (SELECT gid, the_geom FROM object.main_detail WHERE object_id=3) res3 
    ON ST_Contains(res3.the_geom, (SELECT ST_PointOnSurface(res2.the_geom)))) AS a
WHERE object.main_detail.gid=a.resolution2_id;


-----------------------------------------------------------------------------------------
-- Link resolutions: Update resolution_ids on INSERT and UPDATE (main_detail.the_geom) --
-----------------------------------------------------------------------------------------
-- Trigger function and trigger to update resolution_ids for each INSERT and UPDATE OF the_geom ON main_detail
CREATE OR REPLACE FUNCTION object.update_resolution_ids() 
RETURNS TRIGGER AS
$BODY$
BEGIN 
     IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN	
	-- Update resolution2_ids for resolution1 records based on spatial join
	UPDATE object.main_detail SET resolution2_id=a.resolution2_id 
	  FROM (SELECT res2.gid AS resolution2_id, res1.gid AS resolution1_id FROM (SELECT gid, resolution2_id, resolution3_id, the_geom FROM object.main_detail WHERE object_id=1) res1 
	    LEFT JOIN (SELECT gid, the_geom FROM object.main_detail WHERE object_id=2) res2 
	    ON ST_Contains(res2.the_geom, (SELECT ST_PointOnSurface(res1.the_geom))) 
		WHERE res1.gid=NEW.gid	-- if resolution1 record is updated
		OR res1.resolution2_id=NEW.gid	-- if resolution2 record is updated
		OR res1.resolution3_id=NEW.gid	-- if resolution3 record is updated
		OR ST_Intersects(res1.the_geom, NEW.the_geom)	-- update ids also for resolution1 records that intersect with the newly updated resolution2 or resolution3 records
		) AS a
	WHERE object.main_detail.gid=a.resolution1_id OR object.main_detail.gid=NEW.gid AND NEW.object_id=1;

	-- Update resolution3_ids for resolution1 records based on spatial join
	UPDATE object.main_detail SET resolution3_id=a.resolution3_id 
	  FROM (SELECT res3.gid AS resolution3_id, res1.gid AS resolution1_id FROM (SELECT gid, resolution2_id, resolution3_id, the_geom FROM object.main_detail WHERE object_id=1) res1
	    LEFT JOIN (SELECT gid, the_geom FROM object.main_detail WHERE object_id=3) res3 
	    ON ST_Contains(res3.the_geom, (SELECT ST_PointOnSurface(res1.the_geom))) 
		WHERE res1.gid=NEW.gid 
		OR res1.resolution2_id=NEW.gid 
		OR res1.resolution3_id=NEW.gid 
		OR ST_Intersects(res1.the_geom, NEW.the_geom)
		) AS a
	WHERE object.main_detail.gid=a.resolution1_id OR object.main_detail.gid=NEW.gid AND NEW.object_id=1;

	-- Update resolution3_ids for resolution2 records based on spatial join
	UPDATE object.main_detail SET resolution3_id=a.resolution3_id 
	  FROM (SELECT res3.gid AS resolution3_id, res2.gid AS resolution2_id FROM (SELECT gid, resolution3_id, the_geom FROM object.main_detail WHERE object_id=2) res2
	    LEFT JOIN (SELECT gid, the_geom FROM object.main_detail WHERE object_id=3) res3 
	    ON ST_Contains(res3.the_geom, (SELECT ST_PointOnSurface(res2.the_geom))) 
		WHERE res2.gid=NEW.gid 
		OR res2.resolution3_id=NEW.gid 
		OR ST_Intersects(res2.the_geom, NEW.the_geom)
		) AS a
	WHERE object.main_detail.gid=a.resolution2_id OR object.main_detail.gid=NEW.gid AND NEW.object_id=2;
	
     RETURN NEW;

     ELSIF TG_OP = 'DELETE' THEN
	-- Update resolution2_ids for resolution1 records based on spatial join
	UPDATE object.main_detail SET resolution2_id=a.resolution2_id 
	  FROM (SELECT res2.gid AS resolution2_id, res1.gid AS resolution1_id FROM (SELECT gid, resolution2_id, resolution3_id, the_geom FROM object.main_detail WHERE object_id=1) res1 
	    LEFT JOIN (SELECT gid, the_geom FROM object.main_detail WHERE object_id=2) res2 
	    ON ST_Contains(res2.the_geom, (SELECT ST_PointOnSurface(res1.the_geom))) 
		WHERE res1.resolution2_id=OLD.gid	-- if resolution2 record is deleted
		OR res1.resolution3_id=OLD.gid	-- if resolution3 record is deleted
		) AS a
	WHERE object.main_detail.gid=a.resolution1_id;

	-- Update resolution3_ids for resolution1 records based on spatial join
	UPDATE object.main_detail SET resolution3_id=a.resolution3_id 
	  FROM (SELECT res3.gid AS resolution3_id, res1.gid AS resolution1_id FROM (SELECT gid, resolution2_id, resolution3_id, the_geom FROM object.main_detail WHERE object_id=1) res1
	    LEFT JOIN (SELECT gid, the_geom FROM object.main_detail WHERE object_id=3) res3 
	    ON ST_Contains(res3.the_geom, (SELECT ST_PointOnSurface(res1.the_geom))) 
		WHERE res1.resolution2_id=OLD.gid 
		OR res1.resolution3_id=OLD.gid
		) AS a
	WHERE object.main_detail.gid=a.resolution1_id;

	-- Update resolution3_ids for resolution2 records based on spatial join
	UPDATE object.main_detail SET resolution3_id=a.resolution3_id 
	  FROM (SELECT res3.gid AS resolution3_id, res2.gid AS resolution2_id FROM (SELECT gid, resolution3_id, the_geom FROM object.main_detail WHERE object_id=2) res2
	    LEFT JOIN (SELECT gid, the_geom FROM object.main_detail WHERE object_id=3) res3 
	    ON ST_Contains(res3.the_geom, (SELECT ST_PointOnSurface(res2.the_geom))) 
		WHERE res2.gid=OLD.gid 
		OR res2.resolution3_id=OLD.gid 
		OR ST_Intersects(res2.the_geom, OLD.the_geom)
		) AS a
	WHERE object.main_detail.gid=a.resolution2_id;
     
     RETURN NULL;

     END IF;
     RETURN NEW;
END;
$BODY$
LANGUAGE 'plpgsql';

COMMENT ON FUNCTION object.update_resolution_ids() IS $body$
This function updates the resolution_ids for an object when its geometry is updated or a new object is inserted.
$body$;

DROP TRIGGER resolution_id_trigger ON object.main_detail;
CREATE TRIGGER resolution_id_trigger
    AFTER INSERT OR UPDATE OF the_geom ON object.main_detail 
      FOR EACH ROW 
      WHEN (pg_trigger_depth() = 1)	-- current nesting level of trigger (1 if called once from inside a trigger)
      EXECUTE PROCEDURE object.update_resolution_ids();

DROP TRIGGER resolution_id_trigger_del ON object.main_detail;
CREATE TRIGGER resolution_id_trigger_del
    AFTER DELETE ON object.main_detail 
      FOR EACH ROW 
      WHEN (pg_trigger_depth() = 1)	-- current nesting level of trigger (1 if called once from inside a trigger)
      EXECUTE PROCEDURE object.update_resolution_ids();



/*----------------------------------------------------------------
-- Create table to hold the QGIS layer styles and populate it --
----------------------------------------------------------------
CREATE TABLE public.layer_styles ( 
	id                   serial  NOT NULL,
	f_table_catalog      varchar(256),
	f_table_schema       varchar(256),
	f_table_name         varchar(256),
	f_geometry_column    varchar(256),
	stylename            varchar(30),
	styleqml             xml,
	stylesld             xml,
	useasdefault         bool,
	description          text,
	owner                varchar(30),
	ui                   xml,
	update_time          timestamp DEFAULT now(),
	CONSTRAINT layer_styles_pkey PRIMARY KEY (id)
 );
*/