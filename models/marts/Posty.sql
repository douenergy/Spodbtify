WITH playlist_counts AS (
    SELECT COUNT(*) AS total_playlists
    FROM {{ ref('Playlists') }}
),

post_malone_playlists AS (
    SELECT COUNT(DISTINCT t.pid) AS post_malone_playlists
    FROM  {{ ref('Tracks') }} t
    WHERE t.artist_name ILIKE '%Post Malone%'
)

SELECT 
    *,   
    post_malone_playlists / total_playlists as post_malone_playlist_ratio
FROM playlist_counts, post_malone_playlists
