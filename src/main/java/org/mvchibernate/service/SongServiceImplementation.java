package org.mvchibernate.service;

import org.mvchibernate.dao.entity.Song;
import org.mvchibernate.dao.interfaces.SongDAO;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
@Service
public class SongServiceImplementation implements SongService {
    private SongDAO songDAO;
    public SongServiceImplementation(SongDAO songDAO) {
        this.songDAO = songDAO;
    }

    @Override
    @Transactional
    public void saveSong(Song song) {
        songDAO.saveSong(song);
    }

    @Override
    @Transactional
    public void updateSong(Song song) {
        songDAO.updateSong(song);
    }

    @Override
    @Transactional
    public Song getSongById(int id) {
        return songDAO.getById(id);
    }

    @Override
    @Transactional
    public List<Song> getSongsAll() {
        return songDAO.getAll();
    }

    @Override
    @Transactional
    public void deleteSongById(int id) {
        songDAO.deleteById(id);
    }
}
