package org.mvchibernate.MVCcontrollers;

import org.mvchibernate.dao.entity.Playlist;
import org.mvchibernate.dao.entity.Song;
import org.mvchibernate.service.PlaylistService;
import org.mvchibernate.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/song")
public class SongController {
    private SongService songService;
    private PlaylistService playlistService;

    @Autowired
    public SongController (SongService songService, PlaylistService playlistService){
        this.songService = songService;
        this.playlistService = playlistService;
    }
    @GetMapping("/add-new-in")
    public String addIn (@RequestParam("playlistId") int playlistId, Model model){
        Song song = new Song();
        model.addAttribute("song", song);
        model.addAttribute("playlistId", playlistId);
        return "song-add-new-form";
    }
    @PostMapping("/add-new-out")
    public String addOut (@ModelAttribute("song") Song song){
        songService.saveSong(song);
        return "redirect:/playlist/list";
    }
    @GetMapping("/add-to-playlist")
    public String addSongToPlaylist (@RequestParam("songId") int songId, @RequestParam("playlistId") int playlistId){
        Playlist playlist = playlistService.getById(playlistId);
        Song song = songService.getSongById(songId);
        playlist.getSongs().add(song);
        playlistService.update(playlist);
        return"redirect:/playlist/update-in?playlistId="+playlistId;
    }
    @GetMapping("/delete-from-catalog")
    public String deleteFromCatalog (@RequestParam("songId") int songId, @RequestParam("playlistId") int playlistId){
        songService.deleteSongById(songId);
        return "redirect:/playlist/song-select-in?playlistId="+playlistId;
    }

}
