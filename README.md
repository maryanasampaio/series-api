# API de Séries da Mary
Criei uma API de séries que lista séries fictícias e usuários ficticios que possuem séries favoritas.

## Como instalar o projeto
- Você precisará do dart instalado em sua máquina :0


- Clone o repositório em seu computador
- Após clonar o repositório você deve rodar os seguintes comandos:

`dart pub add shelf` e `dart pub add shelf_router`

Após rodar esses comandos, entre na pasta bin do projeto e rode o seguinte comando:
`dart servidor.dart`

Após rodar você verá que o projeto foi iniciado na url `http://localhost:8080`

Você pode modificar isso editando o arquivo servidor.dart com o ip e a porta desejado.

Os Endpoints disponíveis no projeto são:

- http://localhost:8080/series
- http://localhost:8080/serie/id_da_serie
- http://localhost:8080/usuarios
- http://localhost:8080/usuario/id_do_usuario

Os ids das séries vão de 1 à 50 e as séries também :)

Faça bom uso.


### O que eu preciso fazer:
- Criar um servidor
- Criar uma classe de séries

- Criar um método para ler um arquivo chamado "**lista_filmes**" e retornar uma **String** com todos os filmes

- Criar um método para transformar essa **String** "**lista_filmes**" em uma **List** (usando **split('\n')**) e retorne um array com todos os filmes

- Crie um método que retorne um **Map** de uma Série **ESPECÍFICA** pelo **INDICE** no seguinte formato:

exemplo: ``pegaSerie(10)``

**Retorno:**
```
Map {
    name: Nome da Série
    airing: Data do Lançamento da Série no Formato "Dia/Mês/Ano"
    views: Quantidade de Views da Série
    streaming: Nome da Plataforma de Streaming
}
```

- Crie um método que pegue a série mais assistida de todas

---

Criar uma rota/endpoint no servidor chamada "**serie**" que aceita o parâmetro **id** e retorna a **série específica**

*OBS: o id representa o índice da série na lista :)*

Exemplo: ``http://localhost/serie/1``

E essa rota/endpoint deve retornar um JSON com o seguinte formato:
```
{
    name: Nome da Série
    airing: Data do Lançamento da Série no Formato "Dia/Mês/Ano"
    views: Quantidade de Views da Série
    streaming: Nome da Plataforma de Streaming
}
```

Criar uma rota/endpoint no servidor chamada "**most-viewed**" que **retorna a série mais assistida de todas**

Exemplo: ```http://localhost/most-viewed/```

E essa rota/endpoint deve retornar um JSON com o seguinte formato:
```
{
    name: Nome da Série
    airing: Data do Lançamento da Série no Formato "Dia/Mês/Ano"
    views: Quantidade de Views da Série
    streaming: Nome da Plataforma de Streaming
}
```

Criar uma rota/endpoint no servidor chamada "**series**" que **retorna todas as séries**

Exemplo: ```http://localhost/series/```

E essa rota/endpoint deve retornar um JSON com o seguinte formato:
```
[
    {
        name: Nome da Série
        airing: Data do Lançamento da Série no Formato "Dia/Mês/Ano"
        views: Quantidade de Views da Série
        streaming: Nome da Plataforma de Streaming
    },
    {
        name: Nome da Série
        airing: Data do Lançamento da Série no Formato "Dia/Mês/Ano"
        views: Quantidade de Views da Série
        streaming: Nome da Plataforma de Streaming
    },
    {
        name: Nome da Série
        airing: Data do Lançamento da Série no Formato "Dia/Mês/Ano"
        views: Quantidade de Views da Série
        streaming: Nome da Plataforma de Streaming
    }
]
```
# Classe de Usuários
 - Crie uma classe de Usuário

 - Crie uma rota/endpoint que retorne um usuário pelo ID (O ID é o indice do usuário na lista de usuários)
Exemplo da rota/endpoint ``http://localost/usuario/1``

<b>Regras</b>
 - Cada gênero deve estar com a primeira letra em maiusculo.
 - Cada indice de série favorita do usuário deve retornar um MAP da série especifica na lista de séries

No exemplo abaixo temos o seguinte usuário:
```Fernanda Ramos;1989-06-25;ação,aventura;21,22,29```

Ela nasceu em 1989 então tem 34 anos   
Ela curte ação e aventura    
E as séries 21, 22 e 29 respectivamente na lista de séries    
representam as séries "Nexus Nova", "Expedição ao Eclipse" e "Época Encantada"     

O Json esperado ao acessar     
```http://localhost:8080/usuario/24```     
É o seguinte:    
 
```
{
    name: Fernanda Ramos
    age: 34
    genres: [
        "Ação",
        "Aventura"
    ],
    series: [
        {
            "nome": "Nexus Nova",
            "airing": "2012-04-03",
            "views": "110000000",
            "streaming": "Netflix"
        },
        {
            "nome": "Expedição ao Eclipse",
            "airing": "2017-09-28",
            "views": "55000000",
            "streaming": "Amazon Prime Video"
        },
        {
            "nome": "Época Encantada",
            "airing": "2003-10-09",
            "views": "80000000",
            "streaming": "HBO"
        }
    ]
}
```

---
 - Crie uma rota/endpoint chamado ```usuarios```
Exemplo: ```http://localhost/usuarios/```

Este rota/endpoint deverá retornar um json com todos os usuários no formato de json de um usuário único, exemplo:
```
[
    {
        name: Fernanda Ramos
        age: 34
        genres: [
            "Ação",
            "Aventura"
        ],
        series: [
            {
            	"nome": "Nexus Nova",
            	"airing": "2012-04-03",
            	"views": "110000000",
            	"streaming": "Netflix"
            },
            {
            	"nome": "Expedição ao Eclipse",
            	"airing": "2017-09-28",
            	"views": "55000000",
            	"streaming": "Amazon Prime Video"
            },
            {
            	"nome": "Época Encantada",
            	"airing": "2003-10-09",
            	"views": "80000000",
            	"streaming": "HBO"
            }
        ]
    },
    {
        name: Fernanda Ramos
        age: 34
        genres: [
            "Ação",
            "Aventura"
        ],
        series: [
            {
            	"nome": "Nexus Nova",
            	"airing": "2012-04-03",
            	"views": "110000000",
            	"streaming": "Netflix"
            },
            {
            	"nome": "Expedição ao Eclipse",
            	"airing": "2017-09-28",
            	"views": "55000000",
            	"streaming": "Amazon Prime Video"
            },
            {
            	"nome": "Época Encantada",
            	"airing": "2003-10-09",
            	"views": "80000000",
            	"streaming": "HBO"
            }
        ]
    }
]