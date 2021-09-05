*Settings*
Documentation    Suite de Testes marvel

Resource    ${EXECDIR}/resources/Base.robot
Library     ${EXECDIR}/resources/factories/Guardians.py
Library     ${EXECDIR}/resources/factories/DeadPool.py

Suite Setup     Super Setup     douglacs@gmail.com

*Test Cases*
Deve cadastrar um personagem

    ${personagem}   Factory Star Lord
    ${response}     POST New Character    ${personagem}

    Status Should Be    200    ${response}


Não deve cadastrar com o mesmo nome

    ${personagem}         Factory Groot
    POST New Character    ${personagem}


    ${response}    POST New Character    ${personagem}

    Status Should Be    409                          ${response}
    Should Be Equal     ${response.json()}[error]    Character already exists :(