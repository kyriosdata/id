/**
 *    Copyright 2019
 *    Fábio Nogueira de Lucena
 *    Fábrica de Software (Instituto de Informática)
 *    Universidade Federal de Goiás
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 */

package com.github.kyriosdata.id;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertThrows;

class NomeTest {

    @Test
    void builderCasoTrivial() {
        Nome.Builder builder = new Nome.Builder("Pedro")
                .addSufixo("Júnior");
        assertEquals("Pedro Júnior", builder.build().toString());
    }

    @Test
    void verificaBuilder() {
        Nome.Builder builder = new Nome.Builder("João");
        Nome nome = builder
                .addNome("Pedro")
                .addNome("Alcântara")
                .addNome("Machado")
                .addSobrenome("da")
                .addSobrenome("Silva")
                .addSufixo("Júnior")
                .addTitulo("Professor")
                .addTitulo("Doutor")
                .build();

        final String titulos = "Professor Doutor";
        final String completo = "João Pedro Alcântara Machado da Silva Júnior";
        final String full = String.join(" ", titulos, completo);
        assertEquals(full, nome.toString());
    }

    @Test
    void nomesImmutable() {
        Nome.Builder builder = new Nome.Builder("Davi");
        Nome nome = builder.build();

        // Não há como adicionar
        assertThrows(UnsupportedOperationException.class, () ->
                nome.getNomes().add("teste"));

        // Não há como remover
        assertThrows(UnsupportedOperationException.class, () ->
                nome.getNomes().remove(0));
    }

    @Test
    void usoCondicionalFalsePorPadrao() {
        Nome.Builder builder = new Nome.Builder("Davi");
        Nome nome = builder.build();

        assertFalse(nome.isUsoCondicional());
    }
}
