/* Contexto_Vaquejada
 * Author: kaio
 * Creation date: 25/04/2026
 */
MACHINE
    Contexto_Vaquejada

SETS
    VAQUEIROS ;
    SENHAS ;
    FASES = { classificacao , disputa , encerrado } ;
    STATUS_SENHA = { na_espera , na_pista , classificada , eliminada , campea } ;
    JULGAMENTO = { valeu_boi , zero_boi }

CONCRETE_CONSTANTS
    LIMITE_SENHAS ,
    BOIS_PARA_CLASSIFICAR

PROPERTIES
    LIMITE_SENHAS : NAT1 &
    LIMITE_SENHAS = 100 & /* Exemplo de limite */
    BOIS_PARA_CLASSIFICAR : NAT1 &
    BOIS_PARA_CLASSIFICAR = 3
END
