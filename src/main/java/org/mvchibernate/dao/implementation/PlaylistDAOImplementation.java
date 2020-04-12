package org.mvchibernate.dao.implementation;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.mvchibernate.dao.entity.Playlist;
import org.mvchibernate.dao.interfaces.PlaylistDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class PlaylistDAOImplementation implements PlaylistDAO {
    private SessionFactory sessionFactory;
    @Autowired
    public PlaylistDAOImplementation (SessionFactory sessionFactory){
        this.sessionFactory = sessionFactory;
    }
    @Override
    public Playlist getById(int id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Playlist.class, id);
    }

    @Override
    public List<Playlist> getAll() {
        Session session = sessionFactory.getCurrentSession();
        Query<Playlist> query = session.createQuery("from Playlist", Playlist.class);
        List<Playlist> playlists = query.getResultList();
        return playlists;
    }

    @Override
    public void deleteById(int id) {
        System.out.println("inside DAO");
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("delete from Playlist where id=:id");
        query.setParameter("id", id);
        query.executeUpdate();

    }

    @Override
    public void saveNew(Playlist playlist) {
        Session session = sessionFactory.getCurrentSession();
        session.save(playlist);
    }

    @Override
    public void update(Playlist playlist) {
        Session session = sessionFactory.getCurrentSession();
        session.update(playlist);
    }
}
