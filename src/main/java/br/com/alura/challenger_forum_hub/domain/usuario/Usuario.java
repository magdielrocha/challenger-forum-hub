package br.com.alura.challenger_forum_hub.domain.usuario;

import br.com.alura.challenger_forum_hub.domain.topico.Resposta;
import br.com.alura.challenger_forum_hub.domain.topico.Topico;
import jakarta.persistence.*;
import lombok.*;

import java.util.List;
import java.util.Set;

@Entity(name = "Usuario")
@Table(name = "usuario")
@Getter
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(of = "id")
@ToString(exclude = "perfis")
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nome;

    private String email;

    private String senha;

    @ManyToMany
    @JoinTable(
            name = "usuario_perfil",
            joinColumns = @JoinColumn(name = "usuario_id"),
            inverseJoinColumns = @JoinColumn(name = "perfil_id")
    )
    private Set<Perfil> perfis;

    @OneToMany(mappedby = "autor", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Topico> topicos;

    @OneToMany(mappedby = "autor", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Resposta> respostas;
}
