package org.mvchibernate.MVCcontrollers;

import org.mvchibernate.dao.entity.Song;
import org.mvchibernate.service.SongService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/songs")
public class SongsController {
    private SongService songService;
    @Autowired
    public SongsController (SongService songService){
        this.songService = songService;
    }
    @GetMapping("/list")
    public String listsongs (Model model){
        List<Song> songs = songService.getSongsAll();
        model.addAttribute("songs",songs);
        return "list";
    }
    @GetMapping("/update")
    public String updateSong (@RequestParam("id") int id, Model model){
        Song song = songService.getSongById(id);
        if (song != null){
            model.addAttribute("song", song);
        }
        return "updateForm";
    }
    @GetMapping("/add")
    public String addSong (Model model){
        Song song = new Song();
        model.addAttribute("song", song);
        return "updateForm";
    }
    @GetMapping("/delete")
    public String deleteSong (@RequestParam("id") int id){
        songService.deleteSongById(id);
        return "redirect:/songs/list";
    }
    @PostMapping("/save")
    public String saveSong (@ModelAttribute("song") Song song){
        if (song.getId() == 0){
            songService.saveSong(song);
        }else {
            songService.updateSong(song);
        }
        return "redirect:/songs/list";
    }
}
