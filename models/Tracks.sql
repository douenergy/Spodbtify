SELECT pid, UNNEST(tracks, recursive := true)
FROM {{ source('external_source', 'raw_spodbtify_playlists') }}