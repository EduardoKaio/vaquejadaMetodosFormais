/*
 * teste5.c - Encerramento sem vencedor (finalizar_sem_vencedor)
 *
 * Cobre: finalizar_sem_vencedor, consultar_status_senha,
 *        total_senhas_vendidas, iniciar_rodizio (multiplos rodizios)
 *
 * Cenario:
 *   - 6 senhas sao compradas (mais que TAMANHO_RODIZIO=4)
 *   - Primeiro rodizio com 4 senhas: nenhuma se classifica (todas zero_boi)
 *   - Segundo rodizio com as 2 restantes: nenhuma se classifica
 *   - Como nao ha senhas classificadas, o torneio e encerrado sem vencedor
 *   - Verificar que todas as senhas permanecem eliminadas e torneio encerrado
 *
 * Tambem testa a operacao observar_torneio_encerrado (no-op, nao deve crashar).
 *
 * IMPORTANTE: apos S5 receber "retorno", o ponteiro do rodizio avanca
 * para S6 -- por isso S6 precisa ser chamada em seguida (e nao S5 de
 * novo), respeitando a posicao real de idx_correndo.
 */
#include "Contexto_Vaquejada.h"
#include "Controle_Torneio.h"
#include <stdio.h>

static int falhas = 0;
static int total = 0;

static void checar(const char *descricao, int condicao) {
  total++;
  if (condicao) {
    printf("  [OK]  %s\n", descricao);
  } else {
    printf("  [FALHA] %s\n", descricao);
    falhas++;
  }
}

void executar_teste_5(void) {
  printf("\n========================================\n");
  printf(" TESTE 5: Encerramento Sem Vencedor\n");
  printf("========================================\n");

  Controle_Torneio__INITIALISATION();

  /* 3 vaqueiros, 6 senhas (> TAMANHO_RODIZIO=4) */
  Controle_Torneio__comprar_senha(1, 1);
  Controle_Torneio__comprar_senha(1, 2);
  Controle_Torneio__comprar_senha(2, 3);
  Controle_Torneio__comprar_senha(2, 4);
  Controle_Torneio__comprar_senha(3, 5);
  Controle_Torneio__comprar_senha(3, 6);

  int total_s;
  Controle_Torneio__total_senhas_vendidas(&total_s);
  checar("6 senhas compradas", total_s == 6);

  /* Primeiro rodizio: pega as 4 primeiras (S1,S2,S3,S4) */
  Controle_Torneio__iniciar_rodizio();
  printf("  [INFO] 1o rodizio iniciado (S1-S4)\n");

  /* Todas as senhas do 1o rodizio levam zero_boi -> eliminadas */
  Controle_Torneio__chamar_para_pista(1);
  Controle_Torneio__correr_boi_classificacao(1, Contexto_Vaquejada__zero_boi);
  Controle_Torneio__chamar_para_pista(2);
  Controle_Torneio__correr_boi_classificacao(2, Contexto_Vaquejada__zero_boi);
  Controle_Torneio__chamar_para_pista(3);
  Controle_Torneio__correr_boi_classificacao(3, Contexto_Vaquejada__zero_boi);
  Controle_Torneio__chamar_para_pista(4);
  Controle_Torneio__correr_boi_classificacao(4, Contexto_Vaquejada__zero_boi);

  Contexto_Vaquejada__STATUS_SENHA st;
  Controle_Torneio__consultar_status_senha(1, &st);
  checar("S1 eliminada (1o rodizio)", st == Contexto_Vaquejada__eliminada);
  Controle_Torneio__consultar_status_senha(2, &st);
  checar("S2 eliminada (1o rodizio)", st == Contexto_Vaquejada__eliminada);
  Controle_Torneio__consultar_status_senha(3, &st);
  checar("S3 eliminada (1o rodizio)", st == Contexto_Vaquejada__eliminada);
  Controle_Torneio__consultar_status_senha(4, &st);
  checar("S4 eliminada (1o rodizio)", st == Contexto_Vaquejada__eliminada);

  /* Segundo rodizio: S5 e S6 (ultimo rodizio) */
  Controle_Torneio__iniciar_ultimo_rodizio();
  printf("  [INFO] 2o rodizio iniciado (S5-S6, ultimo)\n");

  /* S5: retorno (julgamento neutro) -> na_espera de volta, e o
     ponteiro do rodizio avanca para S6 */
  Controle_Torneio__chamar_para_pista(5);
  Controle_Torneio__correr_boi_classificacao(5, Contexto_Vaquejada__retorno);
  Controle_Torneio__consultar_status_senha(5, &st);
  checar("S5 em na_espera apos retorno", st == Contexto_Vaquejada__na_espera);

  /* S6 e quem esta de fato na vez agora (idx_correndo avancou) */
  Controle_Torneio__chamar_para_pista(6);
  Controle_Torneio__correr_boi_classificacao(6, Contexto_Vaquejada__zero_boi);
  Controle_Torneio__consultar_status_senha(6, &st);
  checar("S6 eliminada (2o rodizio)", st == Contexto_Vaquejada__eliminada);

  /* Com S6 fora, o rodizio volta pra S5 */
  Controle_Torneio__chamar_para_pista(5);
  Controle_Torneio__correr_boi_classificacao(5, Contexto_Vaquejada__zero_boi);
  Controle_Torneio__consultar_status_senha(5, &st);
  checar("S5 eliminada apos zero_boi", st == Contexto_Vaquejada__eliminada);

  /* Nenhuma senha se classificou -> encerrar sem vencedor */
  Controle_Torneio__finalizar_sem_vencedor();
  printf("  [INFO] finalizar_sem_vencedor chamado\n");

  /* Verificar que senhas ainda permanecem eliminadas (nao viraram campeas) */
  Controle_Torneio__consultar_status_senha(1, &st);
  checar("S1 permanece eliminada apos finalizar_sem_vencedor",
         st == Contexto_Vaquejada__eliminada);
  Controle_Torneio__consultar_status_senha(6, &st);
  checar("S6 permanece eliminada apos finalizar_sem_vencedor",
         st == Contexto_Vaquejada__eliminada);

  /* observar_torneio_encerrado nao deve causar crash (no-op) */
  Controle_Torneio__observar_torneio_encerrado();
  checar("observar_torneio_encerrado executou sem falhas (no-op)", 1);

  printf("\nTeste 5: %d/%d verificacoes passaram.\n", total - falhas, total);
  falhas = 0;
  total = 0;
}