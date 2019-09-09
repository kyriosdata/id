/**
 * Copyright 2019
 * Fábio Nogueira de Lucena
 * Fábrica de Software (Instituto de Informática)
 * Universidade Federal de Goiás
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * <p>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.github.kyriosdata.id;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Nome {
    private List<String> nomes;
    private List<String> sobrenomes;
    private List<String> titulos;
    private List<String> sufixos;
    private boolean preferido;
    private boolean usoCondicional;

    public static class Builder {
        private List<String> nomes = new ArrayList<>();
        private List<String> sobrenomes = new ArrayList<>();
        private List<String> titulos = new ArrayList<>();
        private List<String> sufixos = new ArrayList<>();
        private boolean preferido = true;
        private boolean usoCondicional = false;

        public Builder(final String nome) {
            nomes.add(nome);
        }

        public Builder addNome(final String nome) {
            nomes.add(nome);
            return this;
        }

        public Builder addSobrenome(final String sobrenome) {
            sobrenomes.add(sobrenome);
            return this;
        }

        public Builder addSufixo(final String prefixo) {
            sufixos.add(prefixo);
            return this;
        }

        public Builder addTitulo(final String titulo) {
            titulos.add(titulo);
            return this;
        }

        public Builder preferido(final boolean preferido) {
            this.preferido = preferido;
            return this;
        }

        public Builder usoCondicional(final boolean uso) {
            usoCondicional = uso;
            return this;
        }

        public Nome build() {
            return new Nome(this);
        }
    }

    private Nome(Builder builder) {
        nomes = Collections.unmodifiableList(builder.nomes);
        sobrenomes = Collections.unmodifiableList(builder.sobrenomes);
        titulos = Collections.unmodifiableList(builder.titulos);
        sufixos = Collections.unmodifiableList(builder.sufixos);
        preferido = builder.preferido;
        usoCondicional = builder.usoCondicional;
    }

    public List<String> getNomes() {
        return nomes;
    }

    public List<String> getSobrenomes() {
        return sobrenomes;
    }

    public List<String> getTitulos() {
        return titulos;
    }

    public List<String> getSufixos() {
        return sufixos;
    }

    public boolean isPreferido() {
        return preferido;
    }

    public boolean isUsoCondicional() {
        return usoCondicional;
    }

    @Override
    public String toString() {
        final String parcial = String.join(" ",
                une(titulos), une(nomes), une(sobrenomes), une(sufixos));

        // Remove espaços caso não haja título, sobrenomes e/ou sufixos
        return parcial.trim().replaceAll(" +", " ");
    }

    private String une(List<String> lista) {
        return String.join(" ", lista);
    }
}
