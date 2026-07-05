#include <stdio.h>
#include <stdbool.h>
#include "Contexto_Vaquejada.h"
#include "Gerenciador_Senhas.h"
#include "Controle_Torneio.h"
#include "testes.h"

/* =========================================================
 * Separador visual entre testes
 * ========================================================= */
static void separador(void) {
    printf("\n########################################\n");
    printf("#          PROXIMO TESTE               #\n");
    printf("########################################\n");
}

/* =========================================================
 * main - runner de testes do sistema de vaquejada
 *
 * Cada funcao executar_teste_N() e definida em testeN.c e
 * cobre um cenario diferente do torneio, com verificacoes
 * explicitas de pre e pos-condicoes.
 * ========================================================= */
int main(void) {
    printf("##########################################\n");
    printf("#  BATERIA DE TESTES - VAQUEJADA FORMAL  #\n");
    printf("##########################################\n");

    /*
     * TESTE 1 - Gestao de senhas pre-torneio
     * Foco: comprar_senha, desistir_senha, transferir_senha,
     *       consultar_dono, total_senhas_vendidas,
     *       consultar_bois_derrubados
     */
    executar_teste_1();

    separador();

    /*
     * TESTE 2 - Fase de classificatoria completa
     * Foco: iniciar_ultimo_rodizio, chamar_para_pista,
     *       correr_boi_classificacao (valeu/zero),
     *       consultar_status_senha, consultar_bois_derrubados,
     *       iniciar_fase_disputa, correr_boi_disputa,
     *       declarar_campeao_unico
     */
    executar_teste_2();

    separador();

    /*
     * TESTE 3 - Disputa com rachar_premio (empate)
     * Foco: rachar_premio, consultar_status_senha (campea),
     *       multiplas rodadas sem eliminacao
     */
    executar_teste_3();

    separador();

    /*
     * TESTE 4 - Disputa com rachar_sem_finalizar
     * Foco: rachar_sem_finalizar, correr_boi_disputa com
     *       zero_boi apos racha, declarar_campeao_unico
     */
    executar_teste_4();

    separador();

    /*
     * TESTE 5 - Encerramento sem vencedor
     * Foco: iniciar_rodizio (multiplos), retorno na classificacao,
     *       finalizar_sem_vencedor, observar_torneio_encerrado
     */
    executar_teste_5();

    printf("\n##########################################\n");
    printf("#  FIM DA BATERIA DE TESTES              #\n");
    printf("##########################################\n");

    return 0;
}
