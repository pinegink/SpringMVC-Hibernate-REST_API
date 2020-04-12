package org.mvchibernate.MVCcontrollers;

import org.mvchibernate.dao.entity.Playlist;
import org.mvchibernate.dao.entity.Song;
import org.mvchibernate.service.PlaylistService;
import org.mvchibernate.service.SongService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/playlist")
public class PlaylistsListController {
    private PlaylistService playlistService;
    private SongService songService;
    public PlaylistsListController (PlaylistService playlistService, SongService songService){
        this.playlistService = playlistService;
        this.songService = songService;
    }
    @GetMapping("/list")
    public String ListOfPlaylists (Model model){
        model.addAttribute("playlists", playlistService.getAll());
        return "list-of-playlists";
    }
    @GetMapping("/update-in")
    public String updateIn (@RequestParam("playlistId") int id, Model model){
        model.addAttribute("songs", playlistService.getById(id).getSongs());
        model.addAttribute("playlistId", id);
        return "playlist-update-form";
    }
    @PostMapping("/update-out")
    public String updateOut (@ModelAttribute("playlist") Playlist playlist){
        playlistService.update(playlist);
        return null;
    }
    @GetMapping("/update-delete-song")
    public String updateDeleteSong (@RequestParam("songId") int songId, @RequestParam("playlistId") int playlistId){
        Playlist playlist = playlistService.getById(playlistId);
        List<Song> songs = playlist.getSongs();
        for (int i=0; i<songs.size(); i++){
            if (songs.get(i).getId() == songId){
                songs.remove(i);
            }
        }
        playlistService.update(playlist);
        return "redirect:/playlist/update-in?playlistId="+playlistId;
    }

    @GetMapping("delete")
    public String delete (@RequestParam("id") int id){
        playlistService.deleteById(id);
        return "redirect:/playlist/list";
    }
    @GetMapping("/add-in")
    public String addIn (Model model){
        model.addAttribute("playlist", new Playlist());
        return "playlist-add-form";
    }
    @PostMapping("/add-out")
    public String addOut (@ModelAttribute("playlist") Playlist playlist){
        playlistService.save(playlist);
        return "redirect:/playlist/list";
    }
    @GetMapping ("/add-existing-song-in")
    public String addSongIn (Model model){

        return null;
    }
    @GetMapping("/song-select-in")
    public String songSelect (@RequestParam("playlistId") int playlistId, Model model){
        List<Song> allSongs = songService.getSongsAll();
        List<Song> alreadyInPlaylist = playlistService.getById(playlistId).getSongs();
        List<Song> canBeAddedToPlaylist = new ArrayList<>();
        for (Song song : allSongs){
            if (!alreadyInPlaylist.contains(song)){
                canBeAddedToPlaylist.add(song);
            }
        }
        model.addAttribute("songs", canBeAddedToPlaylist);
        model.addAttribute("playlistId", playlistId);
        return "song-select-form";
    }

}
