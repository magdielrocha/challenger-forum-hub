package br.com.alura.challenger_forum_hub.controller;

import br.com.alura.challenger_forum_hub.domain.topico.Topico;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("topicos")
public class TopicosController {

    @PostMapping
    @Transactional
    public ResponseEntity cadastrarTopico(@RequestBody @Valid Topico topico) { // por enquanto
        return ResponseEntity.ok().body("Topico cadastrado com sucesso!");
    }
}
