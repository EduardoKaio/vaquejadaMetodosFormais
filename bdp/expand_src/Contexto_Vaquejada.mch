MACHINE
    Contexto_Vaquejada

SETS
    FASES = { classificacao , disputa , encerrado } ;
    STATUS_SENHA = { na_espera , na_pista , classificada , eliminada , campea } ;
    JULGAMENTO = { valeu_boi , zero_boi , retorno }

CONCRETE_CONSTANTS
    TOTAL_SENHAS
    , LIMITE_SENHAS_VAQUEIRO
    , BOIS_PARA_CLASSIFICAR
    , VAQUEIROS
    , SENHAS
    , TAMANHO_RODIZIO
    , PREMIO_TOTAL

PROPERTIES
    TOTAL_SENHAS : NAT1
    & TOTAL_SENHAS = 20

    & LIMITE_SENHAS_VAQUEIRO : NAT1
    & LIMITE_SENHAS_VAQUEIRO = max ( { 1 , TOTAL_SENHAS / 5 } )

    & BOIS_PARA_CLASSIFICAR : NAT1
    & BOIS_PARA_CLASSIFICAR = 2

    & TAMANHO_RODIZIO : NAT1
    & TAMANHO_RODIZIO = 4

    & VAQUEIROS <: NAT1
    & VAQUEIROS = 1 .. 3

    & SENHAS <: NAT1
    & SENHAS = 1 .. TOTAL_SENHAS

    & PREMIO_TOTAL : NAT1
    & PREMIO_TOTAL = 10000

END
