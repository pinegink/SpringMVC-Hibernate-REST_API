package org.mvchibernate.dao.implementation;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.mvchibernate.dao.entity.Song;
import org.mvchibernate.dao.interfaces.SongDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class SongDAOImplementation implements SongDAO {
    private SessionFactory sessionFactory;
    @Autowired
    public  SongDAOImplementation (SessionFactory sessionFactory) {
        this.sessionFactory= sessionFactory;
    }
    @Override
    public void saveSong(Song song) {
        Session session = sessionFactory.getCurrentSession();
        session.save(song);
    }

    @Override
    public void updateSong(Song song) {
        Session session = sessionFactory.getCurrentSession();
        session.update(song);
    }

    @Override
    public Song getSongById(int id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Song.class, id);
    }

    @Override
    public List<Song> getSongsAll() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Song").list();
    }

    @Override
    public void deleteSongById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("delete from Song where id=:id");
        query.setParameter("id", id);
        query.executeUpdate();
    }
}
