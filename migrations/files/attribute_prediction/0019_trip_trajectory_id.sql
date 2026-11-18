-- Adds trip.trajectory_id: which links a trip to its raw trajectory in public.trajectories

ALTER TABLE attribute_prediction.trip
    ADD COLUMN trajectory_id text NOT NULL UNIQUE;