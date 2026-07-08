/*
 * teste4.c - Disputa com rachar_sem_finalizar (disputa continua)
 *
 * Cobre: rachar_sem_finalizar, correr_boi_disputa (com zero_boi
 *        durante racha), iniciar_nova_rodada_disputa apos racha,
 *        declarar_campeao_unico ao final
 *
 * Cenario:
 *   - 4 senhas entram na classificatoria: V1->S1, V2->S2, V2->S3, V3->S4
 *   - S1, S3 e S4 se classificam (uma por vaqueiro distinto); S2 e
 *     eliminada na classificatoria
 *   - Na disputa, apos uma rodada em que todas sobrevivem, chama-se
 *     rachar_sem_finalizar -- a PRE dessa operacao exige 3 senhas
 *     classificadas de 3 vaqueiros DISTINTOS, por isso o cenario precisa
 *     dos 3 vaqueiros representados (S1/V1, S3/V2, S4/V3), nao so 2
 *   - Continua a disputa: S3 e S4 caem com zero_boi (recebendo a cota
 *     parcial do premio), S1 e declarada campea
 *
 * IMPORTANTE: as chamadas de classificacao seguem a ordem real do
 * rodizio (idx_correndo) -- ver comentario no teste2.c/teste3.c.
 */
#include <stdio.h>
#include "Controle_Torneio.h"
#include "Contexto_Vaquejada.h"

static int falhas = 0;
static int total  = 0;

static void checar(const char *descricao, int condicao) {
    total++;
    if (condicao) {
        printf("  [OK]  %s\n", descricao);
    } else {
        printf("  [FALHA] %s\n", descricao);
        falhas++;
    }
}

void executar_teste_4(void) {
    printf("\n========================================\n");
    printf(" TESTE 4: Disputa com rachar_sem_finalizar\n");
    printf("========================================\n");

    Controle_Torneio__INITIALISATION();

    /* V1 -> S1 | V2 -> S2, S3 | V3 -> S4 */
    Controle_Torneio__comprar_senha(1, 1);
    Controle_Torneio__comprar_senha(2, 2);
    Controle_Torneio__comprar_senha(2, 3);
    Controle_Torneio__comprar_senha(3, 4);

    /* Classificatoria */
    Controle_Torneio__iniciar_ultimo_rodizio();

    /* Primeira volta: S1, S2, S3, S4 correm uma vez cada */
    Controle_Torneio__chamar_para_pista(1);
    Controle_Torneio__correr_boi_classificacao(1, Contexto_Vaquejada__valeu_boi);

    Controle_Torneio__chamar_para_pista(2);
    Controle_Torneio__correr_boi_classificacao(2, Contexto_Vaquejada__zero_boi);

    Controle_Torneio__chamar_para_pista(3);
    Controle_Torneio__correr_boi_classificacao(3, Contexto_Vaquejada__valeu_boi);

    Controle_Torneio__chamar_para_pista(4);
    Controle_Torneio__correr_boi_classificacao(4, Contexto_Vaquejada__valeu_boi);

    /* Segunda volta: so restam S1, S3, S4 (S2 ja foi eliminada) */
    Controle_Torneio__chamar_para_pista(1);
    Controle_Torneio__correr_boi_classificacao(1, Contexto_Vaquejada__valeu_boi);

    Controle_Torneio__chamar_para_pista(3);
    Controle_Torneio__correr_boi_classificacao(3, Contexto_Vaquejada__valeu_boi);

    Controle_Torneio__chamar_para_pista(4);
    Controle_Torneio__correr_boi_classificacao(4, Contexto_Vaquejada__valeu_boi);

    Contexto_Vaquejada__STATUS_SENHA st;
    Controle_Torneio__consultar_status_senha(1, &st);
    checar("S1 classificada", st == Contexto_Vaquejada__classificada);
    Controle_Torneio__consultar_status_senha(2, &st);
    checar("S2 eliminada na classificatoria", st == Contexto_Vaquejada__eliminada);
    Controle_Torneio__consultar_status_senha(3, &st);
    checar("S3 classificada", st == Contexto_Vaquejada__classificada);
    Controle_Torneio__consultar_status_senha(4, &st);
    checar("S4 classificada", st == Contexto_Vaquejada__classificada);

    /* Disputa */
    Controle_Torneio__iniciar_fase_disputa();

    /* Rodada 1: S1, S3, S4 valeu -> todas avancam, 3 vaqueiros representados */
    Controle_Torneio__iniciar_nova_rodada_disputa();
    Controle_Torneio__chamar_para_pista(1);
    Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__valeu_boi);
    Controle_Torneio__chamar_para_pista(3);
    Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__valeu_boi);
    Controle_Torneio__chamar_para_pista(4);
    Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__valeu_boi);

    /* Acionar rachar_sem_finalizar: exige 3 senhas classificadas de 3
       vaqueiros distintos -- S1/V1, S3/V2, S4/V3 satisfazem a PRE */
    Controle_Torneio__rachar_sem_finalizar();
    printf("  [INFO] rachar_sem_finalizar acionado com S1, S3 e S4 na disputa\n");

    /* Rodada 2 (pos-racha): S1 valeu, S3 e S4 zero -> ambas eliminadas,
       cada uma recebendo a cota parcial do premio */
    Controle_Torneio__iniciar_nova_rodada_disputa();
    Controle_Torneio__chamar_para_pista(1);
    Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__valeu_boi);
    Controle_Torneio__chamar_para_pista(3);
    Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__zero_boi);
    Controle_Torneio__chamar_para_pista(4);
    Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__zero_boi);

    Controle_Torneio__consultar_status_senha(1, &st);
    checar("S1 classificada na disputa apos zero_boi de S3 e S4", st == Contexto_Vaquejada__classificada);
    Controle_Torneio__consultar_status_senha(3, &st);
    checar("S3 eliminada na disputa apos zero_boi (pos-racha)", st == Contexto_Vaquejada__eliminada);
    Controle_Torneio__consultar_status_senha(4, &st);
    checar("S4 eliminada na disputa apos zero_boi (pos-racha)", st == Contexto_Vaquejada__eliminada);

    /* Sobrou apenas S1 -> declarar campeao */
    Controle_Torneio__declarar_campeao_unico();
    Controle_Torneio__consultar_status_senha(1, &st);
    checar("S1 campea apos declarar_campeao_unico", st == Contexto_Vaquejada__campea);

    printf("\nTeste 4: %d/%d verificacoes passaram.\n", total - falhas, total);
    falhas = 0; total = 0;
}