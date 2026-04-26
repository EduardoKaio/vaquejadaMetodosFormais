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

ABSTRACT_VARIABLES
    fase_atual

INVARIANT
    fase_atual : FASES &

    /* Regra de exclusividade de pista validada globalmente */
    card ( estado_senha |> { na_pista } ) <= 1

INITIALISATION
    fase_atual := classificacao

OPERATIONS
    /* A operação do sistema envelopa a operação do banco de dados com regras da fase */
    comprar_senha ( vv , ss ) =
    PRE
        vv : VAQUEIROS &
        ss : SENHAS &
        ss /: dom ( dono_senha ) &
        card ( dom ( dono_senha ) ) < LIMITE_SENHAS &
        fase_atual = classificacao
    THEN
        cadastrar_senha ( vv , ss ) /* Chama a operação incluída */
    END ;

    desistir_senha ( ss ) =
    PRE
        ss : dom ( estado_senha ) &
        estado_senha ( ss ) = na_espera & /* Só pode desistir se estiver na fila */
        fase_atual /= encerrado
    THEN
        atualizar_status ( ss , eliminada )
    END ;

    transferir_senha ( ss , novo_vaqueiro ) =
    PRE
        ss : dom ( estado_senha ) &
        estado_senha ( ss ) = na_espera & /* Só transfere antes de correr */
        novo_vaqueiro : VAQUEIROS &
        fase_atual /= encerrado
    THEN
        atualizar_dono ( ss , novo_vaqueiro ) /* Usa a nova operação do gerenciador */
    END ;


    // Genérica, usada na classificação e disputa
    chamar_para_pista ( ss ) =
    PRE
        ss : dom ( estado_senha ) &
        estado_senha ( ss ) = na_espera &
        card ( estado_senha |> { na_pista } ) = 0
    THEN
        atualizar_status ( ss , na_pista )
    END ;


    // Classificação
    correr_boi_classificacao ( ss , julgamento ) =
    PRE
        fase_atual = classificacao &
        ss : dom ( estado_senha ) &
        estado_senha ( ss ) = na_pista &
        julgamento : JULGAMENTO
    THEN
        IF julgamento = zero_boi THEN
            atualizar_status ( ss , eliminada )
        ELSE
            IF bois_corridos ( ss ) + 1 = BOIS_PARA_CLASSIFICAR THEN
                /* Aqui usamos a nova operação atômica em vez do || */
                registrar_valeu_boi ( ss , classificada )
            ELSE
                /* Aqui também */
                registrar_valeu_boi ( ss , na_espera )
            END
        END
    END ;


    // DISPUTA
    iniciar_disputa =
    PRE
        fase_atual = classificacao &
        /* Só pode iniciar se a pista estiver vazia e não tiver mais ninguém na fila original */
        card ( estado_senha |> { na_pista } ) = 0 &
        card ( estado_senha |> { na_espera } ) = 0
    THEN
        fase_atual := disputa ||
        preparar_disputa /* Chama a operação em lote que criamos no gerenciador */
    END ;

    correr_boi_disputa ( ss , julgamento ) =
    PRE
        fase_atual = disputa &
        ss : dom ( estado_senha ) &
        estado_senha ( ss ) = na_pista &
        julgamento : JULGAMENTO
    THEN
        IF julgamento = zero_boi THEN
            atualizar_status ( ss , eliminada )
        ELSE
            /* Na disputa, se valeu o boi, ele apenas volta pra fila para a próxima rodada */
            atualizar_status ( ss , na_espera )
        END
    END ;

    rachar_premio =
    PRE
        fase_atual = disputa &
        /* Garante que a rodada acabou (ninguém na pista) antes de rachar */
        card ( estado_senha |> { na_pista } ) = 0 &
        /* Tem que ter pelo menos 2 pessoas para rachar */
        card ( estado_senha |> { na_espera } ) >= 2
    THEN
        fase_atual := encerrado ||
        finalizar_torneio
    END ;

    declarar_campeao_unico =
    PRE
        fase_atual = disputa &
        card ( estado_senha |> { na_pista } ) = 0 &
        /* Só sobrou 1 senha viva no sistema */
        card ( estado_senha |> { na_espera } ) = 1
    THEN
        fase_atual := encerrado ||
        finalizar_torneio
    END ;


    // CONSULTAS

    /* Retorna o conjunto de todas as senhas que bateram a classificação */
    retorno <-- listar_classificados =
    BEGIN
        /* Pega o domínio (as senhas) onde a imagem é 'classificada' */
        retorno := dom ( estado_senha |> { classificada } )
    END ;

    /* Retorna as senhas que ainda estão "vivas" no mata-mata */
    retorno <-- listar_vivos_disputa =
    PRE
        fase_atual = disputa
    THEN
        /* Filtra quem está na fila ou na pista agora */
        retorno := dom ( estado_senha |> { na_espera , na_pista } )
    END ;

    /* Como se fosse um "SELECT status FROM senhas WHERE id = ss" */
    retorno <-- consultar_status_senha ( ss ) =
    PRE
        ss : dom ( estado_senha )
    THEN
        retorno := estado_senha ( ss )
    END ;

    /* Consulta quem é o dono de uma senha */
    retorno <-- consultar_dono ( ss ) =
    PRE
        ss : dom ( dono_senha )
    THEN
        retorno := dono_senha ( ss )
    END ;

    retorno <-- listar_senhas_vaqueiro ( vv ) =
    PRE
        vv : VAQUEIROS
    THEN
        /* Pega todas as senhas (domínio) cuja imagem (dono) seja exatamente 'vv' */
        retorno := dom ( dono_senha |> { vv } )
    END ;

    retorno <-- total_senhas_vendidas =
    BEGIN
        /* Conta quantos elementos existem no domínio da relação de donos */
        retorno := card ( dom ( dono_senha ) )
    END ;

    retorno <-- consultar_bois_corridos ( ss ) =
    PRE
        ss : dom ( bois_corridos )
    THEN
        retorno := bois_corridos ( ss )
    END
END
