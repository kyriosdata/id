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

/**
 * O nome de um indivíduo assistido. O nome é formado pela concatenação dos
 * títulos, primeiros nomes, sobrenomes e sufixos. Por exemplo, "Sr. João da
 * Silva Júnior" é o nome completo formado por um único título ("Sr."), um
 * único primeiro nome ("João"), dois sobrenomes ("da Silva") e um sufixo
 * ("Júnior").
 *
 * <p>Observe que títulos e sufixos não são obrigatórios.</p>
 */
public class Nome {

    /**
     * Primeiros nomes do nome.
     */
    private List<String> nomes;

    /**
     * Sobrenomes do nome.
     */
    private List<String> sobrenomes;

    /**
     * Títulos do nome.
     */
    private List<String> titulos;

    /**
     * Sufixos empregados pelo nome.
     */
    private List<String> sufixos;

    /**
     * Indica se o nome é o preferido, ou não.
     */
    private boolean preferido;

    /**
     * Indica se o uso do nome é condicional.
     */
    private boolean usoCondicional;

    /**
     * Classe empregada para construir uma instância (immutable) da classe
     * {@link Nome}.
     */
    public static class Builder {
        private List<String> nomes = new ArrayList<>();
        private List<String> sobrenomes = new ArrayList<>();
        private List<String> titulos = new ArrayList<>();
        private List<String> sufixos = new ArrayList<>();
        private boolean preferido = true;
        private boolean usoCondicional = false;

        /**
         * Ter um primeiro nome é obrigatório.
         *
         * @param nome O primeiro nome do nome.
         */
        public Builder(final String nome) {
            nomes.add(nome);
        }

        /**
         * Adiciona nome fornecido à lista de primeiros nomes.
         *
         * @param nome O primeiro nome a ser acrescentado à lista de
         *             primeiros nomes.
         * @return Instância que permite criação de nome já com o primeiro
         * nome fornecido acrescido à lista de primeiros nomes.
         */
        public Builder addNome(final String nome) {
            nomes.add(nome);
            return this;
        }

        /**
         * Adiciona sobrenome fornecido à lista de sobrenomes.
         *
         * @param sobrenome O sobrenome a ser acrescentado à lista de
         *                  sobrenomes.
         * @return Instância que permite criação de nome já com o sobrenome
         * fornecido acrescido à lista de sobrenomes.
         */
        public Builder addSobrenome(final String sobrenome) {
            sobrenomes.add(sobrenome);
            return this;
        }

        /**
         * Adiciona sufixo fornecido à lista de sufixos.
         *
         * @param sufixo O sufixo a ser acrescentado à lista de
         *               sufixos.
         * @return Instância que permite criação de nome já com o sufixo
         * fornecido acrescido à lista de sufixos.
         */
        public Builder addSufixo(final String sufixo) {
            sufixos.add(sufixo);
            return this;
        }

        /**
         * Adiciona título fornecido à lista de títulos.
         *
         * @param titulo O título a ser acrescentado à lista de
         *               títulos.
         * @return Instância que permite criação de nome já com o título
         * fornecido acrescido à lista de títulos.
         */
        public Builder addTitulo(final String titulo) {
            titulos.add(titulo);
            return this;
        }

        /**
         * Define se o nome em construção é preferido.
         *
         * @param preferido O valor {@code true} se o nome que está sendo
         *                  construído é o nome preferido do indivíduo.
         * @return Instância que permite criação de nome já com a indicação
         * se o nome que está sendo construído é preferido ou não.
         */
        public Builder preferido(final boolean preferido) {
            this.preferido = preferido;
            return this;
        }

        /**
         * Define se o nome em construção é para ser usdado condicionalmente.
         *
         * @param uso O valor {@code true} se o nome que está sendo
         *            construído deve ser usado condicionalmente.
         * @return Instância que permite criação de nome já com a indicação
         * se o nome que está sendo construído deve ser usado
         * condicionalmente ou não.
         */
        public Builder usoCondicional(final boolean uso) {
            usoCondicional = uso;
            return this;
        }

        /**
         * Cria uma instância da classe {@link Nome} conforme os parâmetros
         * fornecidos.
         *
         * @return Uma instância da classe {@link Nome} conforme os
         * parâmetros fornecidos.
         */
        public Nome build() {
            return new Nome(this);
        }
    }

    /**
     * Construtor PRIVADO que faz uso de objeto da classe {@link Builder}.
     *
     * @param builder Objeto contendo valores a partir dos quais a instância
     *                da classe {@link Nome} será criada.
     */
    private Nome(Builder builder) {
        nomes = Collections.unmodifiableList(builder.nomes);
        sobrenomes = Collections.unmodifiableList(builder.sobrenomes);
        titulos = Collections.unmodifiableList(builder.titulos);
        sufixos = Collections.unmodifiableList(builder.sufixos);
        preferido = builder.preferido;
        usoCondicional = builder.usoCondicional;
    }

    /**
     * Recupera a lista de primeiros nomes do nome.
     *
     * @return A lista de primeiros nomes do nome.
     */
    public List<String> getNomes() {
        return nomes;
    }

    /**
     * Recupera a lista de sobrenomes do nome.
     *
     * @return A lista de sobrenomes do nome.
     */
    public List<String> getSobrenomes() {
        return sobrenomes;
    }

    /**
     * Recupera a lista de títulos do nome.
     *
     * @return A lista de títulos do nome.
     */
    public List<String> getTitulos() {
        return titulos;
    }

    /**
     * Recupera a lista de sufixos do nome.
     *
     * @return A lista de sufixos do nome.
     */
    public List<String> getSufixos() {
        return sufixos;
    }

    /**
     * Recupera a indicação se o nome é preferido.
     *
     * @return {@code true} se e somente se o nome é preferido.
     */
    public boolean isPreferido() {
        return preferido;
    }

    /**
     * Recupera a indicação se o nome deve ser usado condicionalmente.
     *
     * @return {@code true} se e somente se o nome só pode ser usado
     * condicionalmente.
     */
    public boolean isUsoCondicional() {
        return usoCondicional;
    }

    /**
     * Produz o nome completo.
     * @return O nome completo.
     */
    @Override
    public String toString() {
        final String parcial = String.join(" ",
                une(titulos), une(nomes), une(sobrenomes), une(sufixos));

        // Remove espaços caso não haja título, sobrenomes e/ou sufixos
        return parcial.trim().replaceAll(" +", " ");
    }

    /**
     * Concatena as sequências fornecidas na lista.
     *
     * @param lista A lista de sequências a serem concatenadas.
     *
     * @return A sequência de caracteres formada pela união das sequências
     * contidas na lista separadas por espaço em branco.
     */
    private String une(List<String> lista) {
        return String.join(" ", lista);
    }
}
