package br.com.alura.challenger_forum_hub.domain.usuario;

import jakarta.persistence.*;
import lombok.*;

@Entity(name = "Perfil")
@Table(name = "perfil")
@Getter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "id")
@ToString
public class Perfil {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;

}
