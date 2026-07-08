# Vaquejada — código C gerado (Atelier B)

Máquinas implementadas: `Contexto_Vaquejada`, `Gerenciador_Senhas`, `Controle_Torneio`.

## Compilar

```bash
gcc -Wall -Wextra -o teste_torneio \
    main_testes.c Contexto_Vaquejada_i.c Gerenciador_Senhas_i.c \
    Controle_Torneio_i.c teste1.c teste2.c teste3.c teste4.c teste5.c
```

## Executar

```bash
./teste_torneio
```

## Limpar binário

```bash
rm -f teste_torneio
```
