/* WARNING if type checker is not performed, translation could contain errors ! */

#include "Controle_Torneio.h"

/* Clause SEES */
#include "Contexto_Vaquejada.h"

/* Clause IMPORTS */
#include "Gerenciador_Senhas.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static Contexto_Vaquejada__FASES Controle_Torneio__fase_atual_v;
static int32_t Controle_Torneio__rodizio_arr[4];
static int32_t Controle_Torneio__rodizio_size;
static int32_t Controle_Torneio__idx_correndo_v;
static bool Controle_Torneio__torneio_iniciado_v;
static bool Controle_Torneio__ultimo_rodizio_iniciado_v;
static bool Controle_Torneio__racha_sem_finalizar_v;
static int32_t Controle_Torneio__premiacao_individual_arr[3];
static int32_t Controle_Torneio__premiacao_vagas_v;
static int32_t Controle_Torneio__premiacao_total_atual_v;
static int32_t Controle_Torneio__colocacao_arr[20];
static int32_t Controle_Torneio__posicao_atual_v;
/* Clause INITIALISATION */
void Controle_Torneio__INITIALISATION(void)
{
    
    Gerenciador_Senhas__INITIALISATION();
    Controle_Torneio__fase_atual_v = Contexto_Vaquejada__classificacao;
    Controle_Torneio__rodizio_size = 0;
    Controle_Torneio__idx_correndo_v = 1;
    Controle_Torneio__torneio_iniciado_v = false;
    Controle_Torneio__ultimo_rodizio_iniciado_v = false;
    Controle_Torneio__racha_sem_finalizar_v = false;
    Controle_Torneio__premiacao_vagas_v = 0;
    Controle_Torneio__premiacao_total_atual_v = 10000;
    Controle_Torneio__posicao_atual_v = 0;
    {
        int32_t ii;
        
        ii = 0;
        while((ii) <= (3))
        {
            Controle_Torneio__rodizio_arr[ii] = 0;
            ii = ii+1;
        }
    }
    {
        int32_t ii;
        
        ii = 0;
        while((ii) <= (2))
        {
            Controle_Torneio__premiacao_individual_arr[ii] = 0;
            ii = ii+1;
        }
    }
    {
        int32_t ii;
        
        ii = 0;
        while((ii) <= (19))
        {
            Controle_Torneio__colocacao_arr[ii] = 0;
            ii = ii+1;
        }
    }
}

/* Clause OPERATIONS */

void Controle_Torneio__comprar_senha(int32_t vv, int32_t ss)
{
    int32_t last_val;
    int32_t idx;
    
    if((Controle_Torneio__rodizio_size) > (0))
    {
        idx = Controle_Torneio__rodizio_size-1;
        last_val = Controle_Torneio__rodizio_arr[idx];
        Gerenciador_Senhas__cadastrar_senha(vv, ss, Controle_Torneio__torneio_iniciado_v, last_val);
    }
    else
    {
        Gerenciador_Senhas__cadastrar_senha(vv, ss, Controle_Torneio__torneio_iniciado_v, 0);
    }
}

void Controle_Torneio__desistir_senha(int32_t ss)
{
    Gerenciador_Senhas__cancelar_registro_senha(ss);
}

void Controle_Torneio__transferir_senha(int32_t ss, int32_t novo_vaqueiro)
{
    Gerenciador_Senhas__atualizar_dono(ss, novo_vaqueiro);
}

void Controle_Torneio__iniciar_rodizio(void)
{
    int32_t tam;
    int32_t ii;
    int32_t tmp_val;
    
    Gerenciador_Senhas__extrair_lote_rodizio();
    Gerenciador_Senhas__consultar_tamanho_lote_saida(&tam);
    ii = 0;
    while((ii) < (tam))
    {
        Gerenciador_Senhas__consultar_lote_saida(ii+1, &tmp_val);
        Controle_Torneio__rodizio_arr[ii] = tmp_val;
        ii = ii+1;
    }
    Controle_Torneio__rodizio_size = tam;
    Controle_Torneio__idx_correndo_v = 1;
    Controle_Torneio__torneio_iniciado_v = true;
}

void Controle_Torneio__iniciar_ultimo_rodizio(void)
{
    int32_t tam;
    int32_t ii;
    int32_t tmp_val;
    
    Gerenciador_Senhas__extrair_lote_rodizio();
    Gerenciador_Senhas__consultar_tamanho_lote_saida(&tam);
    ii = 0;
    while((ii) < (tam))
    {
        Gerenciador_Senhas__consultar_lote_saida(ii+1, &tmp_val);
        Controle_Torneio__rodizio_arr[ii] = tmp_val;
        ii = ii+1;
    }
    Controle_Torneio__rodizio_size = tam;
    Controle_Torneio__idx_correndo_v = 1;
    Controle_Torneio__ultimo_rodizio_iniciado_v = true;
    Controle_Torneio__torneio_iniciado_v = true;
}

void Controle_Torneio__chamar_para_pista(int32_t ss)
{
    Gerenciador_Senhas__atualizar_status(ss, Contexto_Vaquejada__na_pista);
}

void Controle_Torneio__correr_boi_classificacao(int32_t ss, Contexto_Vaquejada__JULGAMENTO jj)
{
    int32_t bc;
    int32_t lim;
    int32_t ii;
    int32_t prox;
    int32_t tmp_val;
    int32_t nbc;
    
    Gerenciador_Senhas__registrar_julgamento_classificacao(ss, jj);
    Gerenciador_Senhas__get_bois_corridos(ss, &bc);
    nbc = bc+1;
    if((jj == Contexto_Vaquejada__zero_boi) ||
    (((jj == Contexto_Vaquejada__valeu_boi) &&
            (nbc == Contexto_Vaquejada__BOIS_PARA_CLASSIFICAR))))
    {
        ii = Controle_Torneio__idx_correndo_v-1;
        lim = Controle_Torneio__rodizio_size-1;
        while((ii) < (lim))
        {
            prox = ii+1;
            tmp_val = Controle_Torneio__rodizio_arr[prox];
            Controle_Torneio__rodizio_arr[ii] = tmp_val;
            ii = ii+1;
        }
        Controle_Torneio__rodizio_size = Controle_Torneio__rodizio_size-1;
        if(Controle_Torneio__rodizio_size == 0)
        {
            Controle_Torneio__idx_correndo_v = 1;
        }
        else if((Controle_Torneio__idx_correndo_v) > (Controle_Torneio__rodizio_size))
        {
            Controle_Torneio__idx_correndo_v = 1;
        }
    }
    else
    {
        if((Controle_Torneio__idx_correndo_v) < (Controle_Torneio__rodizio_size))
        {
            Controle_Torneio__idx_correndo_v = Controle_Torneio__idx_correndo_v+1;
        }
        else
        {
            Controle_Torneio__idx_correndo_v = 1;
        }
    }
}

void Controle_Torneio__iniciar_fase_disputa(void)
{
    Controle_Torneio__fase_atual_v = Contexto_Vaquejada__disputa;
}

void Controle_Torneio__correr_boi_disputa(Contexto_Vaquejada__JULGAMENTO jj)
{
    int32_t ss_val;
    int32_t vaqueiro_eliminado;
    int32_t calc_premio;
    
    if((jj == Contexto_Vaquejada__zero_boi) &&
    (Controle_Torneio__racha_sem_finalizar_v == true))
    {
        Gerenciador_Senhas__get_primeiro_fila_disputa(&ss_val);
        Gerenciador_Senhas__get_dono_senha(ss_val, &vaqueiro_eliminado);
        calc_premio = Controle_Torneio__premiacao_individual_arr[vaqueiro_eliminado-1];
        calc_premio = calc_premio+Controle_Torneio__premiacao_vagas_v;
        Controle_Torneio__premiacao_individual_arr[vaqueiro_eliminado-1] = calc_premio;
        Controle_Torneio__premiacao_total_atual_v = Controle_Torneio__premiacao_total_atual_v-Controle_Torneio__premiacao_vagas_v;
        Controle_Torneio__colocacao_arr[ss_val-1] = Controle_Torneio__posicao_atual_v;
        Controle_Torneio__posicao_atual_v = Controle_Torneio__posicao_atual_v-1;
    }
    Gerenciador_Senhas__processar_resultado_disputa(jj);
}

void Controle_Torneio__iniciar_nova_rodada_disputa(void)
{
    Gerenciador_Senhas__avancar_rodada_disputa();
}

void Controle_Torneio__finalizar_sem_vencedor(void)
{
    Controle_Torneio__fase_atual_v = Contexto_Vaquejada__encerrado;
}

void Controle_Torneio__rachar_sem_finalizar(void)
{
    int32_t ii;
    int32_t qtd;
    Contexto_Vaquejada__STATUS_SENHA st;
    int32_t div_base;
    int32_t prize_calc;
    
    qtd = 0;
    ii = 1;
    while((ii) <= (20))
    {
        Gerenciador_Senhas__get_estado_senha(ii, &st);
        if(st == Contexto_Vaquejada__classificada)
        {
            qtd = qtd+1;
        }
        ii = ii+1;
    }
    Controle_Torneio__racha_sem_finalizar_v = true;
    Controle_Torneio__posicao_atual_v = qtd;
    div_base = qtd-1;
    div_base = 2 * div_base;
    if((div_base) > (0))
    {
        prize_calc = Controle_Torneio__premiacao_total_atual_v / div_base;
        Controle_Torneio__premiacao_vagas_v = prize_calc;
    }
}

void Controle_Torneio__rachar_premio(void)
{
    int32_t ii;
    int32_t qtd;
    Contexto_Vaquejada__STATUS_SENHA st;
    int32_t vq;
    int32_t prize_per_senha;
    int32_t cur_prize;
    
    qtd = 0;
    ii = 1;
    while((ii) <= (20))
    {
        Gerenciador_Senhas__get_estado_senha(ii, &st);
        if(st == Contexto_Vaquejada__classificada)
        {
            qtd = qtd+1;
        }
        ii = ii+1;
    }
    if((qtd) > (0))
    {
        prize_per_senha = Controle_Torneio__premiacao_total_atual_v / qtd;
        ii = 1;
        while((ii) <= (20))
        {
            Gerenciador_Senhas__get_estado_senha(ii, &st);
            if(st == Contexto_Vaquejada__classificada)
            {
                Gerenciador_Senhas__get_dono_senha(ii, &vq);
                cur_prize = Controle_Torneio__premiacao_individual_arr[vq-1];
                cur_prize = cur_prize+prize_per_senha;
                Controle_Torneio__premiacao_individual_arr[vq-1] = cur_prize;
                Controle_Torneio__colocacao_arr[ii-1] = 1;
            }
            ii = ii+1;
        }
    }
    Controle_Torneio__fase_atual_v = Contexto_Vaquejada__encerrado;
    Gerenciador_Senhas__finalizar_torneio();
}

void Controle_Torneio__declarar_campeao_unico(void)
{
    int32_t ii;
    Contexto_Vaquejada__STATUS_SENHA st;
    int32_t vq;
    int32_t cur_prize;
    
    ii = 1;
    while((ii) <= (20))
    {
        Gerenciador_Senhas__get_estado_senha(ii, &st);
        if(st == Contexto_Vaquejada__classificada)
        {
            Gerenciador_Senhas__get_dono_senha(ii, &vq);
            Controle_Torneio__colocacao_arr[ii-1] = 1;
        }
        ii = ii+1;
    }
    cur_prize = Controle_Torneio__premiacao_individual_arr[vq-1];
    cur_prize = cur_prize+Controle_Torneio__premiacao_total_atual_v;
    Controle_Torneio__premiacao_individual_arr[vq-1] = cur_prize;
    Controle_Torneio__fase_atual_v = Contexto_Vaquejada__encerrado;
    Gerenciador_Senhas__finalizar_torneio();
}

void Controle_Torneio__observar_torneio_encerrado(void)
{
    ;
}

void Controle_Torneio__consultar_status_senha(int32_t ss, Contexto_Vaquejada__STATUS_SENHA *res)
{
    Gerenciador_Senhas__get_estado_senha(ss, res);
}

void Controle_Torneio__consultar_dono(int32_t ss, int32_t *res)
{
    Gerenciador_Senhas__get_dono_senha(ss, res);
}

void Controle_Torneio__total_senhas_vendidas(int32_t *res)
{
    int32_t ii;
    int32_t dono;
    int32_t count;
    
    count = 0;
    ii = 1;
    while((ii) <= (20))
    {
        Gerenciador_Senhas__get_dono_senha(ii, &dono);
        if((dono) != (0))
        {
            count = count+1;
        }
        ii = ii+1;
    }
    (*res) = count;
}

void Controle_Torneio__consultar_bois_derrubados(int32_t ss, int32_t *res)
{
    Gerenciador_Senhas__get_bois_corridos(ss, res);
}

