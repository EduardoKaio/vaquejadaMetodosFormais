MACHINE
    Controle_Torneio

INCLUDES
    Gerenciador_Senhas

SEES
    Contexto_Vaquejada

ABSTRACT_VARIABLES
    fase_atual
    , rodizio_atual
    , idx_correndo
    , torneio_iniciado
    , ultimo_rodizio_iniciado
    , racha_sem_finalizar
    , premiacao_individual
    , premiacao_vagas
    , premiacao_total_atual
    , colocacao
    , posicao_atual

INVARIANT
    fase_atual : FASES
    & rodizio_atual : iseq ( NAT1 )
    & size ( rodizio_atual ) <= TAMANHO_RODIZIO
    & idx_correndo : 1 .. TAMANHO_RODIZIO
    & torneio_iniciado : BOOL
    & ultimo_rodizio_iniciado : BOOL
    & racha_sem_finalizar : BOOL
    & premiacao_individual : VAQUEIROS --> NAT
    & premiacao_vagas : NAT
    & premiacao_total_atual : NAT
    & colocacao : SENHAS +-> NAT1
    & posicao_atual : NAT
    /* Regra do vencedor, qualquer senha campeã exige que o torneio esteja encerrado 
       e que o vaqueiro tenha batido a cota de bois para classificação */
    & ! ( ss ) . (
        ss : dom ( estado_senha ) & estado_senha ( ss ) = campea
        =>
        fase_atual = encerrado &
        ss : dom ( bois_corridos ) & bois_corridos ( ss ) >= BOIS_PARA_CLASSIFICAR
    )
INITIALISATION
    fase_atual := classificacao
    || rodizio_atual := []
    || idx_correndo := 1
    || torneio_iniciado := FALSE
    || ultimo_rodizio_iniciado := FALSE
    || racha_sem_finalizar := FALSE
    || premiacao_individual := VAQUEIROS * { 0 }
    || premiacao_vagas := 0
    || premiacao_total_atual := PREMIO_TOTAL
    || colocacao := {}
    || posicao_atual := 0

OPERATIONS
comprar_senha ( vv , ss ) =
    PRE
            vv : VAQUEIROS
        & vv : NAT1
        & ss : SENHAS
        & ss : NAT1
        & ss /: dom ( dono_senha )
        & card ( dom ( dono_senha ) ) < TOTAL_SENHAS
        & fase_atual = classificacao
        & card ( dom ( dono_senha |> { vv } ) ) < LIMITE_SENHAS_VAQUEIRO
        & ultimo_rodizio_iniciado = FALSE
    THEN
        IF rodizio_atual /= [] THEN
            cadastrar_senha ( vv , ss , torneio_iniciado , last ( rodizio_atual ) )
        ELSE
            cadastrar_senha ( vv , ss , torneio_iniciado , 0 )
        END
    END ;

 desistir_senha ( ss ) =
    PRE
            ss : SENHAS
        & ss : NAT1
        & ss : dom ( estado_senha )
        & estado_senha ( ss ) = na_espera
        & fase_atual /= encerrado
            & ss : ran ( fila_geral )
    THEN
        cancelar_registro_senha ( ss )
    END ;

transferir_senha ( ss , novo_vaqueiro ) =
    PRE
            novo_vaqueiro : VAQUEIROS
        & novo_vaqueiro : NAT1
        & ss : SENHAS
        & ss : NAT1
        & ss : dom ( estado_senha )
        & estado_senha ( ss ) = na_espera
        & fase_atual = classificacao
        & card ( dom ( dono_senha |> { novo_vaqueiro } ) ) < LIMITE_SENHAS_VAQUEIRO
        & ss : dom ( bois_corridos )
        & bois_corridos ( ss ) = 0
    THEN
        atualizar_dono ( ss , novo_vaqueiro )
    END ;

iniciar_rodizio =
    PRE
            fase_atual = classificacao
        & rodizio_atual = []
        & size ( fila_geral ) > 0
        & size ( fila_geral ) > TAMANHO_RODIZIO
            & ultimo_rodizio_iniciado = FALSE
    THEN
        rodizio_atual <-- extrair_lote_rodizio
        || idx_correndo := 1
        || torneio_iniciado := TRUE
    END ;

iniciar_ultimo_rodizio =
    PRE
            fase_atual = classificacao
        & rodizio_atual = []
        & size ( fila_geral ) > 0
        & ultimo_rodizio_iniciado = FALSE
            & size ( fila_geral ) <= TAMANHO_RODIZIO
    THEN
        rodizio_atual <-- extrair_lote_rodizio
        || idx_correndo := 1
        || ultimo_rodizio_iniciado := TRUE
            || torneio_iniciado := TRUE
    END ;

chamar_para_pista ( ss ) =
    PRE
            ss : SENHAS
        & ss : NAT1
        & ss : dom ( estado_senha )
        & ( estado_senha ( ss ) = na_espera or estado_senha ( ss ) = classificada )
        & na_pista /: ran ( estado_senha )
        & (
            /* O locutor só pode chamar exatamente quem é o próximo da fila */
            ( fase_atual = classificacao & rodizio_atual /= [] & idx_correndo <= size ( rodizio_atual ) & ss = rodizio_atual ( idx_correndo ) )
            or
            ( fase_atual = disputa & size ( fila_disputa_atual ) > 0 & ss = fila_disputa_atual ( 1 ) )
        )
    THEN
        atualizar_status ( ss , na_pista )
    END ;

correr_boi_classificacao ( ss , jj ) =
    PRE
            fase_atual = classificacao
        & rodizio_atual /= []
        & idx_correndo <= size ( rodizio_atual )
        & ss : SENHAS
        & ss : NAT1
        & ss = rodizio_atual ( idx_correndo )
        & jj : JULGAMENTO
        /* É obrigatório que a senha chamada já esteja na pista */
        & estado_senha ( rodizio_atual ( idx_correndo ) ) = na_pista
        & rodizio_atual ( idx_correndo ) : dom ( bois_corridos )
    THEN
            registrar_julgamento_classificacao ( ss , jj )
            ||
            IF jj = zero_boi or ( jj = valeu_boi & bois_corridos ( ss ) + 1 = BOIS_PARA_CLASSIFICAR )
            THEN
                ANY novo_rodizio WHERE
                    novo_rodizio = ( rodizio_atual /|\ ( idx_correndo - 1 ) ) ^ ( rodizio_atual \|/ idx_correndo )
                THEN
                    IF novo_rodizio = [] THEN
                            /* Todos foram retirados */
                            rodizio_atual := [] || idx_correndo := 1

                    ELSIF idx_correndo > size ( novo_rodizio ) THEN
                            /* O vaqueiro eliminado era o último da fila */
                            idx_correndo := 1
                            || rodizio_atual := novo_rodizio

                     ELSE
                            /* O vaqueiro estava no meio da fila, apenas atualiza a lista (o de trás assume o índice) */
                            rodizio_atual := novo_rodizio
                    END
                END

            ELSE
                /* Foi retorno ou não bateu os de classificar, ele continua no rodízio */
            IF idx_correndo < size ( rodizio_atual ) THEN
                /* Não era o último, Apenas passamos a vez para o próximo da fila */
                idx_correndo := idx_correndo + 1
            ELSE
                /* Chegou no último da bateria, dá a volta para a próxima rodada */
                idx_correndo := 1
            END
            END
    END ;

iniciar_fase_disputa =
    PRE
            fase_atual = classificacao
        & rodizio_atual = []
        & size ( fila_geral ) = 0
        & size ( fila_disputa_proxima ) > 0
    THEN
        /* A lista já foi montada durante a classificatória, basta checar o seu tamanho */
        fase_atual := disputa
    END ;

correr_boi_disputa ( jj ) =
    PRE
            fase_atual = disputa
        & size ( fila_disputa_atual ) > 0
        & jj : JULGAMENTO
        /* A senha tem que estar na pista */
        & estado_senha ( fila_disputa_atual ( 1 ) ) = na_pista
    THEN
        processar_resultado_disputa ( jj )
        ||
        IF jj = zero_boi & racha_sem_finalizar = TRUE THEN
            ANY ss , vaqueiro_eliminado WHERE
                ss = fila_disputa_atual ( 1 )
                & vaqueiro_eliminado = dono_senha ( ss )
            THEN
                premiacao_individual ( vaqueiro_eliminado ) := premiacao_individual ( vaqueiro_eliminado ) + premiacao_vagas
                || premiacao_total_atual := premiacao_total_atual - premiacao_vagas
                || colocacao ( ss ) := posicao_atual
                || posicao_atual := posicao_atual - 1
            END
        END
    END ;

iniciar_nova_rodada_disputa =
    PRE
            fase_atual = disputa
        & size ( fila_disputa_atual ) = 0
        /* Permite avançar rodada ou reiniciar a atual se todos perderam */
        & ( size ( fila_disputa_proxima ) > 0 or size ( eliminados_nesta_rodada ) > 0 )
            & size ( fila_disputa_proxima ) /= 1
            /* Garante que tem pelo menos 2 competidores classificados */
            & (
            /* Alguém passou (tem senhas classificadas) */
            ( size ( fila_disputa_proxima ) > 0 &
             # ( xx , yy ) . (
                xx : dom ( estado_senha ) & yy : dom ( estado_senha ) &
                xx /= yy &
                estado_senha ( xx ) = classificada & estado_senha ( yy ) = classificada &
                xx : dom ( dono_senha ) & yy : dom ( dono_senha ) & dono_senha ( xx ) /= dono_senha ( yy )
             )
            )
            or
            /* Ninguém passou (todos tiraram zero_boi). A rodada vai reiniciar. */
            ( size ( fila_disputa_proxima ) = 0 & size ( eliminados_nesta_rodada ) > 1 )
        )
    THEN
        avancar_rodada_disputa
    END ;

finalizar_sem_vencedor =
    PRE
        /* Garante que a fase de classificação acabou e todos correram */
        fase_atual = classificacao
        & rodizio_atual = []
        & size ( fila_geral ) = 0
        & ultimo_rodizio_iniciado = TRUE
        /* Garante que ninguém se classificou para a disputa */
            & size ( fila_disputa_proxima ) = 0
    THEN
        fase_atual := encerrado
    END ;

rachar_sem_finalizar =
    PRE
        fase_atual = disputa
        & na_pista /: ran ( estado_senha )
        & size ( fila_disputa_atual ) = 0
        /* Garante que existem pelo menos 3 senhas classificadas pertencentes a 3 vaqueiros distintos */
        & # ( xx , yy , zz ) . (
            xx : dom ( estado_senha ) & yy : dom ( estado_senha ) & zz : dom ( estado_senha )
            & xx /= yy & xx /= zz & yy /= zz
            & estado_senha ( xx ) = classificada & estado_senha ( yy ) = classificada & estado_senha ( zz ) = classificada
            & xx : dom ( dono_senha ) & yy : dom ( dono_senha ) & zz : dom ( dono_senha )
            & dono_senha ( xx ) /= dono_senha ( yy ) & dono_senha ( xx ) /= dono_senha ( zz ) & dono_senha ( yy ) /= dono_senha ( zz )
        )
    THEN
        ANY senhas_restantes , qtd WHERE
            senhas_restantes = dom ( estado_senha |> { classificada } ) &
            qtd = card ( senhas_restantes )
        THEN
            racha_sem_finalizar := TRUE
            || premiacao_vagas := ( premiacao_total_atual ) / ( 2 * ( qtd - 1 ) )
            || posicao_atual := qtd
        END
    END ;

rachar_premio =
    PRE
        fase_atual = disputa
        & na_pista /: ran ( estado_senha )
            & size ( fila_disputa_atual ) = 0
            /* Só permite rachar se houver senhas classificadas de vaqueiros diferentes */
            & # ( xx , yy ) . (
            xx : dom ( estado_senha ) & yy : dom ( estado_senha ) &
            xx /= yy &
            estado_senha ( xx ) = classificada & estado_senha ( yy ) = classificada &
            xx : dom ( dono_senha ) & yy : dom ( dono_senha ) & dono_senha ( xx ) /= dono_senha ( yy )
        )
    THEN
        ANY senhas_vencedoras , valor_por_senha WHERE
            /* O conjunto exato de senhas que dividem o prêmio */
            senhas_vencedoras = dom ( estado_senha |> { classificada } )

            /* Fração do prêmio por senha (divisão inteira do Método B) */
            & valor_por_senha = premiacao_total_atual / card ( senhas_vencedoras )
        THEN
            fase_atual := encerrado
            || finalizar_torneio
            /* Substitui a função de premiação inteira de uma vez */
            || premiacao_individual := % vq . (
                vq : VAQUEIROS |
                /* valor * quantidade de senhas que são vencedoras E pertencem a este vaqueiro */
                valor_por_senha * card ( senhas_vencedoras /\ dono_senha ~ [ { vq } ] )
            )
            || colocacao := colocacao <+ ( senhas_vencedoras * { 1 } )
        END
    END ;

declarar_campeao_unico =
    PRE
        fase_atual = disputa
        & na_pista /: ran ( estado_senha )
        & size ( fila_disputa_atual ) = 0
        /* Existe um vaqueiro que é dono de todas as senhas classificadas restantes */
        & # ( vv ) . (
            vv : VAQUEIROS &
            /* Garante que existe pelo menos uma senha classificada */
            # ( xx ) . ( xx : dom ( estado_senha ) & estado_senha ( xx ) = classificada ) &
            /* Garante que qualquer senha classificada obrigatoriamente pertence a vv */
            ! ( yy ) . ( yy : dom ( estado_senha ) & yy : dom ( dono_senha ) & estado_senha ( yy ) = classificada => dono_senha ( yy ) = vv )
        )
    THEN
        ANY vencedor , senhas_campeas WHERE
            vencedor : VAQUEIROS
            & ! ( yy ) . ( yy : dom ( estado_senha ) & estado_senha ( yy ) = classificada => dono_senha ( yy ) = vencedor )
            /* Capturamos as senhas restantes */
            & senhas_campeas = dom ( estado_senha |> { classificada } )
        THEN
            fase_atual := encerrado
            || finalizar_torneio
            || premiacao_individual ( vencedor ) := premiacao_individual ( vencedor ) + premiacao_total_atual
            || colocacao := colocacao <+ ( senhas_campeas * { 1 } )
        END
    END ;

observar_torneio_encerrado =
    PRE
        fase_atual = encerrado
    THEN
        skip
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

    res <-- total_senhas_vendidas =
    BEGIN
        res := card ( dom ( dono_senha ) )
    END ;

    res <-- consultar_bois_derrubados ( ss ) =
    PRE
        ss : NAT1 &
        ss : dom ( bois_corridos )
    THEN
        res := bois_corridos ( ss )
    END
END
