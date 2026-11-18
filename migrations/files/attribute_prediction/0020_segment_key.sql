-- Adds key to the segment view.
-- Two different roads can go between the same two nodes (u and v), and key is what tells them apart.
-- We need it to match the two directions of a two-way road, so the graph can be built from this view.
-- CREATE OR REPLACE VIEW can only add new columns at the end, so key is the last column.

CREATE OR REPLACE VIEW attribute_prediction.segment AS
SELECT fid                                                AS segment_id,
       u,
       v,
       length                                             AS length_m,
       COALESCE(lower(oneway) IN ('true', 'yes', '1', '-1'), false) AS oneway,
       geometry                                           AS geom,
       highway, lanes, maxspeed, ref, name, bridge, tunnel,
       key
FROM public.osm_edges;
