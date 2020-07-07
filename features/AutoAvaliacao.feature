Feature: auto-avaliacao
As a aluno do CIn
I want to atribuir um conceito para cada meta da cadeira que curso 
So that expressar o quanto eu mereco receber em cada objetivo

Cenario: Adicao de auto-avaliacao feita com sucesso
Given Eu sou estudante com cpf  “10771553447”
And da cadeira de “Engenharia de software”
And Estou na pagina de “auto-avaliacao” 
When Eu adiciono os conceitos “MA”, “MA” e “MA” para as metas “requisitos”, “Gerencia de configuracao” e “Gerencia de projetos” na auto-avaliacao 
Then Eu posso uma mensagem de confirmacao

Cenario: Adicao de auto-avaliacao feita com sucesso
Given o estudante com cpf  “10771553447” esta armazenado no sistema com os conceitos “MA”, “MA” e “MA” para as metas para as metas  “requisitos”, “Gerencia de configuracao” e “Gerencia de projetos” 
When Eu envio a auto-avaliacao com os conceitos “MA”, “MA” e “MPA” para as metas  “requisitos”, “Gerencia de configuracao” e “Gerencia de projetos” 
Then sua auto-avaliacao e armazenada com sucesso no sistema com os conceitos “MA”, “MA” e “MPA” para as metas  “requisitos”, “Gerencia de configuracao” e “Gerencia de projetos” 

Cenario: Erro na adicao auto-avaliacao
Given sendo um estudante com cpf  “10771553447”
And da cadeira de “Engenharia de software”
And Estou na pagina de “auto-avaliacao” 
When Eu adiciono os conceitos “MA”, “MA” para as metas de “requisitos” e  “Gerencia de configuracao” 
And deixo a meta “Gerencia de projetos” sem conceito
Then minha auto-avaliacao nao e adicionada
And recebo uma mensagem notificando a ausencia de conceito para a meta “Gerencia de projetos”
Then Eu recebo mensagem notificando a ausencia de conceito para a meta “Gerencia de projetos”

Cenário: Ha discrepancia na auto-avaliacao
Given  estudante de cpf  “107” com conceitos  “MA”, “MA”, “MA”, “MA”, “MA” sobre as metas aprendidas
And auto-avaliacao com conceitos “MA”, “MA”, “MA”, “MA”, “MA” sobre as metas aprendidas
And  estudante de cpf  “715” com conceitos “MA”, “MA”, “MA”, “MA”, “MA” sobre as metas aprendidas
And auto-avaliacao com conceitos “MPA”, “MPA”, “MPA”, “MPA”, “MPA” sobre as metas aprendidas
And  estudante de cpf  “447” com conceitos “MA”, “MA”, “MANA”, “MPA”, “MPA” sobre as metas aprendidas
And auto-avaliacao com conceitos “MA”, “MA”, “MPA”, “MA”, “MA” sobre as metas aprendidas
When entro na pagina “discrepancia_autoavaliacao”
Then vejo o aluno com cpf “447” na lista
