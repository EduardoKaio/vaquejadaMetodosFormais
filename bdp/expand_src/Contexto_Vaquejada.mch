MACHINE
    Contexto_Vaquejada

SETS
    FASES = { classificacao , disputa , encerrado } ;
    STATUS_SENHA = { na_espera , na_pista , classificada , eliminada , campea } ;
    JULGAMENTO = { valeu_boi , zero_boi , retorno } ;
    CATEGORIAS = { profissional , amador }

CONCRETE_CONSTANTS
    LIMITE_SENHAS ,
    BOIS_PARA_CLASSIFICAR ,
    VAQUEIROS ,
    SENHAS

PROPERTIES
    LIMITE_SENHAS : NAT1 &
    LIMITE_SENHAS = 100 &
    BOIS_PARA_CLASSIFICAR : NAT1 &
    BOIS_PARA_CLASSIFICAR = 3 &

    VAQUEIROS = NAT1 &
    SENHAS = NAT1
END
