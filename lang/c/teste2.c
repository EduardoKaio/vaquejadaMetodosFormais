/*
 * teste2.c - Classificatoria: todas as senhas passam
 *
 * Cobre: iniciar_ultimo_rodizio, chamar_para_pista,
 *        correr_boi_classificacao (valeu_boi e zero_boi),
 *        consultar_status_senha, consultar_bois_derrubados
 *
 * Cenario:
 *   - 4 senhas compradas (V1->S1, V2->S2, V3->S3, V3->S4 -- so existem
 *     3 vaqueiros, entao S3 e S4 ficam com o mesmo dono)
 *   - Rodizio iniciado com todas as 4
 *   - S1 e S2: dois valeu_boi -> classificadas
 *   - S3: zero_boi na primeira corrida -> eliminada
 *   - S4: um valeu_boi + zero_boi -> eliminada (nao atingiu
 * BOIS_PARA_CLASSIFICAR)
 *   - Verificar status final de cada senha
 *
 * IMPORTANTE: cada senha so pode ser chamada quando esta de fato na
 * posicao idx_correndo do rodizio. Por isso a segunda volta de cada
 * senha (o segundo valeu_boi) so acontece depois que todas passaram
 * pela primeira volta, na ordem real da fila.
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

void executar_teste_2(void) {
  printf("\n========================================\n");
  printf(" TESTE 2: Fase de Classificatoria\n");
  printf("========================================\n");

  Controle_Torneio__INITIALISATION();

  /* Comprar 4 senhas (apenas vaqueiros 1..3 existem) */
  Controle_Torneio__comprar_senha(1, 1);
  Controle_Torneio__comprar_senha(2, 2);
  Controle_Torneio__comprar_senha(3, 3);
  Controle_Torneio__comprar_senha(3, 4);

  int total_s;
  Controle_Torneio__total_senhas_vendidas(&total_s);
  checar("4 senhas compradas", total_s == 4);

  /* Iniciar rodizio (ultimo, para que todas 4 entrem de uma vez) */
  Controle_Torneio__iniciar_ultimo_rodizio();

  /* --- Primeira volta do rodizio: cada senha corre uma vez, na ordem --- */

  Controle_Torneio__chamar_para_pista(1);
  Contexto_Vaquejada__STATUS_SENHA st;
  Controle_Torneio__consultar_status_senha(1, &st);
  checar("Senha 1 esta na_pista apos chamar_para_pista",
         st == Contexto_Vaquejada__na_pista);

  Controle_Torneio__correr_boi_classificacao(1, Contexto_Vaquejada__valeu_boi);
  int bois;
  Controle_Torneio__consultar_bois_derrubados(1, &bois);
  checar("Senha 1: 1 boi corrido apos primeiro valeu", bois == 1);

  Controle_Torneio__consultar_status_senha(1, &st);
  checar("Senha 1 ainda na_espera (precisa de 2 bois)",
         st == Contexto_Vaquejada__na_espera);

  Controle_Torneio__chamar_para_pista(2);
  Controle_Torneio__correr_boi_classificacao(2, Contexto_Vaquejada__valeu_boi);

  /* Senha 3: zero_boi imediato -> eliminada */
  Controle_Torneio__chamar_para_pista(3);
  Controle_Torneio__correr_boi_classificacao(3, Contexto_Vaquejada__zero_boi);
  Controle_Torneio__consultar_status_senha(3, &st);
  checar("Senha 3 eliminada apos zero_boi",
         st == Contexto_Vaquejada__eliminada);

  Controle_Torneio__consultar_bois_derrubados(3, &bois);
  checar("Senha 3: 0 bois corridos (zero_boi nao conta)", bois == 0);

  Controle_Torneio__chamar_para_pista(4);
  Controle_Torneio__correr_boi_classificacao(4, Contexto_Vaquejada__valeu_boi);
  Controle_Torneio__consultar_status_senha(4, &st);
  checar("Senha 4 na_espera apos 1 valeu_boi (falta 1)",
         st == Contexto_Vaquejada__na_espera);

  /* --- Segunda volta: so restam S1, S2 e S4 (S3 ja foi eliminada) --- */

  Controle_Torneio__chamar_para_pista(1);
  Controle_Torneio__correr_boi_classificacao(1, Contexto_Vaquejada__valeu_boi);
  Controle_Torneio__consultar_status_senha(1, &st);
  checar("Senha 1 classificada apos 2 valeu_boi",
         st == Contexto_Vaquejada__classificada);

  Controle_Torneio__consultar_bois_derrubados(1, &bois);
  checar("Senha 1: 2 bois corridos no total", bois == 2);

  Controle_Torneio__chamar_para_pista(2);
  Controle_Torneio__correr_boi_classificacao(2, Contexto_Vaquejada__valeu_boi);
  Controle_Torneio__consultar_status_senha(2, &st);
  checar("Senha 2 classificada apos 2 valeu_boi",
         st == Contexto_Vaquejada__classificada);

  /* --- Senha 4: zero_boi -> eliminada (nao atingiu BOIS_PARA_CLASSIFICAR) --- */
  Controle_Torneio__chamar_para_pista(4);
  Controle_Torneio__correr_boi_classificacao(4, Contexto_Vaquejada__zero_boi);
  Controle_Torneio__consultar_status_senha(4, &st);
  checar("Senha 4 eliminada apos zero_boi subsequente",
         st == Contexto_Vaquejada__eliminada);

  /* --- Verificar transicao para disputa --- */
  Controle_Torneio__iniciar_fase_disputa();

  /* Iniciar rodada - S1 e S2 devem estar na fila de disputa */
  Controle_Torneio__iniciar_nova_rodada_disputa();
  Controle_Torneio__chamar_para_pista(1);
  Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__valeu_boi);
  Controle_Torneio__chamar_para_pista(2);
  Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__zero_boi);

  Controle_Torneio__consultar_status_senha(1, &st);
  checar("Senha 1 classificada na disputa apos valeu_boi",
         st == Contexto_Vaquejada__classificada);

  Controle_Torneio__consultar_status_senha(2, &st);
  checar("Senha 2 eliminada na disputa apos zero_boi",
         st == Contexto_Vaquejada__eliminada);

  /* Declarar campeao */
  Controle_Torneio__declarar_campeao_unico();
  Controle_Torneio__consultar_status_senha(1, &st);
  checar("Senha 1 campea apos declarar_campeao_unico",
         st == Contexto_Vaquejada__campea);

  printf("\nTeste 2: %d/%d verificacoes passaram.\n", total - falhas, total);
  falhas = 0;
  total = 0;
}