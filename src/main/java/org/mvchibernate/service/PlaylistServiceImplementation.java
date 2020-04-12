package org.mvchibernate.service;

import org.mvchibernate.dao.entity.Playlist;
import org.mvchibernate.dao.interfaces.PlaylistDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PlaylistServiceImplementation implements PlaylistService {
    private PlaylistDAO playlistDAO;
    @Autowired
    public PlaylistServiceImplementation (PlaylistDAO playlistDAO){
        this.playlistDAO = playlistDAO;
    }
    @Override
    @Transactional
    public Playlist getById(int id) {
        return playlistDAO.getById(id);
    }

    @Override
    @Transactional
    public List<Playlist> getAll() {
        return playlistDAO.getAll();
    }

    @Override
    @Transactional
    public void deleteById(int id) {
        playlistDAO.deleteById(id);
    }

    @Override
    @Transactional
    public void save(Playlist playlist) {
        playlistDAO.saveNew(playlist);
    }

    @Override
    @Transactional
    public void update(Playlist playlist) {
        playlistDAO.update(playlist);
    }
}

