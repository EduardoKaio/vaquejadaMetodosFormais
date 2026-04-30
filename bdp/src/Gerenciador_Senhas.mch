MACHINE
    Gerenciador_Senhas

SEES
    Contexto_Vaquejada

ABSTRACT_VARIABLES
    dono_senha ,
    estado_senha ,
    bois_corridos ,
    categoria_vaqueiro /* NOVA: Mapeia o vaqueiro a uma categoria única */

INVARIANT
    dono_senha : SENHAS +-> VAQUEIROS &
    estado_senha : SENHAS +-> STATUS_SENHA &
    bois_corridos : SENHAS +-> NAT &
    categoria_vaqueiro : VAQUEIROS +-> CATEGORIAS &

    dom ( estado_senha ) = dom ( dono_senha ) &
    dom ( bois_corridos ) = dom ( dono_senha ) &

    /* NOVO: Todo dono de senha deve ter uma categoria definida */
    ran ( dono_senha ) <: dom ( categoria_vaqueiro ) &

    card ( dom ( dono_senha ) ) <= LIMITE_SENHAS &

    ! ( ss ) . ( ss : dom ( estado_senha ) & estado_senha ( ss ) = classificada => bois_corridos ( ss ) = BOIS_PARA_CLASSIFICAR )

INITIALISATION
    dono_senha := {} ||
    estado_senha := {} ||
    bois_corridos := {} ||
    categoria_vaqueiro := {}

OPERATIONS
    /* NOVA: Agora recebe a categoria no momento da compra */
    cadastrar_senha ( vv , ss , cat ) =
    PRE
        vv : NAT1 & ss : NAT1 & cat : CATEGORIAS &
        ss /: dom ( dono_senha ) &
        card ( dom ( dono_senha ) ) < LIMITE_SENHAS &
        /* Se o vaqueiro já tem cadastro, a categoria informada DEVE ser igual à dele */
        ( vv : dom ( categoria_vaqueiro ) => categoria_vaqueiro ( vv ) = cat )
    THEN
        dono_senha ( ss ) := vv ||
        estado_senha ( ss ) := na_espera ||
        bois_corridos ( ss ) := 0 ||
        categoria_vaqueiro ( vv ) := cat
    END ;

    atualizar_status ( ss , novo_status ) =
    PRE
        ss : NAT1 &
        ss : dom ( estado_senha ) &
        novo_status : STATUS_SENHA
    THEN
        estado_senha ( ss ) := novo_status
    END ;

    /* NOVA: Garante que a transferência mantém a integridade das categorias */
    atualizar_dono ( ss , novo_vaqueiro , cat ) =
    PRE
        ss : NAT1 & novo_vaqueiro : NAT1 & cat : CATEGORIAS &
        ss : dom ( dono_senha ) &
        cat = categoria_vaqueiro ( dono_senha ( ss ) ) & /* Pega a categoria atual da senha */
        /* O novo vaqueiro não pode ser de outra categoria */
        ( novo_vaqueiro : dom ( categoria_vaqueiro ) => categoria_vaqueiro ( novo_vaqueiro ) = cat )
    THEN
        dono_senha ( ss ) := novo_vaqueiro ||
        categoria_vaqueiro ( novo_vaqueiro ) := cat
    END ;

    registrar_valeu_boi ( ss , novo_status ) =
    PRE
        ss : NAT1 &
        ss : dom ( estado_senha ) &
        ss : dom ( bois_corridos ) &
        bois_corridos ( ss ) < BOIS_PARA_CLASSIFICAR &
        novo_status : STATUS_SENHA
    THEN
        bois_corridos ( ss ) := bois_corridos ( ss ) + 1 ||
        estado_senha ( ss ) := novo_status
    END ;

    incrementar_boi ( ss ) =
    PRE
        ss : NAT1 &
        ss : dom ( bois_corridos ) &
        bois_corridos ( ss ) < BOIS_PARA_CLASSIFICAR
    THEN
        bois_corridos ( ss ) := bois_corridos ( ss ) + 1
    END ;

    preparar_disputa =
    BEGIN
        estado_senha := estado_senha <+ ( dom ( estado_senha |> { classificada } ) * { na_espera } )
    END ;

    finalizar_torneio =
    BEGIN
        estado_senha := estado_senha <+ ( dom ( estado_senha |> { na_espera } ) * { campea } )
    END
END
