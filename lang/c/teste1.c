/*
 * teste1.c - Gestao de senhas pre-torneio
 *
 * Cobre: comprar_senha, desistir_senha, transferir_senha,
 *        consultar_dono, total_senhas_vendidas, consultar_bois_derrubados
 *
 * Cenario:
 *   - 3 vaqueiros compram senhas (1-6)
 *   - Senha 3 e desistida (cancelada)
 *   - Senha 2 e transferida do vaqueiro 1 para o vaqueiro 3
 *   - Verifica totais, donos e bois corridos (todos zero, torneio nao comeou)
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
void executar_teste_1(void) {
printf("\n========================================\n");
printf(" TESTE 1: Gestao de Senhas Pre-Torneio\n");
printf("========================================\n");
Controle_Torneio__INITIALISATION();
  /* --- Compras --- */
Controle_Torneio__comprar_senha(1, 1); /* V1 -> S1 */
Controle_Torneio__comprar_senha(1, 2); /* V1 -> S2 */
Controle_Torneio__comprar_senha(2, 3); /* V2 -> S3 */
Controle_Torneio__comprar_senha(2, 4); /* V2 -> S4 */
Controle_Torneio__comprar_senha(3, 5); /* V3 -> S5 */
Controle_Torneio__comprar_senha(3, 6); /* V3 -> S6 */
int total_s;
Controle_Torneio__total_senhas_vendidas(&total_s);
checar("Total de senhas vendidas = 6", total_s == 6);
  /* --- Verificar donos iniciais --- */
int dono;
Controle_Torneio__consultar_dono(1, &dono);
checar("Dono da senha 1 = vaqueiro 1", dono == 1);
Controle_Torneio__consultar_dono(2, &dono);
checar("Dono da senha 2 = vaqueiro 1", dono == 1);
Controle_Torneio__consultar_dono(4, &dono);
checar("Dono da senha 4 = vaqueiro 2", dono == 2);
  /* --- Desistencia da senha 3 --- */
Controle_Torneio__desistir_senha(3);
Controle_Torneio__total_senhas_vendidas(&total_s);
checar("Apos desistencia: total = 5", total_s == 5);
  /* Nao da pra consultar o status da senha 3 aqui: sem dono, ela saiu
     do dominio de estado_senha (a PRE de consultar_status_senha exige
     ss:dom(estado_senha), que so vale se a senha tem dono). Em vez
     disso, confirmamos que a senha foi liberada de fato: outro
     vaqueiro consegue compra-la de novo. */
Controle_Torneio__comprar_senha(2, 3);
Controle_Torneio__total_senhas_vendidas(&total_s);
checar("Apos recompra: total volta a 6", total_s == 6);
int dono3;
Controle_Torneio__consultar_dono(3, &dono3);
checar("Senha 3 agora pertence ao vaqueiro 2", dono3 == 2);
  /* --- Transferencia da senha 2: V1 -> V3 --- */
Controle_Torneio__transferir_senha(2, 3);
Controle_Torneio__consultar_dono(2, &dono);
checar("Apos transferencia: dono da senha 2 = vaqueiro 3", dono == 3);
  /* --- Bois corridos iniciais devem ser 0 --- */
int bois;
Controle_Torneio__consultar_bois_derrubados(1, &bois);
checar("Bois corridos da senha 1 = 0 (torneio nao iniciado)", bois == 0);
Controle_Torneio__consultar_bois_derrubados(5, &bois);
checar("Bois corridos da senha 5 = 0 (torneio nao iniciado)", bois == 0);
  /* --- Status inicial das senhas ativas --- */
  Contexto_Vaquejada__STATUS_SENHA st;
Controle_Torneio__consultar_status_senha(1, &st);
checar("Senha 1 esta na_espera antes do torneio",
         st == Contexto_Vaquejada__na_espera);
Controle_Torneio__consultar_status_senha(6, &st);
checar("Senha 6 esta na_espera antes do torneio",
         st == Contexto_Vaquejada__na_espera);
printf("\nTeste 1: %d/%d verificacoes passaram.\n", total - falhas, total);
  falhas = 0;
  total = 0;
}