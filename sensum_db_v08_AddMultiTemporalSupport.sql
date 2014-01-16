---------------------------------------------------------------------
-- Modify return table of transaction time query function (Inside) --
---------------------------------------------------------------------
DROP FUNCTION history.ttime_inside(timestamp without time zone, timestamp without time zone);
CREATE OR REPLACE FUNCTION history.ttime_inside(ttime_from timestamp DEFAULT '0001-01-01 00:00:00', ttime_to timestamp DEFAULT now()) 
RETURNS TABLE (
gid int,
object_id int,
resolution2_id int,
resolution3_id int,
the_geom geometry,
mat_type character varying(254),
mat_tech character varying(254),
mat_prop character varying(254),
llrs character varying(254),
llrs_duct character varying(254),
height character varying(254),
height_numeric_1 integer,
yr_built character varying(254),
yr_destr character varying(254),
occupy character varying(254),
occupy_dt character varying(254),
"position" character varying(254),
plan_shape character varying(254),
str_irreg character varying(254),
str_irreg_dt character varying(254),
str_irreg_type character varying(254),
nonstrcexw character varying(254),
roof_shape character varying(254),
roofcovmat character varying(254),
roofsysmat character varying(254),
roofsystyp character varying(254),
roof_conn character varying(254),
floor_mat character varying(254),
floor_type character varying(254),
floor_conn character varying(254),
foundn_sys character varying(254),
transaction_timestamp timestamptz,
transaction_type text
) AS
$BODY$
BEGIN
	RETURN QUERY

	--query1: query new_record column to get the UPDATE and INSERT objects
	(SELECT (populate_record(null::object.main_detail, b.new_record)).*, b.transaction_time, b.transaction_type FROM history.logged_actions AS b 
	WHERE b.table_name = 'main_detail' AND b.transaction_time >= ttime_from AND b.transaction_time <= ttime_to AND b.transaction_type = 'U'
	OR b.table_name = 'main_detail' AND b.transaction_time >= ttime_from AND b.transaction_time <= ttime_to AND b.transaction_type = 'I'
	ORDER BY b.new_record->'gid', b.transaction_time DESC)
	
	UNION ALL

	--query2: query old_record column to get the DELETE objects
	(SELECT (populate_record(null::object.main_detail, b.old_record)).*, b.transaction_time, b.transaction_type FROM history.logged_actions AS b 
	WHERE b.table_name = 'main_detail' AND b.transaction_time >= ttime_from AND b.transaction_time <= ttime_to AND b.transaction_type = 'D'
	ORDER BY b.old_record->'gid', b.transaction_time DESC);
END;
$BODY$ 
LANGUAGE 'plpgsql';

COMMENT ON FUNCTION history.ttime_inside(ttime_from timestamp, ttime_to timestamp) IS $body$
This function searches history.logged_actions to get the latest version of each object primitive that has been modified only within the queried transaction time.

Arguments:
   ttime_from:	transaction time from yyy-mm-dd hh:mm:ss
   ttime_to:	transaction time to yyy-mm-dd hh:mm:ss
$body$;


--------------------------------------------------------------------
-- Modify return table of transaction time query function (Equal) --
--------------------------------------------------------------------
DROP FUNCTION history.ttime_equal(timestamp without time zone);
CREATE OR REPLACE FUNCTION history.ttime_equal(ttime timestamp) 
RETURNS TABLE (
gid int,
object_id int,
resolution2_id int,
resolution3_id int,
the_geom geometry,
mat_type character varying(254),
mat_tech character varying(254),
mat_prop character varying(254),
llrs character varying(254),
llrs_duct character varying(254),
height character varying(254),
height_numeric_1 integer,
yr_built character varying(254),
yr_destr character varying(254),
occupy character varying(254),
occupy_dt character varying(254),
"position" character varying(254),
plan_shape character varying(254),
str_irreg character varying(254),
str_irreg_dt character varying(254),
str_irreg_type character varying(254),
nonstrcexw character varying(254),
roof_shape character varying(254),
roofcovmat character varying(254),
roofsysmat character varying(254),
roofsystyp character varying(254),
roof_conn character varying(254),
floor_mat character varying(254),
floor_type character varying(254),
floor_conn character varying(254),
foundn_sys character varying(254),
transaction_timestamp timestamptz,
transaction_type text
) AS
$BODY$
BEGIN
	RETURN QUERY

	--query1: query new_record column to get the UPDATE and INSERT records
	(SELECT (populate_record(null::object.main_detail, b.new_record)).*, b.transaction_time, b.transaction_type FROM history.logged_actions AS b 
	WHERE b.table_name = 'main_detail' AND b.transaction_time = ttime AND b.transaction_type = 'U'
	OR b.table_name = 'main_detail' AND b.transaction_time = ttime AND b.transaction_type = 'I'
	ORDER BY b.new_record->'gid', b.transaction_time DESC)
	
	UNION ALL

	--query2: query old_record column to get the DELETE records
	(SELECT (populate_record(null::object.main_detail, b.old_record)).*, b.transaction_time, b.transaction_type FROM history.logged_actions AS b 
	WHERE b.table_name = 'main_detail' AND b.transaction_time = ttime AND b.transaction_type = 'D'
	ORDER BY b.old_record->'gid', b.transaction_time DESC);
END;
$BODY$ 
LANGUAGE 'plpgsql';

COMMENT ON FUNCTION history.ttime_equal(ttime timestamp) IS $body$
This function searches history.logged_actions to get the latest version of each object primitive whose transaction time equals the queried timerange.

Arguments:
   ttime_from:	transaction time from yyy-mm-dd hh:mm:ss
   ttime_to:	transaction time to yyy-mm-dd hh:mm:ss
$body$;


--------------------------------------------------------------------------
-- Modify return table of transaction time query function (Get history) --
--------------------------------------------------------------------------
DROP FUNCTION history.ttime_gethistory();
CREATE OR REPLACE FUNCTION history.ttime_gethistory() 
RETURNS TABLE (
gid int,
object_id int,
resolution2_id int,
resolution3_id int,
the_geom geometry,
mat_type character varying(254),
mat_tech character varying(254),
mat_prop character varying(254),
llrs character varying(254),
llrs_duct character varying(254),
height character varying(254),
height_numeric_1 integer,
yr_built character varying(254),
yr_destr character varying(254),
occupy character varying(254),
occupy_dt character varying(254),
"position" character varying(254),
plan_shape character varying(254),
str_irreg character varying(254),
str_irreg_dt character varying(254),
str_irreg_type character varying(254),
nonstrcexw character varying(254),
roof_shape character varying(254),
roofcovmat character varying(254),
roofsysmat character varying(254),
roofsystyp character varying(254),
roof_conn character varying(254),
floor_mat character varying(254),
floor_type character varying(254),
floor_conn character varying(254),
foundn_sys character varying(254),
transaction_timestamp timestamptz,
transaction_type text
) AS
$BODY$
BEGIN
	RETURN QUERY
		
	--query1: query new_record column to get the UPDATE and INSERT records
	(SELECT (populate_record(null::object.main_detail, b.new_record)).*, b.transaction_time, b.transaction_type FROM history.logged_actions AS b 
	WHERE b.table_name = 'main_detail' AND b.transaction_type='U'
	OR b.table_name = 'main_detail' AND b.transaction_type='I'
	ORDER BY b.transaction_time DESC)	

	UNION ALL

	--query2: query old_record column to get the DELETE records
	(SELECT (populate_record(null::object.main_detail, b.old_record)).*, b.transaction_time, b.transaction_type FROM history.logged_actions AS b 
	WHERE b.table_name = 'main_detail' AND b.transaction_type='D'
	ORDER BY b.transaction_time DESC);
END;
$BODY$ 
LANGUAGE 'plpgsql';

COMMENT ON FUNCTION history.ttime_gethistory() IS $body$
This function searches history.logged_actions to get all versions of each object primitive that has been modified.
$body$;




------------------------------------------------
-- Add valid time query function (getHistory) --
------------------------------------------------
DROP FUNCTION history.vtime_gethistory();
CREATE OR REPLACE FUNCTION history.vtime_gethistory() 
RETURNS TABLE (
gid int,
object_id int,
resolution int,
resolution2_id int,
resolution3_id int,
the_geom geometry,
mat_type character varying(254),
mat_tech character varying(254),
mat_prop character varying(254),
llrs character varying(254),
llrs_duct character varying(254),
height character varying(254),
height_numeric_1 integer,
yr_built character varying(254),
yr_destr character varying(254),
occupy character varying(254),
occupy_dt character varying(254),
"position" character varying(254),
plan_shape character varying(254),
str_irreg character varying(254),
str_irreg_dt character varying(254),
str_irreg_type character varying(254),
nonstrcexw character varying(254),
roof_shape character varying(254),
roofcovmat character varying(254),
roofsysmat character varying(254),
roofsystyp character varying(254),
roof_conn character varying(254),
floor_mat character varying(254),
floor_type character varying(254),
floor_conn character varying(254),
foundn_sys character varying(254),
vt_yr_built1 timestamptz,
vt_yr_destr1 timestamptz,
transaction_timestamp timestamptz,
transaction_type text
) AS
$BODY$
BEGIN
	RETURN QUERY SELECT * FROM (

	--query1: query new_record column to get the latest UPDATE records
	SELECT  
	n2.gid,
	n2.object_id,
	n3.resolution,
	n2.resolution2_id,
	n2.resolution3_id,
	n2.the_geom geometry,
	n2.the_geom geometry,
	n2.mat_type,
	n2.mat_tech,
	n2.mat_prop,
	n2.llrs,
	n2.llrs_duct,
	n2.height,
	n2.height_numeric_1,
	n2.yr_built,
	n2.yr_destr,
	n2.occupy,
	n2.occupy_dt,
	n2."position",
	n2.plan_shape,
	n2.str_irreg,
	n2.str_irreg_dt,
	n2.str_irreg_type,
	n2.nonstrcexw,
	n2.roof_shape,
	n2.roofcovmat,
	n2.roofsysmat,
	n2.roofsystyp,
	n2.roof_conn,
	n2.floor_mat,
	n2.floor_type,
	n2.floor_conn,
	n2.foundn_sys,
	n1.vt_yr_built1,
	n1.vt_yr_destr1,
	n1.transaction_time,
	n1.transaction_type
	FROM
	
	(SELECT DISTINCT ON (a.new_record->'gid') (populate_record(null::object.main_detail_qualifier, a.new_record)).*, a.transaction_time, a.transaction_type FROM history.logged_actions AS a 
	WHERE a.table_name = 'main_detail_qualifier' AND exist(a.changed_fields,'vt_yr_built1')
	OR a.table_name = 'main_detail_qualifier' AND exist(a.changed_fields,'vt_yr_destr1')	
	ORDER BY a.new_record->'gid', a.transaction_time DESC) n1

	LEFT JOIN 

	(SELECT DISTINCT ON (b.new_record->'gid') (populate_record(null::object.main_detail, b.new_record)).*, b.transaction_time FROM history.logged_actions AS b 
	WHERE b.table_name = 'main_detail'
	ORDER BY b.new_record->'gid', b.transaction_time DESC) n2
	
	ON (n2.gid = n1.detail_id)
	
	JOIN 
	object.main AS n3 
	ON (n3.gid = n2.object_id)

	UNION ALL

	--query2: query new_record column to get the UPDATE and INSERT records
	SELECT  
	n2.gid,
	n2.object_id,
	n3.resolution,
	n2.resolution2_id,
	n2.resolution3_id,
	n2.the_geom geometry,
	n2.mat_type,
	n2.mat_tech,
	n2.mat_prop,
	n2.llrs,
	n2.llrs_duct,
	n2.height,
	n2.height_numeric_1,
	n2.yr_built,
	n2.yr_destr,
	n2.occupy,
	n2.occupy_dt,
	n2."position",
	n2.plan_shape,
	n2.str_irreg,
	n2.str_irreg_dt,
	n2.str_irreg_type,
	n2.nonstrcexw,
	n2.roof_shape,
	n2.roofcovmat,
	n2.roofsysmat,
	n2.roofsystyp,
	n2.roof_conn,
	n2.floor_mat,
	n2.floor_type,
	n2.floor_conn,
	n2.foundn_sys,
	n1.vt_yr_built1,
	n1.vt_yr_destr1,
	n1.transaction_time,
	n1.transaction_type
	FROM

	(SELECT (populate_record(null::object.main_detail_qualifier, a.new_record)).*, a.transaction_time, a.transaction_type FROM history.logged_actions AS a 
	WHERE a.table_name = 'main_detail_qualifier' AND exist(a.changed_fields,'vt_yr_built1')
	OR a.table_name = 'main_detail_qualifier' AND exist(a.changed_fields,'vt_yr_destr1')	--select records that were UPDATE and that caused a change to the transaction_time (=real world change)
	OR a.table_name = 'main_detail_qualifier' AND a.transaction_type = 'I'	--select records that were INSERTED
	ORDER BY a.transaction_time DESC OFFSET 1) n1	--OFFSET 1 to remove the latest UPDATE record (will be substituted by query1 result which gives the latest version in the database and not the latest version before or at n1.transaction_time)

	LEFT JOIN

	(SELECT (populate_record(null::object.main_detail, b.new_record)).*, b.transaction_time FROM history.logged_actions AS b 
	WHERE b.table_name = 'main_detail'
	ORDER BY b.transaction_time) n2
	
	ON (n2.gid = n1.detail_id 
	AND n2.transaction_time = (SELECT max(transaction_time) FROM history.logged_actions WHERE table_name = 'main_detail' AND transaction_time <= n1.transaction_time))	--join only the records from main_detail that have the closest lesser transaction time to the selected main_detail_qualifier

	JOIN 
	object.main AS n3 
	ON (n3.gid = n2.object_id)
	
	UNION ALL

	--query3: query old_record column to get the DELETE records
	SELECT  
	n2.gid,
	n2.object_id,
	n3.resolution,
	n2.resolution2_id,
	n2.resolution3_id,
	n2.the_geom geometry,
	n2.mat_type,
	n2.mat_tech,
	n2.mat_prop,
	n2.llrs,
	n2.llrs_duct,
	n2.height,
	n2.height_numeric_1,
	n2.yr_built,
	n2.yr_destr,
	n2.occupy,
	n2.occupy_dt,
	n2."position",
	n2.plan_shape,
	n2.str_irreg,
	n2.str_irreg_dt,
	n2.str_irreg_type,
	n2.nonstrcexw,
	n2.roof_shape,
	n2.roofcovmat,
	n2.roofsysmat,
	n2.roofsystyp,
	n2.roof_conn,
	n2.floor_mat,
	n2.floor_type,
	n2.floor_conn,
	n2.foundn_sys,
	n1.vt_yr_built1,
	n1.vt_yr_destr1,
	n1.transaction_time,
	n1.transaction_type
	FROM

	(SELECT (populate_record(null::object.main_detail_qualifier, a.old_record)).*, a.transaction_time, a.transaction_type FROM history.logged_actions AS a 
	WHERE a.table_name = 'main_detail_qualifier' AND a.old_record->'vt_yr_built1'!='' AND a.transaction_type = 'D'
	OR a.table_name = 'main_detail_qualifier' AND a.old_record->'vt_yr_destr1'!='' AND a.transaction_type = 'D'
	ORDER BY a.old_record->'gid', a.transaction_time DESC) n1
	
	LEFT JOIN 

	(SELECT (populate_record(null::object.main_detail, b.old_record)).*, b.transaction_time FROM history.logged_actions AS b 
	WHERE b.table_name = 'main_detail'
	ORDER BY b.old_record->'gid', b.transaction_time DESC) n2

	ON (n2.gid = n1.detail_id 
	AND n2.transaction_time = (SELECT max(transaction_time) FROM history.logged_actions WHERE table_name = 'main_detail' AND transaction_time <= n1.transaction_time))	--join only the records from main_detail that have the closest lesser transaction time to the selected main_detail_qualifier

	JOIN 
	object.main AS n3 
	ON (n3.gid = n2.object_id)

	) n0 ORDER BY n0.gid, n0.transaction_time DESC;
END;
$BODY$ 
LANGUAGE 'plpgsql';

COMMENT ON FUNCTION history.vtime_gethistory() IS $body$
This function searches history.logged_actions to get all real world changes with the corresponding latest version for each object primitive at each valid time.
$body$;


-----------------------------------------------
-- Add valid time query function (Intersect) --
-----------------------------------------------
DROP FUNCTION history.vtime_intersect(vtime_from text, vtime_to text); 
CREATE OR REPLACE FUNCTION history.vtime_intersect(vtime_from text DEFAULT '0001-01-01 00:00:00', vtime_to text DEFAULT now()) 
RETURNS TABLE (
gid int,
object_id int,
resolution int,
resolution2_id int,
resolution3_id int,
the_geom geometry,
mat_type character varying(254),
mat_tech character varying(254),
mat_prop character varying(254),
llrs character varying(254),
llrs_duct character varying(254),
height character varying(254),
height_numeric_1 integer,
yr_built character varying(254),
yr_destr character varying(254),
occupy character varying(254),
occupy_dt character varying(254),
"position" character varying(254),
plan_shape character varying(254),
str_irreg character varying(254),
str_irreg_dt character varying(254),
str_irreg_type character varying(254),
nonstrcexw character varying(254),
roof_shape character varying(254),
roofcovmat character varying(254),
roofsysmat character varying(254),
roofsystyp character varying(254),
roof_conn character varying(254),
floor_mat character varying(254),
floor_type character varying(254),
floor_conn character varying(254),
foundn_sys character varying(254),
vt_yr_built1 timestamptz,
vt_yr_destr1 timestamptz
) AS
$BODY$
BEGIN
	RETURN QUERY SELECT DISTINCT ON (n0.gid) * FROM (
	
	-- query1: query old_record column to get UPDATE records which have a vt_yr_destr1 (these are real world changes)
	SELECT  
	n2.gid,
	n2.object_id,
	n3.resolution,
	n2.resolution2_id,
	n2.resolution3_id,
	n2.the_geom geometry,
	n2.mat_type,
	n2.mat_tech,
	n2.mat_prop,
	n2.llrs,
	n2.llrs_duct,
	n2.height,
	n2.height_numeric_1,
	n2.yr_built,
	n2.yr_destr,
	n2.occupy,
	n2.occupy_dt,
	n2."position",
	n2.plan_shape,
	n2.str_irreg,
	n2.str_irreg_dt,
	n2.str_irreg_type,
	n2.nonstrcexw,
	n2.roof_shape,
	n2.roofcovmat,
	n2.roofsysmat,
	n2.roofsystyp,
	n2.roof_conn,
	n2.floor_mat,
	n2.floor_type,
	n2.floor_conn,
	n2.foundn_sys,
	n1.vt_yr_built1,
	n1.vt_yr_destr1
	FROM
	
	(SELECT DISTINCT ON (a.old_record->'gid') (populate_record(null::object.main_detail_qualifier, a.old_record)).*, a.transaction_time FROM history.logged_actions AS a 
	WHERE a.table_name = 'main_detail_qualifier' AND a.old_record->'vt_yr_built1' <= vtime_to AND a.old_record->'vt_yr_destr1' >=vtime_from
	ORDER BY a.old_record->'gid', a.transaction_time DESC) n1	--select only the latest version of each object primitive

	LEFT JOIN 

	(SELECT (populate_record(null::object.main_detail, b.old_record)).*, b.transaction_time FROM history.logged_actions AS b 
	WHERE b.table_name = 'main_detail'
	ORDER BY b.old_record->'gid', b.transaction_time DESC) n2
	
	ON (n2.gid = n1.detail_id 
	AND n2.transaction_time = (SELECT max(transaction_time) FROM history.logged_actions WHERE table_name = 'main_detail' AND transaction_time <= n1.transaction_time))	--join only the records from main_detail that have the closest lesser transaction time to the selected main_detail_qualifier

	JOIN 
	object.main AS n3 
	ON (n3.gid = n2.object_id)

	UNION ALL

	-- query2: query new_record column to get the UPDATE and INSERT records which do not have a vt_yr_destr1 (these are still valid)
	SELECT  
	n2.gid,
	n2.object_id,
	n3.resolution,
	n2.resolution2_id,
	n2.resolution3_id,
	n2.the_geom geometry,
	n2.mat_type,
	n2.mat_tech,
	n2.mat_prop,
	n2.llrs,
	n2.llrs_duct,
	n2.height,
	n2.height_numeric_1,
	n2.yr_built,
	n2.yr_destr,
	n2.occupy,
	n2.occupy_dt,
	n2."position",
	n2.plan_shape,
	n2.str_irreg,
	n2.str_irreg_dt,
	n2.str_irreg_type,
	n2.nonstrcexw,
	n2.roof_shape,
	n2.roofcovmat,
	n2.roofsysmat,
	n2.roofsystyp,
	n2.roof_conn,
	n2.floor_mat,
	n2.floor_type,
	n2.floor_conn,
	n2.foundn_sys,
	n1.vt_yr_built1,
	n1.vt_yr_destr1
	FROM
	
	(SELECT DISTINCT ON (a.new_record->'gid') (populate_record(null::object.main_detail_qualifier, a.new_record)).*, a.transaction_time FROM history.logged_actions AS a 
	WHERE a.table_name = 'main_detail_qualifier' AND a.new_record->'vt_yr_built1' <= vtime_to	--select all records that were inserted before or at the end of the given valid time range
	ORDER BY a.new_record->'gid', a.transaction_time DESC) n1	--select only the latest version of each object primitive

	LEFT JOIN 
	
	(SELECT DISTINCT ON (b.new_record->'gid') (populate_record(null::object.main_detail, b.new_record)).*, b.transaction_time FROM history.logged_actions AS b 
	WHERE b.table_name = 'main_detail'
	ORDER BY b.new_record->'gid', b.transaction_time DESC) n2	--select only the latest version of each object primitive

	ON (n1.detail_id = n2.gid)
	
	JOIN 
	object.main AS n3 
	ON (n3.gid = n2.object_id)

	EXCEPT	-- return all records that are in the result of query1 and query2 but not in the result of query3. this effectively removes the DELETE records (query3) from the UPDATE and INSERT records (query1 and query2).

	--query3: query old_record column to get the DELETE records
	SELECT  
	n2.gid,
	n2.object_id,
	n3.resolution,
	n2.resolution2_id,
	n2.resolution3_id,
	n2.the_geom geometry,
	n2.mat_type,
	n2.mat_tech,
	n2.mat_prop,
	n2.llrs,
	n2.llrs_duct,
	n2.height,
	n2.height_numeric_1,
	n2.yr_built,
	n2.yr_destr,
	n2.occupy,
	n2.occupy_dt,
	n2."position",
	n2.plan_shape,
	n2.str_irreg,
	n2.str_irreg_dt,
	n2.str_irreg_type,
	n2.nonstrcexw,
	n2.roof_shape,
	n2.roofcovmat,
	n2.roofsysmat,
	n2.roofsystyp,
	n2.roof_conn,
	n2.floor_mat,
	n2.floor_type,
	n2.floor_conn,
	n2.foundn_sys,
	n1.vt_yr_built1,
	n1.vt_yr_destr1
	FROM
	
	(SELECT DISTINCT ON (a.old_record->'gid') (populate_record(null::object.main_detail_qualifier, a.old_record)).*, a.transaction_time FROM history.logged_actions AS a 
	WHERE a.table_name = 'main_detail_qualifier' AND a.old_record->'vt_yr_destr1' < vtime_from AND a.transaction_type = 'D'	--exclude from select results the records that where deleted before the requested time range and have a vt_yr_destr1 (these are real world deletes)
	OR a.table_name = 'main_detail_qualifier' AND NOT defined(a.old_record,'vt_yr_destr1') AND a.transaction_type = 'D'	--exclude from select results the records that where deleted but have no vt_yr_destr1 (these are error deletes)
	ORDER BY a.old_record->'gid', a.transaction_time DESC) n1	--select only the latest version of each object primitive

	LEFT JOIN
	
	(SELECT DISTINCT ON (b.old_record->'gid') (populate_record(null::object.main_detail, b.old_record)).*, b.transaction_time FROM history.logged_actions AS b 
	WHERE b.table_name = 'main_detail'
	ORDER BY b.old_record->'gid', b.transaction_time DESC) n2	--select only the latest version of each object primitive
	
	ON (n1.detail_id = n2.gid)

	JOIN 
	object.main AS n3 
	ON (n3.gid = n2.object_id)

	) n0 ORDER BY n0.gid, n0.vt_yr_built1 DESC;

END;
$BODY$ 
LANGUAGE 'plpgsql';

COMMENT ON FUNCTION history.vtime_intersect(vtime_from text, vtime_to text) IS $body$
This function searches history.logged_actions to get the latest version of each object primitive whose valid time intersects with the queried timerange.

Arguments:
   vtime_from:	valid time from yyy-mm-dd hh:mm:ss
   vtime_to:	valid time to yyy-mm-dd hh:mm:ss
$body$;


--------------------------------------------
-- Add valid time query function (Inside) --
--------------------------------------------
DROP FUNCTION history.vtime_inside(vtime_from text, vtime_to text);
CREATE OR REPLACE FUNCTION history.vtime_inside(vtime_from text DEFAULT '0001-01-01 00:00:00', vtime_to text DEFAULT now()) 
RETURNS TABLE (
gid int,
object_id int,
resolution int,
resolution2_id int,
resolution3_id int,
the_geom geometry,
mat_type character varying(254),
mat_tech character varying(254),
mat_prop character varying(254),
llrs character varying(254),
llrs_duct character varying(254),
height character varying(254),
height_numeric_1 integer,
yr_built character varying(254),
yr_destr character varying(254),
occupy character varying(254),
occupy_dt character varying(254),
"position" character varying(254),
plan_shape character varying(254),
str_irreg character varying(254),
str_irreg_dt character varying(254),
str_irreg_type character varying(254),
nonstrcexw character varying(254),
roof_shape character varying(254),
roofcovmat character varying(254),
roofsysmat character varying(254),
roofsystyp character varying(254),
roof_conn character varying(254),
floor_mat character varying(254),
floor_type character varying(254),
floor_conn character varying(254),
foundn_sys character varying(254),
vt_yr_built1 timestamptz,
vt_yr_destr1 timestamptz
) AS
$BODY$
BEGIN
	RETURN QUERY SELECT DISTINCT ON (n0.gid) * FROM (

	-- query old_record column to get all records which have a vt_yr_built1 and vt_yr_destr1 (these are records whose lifespan ended)
	SELECT  
	n2.gid,
	n2.object_id,
	n3.resolution,
	n2.resolution2_id,
	n2.resolution3_id,
	n2.the_geom geometry,
	n2.mat_type,
	n2.mat_tech,
	n2.mat_prop,
	n2.llrs,
	n2.llrs_duct,
	n2.height,
	n2.height_numeric_1,
	n2.yr_built,
	n2.yr_destr,
	n2.occupy,
	n2.occupy_dt,
	n2."position",
	n2.plan_shape,
	n2.str_irreg,
	n2.str_irreg_dt,
	n2.str_irreg_type,
	n2.nonstrcexw,
	n2.roof_shape,
	n2.roofcovmat,
	n2.roofsysmat,
	n2.roofsystyp,
	n2.roof_conn,
	n2.floor_mat,
	n2.floor_type,
	n2.floor_conn,
	n2.foundn_sys,
	n1.vt_yr_built1,
	n1.vt_yr_destr1
	FROM
	
	(SELECT DISTINCT ON (a.old_record->'gid') (populate_record(null::object.main_detail_qualifier, a.old_record)).*, a.transaction_time FROM history.logged_actions AS a 
	WHERE a.table_name = 'main_detail_qualifier' AND a.old_record->'vt_yr_built1' >= vtime_from AND a.old_record->'vt_yr_destr1' <= vtime_to
	ORDER BY a.old_record->'gid', a.transaction_time DESC) n1	--select only the latest version of each object primitive

	LEFT JOIN 

	(SELECT (populate_record(null::object.main_detail, b.old_record)).*, b.transaction_time FROM history.logged_actions AS b 
	WHERE b.table_name = 'main_detail'
	ORDER BY b.old_record->'gid', b.transaction_time DESC) n2

	ON (n2.gid = n1.detail_id 
	AND n2.transaction_time = (SELECT max(transaction_time) FROM history.logged_actions WHERE table_name = 'main_detail' AND transaction_time <= n1.transaction_time))	--join only the records from main_detail that have the closest lesser transaction time to the selected main_detail_qualifier

	JOIN 
	object.main AS n3 
	ON (n3.gid = n2.object_id)

	) n0 ORDER BY n0.gid ASC;
END;
$BODY$ 
LANGUAGE 'plpgsql';

COMMENT ON FUNCTION history.vtime_inside(vtime_from text, vtime_to text) IS $body$
This function searches history.logged_actions to get the latest version of each object primitive whose valid time is completely inside the queried timerange.

Arguments:
   vtime_from:	valid time from yyy-mm-dd hh:mm:ss
   vtime_to:	valid time to yyy-mm-dd hh:mm:ss
$body$;


--------------------------------------------
-- Add valid time query function (equal) --
--------------------------------------------
DROP FUNCTION history.vtime_equal(vtime_from text, vtime_to text);
CREATE OR REPLACE FUNCTION history.vtime_equal(vtime_from text, vtime_to text) 
RETURNS TABLE (
gid int,
object_id int,
resolution int,
resolution2_id int,
resolution3_id int,
the_geom geometry,
mat_type character varying(254),
mat_tech character varying(254),
mat_prop character varying(254),
llrs character varying(254),
llrs_duct character varying(254),
height character varying(254),
height_numeric_1 integer,
yr_built character varying(254),
yr_destr character varying(254),
occupy character varying(254),
occupy_dt character varying(254),
"position" character varying(254),
plan_shape character varying(254),
str_irreg character varying(254),
str_irreg_dt character varying(254),
str_irreg_type character varying(254),
nonstrcexw character varying(254),
roof_shape character varying(254),
roofcovmat character varying(254),
roofsysmat character varying(254),
roofsystyp character varying(254),
roof_conn character varying(254),
floor_mat character varying(254),
floor_type character varying(254),
floor_conn character varying(254),
foundn_sys character varying(254),
vt_yr_built1 timestamptz,
vt_yr_destr1 timestamptz
) AS
$BODY$
BEGIN
	RETURN QUERY SELECT DISTINCT ON (n0.gid) * FROM (

	-- query old_record column to get UPDATE records which have a vt_yr_destr1 (these are real world changes)
	SELECT  
	n2.gid,
	n2.object_id,
	n3.resolution,
	n2.resolution2_id,
	n2.resolution3_id,
	n2.the_geom geometry,
	n2.mat_type,
	n2.mat_tech,
	n2.mat_prop,
	n2.llrs,
	n2.llrs_duct,
	n2.height,
	n2.height_numeric_1,
	n2.yr_built,
	n2.yr_destr,
	n2.occupy,
	n2.occupy_dt,
	n2."position",
	n2.plan_shape,
	n2.str_irreg,
	n2.str_irreg_dt,
	n2.str_irreg_type,
	n2.nonstrcexw,
	n2.roof_shape,
	n2.roofcovmat,
	n2.roofsysmat,
	n2.roofsystyp,
	n2.roof_conn,
	n2.floor_mat,
	n2.floor_type,
	n2.floor_conn,
	n2.foundn_sys,
	n1.vt_yr_built1,
	n1.vt_yr_destr1
	FROM

	(SELECT DISTINCT ON (a.old_record->'gid') (populate_record(null::object.main_detail_qualifier, a.old_record)).*, a.transaction_time FROM history.logged_actions AS a 
	WHERE a.table_name = 'main_detail_qualifier' AND a.old_record->'vt_yr_built1' = vtime_from AND a.old_record->'vt_yr_destr1' = vtime_to
	ORDER BY a.old_record->'gid', a.transaction_time DESC) n1	--select only the latest version of each object primitive

	LEFT JOIN 
	
	(SELECT (populate_record(null::object.main_detail, b.old_record)).*, b.transaction_time FROM history.logged_actions AS b 
	WHERE b.table_name = 'main_detail'
	ORDER BY b.old_record->'gid', b.transaction_time DESC) n2
	
	ON (n2.gid = n1.detail_id 
	AND n2.transaction_time = (SELECT max(transaction_time) FROM history.logged_actions WHERE table_name = 'main_detail' AND transaction_time <= n1.transaction_time))	--join only the records from main_detail that have the closest lesser transaction time to the selected main_detail_qualifier

	JOIN 
	object.main AS n3 
	ON (n3.gid = n2.object_id)

	) n0 ORDER BY n0.gid ASC;
END;
$BODY$ 
LANGUAGE 'plpgsql';

COMMENT ON FUNCTION history.vtime_equal(vtime_from text, vtime_to text) IS $body$
This function searches history.logged_actions to get the latest version of each object primitive whose valid time range equals the queried timerange.

Arguments:
   vtime_from:	valid time from yyy-mm-dd hh:mm:ss
   vtime_to:	valid time to yyy-mm-dd hh:mm:ss
$body$;