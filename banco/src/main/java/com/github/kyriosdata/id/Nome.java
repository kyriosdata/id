package com.github.kyriosdata.id;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Nome {
    private List<String> nomes;
    private List<String> sobrenomes;
    private List<String> prefixos;
    private boolean preferido;
    private boolean usoCondicional;

    public static class Builder {
        private List<String> nomes = new ArrayList<>();
        private List<String> sobrenomes = new ArrayList<>();
        private List<String> prefixos = new ArrayList<>();
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

        public Builder addPrefixo(final String prefixo) {
            prefixos.add(prefixo);
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
        prefixos = Collections.unmodifiableList(builder.prefixos);
        preferido = builder.preferido;
        usoCondicional = builder.usoCondicional;
    }

    public List<String> getNomes() {
        return nomes;
    }

    public List<String> getSobrenomes() {
        return sobrenomes;
    }

    public List<String> getPrefixos() {
        return prefixos;
    }

    public boolean isPreferido() {
        return preferido;
    }

    public boolean isUsoCondicional() {
        return usoCondicional;
    }
}
