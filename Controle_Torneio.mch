/* Controle_Torneio
 * Author: kaio
 * Creation date: 25/04/2026
 */
MACHINE
    Controle_Torneio

INCLUDES
    Gerenciador_Senhas

SEES
    Contexto_Vaquejada

VARIABLES
    fase_atual

INVARIANT
    fase_atual : FASES &
    
    /* Regra de exclusividade de pista validada globalmente */
    card(estado_senha |> {na_pista}) <= 1

INITIALISATION
    fase_atual := classificacao

OPERATIONS
    /* A operação do sistema envelopa a operação do banco de dados com regras da fase */
    comprar_senha(vv, ss) =
    PRE
        vv : VAQUEIROS & 
        ss : SENHAS &
        ss /: dom(dono_senha) &
        card(dom(dono_senha)) < LIMITE_SENHAS &
        fase_atual = classificacao
    THEN
        cadastrar_senha(vv, ss) /* Chama a operação incluída */
    END;

    chamar_para_pista(ss) =
    PRE
        ss : dom(estado_senha) &
        estado_senha(ss) = na_espera &
        card(estado_senha |> {na_pista}) = 0 /* Garante a exclusividade */
    THEN
        atualizar_status(ss, na_pista)
    END;

    correr_boi_classificacao(ss, julgamento) =
    PRE
        fase_atual = classificacao &
        ss : dom(estado_senha) &
        estado_senha(ss) = na_pista &
        julgamento : JULGAMENTO
    THEN
        IF julgamento = zero_boi THEN
            atualizar_status(ss, eliminada)
        ELSE
            IF bois_corridos(ss) + 1 = BOIS_PARA_CLASSIFICAR THEN
                /* Aqui usamos a nova operação atômica em vez do || */
                registrar_valeu_boi(ss, classificada)
            ELSE
                /* Aqui também */
                registrar_valeu_boi(ss, na_espera)
            END
        END
    END
END