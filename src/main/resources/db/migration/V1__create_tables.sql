-- ==========================
-- TABELA USUÁRIO
-- Armazena informações dos usuários do sistema
-- ==========================
CREATE TABLE usuario
(
    id    BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome  VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE, -- cada usuário deve ter email único
    senha VARCHAR(255) NOT NULL
);

-- ==========================
-- TABELA PERFIL
-- Define perfis/roles de acesso do usuário
-- ==========================
CREATE TABLE perfil
(
    id   BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE -- ex: ADMIN, ALUNO, INSTRUTOR
);

-- ==========================
-- TABELA DE RELACIONAMENTO N:N USUÁRIO <-> PERFIL
-- Um usuário pode ter múltiplos perfis e cada perfil pode pertencer a vários usuários
-- ==========================
CREATE TABLE usuario_perfil
(
    usuario_id BIGINT NOT NULL,
    perfil_id  BIGINT NOT NULL,
    PRIMARY KEY (usuario_id, perfil_id),
    CONSTRAINT fk_usuario_perfil_usuario FOREIGN KEY (usuario_id) REFERENCES usuario (id),
    CONSTRAINT fk_usuario_perfil_perfil FOREIGN KEY (perfil_id) REFERENCES perfil (id)
);

-- ==========================
-- TABELA CURSO
-- Armazena cursos disponíveis no sistema
-- ==========================
CREATE TABLE curso
(
    id        BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome      VARCHAR(255) NOT NULL,
    categoria VARCHAR(100) NOT NULL -- ex: Programação, Marketing, Design
);

-- ==========================
-- TABELA TÓPICO
-- Discussões ou tópicos dentro de um curso
-- ==========================
CREATE TABLE topico
(
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    titulo       VARCHAR(255) NOT NULL,
    mensagem     TEXT         NOT NULL,
    data_criacao TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP, -- data de criação automática
    status       VARCHAR(50)  NOT NULL,                           -- ex: ABERTO, FECHADO
    autor_id     BIGINT       NOT NULL,
    curso_id     BIGINT       NOT NULL,
    CONSTRAINT fk_topico_usuario FOREIGN KEY (autor_id) REFERENCES usuario (id),
    CONSTRAINT fk_topico_curso FOREIGN KEY (curso_id) REFERENCES curso (id)
);

-- ==========================
-- TABELA RESPOSTA
-- Respostas dos usuários para os tópicos
-- ==========================
CREATE TABLE resposta
(
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    mensagem     TEXT      NOT NULL,
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    solucao      BOOLEAN            DEFAULT FALSE, -- indica se a resposta resolveu o tópico
    autor_id     BIGINT    NOT NULL,
    topico_id    BIGINT    NOT NULL,
    CONSTRAINT fk_resposta_usuario FOREIGN KEY (autor_id) REFERENCES usuario (id),
    CONSTRAINT fk_resposta_topico FOREIGN KEY (topico_id) REFERENCES topico (id)
);
