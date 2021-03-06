package org.mvchibernate.dao.interfaces;

import org.mvchibernate.dao.entity.Song;

import java.util.List;

public interface SongDAO {
    public void saveSong (Song song);
    public void updateSong (Song song);
    public Song getById(int id);
    public List<Song> getAll();
    public void deleteById(int id);
}
