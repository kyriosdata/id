package com.github.kyriosdata.id;

import java.util.List;

public class Nome {
    private List<String> nomes;
    private List<String> sobrenomes;
    private List<String> prefixos;
    private boolean preferido;
    private boolean usoCondicional;

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
