package org.mvchibernate.service;

import org.mvchibernate.dao.entity.Song;

import java.util.List;

public interface SongService {
    public void saveSong (Song song);
    public void updateSong (Song song);
    public Song getSongById (int id);
    public List<Song> getSongsAll ();
    public void deleteSongById (int id);
}
