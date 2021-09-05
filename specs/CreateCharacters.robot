*Settings*
Documentation    Suite de Testes marvel

Resource    ${EXECDIR}/resources/Base.robot
Library     ${EXECDIR}/resources/factories/Thanos.py
Library     ${EXECDIR}/resources/factories/DeadPool.py

Suite Setup     Run Keywords    Set Client Key  douglacs@gmail.com
...             AND             Back To The Past

*Test Cases*
Deve cadastrar um personagem

    ${personagem}   Factory Thanos
    ${response}     POST New Character    ${personagem}

    Status Should Be    200    ${response}


Não deve cadastrar com o mesmo nome

    ${personagem}         Factory DeadPool
    POST New Character    ${personagem}


    ${response}    POST New Character    ${personagem}

    Status Should Be    409                          ${response}
    Should Be Equal     ${response.json()}[error]    Character already exists :(