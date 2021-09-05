*Settings*
Documentation    Suite de Testes de busca na API Marvel

Resource    ${EXECDIR}/resources/Base.robot
Library     ${EXECDIR}/resources/factories/Xmen.py
Library     ${EXECDIR}/resources/factories/DeadPool.py

Suite Setup    Super Setup    douglacs@gmail.com

*Test Cases*
Deve buscar um personagem pelo ID

    ${personagem}    Factory Logan
    ${logan}         POST New Character    ${personagem}

    ${logan_id}    Set Variable    ${logan.json()}[_id]

    ${response}    GET Characters By ID    ${logan_id}

    Status Should Be    200    ${response}

    Should Be Equal    ${logan.json()}[name]       ${personagem}[name]
    Should Be Equal    ${logan.json()}[age]        ${personagem}[age]
    Should Be Equal    ${logan.json()}[aliases]    ${personagem}[aliases]
    Should Be Equal    ${logan.json()}[team]       ${personagem}[team]
    Should Be Equal    ${logan.json()}[active]     ${personagem}[active]
    Should Be Equal    ${logan.json()}[owner]      ${personagem}[owner]


Não Deve retornar o personagem pelo ID

    ${personagem_id}        Get Unique Id
    
    ${response}     GET Characters By ID  ${personagem_id}

    Status Should Be        404     ${response}