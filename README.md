<div align="center">
<h1>RaroVideoWall</h1>
</div>
<p align="center">🚀</p>

## Documentação

* [Documentação](#documentação)
* [Apresentação do projeto](#apresentação-do-projeto)
* [Arquitetura e decisões técnicas](#arquitetura-e-decisões-técnicas)
* [Classes gerais](#classes-gerais)
    * [ApiService e DioService](#apiservice-e-dioservice)
    * [LocalStorageService e SharedPreferencesService](#localstorageservice-e-sharedpreferencesservice)
    * [LoggedState](#loggedState)
    * [VideoState](#videoState)
    * [Models](#models)
    * [Repositories](#repositories)
    * [Controllers](#controllers)
* [Status do Projeto](#status-do-projeto)
* [Features](#features)
* [Desafios para o futuro](#desafios-para-o-futuro)
* [Referências](#referncias)
* [Pré-requisitos](#pr-requisitos)
* [Rodando o app](#-rodando-o-app)
* [Agradecimentos](#-agradecimentos)
* [Desenvolvedores](#desenvolvedores)

## Apresentação do projeto

<div style="text-align: justify">
A aplicação foi desenvolvida para cumprir o desafio final do curso de Flutter da Raro Academy - 2ª Edição - e tem o propósito principal de entregar para os alunos da academy uma melhor solução para a visualização dos conteúdos vistos em aulas síncronas que ficam disponíveis para acessos posteriores.

Atualmente os vídeos podem ser acessados por meio de um link disponibilizado para os alunos em uma planilha. Nesse sentido foi idealizado o portal de vídeos da raro academy para não só disponibilizar os vídeos de forma mais prática, mas também possibilitando uma maior interação entre os alunos das turmas.
</div>

## Arquitetura e decisões técnicas
<div style="text-align: justify">

Para a organização da estrutura do projeto, foi utilizado o padrão **MVC**, que facilita a comunicação entre as camadas envolvidas, designando responsabilidades separadas para cada uma. A escolha de uma arquitetura consistente auxilia a mantenabilidade do código.

Adotamos também um padrão de **design atômico** para reaproveitar o código da melhor forma possível, compenentizando itens com o objetivo de deixar o código bem enxuto e de fácil entendimento.

A comunicação com a API disponibilizada para nossa aplicação foi feita através da biblioca **DIO**.

Para realizar o gerenciamento de estados em toda a aplicação foi utilizado o **MobX** que se baseia nos conceitos de programação reativa.

Foi utilizado o **Modular** para todo o fluxo de navegação das páginas da aplicação e também para auxiliar na injeção de dependências,
promovendo o desacoplamento das classes da aplicação e permitindo que as classes dependam das suas abstrações. A separação dos módulos se deu assim:

- Home_module:
  - features: Home + Details
- Login_module:
  - features: Login + Recuperar Senha + Registro
- Splash_module:
  - features: Splash page
</div>

## Classes gerais
<div style="text-align: justify">
Estão na pasta Shared e são usados em um ou mais módulos
</div>

### ApiService e DioService
<div style="text-align: justify">
Para o uso da API deve ser recuperada através de Modular.get(). Essa API é uma interface que
representa todos os métodos http. A url é apenas o caminho adicional depois da url base da API. O
parâmetro body representa o campo de dados de uma requisição Http. Além disso é necessário passar o
método HTTP a ser usado na requisição. O campo queryParams é usado para pesquisar parâmetros via
rota. Ele é traduzido para 'nameParam?= value'.

A classe DioService é a classe que implementa de fato as requisições HTTP para a API. Ela mantém a
URL base da API e implementa a primeira tratativa de erro que lança uma exceção de um objeto
Failure.
</div>

### LocalStorageService e StorageService
<div style="text-align: justify">
A classe LocalStorageService é uma interface e a StorageService a sua implementação. Essa
feature é usada para guardar os dados de acesso da página de login na memória interna do
dispositivo evitando a reentrada no aplicativo. Também é usada para salvar os o histórico dos vídeos.
</div>

### LoggedState
<div style="text-align: justify">
Essa classe controla o estado global da aplicação. Ela é única por todo o código (Singleton)    e
serve para guardar o estado e verificar se existe ou não um usuário logado.
</div>

### VideoState
<div style="text-align: justify">
Essa classse mantem o estado da lista de vídeos carregada no aplicativo. Ela permite que outras
páginas consigam atualizar os vídeos da página principal, por isso ela é fornecida no módulo
principal. Espera-se que sempre que a lista de vídeos for buscada da API o estado dessa classe seja
atualizado.
</div>

### Models
<div style="text-align: justify">
Implementa os modelos retornados pelas requisições da API. Os modelos implementados são:

- LoginUserModel → usado para traduzir o modelo do login do usuário, usado para gravação no banco
local,
- UserModel → representa as informações de um usuário logado retornado pela API,
- RegisterUserModel → representa as informações do usuário que serão enviadas para API,
- RecoverPasswordModel → representa as informações de alteração de senha que serão enviadas para API,
- VideoModel → representa as informações dos vídeos retornados pela API,
- CommentModel → implementa as informações dos comentários de um vídeo.
- PlayListContentModel → representa as informações da playlist dos vídeos.
- RequestCodeModel → representa o modelo que possibilita a solicitação de um código pra resgatar a senha.
- FailureModel → implementa o modelo de falha usado em todo o sistema.
</div>

### Repositories
<div style="text-align: justify">
Os repositórios implementam as particularidades das rotas fornecidas pela API. Os repositórios
implementados são:

- Login_repository: implementa as rotas usadas para login, recuperação de senha e cadastros. Essa
  classe é responsável por atualizar o estado de logado ou não na aplicação.
- videos_repository: implementa as rotas para buscar vídeos, buscar vídeos favoritos, favoritar um vídeo e buscar os
  vídeos recomendados.
- local_storage_user_repository: implementa as funcionalidades de salvar, recuperar e apagar a senha e email de um repositório
- comment_repository: implementa as rotas usadas para tratar os comentários.
- local_storage_video_repository: implementa as funcionalidades de salvar, recuperar e apagar os videos de um repositório
- comment_repository: implementa as rotas usadas para tratar os comentários.

Todos os repositórios possuem tratamento de exceções das requisições e possuem retorno de dois tipos
com o caso de erro (Failure) e o caso de sucesso.
</div>

### Controllers
<div style="text-align: justify">

- splash_controller: Com apenas uma função é responsável por verificar se ja existe informações de login salvas no aplicativo e se é possível fazer o login ou deve carregar os videos publicos. Todos as informações necessárias para a home_page são carregadas aqui, inclusive o histórico dos últimos vídeos acessados.
- login_controller: Essa classe controla os estados da tela para saber se trata de sucesso ou falha e além disso é responsável também pela validação das informações inseridas pelo usuário para realizar login e se tudo estiver ok efetuar o login de fato. Implementamos também a possibilidade de marcar um checkbox para o usuário permitir que as informações de login sejam salvas localmente e não seja necessário efetuar o login toda vez que entrar no app.
- recover_password_controller: Essa classe controla os estados da tela para saber se trata de sucesso ou falha, também avalia se os dados informados estão em conformidade com a API e se tudo estiver ok possibilita que o usuário faça a alteração da sua senha.
- register_controller: Essa classe controla os estados da tela para saber se trata de sucesso ou falha e além disso é responsável também pela validação das informações inseridas pelo usuário para realizar o cadastro de um novo aluno, caso os dados passem pelas validações deste controlador, um novo usuário será informado na API.
- home_controller: Essa classe controla os estados da home page (Sucesso, Carregando e Falha) e é responsável por criar as playlists de vídeos necessárias para a home page. Além disso ela fornece também as informações dos vídeos carregados e se o usuário está logado ou não. É através deste controlador que também podemos acessar o caminho para a página de login e para a página de detalhes. Por fim, a home page monitora o fluxo de login, caso o usuário realize o login para que os vídeos sejam atualizados.
- comments_controller: Essa é a classe que gerencia os estados e permite todas as interações com os comentários feitos nos vídeos. É através desse controlador que são implementadas as funções de visualizar, postar, editar e excluir comentários, além de permitir também as interações de upvote e downvote.
- video_controller: Essa classe é responsável por buscar vídeos pelo ID, além de trazer as listas de vídeos recomendados e vídeos favoritados. É responsável também por fazer uma validação da origem da url do vídeo para fazer tratamento diferenciado dos vídeos do youtube.
- details_controller: Esse controlador é responsável por mostrar ao usuário as informações necessárias para edição e deleção dos comentários.
</div>

## Status do Projeto

<h3 align="center">
🚧  Raro Video Wall - Versão entregue  🚧
</h3>

## Features

- [X] Cadastro do usuário
- [X] Login de um usuário cadastrado
- [X] Função lembrar de mim
- [X] Recuperar a senha de um usuário
- [X] Visualizar vídeos no formato de playlists
- [X] Seleção específica de uma playlist
- [X] Registro do histórico do acesso de vídeos
- [X] Recarregamento com swipe
- [X] Favoritar vídeos
- [X] Comentar vídeos
- [X] Editar um comentário
- [X] Deletar o próprio comentário
- [X] Votar nos comentários
- [X] Card informativo mostrando como realizar a edição

## Desafios para o futuro

- [ ] Possibilitar que o usuário escolha o modo escuro
- [ ] Permitir avaliação dos vídeos
- [ ] Aumentar a cobertura de testes
- [ ] Aperfeiçoamento visual


## Referências
<div style="text-align: justify">
Nos inspiramos em aplicativos bastante consolidados no mercado, como YouTube, Netflix, Instagram, para tomar decisões relacionadas ao layout e toda a identidade visual da nossa aplicação está de acordo com a paleta de cores da Raro Academy.
</div>

## Pré-requisitos
<div style="text-align: justify">
Antes de começar, você vai precisar ter instalado em sua máquina as seguintes ferramentas:

[Git](https://git-scm.com),
[Flutter](https://flutter.dev/),
[Dart](https://dart.dev/).
Além disto é bom ter um editor para
trabalhar com o código como [VSCode](https://code.visualstudio.com/).
</div>

## 🎲 Rodando o app

```bash
# Clone este repositório
$ git clone <https://gitlab.com/marcos-willian/raroviewowall>

# Acesse a pasta do projeto no terminal/cmd
$ cd raroviewowall

# Instale as dependências
$ flutter pub get

#Abrir o projeto no seu editor de preferência.

```
## 😇🙏 Agradecimentos

<div style="text-align: justify">

- À Raro Academy, na pessoa de Júlia Febraro, pela oportunidade de ingressar no curso e por todo o suporte entregue desde a inscrição até a entrega deste projeto.
- Ao Lucas Vini por ter estado presente em toda nossa trajetória e ter tornado nossos dias mais leves, escolhendo sempre a melhor trilha sonora kkkkkkk.
- Aos nossos professores, Roberto Foureaux, Marco Fernandes, Cristian Castro, por todo o ensinamento repassado nessas semanas.
- Aos nossos monitores, Kaio Costa e Gustavo Silva, por terem amenizado nosso sofrimento em todas as monitorias e durante as aulas.

</div>

## Desenvolvedores

<table>
  <tr>
    <td align="center">
      <a href="https://gitlab.com/ericarodrigs">
        <img src="https://gitlab.com/uploads/-/system/user/avatar/11989907/avatar.png?width=400" width=60 style="border-radius:100px" alt="Erica Rodrigues"/>
        <br /><sub><b>Érica Rodrigues</b></sub>   
      </a>
    </td>
    <td align="center">
      <a href="https://gitlab.com/Ventura_">
       <img src="https://gitlab.com/uploads/-/system/user/avatar/11998855/avatar.png?width=400" width=60 style="border-radius:100px" alt="Estevão Boaventura"/>
       <br /><sub><b>Estevão Boaventura</b></sub>   
      </a>
    </td>
    <td align="center">
      <a href="https://gitlab.com/guilhermegomes1">
        <img src="https://secure.gravatar.com/avatar/c9218f5ea630bbabc41f6352f5eb26c0?s=800&d=identicon" width=60 style="border-radius:100px" alt="Guilherme Gomes"/>
        <br /><sub><b>Guilherme Gomes</b></sub>
      </a>
    </td>
    <td align="center">
      <a href="https://gitlab.com/marcos-willian">
          <img src="https://secure.gravatar.com/avatar/8971654f42c31cdd671ac3aa6fd25b53?s=800&d=identicon" width=60 style="border-radius:100px" alt="Marcos Willian"/>
          <br /><sub><b>Marcos Willian</b></sub>  
      </a>
    </td>
    <td align="center">
      <a href="https://gitlab.com/victaoforce">
        <img src="https://secure.gravatar.com/avatar/dae7dccaa4cfb6938b63aecb152bdf97?s=800&d=identicon" width=60 style="border-radius:100px" alt="Victor Capanema"/>
        <br /><sub><b>Victor Capanema</b></sub>
      </a>
    </td>
  </tr>
</table>