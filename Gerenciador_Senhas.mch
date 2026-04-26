/* Gerenciador_Senhas
 * Author: kaio
 * Creation date: 25/04/2026
 */
MACHINE
    Gerenciador_Senhas

SEES
    Contexto_Vaquejada

VARIABLES
    dono_senha,
    estado_senha,
    bois_corridos

INVARIANT
    /* Tipagem básica */
    dono_senha : SENHAS +-> VAQUEIROS &
    estado_senha : SENHAS +-> STATUS_SENHA &
    bois_corridos : SENHAS +-> NAT &
    
    /* Sincronia de domínios: Quem tem dono, tem status e contador */
    dom(estado_senha) = dom(dono_senha) &
    dom(bois_corridos) = dom(dono_senha) &
    
    /* Limite máximo do torneio */
    card(dom(dono_senha)) <= LIMITE_SENHAS &
    
    /* Regra rígida: Senha classificada OBRIGATORIAMENTE tem a quantidade certa de bois corridos */
    !(ss).(ss : dom(estado_senha) & estado_senha(ss) = classificada => bois_corridos(ss) = BOIS_PARA_CLASSIFICAR)

INITIALISATION
    dono_senha := {} ||
    estado_senha := {} ||
    bois_corridos := {}

OPERATIONS
    /* Operações de mutação de baixo nível (CRUD) */
    
    cadastrar_senha(vv, ss) =
    PRE
        vv : VAQUEIROS &
        ss : SENHAS &
        ss /: dom(dono_senha) &
        card(dom(dono_senha)) < LIMITE_SENHAS
    THEN
        dono_senha(ss) := vv ||
        estado_senha(ss) := na_espera ||
        bois_corridos(ss) := 0
    END;

    atualizar_status(ss, novo_status) =
    PRE
        ss : dom(estado_senha) &
        novo_status : STATUS_SENHA
    THEN
        estado_senha(ss) := novo_status
    END;

    registrar_valeu_boi(ss, novo_status) =
    PRE
        ss : dom(estado_senha) &
        ss : dom(bois_corridos) &
        bois_corridos(ss) < BOIS_PARA_CLASSIFICAR &
        novo_status : STATUS_SENHA
    THEN
        bois_corridos(ss) := bois_corridos(ss) + 1 ||
        estado_senha(ss) := novo_status
    END;

    incrementar_boi(ss) =
    PRE
        ss : dom(bois_corridos) &
        bois_corridos(ss) < BOIS_PARA_CLASSIFICAR
    THEN
        bois_corridos(ss) := bois_corridos(ss) + 1
    END
END
