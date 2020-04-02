package org.mvchibernate.rest.server;

import org.mvchibernate.dao.entity.Song;
import org.mvchibernate.rest.SongNotFoundException;
import org.mvchibernate.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class SongRestController {
    private SongService songService;
    @Autowired
    public SongRestController (SongService songService){
        this.songService = songService;
    }
    @PostMapping ("/songs")
    public void saveSong (@RequestBody Song song){
        songService.saveSong(song);
    }
    @PutMapping("/songs")
    public void updateSong (@RequestBody Song song){
        songService.updateSong(song);
    }
    @GetMapping("/song/{id}")
    public Song getSongById (@PathVariable int id){
        Song song = songService.getSongById(id);
        if (song == null){
            throw new SongNotFoundException("song id:"+id+" not found");
        }
       return song;
    }
    @GetMapping("/songs")
    public List<Song> getSongsAll (){
        return songService.getSongsAll();
    }
    @DeleteMapping("/songs")
    public String deleteSongById (@PathVariable int id){
        Song song = songService.getSongById(id);
        if (song == null){
            throw new SongNotFoundException("song id:"+id+" not found");
        }
        songService.deleteSongById(id);
        return "song id:"+id+" has been deleted";
    }
}
