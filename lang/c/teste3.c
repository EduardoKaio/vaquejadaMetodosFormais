/*
 * teste3.c - Disputa com rachar_premio (empate / divisao de premio)
 *
 * Cobre: iniciar_ultimo_rodizio, iniciar_fase_disputa,
 *        iniciar_nova_rodada_disputa, correr_boi_disputa,
 *        rachar_premio, consultar_status_senha
 *
 * Cenario:
 *   - 3 senhas entram na classificatoria e todas se classificam
 *   - Na disputa, todas as senhas sobreviventes recebem valeu_boi
 *     em todas as rodadas ate que nenhuma seja eliminada
 *   - Apos varias rodadas sem eliminacao, chama-se rachar_premio:
 *     o premio e dividido igualmente entre as senhas ainda classificadas
 *   - Verificar que todas ficam com status campea apos rachar_premio
 *
 * IMPORTANTE: na classificatoria, cada senha so pode ser chamada quando
 * esta de fato na posicao idx_correndo -- por isso a segunda volta de
 * valeu_boi de cada senha vem depois que todas passaram pela primeira,
 * seguindo a ordem real do rodizio.
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

void executar_teste_3(void) {
    printf("\n========================================\n");
    printf(" TESTE 3: Disputa com rachar_premio\n");
    printf("========================================\n");

    Controle_Torneio__INITIALISATION();

    /* 3 vaqueiros, 3 senhas */
    Controle_Torneio__comprar_senha(1, 1);
    Controle_Torneio__comprar_senha(2, 2);
    Controle_Torneio__comprar_senha(3, 3);

    /* Classificatoria: todas as 3 se classificam (2 valeu_boi cada) */
    Controle_Torneio__iniciar_ultimo_rodizio();

    /* Primeira volta: S1, S2, S3 correm uma vez cada, na ordem do rodizio */
    Controle_Torneio__chamar_para_pista(1);
    Controle_Torneio__correr_boi_classificacao(1, Contexto_Vaquejada__valeu_boi);
    Controle_Torneio__chamar_para_pista(2);
    Controle_Torneio__correr_boi_classificacao(2, Contexto_Vaquejada__valeu_boi);
    Controle_Torneio__chamar_para_pista(3);
    Controle_Torneio__correr_boi_classificacao(3, Contexto_Vaquejada__valeu_boi);

    /* Segunda volta: mesma ordem, agora todas classificam */
    Controle_Torneio__chamar_para_pista(1);
    Controle_Torneio__correr_boi_classificacao(1, Contexto_Vaquejada__valeu_boi);
    Controle_Torneio__chamar_para_pista(2);
    Controle_Torneio__correr_boi_classificacao(2, Contexto_Vaquejada__valeu_boi);
    Controle_Torneio__chamar_para_pista(3);
    Controle_Torneio__correr_boi_classificacao(3, Contexto_Vaquejada__valeu_boi);

    Contexto_Vaquejada__STATUS_SENHA st;
    Controle_Torneio__consultar_status_senha(1, &st);
    checar("Senha 1 classificada", st == Contexto_Vaquejada__classificada);
    Controle_Torneio__consultar_status_senha(2, &st);
    checar("Senha 2 classificada", st == Contexto_Vaquejada__classificada);
    Controle_Torneio__consultar_status_senha(3, &st);
    checar("Senha 3 classificada", st == Contexto_Vaquejada__classificada);

    /* Transicao para disputa */
    Controle_Torneio__iniciar_fase_disputa();

    /* Rodada 1: todas ganham */
    Controle_Torneio__iniciar_nova_rodada_disputa();
    Controle_Torneio__chamar_para_pista(1);
    Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__valeu_boi);
    Controle_Torneio__chamar_para_pista(2);
    Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__valeu_boi);
    Controle_Torneio__chamar_para_pista(3);
    Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__valeu_boi);

    /* Todas classificadas ainda */
    Controle_Torneio__consultar_status_senha(1, &st);
    checar("Senha 1 ainda classificada apos rodada 1", st == Contexto_Vaquejada__classificada);
    Controle_Torneio__consultar_status_senha(2, &st);
    checar("Senha 2 ainda classificada apos rodada 1", st == Contexto_Vaquejada__classificada);
    Controle_Torneio__consultar_status_senha(3, &st);
    checar("Senha 3 ainda classificada apos rodada 1", st == Contexto_Vaquejada__classificada);

    /* Rodada 2: todas ganham novamente - ainda empatadas */
    Controle_Torneio__iniciar_nova_rodada_disputa();
    Controle_Torneio__chamar_para_pista(1);
    Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__valeu_boi);
    Controle_Torneio__chamar_para_pista(2);
    Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__valeu_boi);
    Controle_Torneio__chamar_para_pista(3);
    Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__valeu_boi);

    /* Decisao: rachar premio entre as 3 senhas */
    Controle_Torneio__rachar_premio();

    /* Todas devem ser campeas */
    Controle_Torneio__consultar_status_senha(1, &st);
    checar("Senha 1 campea apos rachar_premio", st == Contexto_Vaquejada__campea);
    Controle_Torneio__consultar_status_senha(2, &st);
    checar("Senha 2 campea apos rachar_premio", st == Contexto_Vaquejada__campea);
    Controle_Torneio__consultar_status_senha(3, &st);
    checar("Senha 3 campea apos rachar_premio", st == Contexto_Vaquejada__campea);

    /* Nao da pra consultar a senha 4 aqui: ela nunca foi comprada, entao
       nunca teve dono e nunca entrou no dominio de estado_senha (mesma
       razao do ajuste no teste1.c). */

    printf("\nTeste 3: %d/%d verificacoes passaram.\n", total - falhas, total);
    falhas = 0; total = 0;
}