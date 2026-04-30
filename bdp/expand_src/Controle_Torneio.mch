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

    card ( estado_senha |> { na_pista } ) <= 1 &

    ( campea : ran ( estado_senha ) => fase_atual = encerrado )

INITIALISATION
    fase_atual := classificacao

OPERATIONS
    comprar_senha ( vv , ss , cat ) =
    PRE
        vv : NAT1 & ss : NAT1 & cat : CATEGORIAS &
        ss /: dom ( dono_senha ) &
        card ( dom ( dono_senha ) ) < LIMITE_SENHAS &
        fase_atual = classificacao &
        ( vv : dom ( categoria_vaqueiro ) => categoria_vaqueiro ( vv ) = cat )
    THEN
        cadastrar_senha ( vv , ss , cat )
    END ;

    desistir_senha ( ss ) =
    PRE
        ss : NAT1 &
        ss : dom ( estado_senha ) &
        estado_senha ( ss ) = na_espera &
        fase_atual /= encerrado
    THEN
        atualizar_status ( ss , eliminada )
    END ;

    transferir_senha ( ss , novo_vaqueiro ) =
    PRE
        ss : NAT1 & novo_vaqueiro : NAT1 &
        ss : dom ( estado_senha ) &
        estado_senha ( ss ) = na_espera &
        fase_atual /= encerrado &
        /* O novo vaqueiro não pode ser de categoria diferente da senha */
        ( novo_vaqueiro : dom ( categoria_vaqueiro ) => categoria_vaqueiro ( novo_vaqueiro ) = categoria_vaqueiro ( dono_senha ( ss ) ) )
    THEN
        atualizar_dono ( ss , novo_vaqueiro , categoria_vaqueiro ( dono_senha ( ss ) ) )
    END ;

    chamar_para_pista ( ss ) =
    PRE
        ss : NAT1 &
        ss : dom ( estado_senha ) &
        estado_senha ( ss ) = na_espera &
        card ( estado_senha |> { na_pista } ) = 0
    THEN
        atualizar_status ( ss , na_pista )
    END ;

    correr_boi_classificacao ( ss , julgamento ) =
    PRE
        ss : NAT1 &
        fase_atual = classificacao &
        ss : dom ( estado_senha ) &
        estado_senha ( ss ) = na_pista &
        julgamento : JULGAMENTO
    THEN
        IF julgamento = zero_boi THEN
            atualizar_status ( ss , eliminada )
        ELSE
            IF julgamento = retorno THEN
                atualizar_status ( ss , na_espera ) /* NOVO: Volta para o final da fila sem alterar pontos */
            ELSE /* valeu_boi */
                IF bois_corridos ( ss ) + 1 = BOIS_PARA_CLASSIFICAR THEN
                    registrar_valeu_boi ( ss , classificada )
                ELSE
                    registrar_valeu_boi ( ss , na_espera )
                END
            END
        END
    END ;

    iniciar_disputa =
    PRE
        fase_atual = classificacao &
        card ( estado_senha |> { na_pista } ) = 0 &
        card ( estado_senha |> { na_espera } ) = 0
    THEN
        fase_atual := disputa ||
        preparar_disputa
    END ;

    correr_boi_disputa ( ss , julgamento ) =
    PRE
        ss : NAT1 &
        fase_atual = disputa &
        ss : dom ( estado_senha ) &
        estado_senha ( ss ) = na_pista &
        julgamento : JULGAMENTO
    THEN
        IF julgamento = zero_boi THEN
            atualizar_status ( ss , eliminada )
        ELSE
            IF julgamento = retorno THEN
                atualizar_status ( ss , na_espera ) /* NOVO: Repete a corrida do mata-mata */
            ELSE /* valeu_boi */
                atualizar_status ( ss , na_espera )
            END
        END
    END ;

    rachar_premio =
    PRE
        fase_atual = disputa &
        card ( estado_senha |> { na_pista } ) = 0 &
        card ( estado_senha |> { na_espera } ) >= 2
    THEN
        fase_atual := encerrado ||
        finalizar_torneio
    END ;

    declarar_campeao_unico =
    PRE
        fase_atual = disputa &
        card ( estado_senha |> { na_pista } ) = 0 &
        card ( estado_senha |> { na_espera } ) = 1
    THEN
        fase_atual := encerrado ||
        finalizar_torneio
    END ;

    /* =========================
       CONSULTAS CONCRETAS
       ========================= */

    res <-- consultar_status_senha ( ss ) =
    PRE
        ss : NAT1 &
        ss : dom ( estado_senha )
    THEN
        res := estado_senha ( ss )
    END ;

    res <-- consultar_dono ( ss ) =
    PRE
        ss : NAT1 &
        ss : dom ( dono_senha )
    THEN
        res := dono_senha ( ss )
    END ;

    res <-- consultar_categoria_vaqueiro ( vv ) =
    PRE
        vv : NAT1 &
        vv : dom ( categoria_vaqueiro )
    THEN
        res := categoria_vaqueiro ( vv )
    END ;

    res <-- total_senhas_vendidas =
    BEGIN
        res := card ( dom ( dono_senha ) )
    END ;

    res <-- consultar_bois_corridos ( ss ) =
    PRE
        ss : NAT1 &
        ss : dom ( bois_corridos )
    THEN
        res := bois_corridos ( ss )
    END
END
