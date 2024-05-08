SELECT * Exclude('tracks') 
FROM {{ source('external_source', 'raw_spodbtify_playlists') }} 