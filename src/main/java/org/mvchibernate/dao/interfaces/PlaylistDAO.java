package org.mvchibernate.dao.interfaces;

import org.mvchibernate.dao.entity.Playlist;

import java.util.List;

public interface PlaylistDAO {
    public Playlist getById (int id);
    public List<Playlist> getAll();
    public void deleteById (int id);
    public void saveNew (Playlist playlist);
    public void update (Playlist playlist);
}
