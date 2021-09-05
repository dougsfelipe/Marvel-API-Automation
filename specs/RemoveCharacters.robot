*Settings*
Documentation    Suite de Testes de exclusão de personagens na API Marvel

Resource    ${EXECDIR}/resources/Base.robot
Library     ${EXECDIR}/resources/factories/Xmen.py

Suite Setup    Super Setup    douglacs@gmail.com

*Test Cases*
Deve remover um personagem pelo ID

    ${personagem}    Factory Ciclope
    ${ciclope}       POST New Character    ${personagem}

    ${ciclope_id}    Set Variable    ${ciclope.json()}[_id]

    ${response}    DELETE Characters By ID    ${ciclope_id}

    Status Should Be    204    ${response}

    ${response2}    GET Characters By ID  ${ciclope_id}

    Status Should Be    404    ${response2}


Não Deve remover pelo ID

    ${personagem_id}    Get Unique Id

    ${response}    DELETE Characters By ID    ${personagem_id}

    Status Should Be    404    ${response}