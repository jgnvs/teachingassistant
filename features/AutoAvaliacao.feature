Feature: auto-avaliação
As a aluno do CIn
I want to atribuir um conceito para cada meta da cadeira que curso 
So that expressar o quanto eu mereço receber em cada objetivo

Cenário: Adição de auto-avaliação feita com sucesso
Given Eu sou estudante com cpf  “10771553447”
And da cadeira de “Engenharia de software”
And Estou na página de “auto-avaliação” 
When Eu adiciono os conceitos “MA”, “MA” e “MA” para as metas “requisitos”, “Gerência de configuração” e “Gerência de projetos” na auto-avaliação 
Then Eu posso uma mensagem de confirmação

Cenário: Adição de auto-avaliação feita com sucesso
Given o estudante com cpf  “10771553447” está armazenado no sistema com os conceitos “MA”, “MA” e “MA” para as metas para as metas  “requisitos”, “Gerência de configuração” e “Gerência de projetos” 
When Eu envio a auto-avaliação com os conceitos “MA”, “MA” e “MPA” para as metas  “requisitos”, “Gerência de configuração” e “Gerência de projetos” 
Then sua auto-avaliação é armazenada com sucesso no sistema com os conceitos “MA”, “MA” e “MPA” para as metas  “requisitos”, “Gerência de configuração” e “Gerência de projetos” 

Cenário: Erro na adição auto-avaliação
Given Eu sou estudante com cpf  “10771553447”
And da cadeira de “Engenharia de software”
And Estou na página de “auto-avaliação” 
When Eu adiciono os conceitos “MA”, “MA” para as metas de “requisitos” e  “Gerência de configuração” 
And deixo a meta “Gerência de projetos” sem conceito
Then minha auto-avaliação não é adicionada
And recebo uma mensagem notificando a ausencia de conceito para a meta “Gerência de projetos”
Then Eu recebo mensagem notificando a ausência de conceito para a meta “Gerência de projetos”

Cenário: Ha discrepancia na auto-avaliacao
Given  estudante de cpf  “107” com conceitos  “MA”, “MA”, “MA”, “MA”, “MA” sobre as metas aprendidas
And auto-avaliação com conceitos “MA”, “MA”, “MA”, “MA”, “MA” sobre as metas aprendidas
And  estudante de cpf  “715” com conceitos “MA”, “MA”, “MA”, “MA”, “MA” sobre as metas aprendidas
And auto-avaliação com conceitos “MPA”, “MPA”, “MPA”, “MPA”, “MPA” sobre as metas aprendidas
And  estudante de cpf  “447” com conceitos “MA”, “MA”, “MANA”, “MPA”, “MPA” sobre as metas aprendidas
And auto-avaliação com conceitos “MA”, “MA”, “MPA”, “MA”, “MA” sobre as metas aprendidas
When entro na pagina “discrepancia_autoavaliacao”
Then vejo o aluno com cpf “447” na lista
