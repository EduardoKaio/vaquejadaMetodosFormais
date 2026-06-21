#ifndef _Contexto_Vaquejada_h
#define _Contexto_Vaquejada_h

#include <stdint.h>
#include <stdbool.h>
#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */
typedef enum
{
    Contexto_Vaquejada__classificacao,
    Contexto_Vaquejada__disputa,
    Contexto_Vaquejada__encerrado
    
} Contexto_Vaquejada__FASES;
#define Contexto_Vaquejada__FASES__max 3
typedef enum
{
    Contexto_Vaquejada__na_espera,
    Contexto_Vaquejada__na_pista,
    Contexto_Vaquejada__classificada,
    Contexto_Vaquejada__eliminada,
    Contexto_Vaquejada__campea
    
} Contexto_Vaquejada__STATUS_SENHA;
#define Contexto_Vaquejada__STATUS_SENHA__max 5
typedef enum
{
    Contexto_Vaquejada__valeu_boi,
    Contexto_Vaquejada__zero_boi,
    Contexto_Vaquejada__retorno
    
} Contexto_Vaquejada__JULGAMENTO;
#define Contexto_Vaquejada__JULGAMENTO__max 3

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
#define Contexto_Vaquejada__TOTAL_SENHAS 20
#define Contexto_Vaquejada__LIMITE_SENHAS_VAQUEIRO 4
#define Contexto_Vaquejada__BOIS_PARA_CLASSIFICAR 2
typedef int Contexto_Vaquejada__VAQUEIROS;
typedef int Contexto_Vaquejada__SENHAS;
#define Contexto_Vaquejada__TAMANHO_RODIZIO 4
#define Contexto_Vaquejada__PREMIO_TOTAL 10000
/* Array and record constants */








/* Clause CONCRETE_VARIABLES */

extern void Contexto_Vaquejada__INITIALISATION(void);


#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Contexto_Vaquejada_h */
