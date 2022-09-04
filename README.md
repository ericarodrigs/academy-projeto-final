<div align="center">
<h1>RaroVideoWall</h1>
</div>
<p align="center">🚀</p>

## Documentação

* [Documentação](#-documentação)
* [Arquitetura](#-arquitetura)
* [Classes gerais](#-classes-gerais)
    * [ApiService e DioService](#-apiService-e-dioService)
    * [LocalStorageService e SharedPreferencesService](#-localStorageService-e-sharedPreferencesService)
    * [LoggedState](#-loggedState)
    * [VideoState](#-videoState)
    * [Models](#-models)
    * [Repositories](#-repositories)
    * [Controllers](#-controllers)
* [Tecnologias](#-tecnologias)
* [Status do Projeto](#-status-do-projeto)
* [Features](#-features)
* [Pré-requisitos](#-pre-requisitos)
* [Rodando o app](#-rodando-o-app)
* [Tests](#-testes)
* [Desenvolvedores](#-desenvolvedores)

## Arquitetura

MVC, juntamente com design Atômico

Serviço de comunicação Dio service

Estrutura modular Separação de módulos:
-home_modules - features: Home + details -login_module:

- features: login + recuperar + registro -splash_module:
- features: splash

Gerenciamento de estados Usa mobx com code gen

## Classes gerais

Estão na pasta Shared e são usados em um ou mais modulos

### ApiService e DioService

Para o uso da api deve ser recuperada através de Modular.get(). Essa api é uma interface que
representa todos os métodos http. A url é apenas o caminho adicional depois da url base da api. O
parâmetro body representa o capo de dados de uma requisição Http. Além disso é necessário passar o
método HTTP a ser usado na requisição. O campo queryParams é usado para pesquisar parâmetros via
rota. Ele é traduzido para 'nameParam?= value'.

A classe DioService é a classe que implementa de fato as requisições HTTP para a api. Ela mantem a
URL base da API e implementa a primeira tratativa de erro que lança uma exceção de um objeto
Failure.

### LocalStorageService e SharedPreferencesService

A classe LocalStorageService é uma interface e a SharedPreferencesService a sua implementação. Essa
feature será usada para guardar os dados de acesso da página de login na memoria interna do
dispositivo evitando a reentrada no aplicativo.

### LoggedState

Essa classe controla o estado globa da aplicação. Ela é única por todo o código (Singleton)    e
serve para guardar o estado se existe ou não um usuário logado.

### VideoState

Essa classse mantem o estado da lista de videos carregada no aplicativo. Ela permite que outras
paginas consigam atualizar os videos da pagina principal, por isso ela éfornecida no modulo
principal. Espera-se que sempre que a lista de videos é buscada da API o estado dessa classe seja
atualizado.

### Models

Implementa os modelos retornados pelas requisições da api. Os modelos implementados são:
LoginUserModel -> usado para traduzir o modelo do login do usuário, usado para gravação no banco
local, UserModel representa as informações de um usuário logado retornado pela API, VideoModel ->
Representa as informações dos videos retornado pela API. Além disso No modulo home existe o modelo
CommentModel que implementa as informações dos comentários de um video. Por fim o failure implementa
o modelo de falha usado em todo o sistema.

### Repositories

Os repositorios implementam as particularidades das rotas fornecidas pela API. Os repositorios
implementados são:

- Login_repository: implementa as rotas usadas para login, recuperação de senha e cadastros. Essa
  classe é responsável por atualizar o estado de logado ou não na aplicação. - Videos_repository:
  implementa as rotas para pegar videos, pegar videos favoritos, favoritar um video e pegar os
  videos recomendados para um video. - local_storage_user_repository: implementa as funcionalidades
  de salvar, recuperar e apagar a senha e email de um repositorio - comment_repository: implementas
  as rotas usadas para tratar de comentários.

Todos os repositorios possuem tratamento de exceções das requisições e possuem retorno de dois tipos
com o caso de erro (Failure) e o caso de sucesso.

### Controllers

	- splash_controller: Com a penas uma função é responsável por verificar se ja existe informações de login salvas no aplicativo e se é possível fazer o login ou deve carregar os videos publicos. Todos as informações necessárias para a home_page são carregadas aqui. (Os videos são carregados na classe video_state)
	- home_controller: Essa classe controla os estados da home page (Sucesso, carregando e falha) além disso ela é responsável por criar as play list de videos necessária da home page. Além disso ela fornece as informações dos videos carregados e se o usuário está logado ou não. Além disso ela fornece o caminho para o login e para a pagina de detalhes. Por fim, a home page monitora o fluxo de login, caso o usuário realize o login os videos são atualizados.
	- login_controller:
	- recover_controller:
	- register_controller:
	- detail_controller:

## Tecnologias

## Status do Projeto

<h3 align="center">
🚧  Raro Video Wall - Em construção...  🚧
</h3>

## Features

- [x] Cadastro de usuário
- [x] Login
- [ ] Recuperar Senha
- [ ] Visualizar vídeos
- [ ] Favoritar vídeos
- [ ] Comentários nos vídeos

## Pré-requisitos

Antes de começar, você vai precisar ter instalado em sua máquina as seguintes ferramentas:
[Git](https://git-scm.com), [Flutter](https://flutter.dev/). Além disto é bom ter um editor para
trabalhar com o código como [VSCode](https://code.visualstudio.com/)

## 🎲 Rodando o app

```bash
# Clone este repositório
$ git clone <https://gitlab.com/marcos-willian/raroviewowall>

# Acesse a pasta do projeto no terminal/cmd
$ cd raroviewowall

# Instale as dependências
$ flutter pub get

```
## Tests

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
        <br /><sub><b>Marcos Willian</b></sub>
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