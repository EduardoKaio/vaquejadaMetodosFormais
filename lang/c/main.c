#include <stdio.h>
#include <stdlib.h>
#include "Controle_Torneio.h"
#include "Contexto_Vaquejada.h"

// Função auxiliar para converter status em string
const char* status_to_string(Contexto_Vaquejada__STATUS_SENHA st) {
    switch(st) {
        case Contexto_Vaquejada__na_espera: return "Na Espera";
        case Contexto_Vaquejada__na_pista: return "Na Pista";
        case Contexto_Vaquejada__classificada: return "Classificada";
        case Contexto_Vaquejada__eliminada: return "Eliminada";
        case Contexto_Vaquejada__campea: return "Campeã";
        default: return "Desconhecido";
    }
}

void print_menu() {
    printf("\n============================================\n");
    printf("         MENU CONTROLE DE TORNEIO\n");
    printf("============================================\n");
    printf(" 1. Comprar Senha\n");
    printf(" 2. Consultar Status de Senha\n");
    printf(" 3. Iniciar Rodizio (Classificacao)\n");
    printf(" 4. Iniciar Ultimo Rodizio (Classificacao)\n");
    printf(" 5. Chamar Senha para Pista\n");
    printf(" 6. Correr Boi (Classificacao)\n");
    printf(" 7. Iniciar Fase Disputa\n");
    printf(" 8. Correr Boi (Disputa)\n");
    printf(" 9. Iniciar Nova Rodada Disputa\n");
    printf("10. Rachar Premio e Encerrar\n");
    printf("11. Declarar Campeao Unico e Encerrar\n");
    printf("12. Finalizar Torneio sem Vencedor\n");
    printf("13. Ver Total de Senhas Vendidas\n");
    printf(" 0. Sair do Sistema\n");
    printf("--------------------------------------------\n");
    printf("Escolha uma opcao: ");
}

int main() {
    // Inicialização obrigatória do sistema B
    Contexto_Vaquejada__INITIALISATION();
    Gerenciador_Senhas__INITIALISATION();
    Controle_Torneio__INITIALISATION();
    
    printf("Sistema B Inicializado com sucesso.\n");
    
    int opcao = -1;
    while(opcao != 0) {
        print_menu();
        if (scanf("%d", &opcao) != 1) {
            while(getchar() != '\n'); // Limpa buffer
            printf("Entrada invalida.\n");
            continue;
        }
        
        switch(opcao) {
            case 0:
                printf("Encerrando o sistema...\n");
                break;
                
            case 1: {
                int vv, ss;
                printf("Digite o ID do Vaqueiro (1-3): ");
                scanf("%d", &vv);
                printf("Digite o ID da Senha (1-20): ");
                scanf("%d", &ss);
                
                // Checagem de Pré-condições antes de chamar
                if (vv >= 1 && vv <= 3 && ss >= 1 && ss <= 20) {
                    int dono;
                    Controle_Torneio__consultar_dono(ss, &dono);
                    if (dono == 0) { // Garante que a senha não foi vendida
                        Controle_Torneio__comprar_senha(vv, ss);
                        printf(">>> SUCESSO: Senha %d comprada pelo Vaqueiro %d!\n", ss, vv);
                    } else {
                        printf(">>> ERRO (PRE): A Senha %d ja possui dono (Vaqueiro %d).\n", ss, dono);
                    }
                } else {
                    printf(">>> ERRO (PRE): IDs fora dos limites estabelecidos no contexto.\n");
                }
                break;
            }
            
            case 2: {
                int ss;
                printf("Digite o ID da Senha (1-20): ");
                scanf("%d", &ss);
                if (ss >= 1 && ss <= 20) {
                    int dono;
                    Controle_Torneio__consultar_dono(ss, &dono);
                    if (dono != 0) {
                        Contexto_Vaquejada__STATUS_SENHA st;
                        int bc;
                        Controle_Torneio__consultar_status_senha(ss, &st);
                        Controle_Torneio__consultar_bois_derrubados(ss, &bc);
                        printf(">>> SENHA %d | Dono: Vaqueiro %d | Status: %s | Bois Corridos: %d\n", 
                               ss, dono, status_to_string(st), bc);
                    } else {
                        printf(">>> A Senha %d ainda não foi vendida.\n", ss);
                    }
                } else {
                    printf(">>> ERRO: ID da Senha Invalido.\n");
                }
                break;
            }
            
            case 3:
                Controle_Torneio__iniciar_rodizio();
                printf(">>> SUCESSO: Novo rodizio de senhas iniciado.\n");
                break;
                
            case 4:
                Controle_Torneio__iniciar_ultimo_rodizio();
                printf(">>> SUCESSO: Ultimo rodizio de senhas iniciado.\n");
                break;
                
            case 5: {
                int ss;
                printf("Digite o ID da Senha a chamar (1-20): ");
                scanf("%d", &ss);
                if (ss >= 1 && ss <= 20) {
                    Contexto_Vaquejada__STATUS_SENHA st;
                    Controle_Torneio__consultar_status_senha(ss, &st);
                    // Pre-condição: Tem que estar na espera ou classificada para ser chamada para a pista
                    if (st == Contexto_Vaquejada__na_espera || st == Contexto_Vaquejada__classificada) {
                        Controle_Torneio__chamar_para_pista(ss);
                        printf(">>> SUCESSO: Senha %d entrou na pista!\n", ss);
                    } else {
                        printf(">>> ERRO (PRE): Senha %d não pode ser chamada (Status Atual: %s).\n", ss, status_to_string(st));
                    }
                } else {
                    printf(">>> ERRO: ID da Senha Invalido.\n");
                }
                break;
            }
            
            case 6: {
                int ss, julg;
                printf("Digite o ID da Senha que esta na pista (1-20): ");
                scanf("%d", &ss);
                printf("Julgamento (0 = Valeu Boi, 1 = Zero Boi, 2 = Retorno): ");
                scanf("%d", &julg);
                
                if (ss >= 1 && ss <= 20 && julg >= 0 && julg <= 2) {
                    Contexto_Vaquejada__STATUS_SENHA st;
                    Controle_Torneio__consultar_status_senha(ss, &st);
                    // Pre-condição: Só pode correr boi quem já foi chamado para a pista
                    if (st == Contexto_Vaquejada__na_pista) {
                        Controle_Torneio__correr_boi_classificacao(ss, (Contexto_Vaquejada__JULGAMENTO)julg);
                        printf(">>> SUCESSO: Julgamento registrado na classificatoria.\n");
                    } else {
                        printf(">>> ERRO (PRE): A senha deve estar 'Na Pista' para receber julgamento.\n");
                    }
                } else {
                    printf(">>> ERRO: Entradas invalidas.\n");
                }
                break;
            }
            
            case 7:
                Controle_Torneio__iniciar_fase_disputa();
                printf(">>> SUCESSO: Fase de disputa foi iniciada!\n");
                break;
                
            case 8: {
                int julg;
                printf("Julgamento do Vaqueiro Atual (0 = Valeu Boi, 1 = Zero Boi, 2 = Retorno): ");
                scanf("%d", &julg);
                if (julg >= 0 && julg <= 2) {
                    Controle_Torneio__correr_boi_disputa((Contexto_Vaquejada__JULGAMENTO)julg);
                    printf(">>> SUCESSO: Julgamento de disputa registrado.\n");
                } else {
                    printf(">>> ERRO: Julgamento invalido.\n");
                }
                break;
            }
            
            case 9:
                Controle_Torneio__iniciar_nova_rodada_disputa();
                printf(">>> SUCESSO: Nova bateria da disputa comecou.\n");
                break;
                
            case 10:
                Controle_Torneio__rachar_premio();
                printf(">>> SUCESSO: Os vaqueiros decidiram rachar. Torneio Encerrado!\n");
                break;
                
            case 11:
                Controle_Torneio__declarar_campeao_unico();
                printf(">>> SUCESSO: Campeao unico declarado. Torneio Encerrado!\n");
                break;
                
            case 12:
                Controle_Torneio__finalizar_sem_vencedor();
                printf(">>> SUCESSO: Torneio finalizado sem vencedores.\n");
                break;
                
            case 13: {
                int total;
                Controle_Torneio__total_senhas_vendidas(&total);
                printf(">>> TOTAL DE SENHAS VENDIDAS ATE O MOMENTO: %d\n", total);
                break;
            }
            
            default:
                printf(">>> ERRO: Opcao invalida.\n");
        }
    }
    
    return 0;
}