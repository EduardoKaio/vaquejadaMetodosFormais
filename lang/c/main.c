#include <stdio.h>
#include <stdbool.h>
#include "Contexto_Vaquejada.h"
#include "Gerenciador_Senhas.h"
#include "Controle_Torneio.h"

void imprimir_status(int senha) {
    Contexto_Vaquejada__STATUS_SENHA status;
    Controle_Torneio__consultar_status_senha(senha, &status);
    printf("Status da senha %d (numérico): %d\n", senha, status);
}

int main() {
    Controle_Torneio__INITIALISATION();
    printf("=== Torneio Inicializado ===\n\n");

    /* Vaqueiro 1: Senhas 1 e 4 | Vaqueiro 2: Senhas 2 e 5 | Vaqueiro 3: Senha 3 */
    Controle_Torneio__comprar_senha(1, 1);
    Controle_Torneio__comprar_senha(2, 2);
    Controle_Torneio__comprar_senha(3, 3);
    Controle_Torneio__comprar_senha(1, 4);
    Controle_Torneio__comprar_senha(2, 5);
    
    int total;
    Controle_Torneio__total_senhas_vendidas(&total);
    printf("Senhas compradas: %d\n\n", total);

    /* Inicia classificatoria assumindo que TAMANHO_RODIZIO comporta as 5 senhas */
    Controle_Torneio__iniciar_ultimo_rodizio();
    printf("=== Fase de Classificacao Iniciada ===\n");

    Controle_Torneio__chamar_para_pista(1);
    Controle_Torneio__correr_boi_classificacao(1, Contexto_Vaquejada__valeu_boi);
    printf("- Senha 1 (V1): valeu_boi\n");

    Controle_Torneio__chamar_para_pista(2);
    Controle_Torneio__correr_boi_classificacao(2, Contexto_Vaquejada__valeu_boi);
    printf("- Senha 2 (V2): valeu_boi\n");

    Controle_Torneio__chamar_para_pista(3);
    Controle_Torneio__correr_boi_classificacao(3, Contexto_Vaquejada__zero_boi);
    printf("- Senha 3 (V3): zero_boi (eliminada)\n");

    Controle_Torneio__chamar_para_pista(4);
    Controle_Torneio__correr_boi_classificacao(4, Contexto_Vaquejada__valeu_boi);
    printf("- Senha 4 (V1): valeu_boi\n");

    Controle_Torneio__chamar_para_pista(5);
    Controle_Torneio__correr_boi_classificacao(5, Contexto_Vaquejada__zero_boi);
    printf("- Senha 5 (V2): zero_boi (eliminada)\n\n");

    /* Transição para a fase de disputa */
    Controle_Torneio__iniciar_fase_disputa();
    printf("=== Transicao para a Disputa ===\n\n");

    /* --- RODADA 1 DA DISPUTA --- */
    printf("--- Disputa: Rodada 1 ---\n");
    Controle_Torneio__iniciar_nova_rodada_disputa();
    
    Controle_Torneio__chamar_para_pista(1);
    Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__valeu_boi);
    printf("- Senha 1: valeu_boi\n");

    Controle_Torneio__chamar_para_pista(2);
    Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__valeu_boi);
    printf("- Senha 2: valeu_boi\n");

    Controle_Torneio__chamar_para_pista(4);
    Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__valeu_boi);
    printf("- Senha 4: valeu_boi\n\n");

    /* --- RODADA 2 DA DISPUTA --- */
    printf("--- Disputa: Rodada 2 ---\n");
    Controle_Torneio__iniciar_nova_rodada_disputa();
    
    Controle_Torneio__chamar_para_pista(1);
    Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__valeu_boi);
    printf("- Senha 1: valeu_boi\n");

    Controle_Torneio__chamar_para_pista(2);
    Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__zero_boi);
    printf("- Senha 2: zero_boi (eliminada)\n");

    Controle_Torneio__chamar_para_pista(4);
    Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__valeu_boi);
    printf("- Senha 4: valeu_boi\n\n");

    /* --- RODADA 3 DA DISPUTA --- */
    printf("--- Disputa: Rodada 3 ---\n");
    Controle_Torneio__iniciar_nova_rodada_disputa();
    
    Controle_Torneio__chamar_para_pista(1);
    Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__valeu_boi);
    printf("- Senha 1: valeu_boi\n");

    Controle_Torneio__chamar_para_pista(4);
    Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__zero_boi);
    printf("- Senha 4: zero_boi (eliminada)\n\n");

    /* --- FIM DO TORNEIO --- */
    /* Sobrou apenas a senha 1 do Vaqueiro 1 */
    Controle_Torneio__declarar_campeao_unico();
    printf("=== Torneio Encerrado (Campeao Unico Declarado) ===\n\n");

    printf("--- Resultados Finais ---\n");
    imprimir_status(1); 
    imprimir_status(2); 
    imprimir_status(3); 
    imprimir_status(4); 
    imprimir_status(5); 

    return 0;
}