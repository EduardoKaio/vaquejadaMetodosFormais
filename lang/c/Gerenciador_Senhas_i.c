/* WARNING if type checker is not performed, translation could contain errors ! */

#include "Gerenciador_Senhas.h"

/* Clause SEES */
#include "Contexto_Vaquejada.h"

/* Clause CONCRETE_CONSTANTS */
/* Basic constants */

/* Array and record constants */
/* Clause CONCRETE_VARIABLES */

static int32_t Gerenciador_Senhas__dono_senha_arr[20];
static Contexto_Vaquejada__STATUS_SENHA Gerenciador_Senhas__estado_senha_arr[20];
static int32_t Gerenciador_Senhas__bois_corridos_arr[20];
static int32_t Gerenciador_Senhas__fila_geral_arr[20];
static int32_t Gerenciador_Senhas__fila_geral_fim;
static int32_t Gerenciador_Senhas__fila_disputa_atual_arr[20];
static int32_t Gerenciador_Senhas__fila_disputa_atual_fim;
static int32_t Gerenciador_Senhas__fila_disputa_proxima_arr[20];
static int32_t Gerenciador_Senhas__fila_disputa_proxima_fim;
static int32_t Gerenciador_Senhas__eliminados_arr[20];
static int32_t Gerenciador_Senhas__eliminados_fim;
static int32_t Gerenciador_Senhas__lote_saida_arr[4];
static int32_t Gerenciador_Senhas__lote_saida_size;
/* Clause INITIALISATION */
void Gerenciador_Senhas__INITIALISATION(void)
{
    
    {
        int32_t ii;
        
        ii = 0;
        while((ii) <= (19))
        {
            Gerenciador_Senhas__dono_senha_arr[ii] = 0;
            Gerenciador_Senhas__estado_senha_arr[ii] = Contexto_Vaquejada__na_espera;
            Gerenciador_Senhas__bois_corridos_arr[ii] = 0;
            Gerenciador_Senhas__fila_geral_arr[ii] = 0;
            Gerenciador_Senhas__fila_disputa_atual_arr[ii] = 0;
            Gerenciador_Senhas__fila_disputa_proxima_arr[ii] = 0;
            Gerenciador_Senhas__eliminados_arr[ii] = 0;
            ii = ii+1;
        }
    }
    {
        int32_t ii;
        
        ii = 0;
        while((ii) <= (3))
        {
            Gerenciador_Senhas__lote_saida_arr[ii] = 0;
            ii = ii+1;
        }
    }
    Gerenciador_Senhas__lote_saida_size = 0;
    Gerenciador_Senhas__fila_geral_fim = 0;
    Gerenciador_Senhas__fila_disputa_atual_fim = 0;
    Gerenciador_Senhas__fila_disputa_proxima_fim = 0;
    Gerenciador_Senhas__eliminados_fim = 0;
}

/* Clause OPERATIONS */

void Gerenciador_Senhas__cadastrar_senha(int32_t vv, int32_t ss, bool torneio_comecou, int32_t ultima_senha)
{
    int32_t pos;
    int32_t ii;
    int32_t idx;
    int32_t prev;
    int32_t tmp_val;
    
    idx = ss-1;
    Gerenciador_Senhas__dono_senha_arr[idx] = vv;
    Gerenciador_Senhas__estado_senha_arr[idx] = Contexto_Vaquejada__na_espera;
    Gerenciador_Senhas__bois_corridos_arr[idx] = 0;
    if(torneio_comecou == false)
    {
        pos = 0;
        if((pos) < (Gerenciador_Senhas__fila_geral_fim))
        {
            tmp_val = Gerenciador_Senhas__fila_geral_arr[pos];
            while(((pos) < (Gerenciador_Senhas__fila_geral_fim)) &&
            ((tmp_val) < (ss)))
            {
                pos = pos+1;
                if((pos) < (Gerenciador_Senhas__fila_geral_fim))
                {
                    tmp_val = Gerenciador_Senhas__fila_geral_arr[pos];
                }
            }
        }
        ii = Gerenciador_Senhas__fila_geral_fim;
        while((ii) > (pos))
        {
            prev = ii-1;
            tmp_val = Gerenciador_Senhas__fila_geral_arr[prev];
            Gerenciador_Senhas__fila_geral_arr[ii] = tmp_val;
            ii = ii-1;
        }
        Gerenciador_Senhas__fila_geral_arr[pos] = ss;
        Gerenciador_Senhas__fila_geral_fim = Gerenciador_Senhas__fila_geral_fim+1;
    }
    else
    {
        if((ss) < (ultima_senha))
        {
            Gerenciador_Senhas__fila_geral_arr[Gerenciador_Senhas__fila_geral_fim] = ss;
            Gerenciador_Senhas__fila_geral_fim = Gerenciador_Senhas__fila_geral_fim+1;
        }
        else
        {
            pos = 0;
            if((pos) < (Gerenciador_Senhas__fila_geral_fim))
            {
                tmp_val = Gerenciador_Senhas__fila_geral_arr[pos];
                while((((pos) < (Gerenciador_Senhas__fila_geral_fim)) &&
                    ((tmp_val) < (ss))) &&
                ((tmp_val) > (ultima_senha)))
                {
                    pos = pos+1;
                    if((pos) < (Gerenciador_Senhas__fila_geral_fim))
                    {
                        tmp_val = Gerenciador_Senhas__fila_geral_arr[pos];
                    }
                }
            }
            ii = Gerenciador_Senhas__fila_geral_fim;
            while((ii) > (pos))
            {
                prev = ii-1;
                tmp_val = Gerenciador_Senhas__fila_geral_arr[prev];
                Gerenciador_Senhas__fila_geral_arr[ii] = tmp_val;
                ii = ii-1;
            }
            Gerenciador_Senhas__fila_geral_arr[pos] = ss;
            Gerenciador_Senhas__fila_geral_fim = Gerenciador_Senhas__fila_geral_fim+1;
        }
    }
}

void Gerenciador_Senhas__atualizar_status(int32_t ss, Contexto_Vaquejada__STATUS_SENHA novo_status)
{
    int32_t idx;
    
    idx = ss-1;
    Gerenciador_Senhas__estado_senha_arr[idx] = novo_status;
}

void Gerenciador_Senhas__cancelar_registro_senha(int32_t ss)
{
    int32_t pos;
    int32_t ii;
    int32_t idx;
    int32_t prox;
    int32_t tmp_val;
    int32_t lim;
    
    idx = ss-1;
    Gerenciador_Senhas__dono_senha_arr[idx] = 0;
    Gerenciador_Senhas__estado_senha_arr[idx] = Contexto_Vaquejada__na_espera;
    Gerenciador_Senhas__bois_corridos_arr[idx] = 0;
    pos = 0;
    if((pos) < (Gerenciador_Senhas__fila_geral_fim))
    {
        tmp_val = Gerenciador_Senhas__fila_geral_arr[pos];
        while(((pos) < (Gerenciador_Senhas__fila_geral_fim)) &&
        ((tmp_val) != (ss)))
        {
            pos = pos+1;
            if((pos) < (Gerenciador_Senhas__fila_geral_fim))
            {
                tmp_val = Gerenciador_Senhas__fila_geral_arr[pos];
            }
        }
    }
    lim = Gerenciador_Senhas__fila_geral_fim-1;
    ii = pos;
    while((ii) < (lim))
    {
        prox = ii+1;
        tmp_val = Gerenciador_Senhas__fila_geral_arr[prox];
        Gerenciador_Senhas__fila_geral_arr[ii] = tmp_val;
        ii = ii+1;
    }
    Gerenciador_Senhas__fila_geral_fim = Gerenciador_Senhas__fila_geral_fim-1;
}

void Gerenciador_Senhas__atualizar_dono(int32_t ss, int32_t novo_vaqueiro)
{
    int32_t idx;
    
    idx = ss-1;
    Gerenciador_Senhas__dono_senha_arr[idx] = novo_vaqueiro;
}

void Gerenciador_Senhas__extrair_lote_rodizio(void)
{
    int32_t qtd;
    int32_t ii;
    int32_t offset;
    int32_t tmp_val;
    int32_t lim;
    
    if((Gerenciador_Senhas__fila_geral_fim) > (Contexto_Vaquejada__TAMANHO_RODIZIO))
    {
        qtd = Contexto_Vaquejada__TAMANHO_RODIZIO;
    }
    else
    {
        qtd = Gerenciador_Senhas__fila_geral_fim;
    }
    ii = 0;
    while((ii) < (qtd))
    {
        tmp_val = Gerenciador_Senhas__fila_geral_arr[ii];
        Gerenciador_Senhas__lote_saida_arr[ii] = tmp_val;
        ii = ii+1;
    }
    Gerenciador_Senhas__lote_saida_size = qtd;
    lim = Gerenciador_Senhas__fila_geral_fim-qtd;
    ii = 0;
    while((ii) < (lim))
    {
        offset = ii+qtd;
        tmp_val = Gerenciador_Senhas__fila_geral_arr[offset];
        Gerenciador_Senhas__fila_geral_arr[ii] = tmp_val;
        ii = ii+1;
    }
    Gerenciador_Senhas__fila_geral_fim = Gerenciador_Senhas__fila_geral_fim-qtd;
}

void Gerenciador_Senhas__registrar_julgamento_classificacao(int32_t ss, Contexto_Vaquejada__JULGAMENTO jj)
{
    int32_t idx;
    int32_t bc;
    int32_t pos;
    int32_t ii;
    int32_t prev;
    int32_t tmp_val;
    int32_t nbc;
    
    idx = ss-1;
    if(jj == Contexto_Vaquejada__zero_boi)
    {
        Gerenciador_Senhas__estado_senha_arr[idx] = Contexto_Vaquejada__eliminada;
    }
    else if(jj == Contexto_Vaquejada__valeu_boi)
    {
        bc = Gerenciador_Senhas__bois_corridos_arr[idx];
        nbc = bc+1;
        Gerenciador_Senhas__bois_corridos_arr[idx] = nbc;
        if(nbc == Contexto_Vaquejada__BOIS_PARA_CLASSIFICAR)
        {
            Gerenciador_Senhas__estado_senha_arr[idx] = Contexto_Vaquejada__classificada;
            pos = 0;
            if((pos) < (Gerenciador_Senhas__fila_disputa_proxima_fim))
            {
                tmp_val = Gerenciador_Senhas__fila_disputa_proxima_arr[pos];
                while(((pos) < (Gerenciador_Senhas__fila_disputa_proxima_fim)) &&
                ((tmp_val) < (ss)))
                {
                    pos = pos+1;
                    if((pos) < (Gerenciador_Senhas__fila_disputa_proxima_fim))
                    {
                        tmp_val = Gerenciador_Senhas__fila_disputa_proxima_arr[pos];
                    }
                }
            }
            ii = Gerenciador_Senhas__fila_disputa_proxima_fim;
            while((ii) > (pos))
            {
                prev = ii-1;
                tmp_val = Gerenciador_Senhas__fila_disputa_proxima_arr[prev];
                Gerenciador_Senhas__fila_disputa_proxima_arr[ii] = tmp_val;
                ii = ii-1;
            }
            Gerenciador_Senhas__fila_disputa_proxima_arr[pos] = ss;
            Gerenciador_Senhas__fila_disputa_proxima_fim = Gerenciador_Senhas__fila_disputa_proxima_fim+1;
        }
        else
        {
            Gerenciador_Senhas__estado_senha_arr[idx] = Contexto_Vaquejada__na_espera;
        }
    }
    else
    {
        Gerenciador_Senhas__estado_senha_arr[idx] = Contexto_Vaquejada__na_espera;
    }
}

void Gerenciador_Senhas__processar_resultado_disputa(Contexto_Vaquejada__JULGAMENTO jj)
{
    int32_t ss_val;
    int32_t idx;
    int32_t pos;
    int32_t ii;
    int32_t prev;
    int32_t prox;
    int32_t tmp_val;
    int32_t lim;
    
    ss_val = Gerenciador_Senhas__fila_disputa_atual_arr[0];
    idx = ss_val-1;
    lim = Gerenciador_Senhas__fila_disputa_atual_fim-1;
    ii = 0;
    while((ii) < (lim))
    {
        prox = ii+1;
        tmp_val = Gerenciador_Senhas__fila_disputa_atual_arr[prox];
        Gerenciador_Senhas__fila_disputa_atual_arr[ii] = tmp_val;
        ii = ii+1;
    }
    Gerenciador_Senhas__fila_disputa_atual_fim = Gerenciador_Senhas__fila_disputa_atual_fim-1;
    if(jj == Contexto_Vaquejada__zero_boi)
    {
        Gerenciador_Senhas__estado_senha_arr[idx] = Contexto_Vaquejada__eliminada;
        Gerenciador_Senhas__eliminados_arr[Gerenciador_Senhas__eliminados_fim] = ss_val;
        Gerenciador_Senhas__eliminados_fim = Gerenciador_Senhas__eliminados_fim+1;
    }
    else if(jj == Contexto_Vaquejada__valeu_boi)
    {
        Gerenciador_Senhas__estado_senha_arr[idx] = Contexto_Vaquejada__classificada;
        pos = 0;
        if((pos) < (Gerenciador_Senhas__fila_disputa_proxima_fim))
        {
            tmp_val = Gerenciador_Senhas__fila_disputa_proxima_arr[pos];
            while(((pos) < (Gerenciador_Senhas__fila_disputa_proxima_fim)) &&
            ((tmp_val) < (ss_val)))
            {
                pos = pos+1;
                if((pos) < (Gerenciador_Senhas__fila_disputa_proxima_fim))
                {
                    tmp_val = Gerenciador_Senhas__fila_disputa_proxima_arr[pos];
                }
            }
        }
        ii = Gerenciador_Senhas__fila_disputa_proxima_fim;
        while((ii) > (pos))
        {
            prev = ii-1;
            tmp_val = Gerenciador_Senhas__fila_disputa_proxima_arr[prev];
            Gerenciador_Senhas__fila_disputa_proxima_arr[ii] = tmp_val;
            ii = ii-1;
        }
        Gerenciador_Senhas__fila_disputa_proxima_arr[pos] = ss_val;
        Gerenciador_Senhas__fila_disputa_proxima_fim = Gerenciador_Senhas__fila_disputa_proxima_fim+1;
    }
    else
    {
        Gerenciador_Senhas__estado_senha_arr[idx] = Contexto_Vaquejada__classificada;
        Gerenciador_Senhas__fila_disputa_atual_arr[Gerenciador_Senhas__fila_disputa_atual_fim] = ss_val;
        Gerenciador_Senhas__fila_disputa_atual_fim = Gerenciador_Senhas__fila_disputa_atual_fim+1;
    }
}

void Gerenciador_Senhas__avancar_rodada_disputa(void)
{
    if((Gerenciador_Senhas__fila_disputa_proxima_fim) > (0))
    {
        {
            int32_t ii;
            int32_t tmp_val;
            
            ii = 0;
            while((ii) < (Gerenciador_Senhas__fila_disputa_proxima_fim))
            {
                tmp_val = Gerenciador_Senhas__fila_disputa_proxima_arr[ii];
                Gerenciador_Senhas__fila_disputa_atual_arr[ii] = tmp_val;
                ii = ii+1;
            }
        }
        Gerenciador_Senhas__fila_disputa_atual_fim = Gerenciador_Senhas__fila_disputa_proxima_fim;
        Gerenciador_Senhas__fila_disputa_proxima_fim = 0;
        Gerenciador_Senhas__eliminados_fim = 0;
    }
    else
    {
        {
            int32_t ii;
            int32_t ss_val;
            int32_t idx;
            
            ii = 0;
            while((ii) < (Gerenciador_Senhas__eliminados_fim))
            {
                ss_val = Gerenciador_Senhas__eliminados_arr[ii];
                Gerenciador_Senhas__fila_disputa_atual_arr[ii] = ss_val;
                idx = ss_val-1;
                Gerenciador_Senhas__estado_senha_arr[idx] = Contexto_Vaquejada__classificada;
                ii = ii+1;
            }
        }
        Gerenciador_Senhas__fila_disputa_atual_fim = Gerenciador_Senhas__eliminados_fim;
        Gerenciador_Senhas__eliminados_fim = 0;
    }
}

void Gerenciador_Senhas__finalizar_torneio(void)
{
    int32_t ii;
    Contexto_Vaquejada__STATUS_SENHA st;
    
    ii = 0;
    while((ii) <= (19))
    {
        st = Gerenciador_Senhas__estado_senha_arr[ii];
        if(st == Contexto_Vaquejada__classificada)
        {
            Gerenciador_Senhas__estado_senha_arr[ii] = Contexto_Vaquejada__campea;
        }
        ii = ii+1;
    }
}

void Gerenciador_Senhas__consultar_lote_saida(int32_t ii, int32_t *val)
{
    int32_t idx;
    
    idx = ii-1;
    (*val) = Gerenciador_Senhas__lote_saida_arr[idx];
}

void Gerenciador_Senhas__consultar_tamanho_lote_saida(int32_t *tam)
{
    (*tam) = Gerenciador_Senhas__lote_saida_size;
}

void Gerenciador_Senhas__get_estado_senha(int32_t ss, Contexto_Vaquejada__STATUS_SENHA *st)
{
    int32_t idx;
    
    idx = ss-1;
    (*st) = Gerenciador_Senhas__estado_senha_arr[idx];
}

void Gerenciador_Senhas__get_dono_senha(int32_t ss, int32_t *vq)
{
    int32_t idx;
    
    idx = ss-1;
    (*vq) = Gerenciador_Senhas__dono_senha_arr[idx];
}

void Gerenciador_Senhas__get_bois_corridos(int32_t ss, int32_t *bc)
{
    int32_t idx;
    
    idx = ss-1;
    (*bc) = Gerenciador_Senhas__bois_corridos_arr[idx];
}

void Gerenciador_Senhas__get_primeiro_fila_disputa(int32_t *ss)
{
    (*ss) = Gerenciador_Senhas__fila_disputa_atual_arr[0];
}

