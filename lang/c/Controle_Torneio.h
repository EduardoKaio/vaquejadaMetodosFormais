#ifndef _Controle_Torneio_h
#define _Controle_Torneio_h

#include <stdint.h>
#include <stdbool.h>
#include <string.h>
/* Clause SEES */
#include "Contexto_Vaquejada.h"

/* Clause INCLUDES */
#include "Gerenciador_Senhas.h"

/* Clause IMPORTS */
#include "Gerenciador_Senhas.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */

/* Clause CONCRETE_VARIABLES */

extern void Controle_Torneio__INITIALISATION(void);

/* Clause OPERATIONS */

extern void Controle_Torneio__comprar_senha(int32_t vv, int32_t ss);
extern void Controle_Torneio__desistir_senha(int32_t ss);
extern void Controle_Torneio__transferir_senha(int32_t ss, int32_t novo_vaqueiro);
extern void Controle_Torneio__iniciar_rodizio(void);
extern void Controle_Torneio__iniciar_ultimo_rodizio(void);
extern void Controle_Torneio__chamar_para_pista(int32_t ss);
extern void Controle_Torneio__correr_boi_classificacao(int32_t ss, Contexto_Vaquejada__JULGAMENTO jj);
extern void Controle_Torneio__iniciar_fase_disputa(void);
extern void Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__JULGAMENTO jj);
extern void Controle_Torneio__iniciar_nova_rodada_disputa(void);
extern void Controle_Torneio__finalizar_sem_vencedor(void);
extern void Controle_Torneio__rachar_sem_finalizar(void);
extern void Controle_Torneio__rachar_premio(void);
extern void Controle_Torneio__declarar_campeao_unico(void);
extern void Controle_Torneio__observar_torneio_encerrado(void);
extern void Controle_Torneio__consultar_status_senha(int32_t ss, Contexto_Vaquejada__STATUS_SENHA *res);
extern void Controle_Torneio__consultar_dono(int32_t ss, int32_t *res);
extern void Controle_Torneio__total_senhas_vendidas(int32_t *res);
extern void Controle_Torneio__consultar_bois_derrubados(int32_t ss, int32_t *res);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Controle_Torneio_h */
