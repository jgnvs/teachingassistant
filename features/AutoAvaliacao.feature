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



