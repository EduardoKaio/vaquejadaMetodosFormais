MACHINE
    Gerenciador_Senhas

SEES
    Contexto_Vaquejada

ABSTRACT_VARIABLES
    dono_senha
    , estado_senha
    , bois_corridos
    , fila_geral
    , fila_disputa_atual
    , fila_disputa_proxima
    , eliminados_nesta_rodada
    , buffer_saida
    , tamanho_buffer_saida

INVARIANT
    dono_senha : SENHAS +-> VAQUEIROS
    & estado_senha : SENHAS +-> STATUS_SENHA
    & bois_corridos : SENHAS +-> NAT
    & fila_geral : iseq ( NAT1 )
    & fila_disputa_atual : iseq ( NAT1 )
    & fila_disputa_proxima : iseq ( NAT1 )
    & eliminados_nesta_rodada : iseq ( NAT1 )
    /* Ninguém vira classificado sem ter a quantidade exata de bois */
    & ! ( ss ) . ( ( ss : dom ( estado_senha ) & estado_senha ( ss ) = classificada ) => ( ss : dom ( bois_corridos ) & bois_corridos ( ss ) = BOIS_PARA_CLASSIFICAR ) )
    & buffer_saida : iseq ( NAT1 )
    & tamanho_buffer_saida : NAT

INITIALISATION
    dono_senha := {}
    || estado_senha := {}
    || bois_corridos := {}
    || fila_geral := []
    || fila_disputa_atual := []
    || fila_disputa_proxima := []
    || eliminados_nesta_rodada := []
    || buffer_saida := []
    || tamanho_buffer_saida := 0

OPERATIONS
cadastrar_senha ( vv , ss , torneio_comecou , ultima_senha ) =
    PRE vv : VAQUEIROS
        & vv : NAT1
        & ss : SENHAS
        & ss : NAT1
        & torneio_comecou : BOOL
        & ultima_senha : NAT
        & ss /: dom ( dono_senha )
        & card ( dom ( dono_senha ) ) < TOTAL_SENHAS
        & card ( dom ( dono_senha |> { vv } ) ) < LIMITE_SENHAS_VAQUEIRO
    THEN
        dono_senha ( ss ) := vv
        || estado_senha ( ss ) := na_espera
        || bois_corridos ( ss ) := 0
        ||
        IF torneio_comecou = FALSE THEN
            /* Inserção ordenada, acha o ponto exato onde a senha deve entrar */
            ANY f1 , f2 WHERE
                f1 : iseq ( NAT1 ) & f2 : iseq ( NAT1 )
                & fila_geral = f1 ^ f2
                & ( ! xx . ( xx : ran ( f1 ) => xx < ss ) )
                & ( ! yy . ( yy : ran ( f2 ) => yy > ss ) )
            THEN
                fila_geral := f1 ^ [ ss ] ^ f2
            END
        ELSE
            IF ss < ultima_senha THEN
                fila_geral := fila_geral <- ss
            ELSE
                ANY f1 , f2 WHERE
                    f1 : iseq ( NAT1 ) & f2 : iseq ( NAT1 )
                    & fila_geral = f1 ^ f2
                    & ( ! xx . ( xx : ran ( f1 ) => ( xx < ss & xx > ultima_senha ) ) )
                    & ( f2 /= [] => ( first ( f2 ) > ss or first ( f2 ) <= ultima_senha ) )
                THEN
                    fila_geral := f1 ^ [ ss ] ^ f2
                END
            END
        END
    END ;

atualizar_status ( ss , novo_status ) =
    PRE ss : SENHAS
        & ss : NAT1
        & ss : dom ( estado_senha )
        & novo_status : STATUS_SENHA
    THEN
        estado_senha ( ss ) := novo_status
    END ;

cancelar_registro_senha ( ss ) =
    PRE ss : SENHAS
        & ss : NAT1
        & ss : dom ( dono_senha )
        & ss : ran ( fila_geral )
    THEN
        /* Apaga a senha de todas as variáveis de estado */
        dono_senha := { ss } <<| dono_senha
        || estado_senha := { ss } <<| estado_senha
        || bois_corridos := { ss } <<| bois_corridos
        ||
        /* Remove a senha da Fila Geral mantendo a ordem dos outros competidores */
        ANY f1 , f2 WHERE
            f1 : iseq ( NAT1 ) & f2 : iseq ( NAT1 ) &
            fila_geral = f1 ^ [ ss ] ^ f2
        THEN
            fila_geral := f1 ^ f2
        END
    END ;

atualizar_dono ( ss , novo_vaqueiro ) =
    PRE novo_vaqueiro : VAQUEIROS
        & novo_vaqueiro : NAT1
        & ss : SENHAS
        & ss : NAT1
        & ss : dom ( dono_senha )
        & card ( dom ( dono_senha |> { novo_vaqueiro } ) ) < LIMITE_SENHAS_VAQUEIRO
        & ss : dom ( bois_corridos )
        & bois_corridos ( ss ) = 0
    THEN
        dono_senha ( ss ) := novo_vaqueiro
    END ;

extrair_lote_rodizio =
    PRE size ( fila_geral ) > 0
    THEN
        IF size ( fila_geral ) > TAMANHO_RODIZIO THEN
            buffer_saida := fila_geral /|\ TAMANHO_RODIZIO
            || tamanho_buffer_saida := TAMANHO_RODIZIO
            || fila_geral := fila_geral \|/ TAMANHO_RODIZIO
        ELSE
            buffer_saida := fila_geral
            || tamanho_buffer_saida := size ( fila_geral )
            || fila_geral := []
        END
    END ;

registrar_julgamento_classificacao ( ss , jj ) =
    PRE ss : NAT1
        & ss : dom ( estado_senha )
        & jj : JULGAMENTO
    THEN
        IF jj = zero_boi THEN
            estado_senha ( ss ) := eliminada
        ELSIF jj = valeu_boi THEN
            bois_corridos ( ss ) := bois_corridos ( ss ) + 1
            ||
            /* Verifica se o vaqueiro se classificou agora */
            IF bois_corridos ( ss ) + 1 = BOIS_PARA_CLASSIFICAR THEN
                estado_senha ( ss ) := classificada
                ||
                /* Insere o vaqueiro na fila de disputa, já ordenado */
                ANY f1 , f2 WHERE
                    f1 : iseq ( NAT1 ) & f2 : iseq ( NAT1 )
                    & fila_disputa_proxima = f1 ^ f2
                    & ( ! xx . ( xx : ran ( f1 ) => xx < ss ) )
                    & ( ! yy . ( yy : ran ( f2 ) => yy > ss ) )
                THEN
                    fila_disputa_proxima := f1 ^ [ ss ] ^ f2
                END
            ELSE
                /* Tira da pista e volta pra fila aguardando o próximo boi */
                estado_senha ( ss ) := na_espera
            END
        ELSE
            estado_senha ( ss ) := na_espera
        END
    END ;

 processar_resultado_disputa ( jj ) =
    PRE
        size ( fila_disputa_atual ) > 0 & jj : JULGAMENTO
    THEN
        ANY ss WHERE ss = fila_disputa_atual ( 1 ) THEN
            IF jj = zero_boi THEN
                estado_senha ( ss ) := eliminada
                || fila_disputa_atual := fila_disputa_atual \|/ 1
                || eliminados_nesta_rodada := eliminados_nesta_rodada <- ss

            ELSIF jj = valeu_boi THEN
                estado_senha ( ss ) := classificada
                || fila_disputa_atual := fila_disputa_atual \|/ 1

                /* Inserção ordenada na fila da próxima rodada */
                || ANY f1 , f2 WHERE
                    f1 : iseq ( NAT1 ) & f2 : iseq ( NAT1 )
                    & fila_disputa_proxima = f1 ^ f2
                    & ( ! xx . ( xx : ran ( f1 ) => xx < ss ) )
                    & ( ! yy . ( yy : ran ( f2 ) => yy > ss ) )
                THEN
                    fila_disputa_proxima := f1 ^ [ ss ] ^ f2
                END

            ELSE
                /* Foi retorno, corre no final da rodada atual */
                estado_senha ( ss ) := classificada
                || fila_disputa_atual := ( fila_disputa_atual \|/ 1 ) <- ss
            END
        END
    END ;

avancar_rodada_disputa =
    PRE size ( fila_disputa_atual ) = 0
        & ( size ( fila_disputa_proxima ) > 0 or size ( eliminados_nesta_rodada ) > 0 )
    THEN
        IF size ( fila_disputa_proxima ) > 0 THEN
            /* Alguém passou, avança normal e descarta os eliminados */
            fila_disputa_atual := fila_disputa_proxima
            || fila_disputa_proxima := []
            || eliminados_nesta_rodada := []
        ELSE
            /* Todos levaram zero, reinicia a rodada e devolve o status de classificada */
            fila_disputa_atual := eliminados_nesta_rodada
            || estado_senha := estado_senha <+ ( ran ( eliminados_nesta_rodada ) * { classificada } )
            || eliminados_nesta_rodada := []
        END
    END ;

finalizar_torneio =
    BEGIN
        estado_senha := estado_senha <+ ( dom ( estado_senha |> { classificada } ) * { campea } )
    END ;

val <-- consultar_lote_saida ( ii ) =
    PRE
        ii : NAT1
        & ii <= tamanho_buffer_saida
    THEN
        val := buffer_saida ( ii )
    END ;

tam <-- consultar_tamanho_lote_saida =
    BEGIN
        tam := tamanho_buffer_saida
    END ;

st <-- get_estado_senha ( ss ) =
    PRE ss : NAT1 & ss : dom ( estado_senha ) THEN
        st := estado_senha ( ss )
    END ;

    vq <-- get_dono_senha ( ss ) =
    PRE ss : NAT1 & ss : dom ( dono_senha ) THEN
        vq := dono_senha ( ss )
    END ;

    bc <-- get_bois_corridos ( ss ) =
    PRE ss : NAT1 & ss : dom ( bois_corridos ) THEN
        bc := bois_corridos ( ss )
    END ;

    ss <-- get_primeiro_fila_disputa =
    PRE size ( fila_disputa_atual ) > 0 THEN
        ss := fila_disputa_atual ( 1 )
    END
END
