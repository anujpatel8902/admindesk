package com.example.admindesk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.*;

@Controller
@RequestMapping("/practice")
public class WordController {
    private final List<String> words = Arrays.asList(
            "शब्द"  );
    private final Random random = new Random();

    @GetMapping("/")
    public String showForm(Model model) {
        String word = words.get(random.nextInt(words.size()));
        model.addAttribute("word", word);
        model.addAttribute("result", "");
        return "index";
    }

    @PostMapping("/check")
    public String checkWord(@RequestParam("typedWord") String typedWord,
                            @RequestParam("word") String word,
                            Model model) {
        String result;
        if (typedWord.trim().equalsIgnoreCase(word)) {
            result = "✅ Correct!";
        } else {
            result = "❌ Incorrect! Correct spelling is: " + word;
        }
        // Next random word for new round
        String nextWord = words.get(random.nextInt(words.size()));
        model.addAttribute("word", nextWord);
        model.addAttribute("result", result);
        return "index";
    }
}
