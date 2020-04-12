drop table if exists song_to_playlist;
CREATE table song_to_playlist
(
    song_id integer references songs(id),
    playlist_id integer references playlist(id),
    primary key (song_id, playlist_id)
)