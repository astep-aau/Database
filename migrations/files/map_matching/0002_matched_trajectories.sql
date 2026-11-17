CREATE TABLE map_matching.matched_trajectories (
    dataset       text        NOT NULL,
    taxi_id       text        NOT NULL,
    trajectory_id text        NOT NULL,
    algorithm     text        NOT NULL CHECK (algorithm IN ('fmm', 'stmatch')),
    status        text        NOT NULL CHECK (status IN ('matched', 'failed')),
    road_points   jsonb,                -- same structure as trajectories.road_points
    params        jsonb,
    matched_at    timestamptz NOT NULL DEFAULT now(),
    PRIMARY KEY (dataset, taxi_id, trajectory_id, algorithm)
);