# RaroVideoWall


#Arquitetura usada
MVC, juntamente com design Atômico

Serviço de comunicação
Dio service

Estrutura modular
Separação de módulos:
	-home_modules
 		- features: Home + details
	-login_module: 
		- features: login + recuperar + registro
	-splash_module: 
		- features: splash

Gerenciamento de estados
Usa mobx com code gen 	 


## Uso ApiService
Para o uso da api deve ser recuperada através de Modular.get(). Essa api implementa todos os métodos http. A url é  apenas o caminho adicional depois da url base da api. O parâmetro body representa o capo de dados de uma requisição Http. 

O campo queryParams é usado para pesquisar parâmetros via rota. Ele é traduzido para 'nameParam=? value'. 

## LoggedState
Essa classe controla o estado globa da aplicação. Ela é única por todo o código (Singleton)	e serve para guardar o estado se existe ou não um usuário logado.

## LocalStorageService + SharedPreferencesService
A classe LocalStorageService é uma interface e a SharedPreferencesService a sua implementação. Essa feature será usada para guardar os dados de acesso da página de login na memoria interna do dispositivo evitando a reentrada no aplicativo.

