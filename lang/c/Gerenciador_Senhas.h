#ifndef _Gerenciador_Senhas_h
#define _Gerenciador_Senhas_h

#include <stdint.h>
#include <stdbool.h>
/* Clause SEES */
#include "Contexto_Vaquejada.h"

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */


/* Clause SETS */

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */
/* Array and record constants */

/* Clause CONCRETE_VARIABLES */

extern void Gerenciador_Senhas__INITIALISATION(void);

/* Clause OPERATIONS */

extern void Gerenciador_Senhas__cadastrar_senha(int32_t vv, int32_t ss, bool torneio_comecou, int32_t ultima_senha);
extern void Gerenciador_Senhas__atualizar_status(int32_t ss, Contexto_Vaquejada__STATUS_SENHA novo_status);
extern void Gerenciador_Senhas__cancelar_registro_senha(int32_t ss);
extern void Gerenciador_Senhas__atualizar_dono(int32_t ss, int32_t novo_vaqueiro);
extern void Gerenciador_Senhas__extrair_lote_rodizio(void);
extern void Gerenciador_Senhas__registrar_julgamento_classificacao(int32_t ss, Contexto_Vaquejada__JULGAMENTO jj);
extern void Gerenciador_Senhas__processar_resultado_disputa(Contexto_Vaquejada__JULGAMENTO jj);
extern void Gerenciador_Senhas__avancar_rodada_disputa(void);
extern void Gerenciador_Senhas__finalizar_torneio(void);
extern void Gerenciador_Senhas__consultar_lote_saida(int32_t ii, int32_t *val);
extern void Gerenciador_Senhas__consultar_tamanho_lote_saida(int32_t *tam);
extern void Gerenciador_Senhas__get_estado_senha(int32_t ss, Contexto_Vaquejada__STATUS_SENHA *st);
extern void Gerenciador_Senhas__get_dono_senha(int32_t ss, int32_t *vq);
extern void Gerenciador_Senhas__get_bois_corridos(int32_t ss, int32_t *bc);
extern void Gerenciador_Senhas__get_primeiro_fila_disputa(int32_t *ss);

#ifdef __cplusplus
}
#endif /* __cplusplus */


#endif /* _Gerenciador_Senhas_h */
