var corrente;
window.onload = function () {
    corrente = document.getElementById('visao-geral');
    corrente.style.display = "block";

    veja('nomes-completo');
    atualizaMunicipios();
    municipiosEndereco();
    nacionalidade();
    paises('paises');
    paises('paises-endereco');
};

function mostre(c) {
    corrente.style.display = "none";
    var exiba = document.getElementById(c);
    exiba.style.display = "block";
    corrente = exiba;
}

function changeToUrl() {
    /* Retira # */
    var goTo = location.hash.substring(1);
    mostre(goTo ? goTo : 'visao-geral');
}

document.addEventListener('DOMContentLoaded', function () {

    // Get all "navbar-burger" elements
    var $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

    // Check if there are any navbar burgers
    if ($navbarBurgers.length > 0) {

        // Add a click event on each of them
        $navbarBurgers.forEach(function ($el) {
            $el.addEventListener('click', function () {

                // Get the target from the "data-target" attribute
                var target = $el.dataset.target;
                var $target = document.getElementById(target);

                // Toggle the class on both the "navbar-burger" and the "navbar-menu"
                $el.classList.toggle('is-active');
                $target.classList.toggle('is-active');

            });
        });
    }

});

function veja(d) {
    /* Exibir a div */
    var elementos = document.getElementsByClassName('parcial');
    var i;
    for (i = 0; i < elementos.length; i++) {
        elementos[i].style.display = 'none';
    }

    var corrente = document.getElementById(d);
    corrente.style.display = 'block';

    /* Atualizar feedback da tab selecionada */
    elementos = document.getElementsByClassName('li-parcial');
    for (i = 0; i < elementos.length; i++) {
        elementos[i].className = 'li-parcial';
    }

    corrente = document.getElementById('li-' + d);
    corrente.className = 'li-parcial is-active';
}

function atualizaMunicipios() {
    var elemento = document.getElementById('estados');
    var estado = elemento.options[elemento.selectedIndex].text;
    var municipioLabel = document.getElementById('municipio-label');
    municipioLabel.textContent = estado + " (municípios)";

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var json = JSON.parse(this.responseText);
            var tamanho = json.length;
            var i;

            /* elimina opções existentes */
            var municipios = document.getElementById('municipios');
            municipios.options.length = 0;

            /* insere municípios do estado selecionado */
            for (i = 0; i < tamanho; i++) {
                var opcao = document.createElement('option');
                var componente = json[i];
                if (componente.estado == estado) {
                    opcao.text = componente.municipio;
                    opcao.value = componente.codigo;
                    municipios.add(opcao, municipios[i]);
                }
            }
        }
    };
    xhttp.open("GET", "js/municipios.json", true);
    xhttp.send();
}

function paises(chave) {
    var elemento = document.getElementById(chave);

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var json = JSON.parse(this.responseText);
            var tamanho = json.length;
            var i;

            /* insere países */
            for (i = 0; i < tamanho; i++) {
                var opcao = document.createElement('option');
                var componente = json[i];
                opcao.text = componente.pais;
                opcao.value = componente.cod;
                elemento.add(opcao, elemento[i]);
            }
        }
    };
    xhttp.open("GET", "js/paises.json", true);
    xhttp.send();
}

function nacionalidade() {
    var db = document.getElementById('db');
    var de = document.getElementById('de');

    var elemento = document.getElementById('brasileira');
    if (elemento.checked) {
        db.style.display = "block";
        de.style.display = "none";
    } else {
        db.style.display = "none";
        de.style.display = "block";
    }
}

function brasilOutro() {
    var brasil = document.getElementById('detalhe-brasil');
    var outro = document.getElementById('detalhe-outro');

    var elemento = document.getElementById('brasil');
    if (elemento.checked) {
        brasil.style.display = "block";
        outro.style.display = "none";
    } else {
        brasil.style.display = "none";
        outro.style.display = "block";
    }
}

function municipiosEndereco() {
    var elemento = document.getElementById('estados-endereco');
    var estado = elemento.options[elemento.selectedIndex].text;

    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var json = JSON.parse(this.responseText);
            var tamanho = json.length;
            var i;

            /* elimina opções existentes */
            var municipios = document.getElementById('municipios-endereco');
            municipios.options.length = 0;

            /* insere municípios do estado selecionado */
            for (i = 0; i < tamanho; i++) {
                var opcao = document.createElement('option');
                var componente = json[i];
                if (componente.estado == estado) {
                    opcao.text = componente.municipio;
                    opcao.value = componente.codigo;
                    municipios.add(opcao, municipios[i]);
                }
            }
        }
    };
    xhttp.open("GET", "js/municipios.json", true);
    xhttp.send();
}

var meios = [
    {
        icone: "fa-phone",
        txt: "Telefone"
    },
    {
        icone: "fa-mobile",
        txt: "Celular"
    },
    {
        icone: "fa-fax",
        txt: "Fax"
    },
    {
        icone: "fa-tablet",
        txt: "Pager"
    },
    {
        icone: "fa-envelope-o",
        txt: "Email"
    },
    {
        icone: "fa-globe",
        txt: "URL"
    },
    {
        icone: "",
        txt: "Outro"
    }
];

function alterna() {
    var meio = document.getElementById('meio');
    if (meio.classList.contains('is-active')) {
        meio.classList.remove('is-active');
    } else {
        meio.classList.add('is-active');
    }
}

function selecione(t) {
    var valor = t.id.substring(1);
    var indice = valor == 8 ? 6 : valor - 1;

    var botaoTxt = document.getElementById('mtexto');
    var texto = meios[indice].txt;

    /* valor padrão da dropdown */
    botaoTxt.innerHTML = texto;

    /* título do campo de texto */
    document.getElementById("com-id").innerHTML = texto;

    var botaoIcone = document.getElementById('micone');
    botaoIcone.className = '';
    botaoIcone.classList.add('fa');
    botaoIcone.classList.add(meios[indice].icone);
    alterna();
}

function nomeChanged() {
    var rotulo = document.getElementById('nome-completo');
    var titulo = document.getElementById('titulo').value;
    var nome = document.getElementById('nome').value;
    var sobrenome = document.getElementById('sobrenome').value;
    var sufixo = document.getElementById('sufixo').value;

    rotulo.innerHTML = titulo + " " + nome + " " + sobrenome + " " + sufixo;
}