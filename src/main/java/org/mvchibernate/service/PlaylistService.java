package org.mvchibernate.service;

import org.mvchibernate.dao.entity.Playlist;

import java.util.List;

public interface PlaylistService {
    public Playlist getById (int id);
    public List<Playlist> getAll();
    public void deleteById (int id);
    public void save(Playlist playlist);
    public void update (Playlist playlist);
}
