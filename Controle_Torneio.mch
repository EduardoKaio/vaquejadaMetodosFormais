MACHINE
    Controle_Torneio

INCLUDES
    Gerenciador_Senhas

SEES
    Contexto_Vaquejada

VARIABLES
    fase_atual
    , rodizio_atual
    , boi_turno
    , idx_correndo
    , torneio_iniciado
    , primeiro_rodizio

INVARIANT
    fase_atual : FASES
    & rodizio_atual : iseq ( NAT1 )
    & size ( rodizio_atual ) <= TAMANHO_RODIZIO
    & boi_turno : 1 .. BOIS_PARA_CLASSIFICAR
    & idx_correndo : 1 .. TAMANHO_RODIZIO
    & torneio_iniciado : BOOL
    & primeiro_rodizio : BOOL

INITIALISATION
    fase_atual := nao_iniciado
    || rodizio_atual := []
    || boi_turno := 1
    || idx_correndo := 1
    || torneio_iniciado := FALSE
    || primeiro_rodizio := TRUE

OPERATIONS
iniciar_torneio =
    PRE torneio_iniciado = FALSE
        & fase_atual = nao_iniciado
    THEN
        torneio_iniciado := TRUE
        || fase_atual := classificacao
    END ;

comprar_senha ( vv , ss ) =
    PRE vv : VAQUEIROS
        & vv : NAT1
        & ss : SENHAS
        & ss : NAT1
        & ss /: dom ( dono_senha )
        & card ( dom ( dono_senha ) ) < TOTAL_SENHAS
        & ( fase_atual = classificacao or fase_atual = nao_iniciado )
        & card ( dom ( dono_senha |> { vv } ) ) < LIMITE_SENHAS_VAQUEIRO
    THEN
        IF rodizio_atual /= [] THEN
            cadastrar_senha ( vv , ss , torneio_iniciado , last ( rodizio_atual ) )
        ELSE
            cadastrar_senha ( vv , ss , torneio_iniciado , 0 )
        END
    END ;

 desistir_senha ( ss ) =
    PRE ss : SENHAS
        & ss : NAT1
        & ss : dom ( estado_senha )
        & estado_senha ( ss ) = na_espera
        & fase_atual /= encerrado
	& ss : ran(fila_geral)
    THEN
        cancelar_registro_senha(ss)
    END ;

transferir_senha ( ss , novo_vaqueiro ) =
    PRE novo_vaqueiro : VAQUEIROS
        & novo_vaqueiro : NAT1
        & ss : SENHAS
        & ss : NAT1
        & ss : dom ( estado_senha )
        & estado_senha ( ss ) = na_espera
        & fase_atual /= encerrado
        & card ( dom ( dono_senha |> { novo_vaqueiro } ) ) < LIMITE_SENHAS_VAQUEIRO
    THEN
        atualizar_dono ( ss , novo_vaqueiro )
    END ;

iniciar_rodizio =
    PRE fase_atual = classificacao
        & rodizio_atual = []
        & size ( fila_geral ) > 0
        & ( (primeiro_rodizio = TRUE) => (size ( fila_geral ) >= TAMANHO_RODIZIO) )
    THEN
        rodizio_atual <-- extrair_lote_rodizio
        || boi_turno := 1
        || idx_correndo := 1
        || primeiro_rodizio := FALSE
    END ;

chamar_para_pista ( ss ) =
    PRE ss : SENHAS
        & ss : NAT1
        & ss : dom ( estado_senha )
        & ( estado_senha ( ss ) = na_espera or estado_senha ( ss ) = classificada )
        & na_pista /: ran ( estado_senha )
        & (
            /* TRAVA: O locutor só pode chamar exatamente quem é o próximo da fila! */
            ( fase_atual = classificacao & rodizio_atual /= [] & idx_correndo <= size ( rodizio_atual ) & ss = rodizio_atual ( idx_correndo ) )
            or
            ( fase_atual = disputa & size ( fila_disputa_atual ) > 0 & ss = fila_disputa_atual ( 1 ) )
        )
    THEN
        atualizar_status ( ss , na_pista )
    END ;

correr_boi_classificacao ( jj ) =
    PRE fase_atual = classificacao
        & rodizio_atual /= []
        & idx_correndo <= size ( rodizio_atual )
        & jj : JULGAMENTO
        /* TRAVA: É OBRIGATÓRIO que a senha chamada já esteja na pista! */
        & estado_senha ( rodizio_atual ( idx_correndo ) ) = na_pista
    THEN
        ANY ss WHERE ss = rodizio_atual ( idx_correndo ) THEN
            registrar_julgamento_classificacao ( ss , jj )
            ||
            IF jj = zero_boi THEN
                ANY novo_rodizio WHERE
                    novo_rodizio = ( rodizio_atual /|\ ( idx_correndo - 1 ) ) ^ ( rodizio_atual \|/ idx_correndo )
                THEN
                    IF novo_rodizio = [] THEN
                        /* Todos foram eliminados */
                        rodizio_atual := [] || idx_correndo := 1 || boi_turno := 1

                    ELSIF idx_correndo > size ( novo_rodizio ) THEN
                        /* O vaqueiro eliminado era o último da fila */
                        idx_correndo := 1
                        ||
                        IF boi_turno < BOIS_PARA_CLASSIFICAR THEN
                            /* Ainda tem bois para correr, atualiza a lista e avança o turno */
                            rodizio_atual := novo_rodizio || boi_turno := boi_turno + 1
                        ELSE
                            /* Rodízio finalizado */
                            rodizio_atual := [] || boi_turno := 1
                        END

                    ELSE
                        /* O vaqueiro estava no meio da fila, apenas atualiza a lista (o de trás assume o índice) */
                        rodizio_atual := novo_rodizio
                    END
                END

            ELSIF jj = retorno THEN
                ANY novo_rodizio WHERE
                    novo_rodizio = ( ( rodizio_atual /|\ ( idx_correndo - 1 ) ) ^ ( rodizio_atual \|/ idx_correndo ) ) <- ss
                THEN
                    rodizio_atual := novo_rodizio
                END

            ELSE
                IF idx_correndo < size ( rodizio_atual ) THEN
                    idx_correndo := idx_correndo + 1
                ELSIF boi_turno < BOIS_PARA_CLASSIFICAR THEN
                    idx_correndo := 1 || boi_turno := boi_turno + 1
                ELSE
                    rodizio_atual := [] || idx_correndo := 1 || boi_turno := 1
                END
            END
        END
    END ;

iniciar_fase_disputa =
    PRE fase_atual = classificacao
        & rodizio_atual = []
        & size ( fila_geral ) = 0
    THEN
        /* Como a lista já foi montada durante a classificatória, basta checar o seu tamanho! */
        IF size ( fila_disputa_atual ) > 0 THEN
            fase_atual := disputa
        ELSE
            fase_atual := encerrado
        END
    END ;

correr_boi_disputa ( jj ) =
    PRE fase_atual = disputa
        & size ( fila_disputa_atual ) > 0
        & jj : JULGAMENTO
        /* TRAVA: É OBRIGATÓRIO que a senha chamada já esteja na pista! */
        & estado_senha ( fila_disputa_atual ( 1 ) ) = na_pista
    THEN
        processar_resultado_disputa ( jj )
    END ;

iniciar_nova_rodada_disputa =
    PRE fase_atual = disputa
        & size ( fila_disputa_atual ) = 0
        /* Permite avançar rodada ou reiniciar a atual se todos perderam */
        & ( size ( fila_disputa_proxima ) > 0 or size ( eliminados_nesta_rodada ) > 0 )
	& size ( fila_disputa_proxima ) /= 1
    THEN
        avancar_rodada_disputa
    END ;

rachar_premio =
    PRE fase_atual = disputa
        & size ( fila_disputa_atual ) = 0
        & na_pista /: ran ( estado_senha )
        & ( # ( xx , yy ) . ( xx : dom ( estado_senha ) & yy : dom ( estado_senha ) & xx /= yy & estado_senha ( xx ) = classificada & estado_senha ( yy ) = classificada ) )
    THEN
        fase_atual := encerrado ||
        finalizar_torneio
    END ;

declarar_campeao_unico =
    PRE fase_atual = disputa
        & size ( fila_disputa_atual ) = 0
        & na_pista /: ran ( estado_senha )
        & ( # ( xx ) . ( xx : dom ( estado_senha ) & estado_senha ( xx ) = classificada & ! ( yy ) . ( yy : dom ( estado_senha ) & estado_senha ( yy ) = classificada => xx = yy ) ) )
    THEN
        fase_atual := encerrado ||
        finalizar_torneio
    END;

observar_torneio_encerrado =
    PRE 
        fase_atual = encerrado
    THEN
        skip
    END;

 /* =========================
       CONSULTAS CONCRETAS
       ========================= */

    res <-- consultar_status_senha(ss) =
    PRE
        ss : NAT1 &
        ss : dom(estado_senha)
    THEN
        res := estado_senha(ss)
    END;

    res <-- consultar_dono(ss) =
    PRE
        ss : NAT1 &
        ss : dom(dono_senha)
    THEN
        res := dono_senha(ss)
    END;

    res <-- total_senhas_vendidas =
    BEGIN
        res := card(dom(dono_senha))
    END;

    res <-- consultar_bois_corridos(ss) =
    PRE
        ss : NAT1 &
        ss : dom(bois_corridos)
    THEN
        res := bois_corridos(ss)
    END
END
