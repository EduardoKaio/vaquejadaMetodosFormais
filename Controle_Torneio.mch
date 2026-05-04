MACHINE
    Controle_Torneio

INCLUDES
    Gerenciador_Senhas

SEES
    Contexto_Vaquejada

VARIABLES
    fase_atual
    , rodizio_atual
    , idx_correndo
    , torneio_iniciado
    , ultimo_rodizio_iniciado

INVARIANT
    fase_atual : FASES
    & rodizio_atual : iseq ( NAT1 )
    & size ( rodizio_atual ) <= TAMANHO_RODIZIO
    & idx_correndo : 1 .. TAMANHO_RODIZIO
    & torneio_iniciado : BOOL
    & ultimo_rodizio_iniciado : BOOL
    /* Regra do Vencedor, qualquer senha campeã exige que o torneio esteja encerrado 
       e que o vaqueiro tenha batido a cota de bois para classificação */
    & !(ss) . (
        ss : dom(estado_senha) & estado_senha(ss) = campea 
        => 
        fase_atual = encerrado & 
        ss : dom(bois_corridos) & bois_corridos(ss) >= BOIS_PARA_CLASSIFICAR
    )
INITIALISATION
    fase_atual := classificacao
    || rodizio_atual := []
    || idx_correndo := 1
    || torneio_iniciado := FALSE
    || ultimo_rodizio_iniciado := FALSE

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
	& ss : ran(fila_geral)
    THEN
        cancelar_registro_senha(ss)
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
        & ss : dom(bois_corridos)
        & bois_corridos(ss) = 0
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

correr_boi_classificacao ( ss, jj ) =
    PRE 
    	fase_atual = classificacao
        & rodizio_atual /= []
        & idx_correndo <= size ( rodizio_atual )
        & ss : SENHAS
        & ss : NAT1
        & ss = rodizio_atual ( idx_correndo )
        & jj : JULGAMENTO
        /* é obrigatório que a senha chamada já esteja na pista */
        & estado_senha ( rodizio_atual ( idx_correndo ) ) = na_pista
        & rodizio_atual(idx_correndo) : dom(bois_corridos)
    THEN
	registrar_julgamento_classificacao ( ss , jj )
	||
	IF jj = zero_boi 
	   or (jj = valeu_boi & bois_corridos(ss) + 1 = BOIS_PARA_CLASSIFICAR)
	THEN
	    ANY novo_rodizio WHERE
	        novo_rodizio = ( rodizio_atual /|\ ( idx_correndo - 1 ) ) ^ ( rodizio_atual \|/ idx_correndo )
	    THEN
	        IF novo_rodizio = [] THEN
		    /* Todos foram eliminados */
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
	        /* Foi retorno, ele continua no rodízio! */
                IF idx_correndo < size(rodizio_atual) THEN
                    /* Não era o último, Apenas passamos a vez para o próximo da fila. */
                    idx_correndo := idx_correndo + 1
                ELSE
                    /* Chegou no último da bateria, dá a volta para a próxima rodada! */
                    idx_correndo := 1
                END
	END
    END ;

iniciar_fase_disputa =
    PRE 
    	fase_atual = classificacao
        & rodizio_atual = []
        & size ( fila_geral ) = 0
        & size(fila_disputa_atual) > 0 
    THEN
        /* Como a lista já foi montada durante a classificatória, basta checar o seu tamanho! */
        fase_atual := disputa
    END ;

correr_boi_disputa ( jj ) =
    PRE 
    	fase_atual = disputa
        & size ( fila_disputa_atual ) > 0
        & jj : JULGAMENTO
        /* TRAVA: É OBRIGATÓRIO que a senha chamada já esteja na pista! */
        & estado_senha ( fila_disputa_atual ( 1 ) ) = na_pista
    THEN
        processar_resultado_disputa ( jj )
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
            (size(fila_disputa_proxima) > 0 & 
             #(xx, yy) . (
                xx : dom(estado_senha) & yy : dom(estado_senha) & 
                xx /= yy & 
                estado_senha(xx) = classificada & estado_senha(yy) = classificada &
                xx : dom(dono_senha) & yy : dom(dono_senha) & dono_senha(xx) /= dono_senha(yy)
             )
            )
            or
            /* NINGUÉM passou (todos tiraram zero_boi). A rodada vai reiniciar. */
            (size(fila_disputa_proxima) = 0 & size(eliminados_nesta_rodada) > 1)
        )
    THEN
        avancar_rodada_disputa
    END ;
    
finalizar_sem_vencedor =
    PRE 
        /* Garante que a fase de classificação acabou e todos correram */
        fase_atual = classificacao 
        & rodizio_atual = [] 
        & size(fila_geral) = 0 
        & ultimo_rodizio_iniciado = TRUE
        /* Garante que NINGUÉM se classificou para a disputa */
        & size(fila_disputa_atual) = 0
    THEN
        fase_atual := encerrado
    END;

rachar_premio =
    PRE 
        fase_atual = disputa 
        & na_pista /: ran(estado_senha) 
	& size(fila_disputa_atual) = 0 
	/* Só permite rachar se houver senhas classificadas de vaqueiros diferentes */
	& #(xx, yy) . (
            xx : dom(estado_senha) & yy : dom(estado_senha) & 
            xx /= yy & 
            estado_senha(xx) = classificada & estado_senha(yy) = classificada &
            /* Trava de segurança: */
            xx : dom(dono_senha) & yy : dom(dono_senha) & dono_senha(xx) /= dono_senha(yy)
        ) 
    THEN
        fase_atual := encerrado || finalizar_torneio
    END;

declarar_campeao_unico =
    PRE 
        fase_atual = disputa 
        & na_pista /: ran(estado_senha) 
        & size(fila_disputa_atual) = 0 
        /* Existe um vaqueiro que é dono de todas as senhas classificadas restantes */
        & #(vv) . (
            vv : VAQUEIROS &
            /* 1. Garante que existe pelo menos uma senha classificada (para não dar falso positivo) */
            #(xx) . (xx : dom(estado_senha) & estado_senha(xx) = classificada) &
            /* 2. Garante que qualquer senha classificada obrigatoriamente pertence a 'vv' */
            !(yy) . (yy : dom(estado_senha) & yy : dom(dono_senha) & estado_senha(yy) = classificada => dono_senha(yy) = vv)
        ) 
    THEN
        fase_atual := encerrado 
        || finalizar_torneio
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

    res <-- consultar_bois_derrubados(ss) =
    PRE
        ss : NAT1 &
        ss : dom(bois_corridos)
    THEN
        res := bois_corridos(ss)
    END
END
