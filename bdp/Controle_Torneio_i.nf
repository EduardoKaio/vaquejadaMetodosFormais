Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(Controle_Torneio_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(Controle_Torneio_i))==(Machine(Controle_Torneio));
  Level(Implementation(Controle_Torneio_i))==(1);
  Upper_Level(Implementation(Controle_Torneio_i))==(Machine(Controle_Torneio))
END
&
THEORY LoadedStructureX IS
  Implementation(Controle_Torneio_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(Controle_Torneio_i))==(Contexto_Vaquejada)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(Controle_Torneio_i))==(Gerenciador_Senhas);
  Inherited_List_Includes(Implementation(Controle_Torneio_i))==(Gerenciador_Senhas)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(Controle_Torneio_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(Controle_Torneio_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(Controle_Torneio_i))==(?);
  Context_List_Variables(Implementation(Controle_Torneio_i))==(?);
  Abstract_List_Variables(Implementation(Controle_Torneio_i))==(posicao_atual,colocacao,premiacao_total_atual,premiacao_vagas,premiacao_individual,racha_sem_finalizar,ultimo_rodizio_iniciado,torneio_iniciado,idx_correndo,rodizio_atual,fase_atual,tamanho_buffer_saida,buffer_saida,eliminados_nesta_rodada,fila_disputa_proxima,fila_disputa_atual,fila_geral,bois_corridos,estado_senha,dono_senha);
  Local_List_Variables(Implementation(Controle_Torneio_i))==(?);
  List_Variables(Implementation(Controle_Torneio_i))==(tamanho_buffer_saida,buffer_saida,eliminados_nesta_rodada,fila_disputa_proxima,fila_disputa_atual,fila_geral,bois_corridos,estado_senha,dono_senha);
  External_List_Variables(Implementation(Controle_Torneio_i))==(tamanho_buffer_saida,buffer_saida,eliminados_nesta_rodada,fila_disputa_proxima,fila_disputa_atual,fila_geral,bois_corridos,estado_senha,dono_senha)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(Controle_Torneio_i))==(?);
  Abstract_List_VisibleVariables(Implementation(Controle_Torneio_i))==(?);
  External_List_VisibleVariables(Implementation(Controle_Torneio_i))==(?);
  Expanded_List_VisibleVariables(Implementation(Controle_Torneio_i))==(?);
  List_VisibleVariables(Implementation(Controle_Torneio_i))==(posicao_atual_v,colocacao_arr,premiacao_total_atual_v,premiacao_vagas_v,premiacao_individual_arr,racha_sem_finalizar_v,ultimo_rodizio_iniciado_v,torneio_iniciado_v,idx_correndo_v,rodizio_size,rodizio_arr,fase_atual_v);
  Internal_List_VisibleVariables(Implementation(Controle_Torneio_i))==(posicao_atual_v,colocacao_arr,premiacao_total_atual_v,premiacao_vagas_v,premiacao_individual_arr,racha_sem_finalizar_v,ultimo_rodizio_iniciado_v,torneio_iniciado_v,idx_correndo_v,rodizio_size,rodizio_arr,fase_atual_v)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(Controle_Torneio_i))==(btrue);
  Abstract_List_Invariant(Implementation(Controle_Torneio_i))==(fase_atual: FASES & rodizio_atual: iseq(NAT1) & size(rodizio_atual)<=TAMANHO_RODIZIO & idx_correndo: 1..TAMANHO_RODIZIO & torneio_iniciado: BOOL & ultimo_rodizio_iniciado: BOOL & racha_sem_finalizar: BOOL & premiacao_individual: VAQUEIROS --> NAT & premiacao_vagas: NAT & premiacao_total_atual: NAT & colocacao: SENHAS +-> NAT1 & posicao_atual: NAT & !ss.(ss: dom(estado_senha) & estado_senha(ss) = campea => fase_atual = encerrado & ss: dom(bois_corridos) & bois_corridos(ss)>=BOIS_PARA_CLASSIFICAR) & dono_senha: SENHAS +-> VAQUEIROS & estado_senha: SENHAS +-> STATUS_SENHA & bois_corridos: SENHAS +-> NAT & fila_geral: iseq(NAT1) & fila_disputa_atual: iseq(NAT1) & fila_disputa_proxima: iseq(NAT1) & eliminados_nesta_rodada: iseq(NAT1) & !ss.(ss: dom(estado_senha) & estado_senha(ss) = classificada => ss: dom(bois_corridos) & bois_corridos(ss) = BOIS_PARA_CLASSIFICAR) & buffer_saida: iseq(NAT1) & tamanho_buffer_saida: NAT);
  Expanded_List_Invariant(Implementation(Controle_Torneio_i))==(dono_senha: SENHAS +-> VAQUEIROS & estado_senha: SENHAS +-> STATUS_SENHA & bois_corridos: SENHAS +-> NAT & fila_geral: iseq(NAT1) & fila_disputa_atual: iseq(NAT1) & fila_disputa_proxima: iseq(NAT1) & eliminados_nesta_rodada: iseq(NAT1) & !ss.(ss: dom(estado_senha) & estado_senha(ss) = classificada => ss: dom(bois_corridos) & bois_corridos(ss) = BOIS_PARA_CLASSIFICAR) & buffer_saida: iseq(NAT1) & tamanho_buffer_saida: NAT);
  Context_List_Invariant(Implementation(Controle_Torneio_i))==(btrue);
  List_Invariant(Implementation(Controle_Torneio_i))==(fase_atual_v: FASES & rodizio_arr: 0..3 --> NAT & rodizio_size: 0..4 & idx_correndo_v: NAT1 & torneio_iniciado_v: BOOL & ultimo_rodizio_iniciado_v: BOOL & racha_sem_finalizar_v: BOOL & premiacao_individual_arr: 0..2 --> NAT & premiacao_vagas_v: NAT & premiacao_total_atual_v: NAT & colocacao_arr: 0..19 --> NAT & posicao_atual_v: NAT & fase_atual = fase_atual_v & rodizio_atual = %ii.(ii: 0..rodizio_size-1 | rodizio_arr(ii)) & idx_correndo = idx_correndo_v & torneio_iniciado = torneio_iniciado_v & ultimo_rodizio_iniciado = ultimo_rodizio_iniciado_v & racha_sem_finalizar = racha_sem_finalizar_v & premiacao_individual = %vq.(vq: 1..3 | premiacao_individual_arr(vq-1)) & premiacao_vagas = premiacao_vagas_v & premiacao_total_atual = premiacao_total_atual_v & colocacao = %ss.(ss: 1..20 & colocacao_arr(ss-1)/=0 | colocacao_arr(ss-1)) & posicao_atual = posicao_atual_v)
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Implementation(Controle_Torneio_i))==(btrue);
  Expanded_List_Assertions(Implementation(Controle_Torneio_i))==(btrue);
  Context_List_Assertions(Implementation(Controle_Torneio_i))==(btrue);
  List_Assertions(Implementation(Controle_Torneio_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(Controle_Torneio_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(Controle_Torneio_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(Controle_Torneio_i))==(dono_senha,estado_senha,bois_corridos,fila_geral,fila_disputa_atual,fila_disputa_proxima,eliminados_nesta_rodada,buffer_saida,tamanho_buffer_saida:={},{},{},<>,<>,<>,<>,<>,0;fase_atual_v:=classificacao;(0: INT | rodizio_size:=0);(1: INT | idx_correndo_v:=1);torneio_iniciado_v:=FALSE;ultimo_rodizio_iniciado_v:=FALSE;racha_sem_finalizar_v:=FALSE;(0: INT | premiacao_vagas_v:=0);(10000: INT | premiacao_total_atual_v:=10000);(0: INT | posicao_atual_v:=0);@ii.((0: INT | ii:=0);WHILE ii<=3 DO (ii: dom(rodizio_arr) & 0: INT | rodizio_arr:=rodizio_arr<+{ii|->0});(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 0..4 VARIANT 4-ii END);@ii.((0: INT | ii:=0);WHILE ii<=2 DO (ii: dom(premiacao_individual_arr) & 0: INT | premiacao_individual_arr:=premiacao_individual_arr<+{ii|->0});(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 0..3 VARIANT 3-ii END);@ii.((0: INT | ii:=0);WHILE ii<=19 DO (ii: dom(colocacao_arr) & 0: INT | colocacao_arr:=colocacao_arr<+{ii|->0});(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 0..20 VARIANT 20-ii END));
  Context_List_Initialisation(Implementation(Controle_Torneio_i))==(skip);
  List_Initialisation(Implementation(Controle_Torneio_i))==(fase_atual_v:=classificacao;rodizio_size:=0;idx_correndo_v:=1;torneio_iniciado_v:=FALSE;ultimo_rodizio_iniciado_v:=FALSE;racha_sem_finalizar_v:=FALSE;premiacao_vagas_v:=0;premiacao_total_atual_v:=10000;posicao_atual_v:=0;VAR ii IN ii:=0;WHILE ii<=3 DO rodizio_arr(ii):=0;ii:=ii+1 INVARIANT ii: 0..4 VARIANT 4-ii END END;VAR ii IN ii:=0;WHILE ii<=2 DO premiacao_individual_arr(ii):=0;ii:=ii+1 INVARIANT ii: 0..3 VARIANT 3-ii END END;VAR ii IN ii:=0;WHILE ii<=19 DO colocacao_arr(ii):=0;ii:=ii+1 INVARIANT ii: 0..20 VARIANT 20-ii END END)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(Controle_Torneio_i))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Implementation(Controle_Torneio_i),Machine(Gerenciador_Senhas))==(?);
  List_Instanciated_Parameters(Implementation(Controle_Torneio_i),Machine(Contexto_Vaquejada))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(Controle_Torneio_i),Machine(Gerenciador_Senhas))==(btrue);
  List_Constraints(Implementation(Controle_Torneio_i))==(btrue);
  List_Context_Constraints(Implementation(Controle_Torneio_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(Controle_Torneio_i))==(comprar_senha,desistir_senha,transferir_senha,iniciar_rodizio,iniciar_ultimo_rodizio,chamar_para_pista,correr_boi_classificacao,iniciar_fase_disputa,correr_boi_disputa,iniciar_nova_rodada_disputa,finalizar_sem_vencedor,rachar_sem_finalizar,rachar_premio,declarar_campeao_unico,observar_torneio_encerrado,consultar_status_senha,consultar_dono,total_senhas_vendidas,consultar_bois_derrubados);
  List_Operations(Implementation(Controle_Torneio_i))==(comprar_senha,desistir_senha,transferir_senha,iniciar_rodizio,iniciar_ultimo_rodizio,chamar_para_pista,correr_boi_classificacao,iniciar_fase_disputa,correr_boi_disputa,iniciar_nova_rodada_disputa,finalizar_sem_vencedor,rachar_sem_finalizar,rachar_premio,declarar_campeao_unico,observar_torneio_encerrado,consultar_status_senha,consultar_dono,total_senhas_vendidas,consultar_bois_derrubados)
END
&
THEORY ListInputX IS
  List_Input(Implementation(Controle_Torneio_i),comprar_senha)==(vv,ss);
  List_Input(Implementation(Controle_Torneio_i),desistir_senha)==(ss);
  List_Input(Implementation(Controle_Torneio_i),transferir_senha)==(ss,novo_vaqueiro);
  List_Input(Implementation(Controle_Torneio_i),iniciar_rodizio)==(?);
  List_Input(Implementation(Controle_Torneio_i),iniciar_ultimo_rodizio)==(?);
  List_Input(Implementation(Controle_Torneio_i),chamar_para_pista)==(ss);
  List_Input(Implementation(Controle_Torneio_i),correr_boi_classificacao)==(ss,jj);
  List_Input(Implementation(Controle_Torneio_i),iniciar_fase_disputa)==(?);
  List_Input(Implementation(Controle_Torneio_i),correr_boi_disputa)==(jj);
  List_Input(Implementation(Controle_Torneio_i),iniciar_nova_rodada_disputa)==(?);
  List_Input(Implementation(Controle_Torneio_i),finalizar_sem_vencedor)==(?);
  List_Input(Implementation(Controle_Torneio_i),rachar_sem_finalizar)==(?);
  List_Input(Implementation(Controle_Torneio_i),rachar_premio)==(?);
  List_Input(Implementation(Controle_Torneio_i),declarar_campeao_unico)==(?);
  List_Input(Implementation(Controle_Torneio_i),observar_torneio_encerrado)==(?);
  List_Input(Implementation(Controle_Torneio_i),consultar_status_senha)==(ss);
  List_Input(Implementation(Controle_Torneio_i),consultar_dono)==(ss);
  List_Input(Implementation(Controle_Torneio_i),total_senhas_vendidas)==(?);
  List_Input(Implementation(Controle_Torneio_i),consultar_bois_derrubados)==(ss)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(Controle_Torneio_i),comprar_senha)==(?);
  List_Output(Implementation(Controle_Torneio_i),desistir_senha)==(?);
  List_Output(Implementation(Controle_Torneio_i),transferir_senha)==(?);
  List_Output(Implementation(Controle_Torneio_i),iniciar_rodizio)==(?);
  List_Output(Implementation(Controle_Torneio_i),iniciar_ultimo_rodizio)==(?);
  List_Output(Implementation(Controle_Torneio_i),chamar_para_pista)==(?);
  List_Output(Implementation(Controle_Torneio_i),correr_boi_classificacao)==(?);
  List_Output(Implementation(Controle_Torneio_i),iniciar_fase_disputa)==(?);
  List_Output(Implementation(Controle_Torneio_i),correr_boi_disputa)==(?);
  List_Output(Implementation(Controle_Torneio_i),iniciar_nova_rodada_disputa)==(?);
  List_Output(Implementation(Controle_Torneio_i),finalizar_sem_vencedor)==(?);
  List_Output(Implementation(Controle_Torneio_i),rachar_sem_finalizar)==(?);
  List_Output(Implementation(Controle_Torneio_i),rachar_premio)==(?);
  List_Output(Implementation(Controle_Torneio_i),declarar_campeao_unico)==(?);
  List_Output(Implementation(Controle_Torneio_i),observar_torneio_encerrado)==(?);
  List_Output(Implementation(Controle_Torneio_i),consultar_status_senha)==(res);
  List_Output(Implementation(Controle_Torneio_i),consultar_dono)==(res);
  List_Output(Implementation(Controle_Torneio_i),total_senhas_vendidas)==(res);
  List_Output(Implementation(Controle_Torneio_i),consultar_bois_derrubados)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(Controle_Torneio_i),comprar_senha)==(comprar_senha(vv,ss));
  List_Header(Implementation(Controle_Torneio_i),desistir_senha)==(desistir_senha(ss));
  List_Header(Implementation(Controle_Torneio_i),transferir_senha)==(transferir_senha(ss,novo_vaqueiro));
  List_Header(Implementation(Controle_Torneio_i),iniciar_rodizio)==(iniciar_rodizio);
  List_Header(Implementation(Controle_Torneio_i),iniciar_ultimo_rodizio)==(iniciar_ultimo_rodizio);
  List_Header(Implementation(Controle_Torneio_i),chamar_para_pista)==(chamar_para_pista(ss));
  List_Header(Implementation(Controle_Torneio_i),correr_boi_classificacao)==(correr_boi_classificacao(ss,jj));
  List_Header(Implementation(Controle_Torneio_i),iniciar_fase_disputa)==(iniciar_fase_disputa);
  List_Header(Implementation(Controle_Torneio_i),correr_boi_disputa)==(correr_boi_disputa(jj));
  List_Header(Implementation(Controle_Torneio_i),iniciar_nova_rodada_disputa)==(iniciar_nova_rodada_disputa);
  List_Header(Implementation(Controle_Torneio_i),finalizar_sem_vencedor)==(finalizar_sem_vencedor);
  List_Header(Implementation(Controle_Torneio_i),rachar_sem_finalizar)==(rachar_sem_finalizar);
  List_Header(Implementation(Controle_Torneio_i),rachar_premio)==(rachar_premio);
  List_Header(Implementation(Controle_Torneio_i),declarar_campeao_unico)==(declarar_campeao_unico);
  List_Header(Implementation(Controle_Torneio_i),observar_torneio_encerrado)==(observar_torneio_encerrado);
  List_Header(Implementation(Controle_Torneio_i),consultar_status_senha)==(res <-- consultar_status_senha(ss));
  List_Header(Implementation(Controle_Torneio_i),consultar_dono)==(res <-- consultar_dono(ss));
  List_Header(Implementation(Controle_Torneio_i),total_senhas_vendidas)==(res <-- total_senhas_vendidas);
  List_Header(Implementation(Controle_Torneio_i),consultar_bois_derrubados)==(res <-- consultar_bois_derrubados(ss))
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(Controle_Torneio_i),comprar_senha)==(btrue);
  List_Precondition(Implementation(Controle_Torneio_i),comprar_senha)==(vv: VAQUEIROS & vv: NAT1 & ss: SENHAS & ss: NAT1 & ss/:dom(dono_senha) & card(dom(dono_senha))<TOTAL_SENHAS & fase_atual = classificacao & card(dom(dono_senha|>{vv}))<LIMITE_SENHAS_VAQUEIRO & ultimo_rodizio_iniciado = FALSE);
  Own_Precondition(Implementation(Controle_Torneio_i),desistir_senha)==(btrue);
  List_Precondition(Implementation(Controle_Torneio_i),desistir_senha)==(ss: SENHAS & ss: NAT1 & ss: dom(estado_senha) & estado_senha(ss) = na_espera & fase_atual/=encerrado & ss: ran(fila_geral));
  Own_Precondition(Implementation(Controle_Torneio_i),transferir_senha)==(btrue);
  List_Precondition(Implementation(Controle_Torneio_i),transferir_senha)==(novo_vaqueiro: VAQUEIROS & novo_vaqueiro: NAT1 & ss: SENHAS & ss: NAT1 & ss: dom(estado_senha) & estado_senha(ss) = na_espera & fase_atual = classificacao & card(dom(dono_senha|>{novo_vaqueiro}))<LIMITE_SENHAS_VAQUEIRO & ss: dom(bois_corridos) & bois_corridos(ss) = 0);
  Own_Precondition(Implementation(Controle_Torneio_i),iniciar_rodizio)==(btrue);
  List_Precondition(Implementation(Controle_Torneio_i),iniciar_rodizio)==(fase_atual = classificacao & rodizio_atual = <> & size(fila_geral)>0 & size(fila_geral)>TAMANHO_RODIZIO & ultimo_rodizio_iniciado = FALSE);
  Own_Precondition(Implementation(Controle_Torneio_i),iniciar_ultimo_rodizio)==(btrue);
  List_Precondition(Implementation(Controle_Torneio_i),iniciar_ultimo_rodizio)==(fase_atual = classificacao & rodizio_atual = <> & size(fila_geral)>0 & ultimo_rodizio_iniciado = FALSE & size(fila_geral)<=TAMANHO_RODIZIO);
  Own_Precondition(Implementation(Controle_Torneio_i),chamar_para_pista)==(btrue);
  List_Precondition(Implementation(Controle_Torneio_i),chamar_para_pista)==(ss: SENHAS & ss: NAT1 & ss: dom(estado_senha) & (estado_senha(ss) = na_espera or estado_senha(ss) = classificada) & na_pista/:ran(estado_senha) & (fase_atual = classificacao & rodizio_atual/=<> & idx_correndo<=size(rodizio_atual) & ss = rodizio_atual(idx_correndo) or (fase_atual = disputa & size(fila_disputa_atual)>0 & ss = fila_disputa_atual(1))));
  Own_Precondition(Implementation(Controle_Torneio_i),correr_boi_classificacao)==(btrue);
  List_Precondition(Implementation(Controle_Torneio_i),correr_boi_classificacao)==(fase_atual = classificacao & rodizio_atual/=<> & idx_correndo<=size(rodizio_atual) & ss: SENHAS & ss: NAT1 & ss = rodizio_atual(idx_correndo) & jj: JULGAMENTO & estado_senha(rodizio_atual(idx_correndo)) = na_pista & rodizio_atual(idx_correndo): dom(bois_corridos));
  Own_Precondition(Implementation(Controle_Torneio_i),iniciar_fase_disputa)==(btrue);
  List_Precondition(Implementation(Controle_Torneio_i),iniciar_fase_disputa)==(fase_atual = classificacao & rodizio_atual = <> & size(fila_geral) = 0 & size(fila_disputa_proxima)>0);
  Own_Precondition(Implementation(Controle_Torneio_i),correr_boi_disputa)==(btrue);
  List_Precondition(Implementation(Controle_Torneio_i),correr_boi_disputa)==(fase_atual = disputa & size(fila_disputa_atual)>0 & jj: JULGAMENTO & estado_senha(fila_disputa_atual(1)) = na_pista);
  Own_Precondition(Implementation(Controle_Torneio_i),iniciar_nova_rodada_disputa)==(btrue);
  List_Precondition(Implementation(Controle_Torneio_i),iniciar_nova_rodada_disputa)==(fase_atual = disputa & size(fila_disputa_atual) = 0 & (size(fila_disputa_proxima)>0 or size(eliminados_nesta_rodada)>0) & size(fila_disputa_proxima)/=1 & (size(fila_disputa_proxima)>0 & #(xx,yy).(xx: dom(estado_senha) & yy: dom(estado_senha) & xx/=yy & estado_senha(xx) = classificada & estado_senha(yy) = classificada & xx: dom(dono_senha) & yy: dom(dono_senha) & dono_senha(xx)/=dono_senha(yy)) or (size(fila_disputa_proxima) = 0 & size(eliminados_nesta_rodada)>1)));
  Own_Precondition(Implementation(Controle_Torneio_i),finalizar_sem_vencedor)==(btrue);
  List_Precondition(Implementation(Controle_Torneio_i),finalizar_sem_vencedor)==(fase_atual = classificacao & rodizio_atual = <> & size(fila_geral) = 0 & ultimo_rodizio_iniciado = TRUE & size(fila_disputa_proxima) = 0);
  Own_Precondition(Implementation(Controle_Torneio_i),rachar_sem_finalizar)==(btrue);
  List_Precondition(Implementation(Controle_Torneio_i),rachar_sem_finalizar)==(fase_atual = disputa & na_pista/:ran(estado_senha) & size(fila_disputa_atual) = 0 & #(xx,yy,zz).(xx: dom(estado_senha) & yy: dom(estado_senha) & zz: dom(estado_senha) & xx/=yy & xx/=zz & yy/=zz & estado_senha(xx) = classificada & estado_senha(yy) = classificada & estado_senha(zz) = classificada & xx: dom(dono_senha) & yy: dom(dono_senha) & zz: dom(dono_senha) & dono_senha(xx)/=dono_senha(yy) & dono_senha(xx)/=dono_senha(zz) & dono_senha(yy)/=dono_senha(zz)));
  Own_Precondition(Implementation(Controle_Torneio_i),rachar_premio)==(btrue);
  List_Precondition(Implementation(Controle_Torneio_i),rachar_premio)==(fase_atual = disputa & na_pista/:ran(estado_senha) & size(fila_disputa_atual) = 0 & #(xx,yy).(xx: dom(estado_senha) & yy: dom(estado_senha) & xx/=yy & estado_senha(xx) = classificada & estado_senha(yy) = classificada & xx: dom(dono_senha) & yy: dom(dono_senha) & dono_senha(xx)/=dono_senha(yy)));
  Own_Precondition(Implementation(Controle_Torneio_i),declarar_campeao_unico)==(btrue);
  List_Precondition(Implementation(Controle_Torneio_i),declarar_campeao_unico)==(fase_atual = disputa & na_pista/:ran(estado_senha) & size(fila_disputa_atual) = 0 & #vv.(vv: VAQUEIROS & #xx.(xx: dom(estado_senha) & estado_senha(xx) = classificada) & !yy.(yy: dom(estado_senha) & yy: dom(dono_senha) & estado_senha(yy) = classificada => dono_senha(yy) = vv)));
  Own_Precondition(Implementation(Controle_Torneio_i),observar_torneio_encerrado)==(btrue);
  List_Precondition(Implementation(Controle_Torneio_i),observar_torneio_encerrado)==(fase_atual = encerrado);
  Own_Precondition(Implementation(Controle_Torneio_i),consultar_status_senha)==(btrue);
  List_Precondition(Implementation(Controle_Torneio_i),consultar_status_senha)==(ss: NAT1 & ss: dom(estado_senha));
  Own_Precondition(Implementation(Controle_Torneio_i),consultar_dono)==(btrue);
  List_Precondition(Implementation(Controle_Torneio_i),consultar_dono)==(ss: NAT1 & ss: dom(dono_senha));
  Own_Precondition(Implementation(Controle_Torneio_i),total_senhas_vendidas)==(btrue);
  List_Precondition(Implementation(Controle_Torneio_i),total_senhas_vendidas)==(btrue);
  Own_Precondition(Implementation(Controle_Torneio_i),consultar_bois_derrubados)==(btrue);
  List_Precondition(Implementation(Controle_Torneio_i),consultar_bois_derrubados)==(ss: NAT1 & ss: dom(bois_corridos))
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(Controle_Torneio_i),consultar_bois_derrubados)==(ss: NAT1 & ss: dom(bois_corridos) | res:=bois_corridos(ss));
  Expanded_List_Substitution(Implementation(Controle_Torneio_i),total_senhas_vendidas)==(btrue | @(ii,st,count).((0: INT | count:=0);(1: INT | ii:=1);WHILE ii<=20 DO (ii: NAT1 & ii: dom(estado_senha) | st:=estado_senha(ii));(st = eliminada or st = classificada or st = na_pista or st = campea or st = na_espera ==> (count+1: INT & count: INT & 1: INT | count:=count+1) [] not(st = eliminada or st = classificada or st = na_pista or st = campea or st = na_espera) ==> skip);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 1..21 VARIANT 21-ii END;(count: INT | res:=count)));
  Expanded_List_Substitution(Implementation(Controle_Torneio_i),consultar_dono)==(ss: NAT1 & ss: dom(dono_senha) | res:=dono_senha(ss));
  Expanded_List_Substitution(Implementation(Controle_Torneio_i),consultar_status_senha)==(ss: NAT1 & ss: dom(estado_senha) | res:=estado_senha(ss));
  Expanded_List_Substitution(Implementation(Controle_Torneio_i),observar_torneio_encerrado)==(fase_atual = encerrado | skip);
  Expanded_List_Substitution(Implementation(Controle_Torneio_i),declarar_campeao_unico)==(fase_atual = disputa & na_pista/:ran(estado_senha) & size(fila_disputa_atual) = 0 & #vv.(vv: VAQUEIROS & #xx.(xx: dom(estado_senha) & estado_senha(xx) = classificada) & !yy.(yy: dom(estado_senha) & yy: dom(dono_senha) & estado_senha(yy) = classificada => dono_senha(yy) = vv)) | @(ii,st,vq,cur_prize).((1: INT | ii:=1);WHILE ii<=20 DO (ii: NAT1 & ii: dom(estado_senha) | st:=estado_senha(ii));(st = classificada ==> ((ii: NAT1 & ii: dom(dono_senha) | vq:=dono_senha(ii));(ii-1: INT & ii: INT & 1: INT & ii-1: dom(colocacao_arr) | colocacao_arr:=colocacao_arr<+{ii-1|->1})) [] not(st = classificada) ==> skip);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 1..21 VARIANT 21-ii END;(vq-1: INT & vq: INT & 1: INT & vq-1: dom(premiacao_individual_arr) | cur_prize:=premiacao_individual_arr(vq-1));(cur_prize+premiacao_total_atual_v: INT & cur_prize: INT & premiacao_total_atual_v: INT | cur_prize:=cur_prize+premiacao_total_atual_v);(vq-1: INT & vq: INT & 1: INT & vq-1: dom(premiacao_individual_arr) & cur_prize: INT | premiacao_individual_arr:=premiacao_individual_arr<+{vq-1|->cur_prize});fase_atual_v:=encerrado;(btrue | estado_senha:=estado_senha<+dom(estado_senha|>{classificada})*{campea})));
  Expanded_List_Substitution(Implementation(Controle_Torneio_i),rachar_premio)==(fase_atual = disputa & na_pista/:ran(estado_senha) & size(fila_disputa_atual) = 0 & #(xx,yy).(xx: dom(estado_senha) & yy: dom(estado_senha) & xx/=yy & estado_senha(xx) = classificada & estado_senha(yy) = classificada & xx: dom(dono_senha) & yy: dom(dono_senha) & dono_senha(xx)/=dono_senha(yy)) | @(ii,qtd,st,vq,prize_per_senha,cur_prize).((0: INT | qtd:=0);(1: INT | ii:=1);WHILE ii<=20 DO (ii: NAT1 & ii: dom(estado_senha) | st:=estado_senha(ii));(st = classificada ==> (qtd+1: INT & qtd: INT & 1: INT | qtd:=qtd+1) [] not(st = classificada) ==> skip);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 1..21 VARIANT 21-ii END;(qtd>0 ==> ((premiacao_total_atual_v/qtd: INT & premiacao_total_atual_v: INT & qtd: INT & not(qtd = 0) | prize_per_senha:=premiacao_total_atual_v/qtd);(1: INT | ii:=1);WHILE ii<=20 DO (ii: NAT1 & ii: dom(estado_senha) | st:=estado_senha(ii));(st = classificada ==> ((ii: NAT1 & ii: dom(dono_senha) | vq:=dono_senha(ii));(vq-1: INT & vq: INT & 1: INT & vq-1: dom(premiacao_individual_arr) | cur_prize:=premiacao_individual_arr(vq-1));(cur_prize+prize_per_senha: INT & cur_prize: INT & prize_per_senha: INT | cur_prize:=cur_prize+prize_per_senha);(vq-1: INT & vq: INT & 1: INT & vq-1: dom(premiacao_individual_arr) & cur_prize: INT | premiacao_individual_arr:=premiacao_individual_arr<+{vq-1|->cur_prize});(ii-1: INT & ii: INT & 1: INT & ii-1: dom(colocacao_arr) | colocacao_arr:=colocacao_arr<+{ii-1|->1})) [] not(st = classificada) ==> skip);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 1..21 VARIANT 21-ii END) [] not(qtd>0) ==> skip);fase_atual_v:=encerrado;(btrue | estado_senha:=estado_senha<+dom(estado_senha|>{classificada})*{campea})));
  Expanded_List_Substitution(Implementation(Controle_Torneio_i),rachar_sem_finalizar)==(fase_atual = disputa & na_pista/:ran(estado_senha) & size(fila_disputa_atual) = 0 & #(xx,yy,zz).(xx: dom(estado_senha) & yy: dom(estado_senha) & zz: dom(estado_senha) & xx/=yy & xx/=zz & yy/=zz & estado_senha(xx) = classificada & estado_senha(yy) = classificada & estado_senha(zz) = classificada & xx: dom(dono_senha) & yy: dom(dono_senha) & zz: dom(dono_senha) & dono_senha(xx)/=dono_senha(yy) & dono_senha(xx)/=dono_senha(zz) & dono_senha(yy)/=dono_senha(zz)) | @(ii,qtd,st,div_base,prize_calc).((0: INT | qtd:=0);(1: INT | ii:=1);WHILE ii<=20 DO (ii: NAT1 & ii: dom(estado_senha) | st:=estado_senha(ii));(st = classificada ==> (qtd+1: INT & qtd: INT & 1: INT | qtd:=qtd+1) [] not(st = classificada) ==> skip);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 1..21 VARIANT 21-ii END;racha_sem_finalizar_v:=TRUE;(qtd: INT | posicao_atual_v:=qtd);(qtd-1: INT & qtd: INT & 1: INT | div_base:=qtd-1);(2*div_base: INT & 2: INT & div_base: INT | div_base:=2*div_base);(div_base>0 ==> ((premiacao_total_atual_v/div_base: INT & premiacao_total_atual_v: INT & div_base: INT & not(div_base = 0) | prize_calc:=premiacao_total_atual_v/div_base);(prize_calc: INT | premiacao_vagas_v:=prize_calc)) [] not(div_base>0) ==> skip)));
  Expanded_List_Substitution(Implementation(Controle_Torneio_i),finalizar_sem_vencedor)==(fase_atual = classificacao & rodizio_atual = <> & size(fila_geral) = 0 & ultimo_rodizio_iniciado = TRUE & size(fila_disputa_proxima) = 0 | fase_atual_v:=encerrado);
  Expanded_List_Substitution(Implementation(Controle_Torneio_i),iniciar_nova_rodada_disputa)==(fase_atual = disputa & size(fila_disputa_atual) = 0 & (size(fila_disputa_proxima)>0 or size(eliminados_nesta_rodada)>0) & size(fila_disputa_proxima)/=1 & (size(fila_disputa_proxima)>0 & #(xx,yy).(xx: dom(estado_senha) & yy: dom(estado_senha) & xx/=yy & estado_senha(xx) = classificada & estado_senha(yy) = classificada & xx: dom(dono_senha) & yy: dom(dono_senha) & dono_senha(xx)/=dono_senha(yy)) or (size(fila_disputa_proxima) = 0 & size(eliminados_nesta_rodada)>1)) & size(fila_disputa_atual) = 0 & (size(fila_disputa_proxima)>0 or size(eliminados_nesta_rodada)>0) | size(fila_disputa_proxima)>0 ==> fila_disputa_atual,fila_disputa_proxima,eliminados_nesta_rodada:=fila_disputa_proxima,<>,<> [] not(size(fila_disputa_proxima)>0) ==> fila_disputa_atual,estado_senha,eliminados_nesta_rodada:=eliminados_nesta_rodada,estado_senha<+ran(eliminados_nesta_rodada)*{classificada},<>);
  Expanded_List_Substitution(Implementation(Controle_Torneio_i),correr_boi_disputa)==(fase_atual = disputa & size(fila_disputa_atual)>0 & jj: JULGAMENTO & estado_senha(fila_disputa_atual(1)) = na_pista | @(ss_val,vaqueiro_eliminado,calc_premio).(jj = zero_boi & racha_sem_finalizar_v = TRUE ==> ((size(fila_disputa_atual)>0 | ss_val:=fila_disputa_atual(1));(ss_val: NAT1 & ss_val: dom(dono_senha) | vaqueiro_eliminado:=dono_senha(ss_val));(vaqueiro_eliminado-1: INT & vaqueiro_eliminado: INT & 1: INT & vaqueiro_eliminado-1: dom(premiacao_individual_arr) | calc_premio:=premiacao_individual_arr(vaqueiro_eliminado-1));(calc_premio+premiacao_vagas_v: INT & calc_premio: INT & premiacao_vagas_v: INT | calc_premio:=calc_premio+premiacao_vagas_v);(vaqueiro_eliminado-1: INT & vaqueiro_eliminado: INT & 1: INT & vaqueiro_eliminado-1: dom(premiacao_individual_arr) & calc_premio: INT | premiacao_individual_arr:=premiacao_individual_arr<+{vaqueiro_eliminado-1|->calc_premio});(premiacao_total_atual_v-premiacao_vagas_v: INT & premiacao_total_atual_v: INT & premiacao_vagas_v: INT | premiacao_total_atual_v:=premiacao_total_atual_v-premiacao_vagas_v);(ss_val-1: INT & ss_val: INT & 1: INT & ss_val-1: dom(colocacao_arr) & posicao_atual_v: INT | colocacao_arr:=colocacao_arr<+{ss_val-1|->posicao_atual_v});(posicao_atual_v-1: INT & posicao_atual_v: INT & 1: INT | posicao_atual_v:=posicao_atual_v-1)) [] not(jj = zero_boi & racha_sem_finalizar_v = TRUE) ==> skip;(size(fila_disputa_atual)>0 & jj: JULGAMENTO | @ss.(ss = fila_disputa_atual(1) ==> (jj = zero_boi ==> estado_senha,fila_disputa_atual,eliminados_nesta_rodada:=estado_senha<+{ss|->eliminada},fila_disputa_atual\|/1,eliminados_nesta_rodada<-ss [] not(jj = zero_boi) ==> (jj = valeu_boi ==> (estado_senha,fila_disputa_atual:=estado_senha<+{ss|->classificada},fila_disputa_atual\|/1 || @(f1,f2).(f1: iseq(NAT1) & f2: iseq(NAT1) & fila_disputa_proxima = f1^f2 & !xx.(xx: ran(f1) => xx<ss) & !yy.(yy: ran(f2) => yy>ss) ==> fila_disputa_proxima:=f1^[ss]^f2)) [] not(jj = valeu_boi) ==> estado_senha,fila_disputa_atual:=estado_senha<+{ss|->classificada},fila_disputa_atual\|/1<-ss))))));
  Expanded_List_Substitution(Implementation(Controle_Torneio_i),iniciar_fase_disputa)==(fase_atual = classificacao & rodizio_atual = <> & size(fila_geral) = 0 & size(fila_disputa_proxima)>0 | fase_atual_v:=disputa);
  Expanded_List_Substitution(Implementation(Controle_Torneio_i),correr_boi_classificacao)==(fase_atual = classificacao & rodizio_atual/=<> & idx_correndo<=size(rodizio_atual) & ss: SENHAS & ss: NAT1 & ss = rodizio_atual(idx_correndo) & jj: JULGAMENTO & estado_senha(rodizio_atual(idx_correndo)) = na_pista & rodizio_atual(idx_correndo): dom(bois_corridos) | @(bc,lim,ii,prox,tmp_val,nbc).((ss: NAT1 & ss: dom(estado_senha) & jj: JULGAMENTO | jj = zero_boi ==> estado_senha:=estado_senha<+{ss|->eliminada} [] not(jj = zero_boi) ==> (jj = valeu_boi ==> (bois_corridos:=bois_corridos<+{ss|->bois_corridos(ss)+1} || (bois_corridos(ss)+1 = BOIS_PARA_CLASSIFICAR ==> (estado_senha:=estado_senha<+{ss|->classificada} || @(f1,f2).(f1: iseq(NAT1) & f2: iseq(NAT1) & fila_disputa_proxima = f1^f2 & !xx.(xx: ran(f1) => xx<ss) & !yy.(yy: ran(f2) => yy>ss) ==> fila_disputa_proxima:=f1^[ss]^f2)) [] not(bois_corridos(ss)+1 = BOIS_PARA_CLASSIFICAR) ==> estado_senha:=estado_senha<+{ss|->na_espera})) [] not(jj = valeu_boi) ==> estado_senha:=estado_senha<+{ss|->na_espera}));(ss: NAT1 & ss: dom(bois_corridos) | bc:=bois_corridos(ss));(bc+1: INT & bc: INT & 1: INT | nbc:=bc+1);(jj = zero_boi or (jj = valeu_boi & nbc = BOIS_PARA_CLASSIFICAR) ==> ((idx_correndo_v-1: INT & idx_correndo_v: INT & 1: INT | ii:=idx_correndo_v-1);(rodizio_size-1: INT & rodizio_size: INT & 1: INT | lim:=rodizio_size-1);WHILE ii<lim DO (ii+1: INT & ii: INT & 1: INT | prox:=ii+1);(prox: dom(rodizio_arr) | tmp_val:=rodizio_arr(prox));(ii: dom(rodizio_arr) & tmp_val: INT | rodizio_arr:=rodizio_arr<+{ii|->tmp_val});(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: idx_correndo_v-1..lim VARIANT lim-ii END;(rodizio_size-1: INT & rodizio_size: INT & 1: INT | rodizio_size:=rodizio_size-1);(rodizio_size = 0 ==> (1: INT | idx_correndo_v:=1) [] not(rodizio_size = 0) ==> (idx_correndo_v>rodizio_size ==> (1: INT | idx_correndo_v:=1) [] not(idx_correndo_v>rodizio_size) ==> skip))) [] not(jj = zero_boi or (jj = valeu_boi & nbc = BOIS_PARA_CLASSIFICAR)) ==> (idx_correndo_v<rodizio_size ==> (idx_correndo_v+1: INT & idx_correndo_v: INT & 1: INT | idx_correndo_v:=idx_correndo_v+1) [] not(idx_correndo_v<rodizio_size) ==> (1: INT | idx_correndo_v:=1)))));
  Expanded_List_Substitution(Implementation(Controle_Torneio_i),chamar_para_pista)==(ss: SENHAS & ss: NAT1 & ss: dom(estado_senha) & (estado_senha(ss) = na_espera or estado_senha(ss) = classificada) & na_pista/:ran(estado_senha) & (fase_atual = classificacao & rodizio_atual/=<> & idx_correndo<=size(rodizio_atual) & ss = rodizio_atual(idx_correndo) or (fase_atual = disputa & size(fila_disputa_atual)>0 & ss = fila_disputa_atual(1))) & ss: SENHAS & ss: NAT1 & ss: dom(estado_senha) & na_pista: STATUS_SENHA | estado_senha:=estado_senha<+{ss|->na_pista});
  Expanded_List_Substitution(Implementation(Controle_Torneio_i),iniciar_ultimo_rodizio)==(fase_atual = classificacao & rodizio_atual = <> & size(fila_geral)>0 & ultimo_rodizio_iniciado = FALSE & size(fila_geral)<=TAMANHO_RODIZIO | @(tam,ii,tmp_val).((size(fila_geral)>0 | size(fila_geral)>TAMANHO_RODIZIO ==> buffer_saida,tamanho_buffer_saida,fila_geral:=fila_geral/|\TAMANHO_RODIZIO,TAMANHO_RODIZIO,fila_geral\|/TAMANHO_RODIZIO [] not(size(fila_geral)>TAMANHO_RODIZIO) ==> buffer_saida,tamanho_buffer_saida,fila_geral:=fila_geral,size(fila_geral),<>);(btrue | tam:=tamanho_buffer_saida);(0: INT | ii:=0);WHILE ii<tam DO (ii+1: INT & ii: INT & 1: INT & ii+1: NAT1 & ii+1<=tamanho_buffer_saida | tmp_val:=buffer_saida(ii+1));(ii: dom(rodizio_arr) & tmp_val: INT | rodizio_arr:=rodizio_arr<+{ii|->tmp_val});(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 0..tam VARIANT tam-ii END;(tam: INT | rodizio_size:=tam);(1: INT | idx_correndo_v:=1);ultimo_rodizio_iniciado_v:=TRUE;torneio_iniciado_v:=TRUE));
  Expanded_List_Substitution(Implementation(Controle_Torneio_i),iniciar_rodizio)==(fase_atual = classificacao & rodizio_atual = <> & size(fila_geral)>0 & size(fila_geral)>TAMANHO_RODIZIO & ultimo_rodizio_iniciado = FALSE | @(tam,ii,tmp_val).((size(fila_geral)>0 | size(fila_geral)>TAMANHO_RODIZIO ==> buffer_saida,tamanho_buffer_saida,fila_geral:=fila_geral/|\TAMANHO_RODIZIO,TAMANHO_RODIZIO,fila_geral\|/TAMANHO_RODIZIO [] not(size(fila_geral)>TAMANHO_RODIZIO) ==> buffer_saida,tamanho_buffer_saida,fila_geral:=fila_geral,size(fila_geral),<>);(btrue | tam:=tamanho_buffer_saida);(0: INT | ii:=0);WHILE ii<tam DO (ii+1: INT & ii: INT & 1: INT & ii+1: NAT1 & ii+1<=tamanho_buffer_saida | tmp_val:=buffer_saida(ii+1));(ii: dom(rodizio_arr) & tmp_val: INT | rodizio_arr:=rodizio_arr<+{ii|->tmp_val});(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 0..tam VARIANT tam-ii END;(tam: INT | rodizio_size:=tam);(1: INT | idx_correndo_v:=1);torneio_iniciado_v:=TRUE));
  Expanded_List_Substitution(Implementation(Controle_Torneio_i),transferir_senha)==(novo_vaqueiro: VAQUEIROS & novo_vaqueiro: NAT1 & ss: SENHAS & ss: NAT1 & ss: dom(estado_senha) & estado_senha(ss) = na_espera & fase_atual = classificacao & card(dom(dono_senha|>{novo_vaqueiro}))<LIMITE_SENHAS_VAQUEIRO & ss: dom(bois_corridos) & bois_corridos(ss) = 0 & novo_vaqueiro: VAQUEIROS & novo_vaqueiro: NAT1 & ss: SENHAS & ss: NAT1 & ss: dom(dono_senha) & card(dom(dono_senha|>{novo_vaqueiro}))<LIMITE_SENHAS_VAQUEIRO & ss: dom(bois_corridos) & bois_corridos(ss) = 0 | dono_senha:=dono_senha<+{ss|->novo_vaqueiro});
  Expanded_List_Substitution(Implementation(Controle_Torneio_i),desistir_senha)==(ss: SENHAS & ss: NAT1 & ss: dom(estado_senha) & estado_senha(ss) = na_espera & fase_atual/=encerrado & ss: ran(fila_geral) & ss: SENHAS & ss: NAT1 & ss: dom(dono_senha) & ss: ran(fila_geral) | dono_senha,estado_senha,bois_corridos:={ss}<<|dono_senha,{ss}<<|estado_senha,{ss}<<|bois_corridos || @(f1,f2).(f1: iseq(NAT1) & f2: iseq(NAT1) & fila_geral = f1^[ss]^f2 ==> fila_geral:=f1^f2));
  Expanded_List_Substitution(Implementation(Controle_Torneio_i),comprar_senha)==(vv: VAQUEIROS & vv: NAT1 & ss: SENHAS & ss: NAT1 & ss/:dom(dono_senha) & card(dom(dono_senha))<TOTAL_SENHAS & fase_atual = classificacao & card(dom(dono_senha|>{vv}))<LIMITE_SENHAS_VAQUEIRO & ultimo_rodizio_iniciado = FALSE | @(last_val,idx).(rodizio_size>0 ==> ((rodizio_size-1: INT & rodizio_size: INT & 1: INT | idx:=rodizio_size-1);(idx: dom(rodizio_arr) | last_val:=rodizio_arr(idx));(vv: VAQUEIROS & vv: NAT1 & ss: SENHAS & ss: NAT1 & torneio_iniciado_v: BOOL & last_val: NAT & ss/:dom(dono_senha) & card(dom(dono_senha))<TOTAL_SENHAS & card(dom(dono_senha|>{vv}))<LIMITE_SENHAS_VAQUEIRO | dono_senha,estado_senha,bois_corridos:=dono_senha<+{ss|->vv},estado_senha<+{ss|->na_espera},bois_corridos<+{ss|->0} || (torneio_iniciado_v = FALSE ==> @(f1,f2).(f1: iseq(NAT1) & f2: iseq(NAT1) & fila_geral = f1^f2 & !xx.(xx: ran(f1) => xx<ss) & !yy.(yy: ran(f2) => yy>ss) ==> fila_geral:=f1^[ss]^f2) [] not(torneio_iniciado_v = FALSE) ==> (ss<last_val ==> fila_geral:=fila_geral<-ss [] not(ss<last_val) ==> @(f1,f2).(f1: iseq(NAT1) & f2: iseq(NAT1) & fila_geral = f1^f2 & !xx.(xx: ran(f1) => xx<ss & xx>last_val) & (f2/=<> => first(f2)>ss or first(f2)<=last_val) ==> fila_geral:=f1^[ss]^f2))))) [] not(rodizio_size>0) ==> (vv: VAQUEIROS & vv: NAT1 & ss: SENHAS & ss: NAT1 & torneio_iniciado_v: BOOL & 0: NAT & ss/:dom(dono_senha) & card(dom(dono_senha))<TOTAL_SENHAS & card(dom(dono_senha|>{vv}))<LIMITE_SENHAS_VAQUEIRO | dono_senha,estado_senha,bois_corridos:=dono_senha<+{ss|->vv},estado_senha<+{ss|->na_espera},bois_corridos<+{ss|->0} || (torneio_iniciado_v = FALSE ==> @(f1,f2).(f1: iseq(NAT1) & f2: iseq(NAT1) & fila_geral = f1^f2 & !xx.(xx: ran(f1) => xx<ss) & !yy.(yy: ran(f2) => yy>ss) ==> fila_geral:=f1^[ss]^f2) [] not(torneio_iniciado_v = FALSE) ==> (ss<0 ==> fila_geral:=fila_geral<-ss [] not(ss<0) ==> @(f1,f2).(f1: iseq(NAT1) & f2: iseq(NAT1) & fila_geral = f1^f2 & !xx.(xx: ran(f1) => xx<ss & xx>0) & (f2/=<> => first(f2)>ss or first(f2)<=0) ==> fila_geral:=f1^[ss]^f2))))));
  List_Substitution(Implementation(Controle_Torneio_i),comprar_senha)==(VAR last_val,idx IN IF rodizio_size>0 THEN idx:=rodizio_size-1;last_val:=rodizio_arr(idx);cadastrar_senha(vv,ss,torneio_iniciado_v,last_val) ELSE cadastrar_senha(vv,ss,torneio_iniciado_v,0) END END);
  List_Substitution(Implementation(Controle_Torneio_i),desistir_senha)==(cancelar_registro_senha(ss));
  List_Substitution(Implementation(Controle_Torneio_i),transferir_senha)==(atualizar_dono(ss,novo_vaqueiro));
  List_Substitution(Implementation(Controle_Torneio_i),iniciar_rodizio)==(VAR tam,ii,tmp_val IN extrair_lote_rodizio;tam <-- consultar_tamanho_lote_saida;ii:=0;WHILE ii<tam DO tmp_val <-- consultar_lote_saida(ii+1);rodizio_arr(ii):=tmp_val;ii:=ii+1 INVARIANT ii: 0..tam VARIANT tam-ii END;rodizio_size:=tam;idx_correndo_v:=1;torneio_iniciado_v:=TRUE END);
  List_Substitution(Implementation(Controle_Torneio_i),iniciar_ultimo_rodizio)==(VAR tam,ii,tmp_val IN extrair_lote_rodizio;tam <-- consultar_tamanho_lote_saida;ii:=0;WHILE ii<tam DO tmp_val <-- consultar_lote_saida(ii+1);rodizio_arr(ii):=tmp_val;ii:=ii+1 INVARIANT ii: 0..tam VARIANT tam-ii END;rodizio_size:=tam;idx_correndo_v:=1;ultimo_rodizio_iniciado_v:=TRUE;torneio_iniciado_v:=TRUE END);
  List_Substitution(Implementation(Controle_Torneio_i),chamar_para_pista)==(atualizar_status(ss,na_pista));
  List_Substitution(Implementation(Controle_Torneio_i),correr_boi_classificacao)==(VAR bc,lim,ii,prox,tmp_val,nbc IN registrar_julgamento_classificacao(ss,jj);bc <-- get_bois_corridos(ss);nbc:=bc+1;IF jj = zero_boi or (jj = valeu_boi & nbc = BOIS_PARA_CLASSIFICAR) THEN ii:=idx_correndo_v-1;lim:=rodizio_size-1;WHILE ii<lim DO prox:=ii+1;tmp_val:=rodizio_arr(prox);rodizio_arr(ii):=tmp_val;ii:=ii+1 INVARIANT ii: idx_correndo_v-1..lim VARIANT lim-ii END;rodizio_size:=rodizio_size-1;IF rodizio_size = 0 THEN idx_correndo_v:=1 ELSIF idx_correndo_v>rodizio_size THEN idx_correndo_v:=1 END ELSE IF idx_correndo_v<rodizio_size THEN idx_correndo_v:=idx_correndo_v+1 ELSE idx_correndo_v:=1 END END END);
  List_Substitution(Implementation(Controle_Torneio_i),iniciar_fase_disputa)==(fase_atual_v:=disputa);
  List_Substitution(Implementation(Controle_Torneio_i),correr_boi_disputa)==(VAR ss_val,vaqueiro_eliminado,calc_premio IN IF jj = zero_boi & racha_sem_finalizar_v = TRUE THEN ss_val <-- get_primeiro_fila_disputa;vaqueiro_eliminado <-- get_dono_senha(ss_val);calc_premio:=premiacao_individual_arr(vaqueiro_eliminado-1);calc_premio:=calc_premio+premiacao_vagas_v;premiacao_individual_arr(vaqueiro_eliminado-1):=calc_premio;premiacao_total_atual_v:=premiacao_total_atual_v-premiacao_vagas_v;colocacao_arr(ss_val-1):=posicao_atual_v;posicao_atual_v:=posicao_atual_v-1 END;processar_resultado_disputa(jj) END);
  List_Substitution(Implementation(Controle_Torneio_i),iniciar_nova_rodada_disputa)==(avancar_rodada_disputa);
  List_Substitution(Implementation(Controle_Torneio_i),finalizar_sem_vencedor)==(fase_atual_v:=encerrado);
  List_Substitution(Implementation(Controle_Torneio_i),rachar_sem_finalizar)==(VAR ii,qtd,st,div_base,prize_calc IN qtd:=0;ii:=1;WHILE ii<=20 DO st <-- get_estado_senha(ii);IF st = classificada THEN qtd:=qtd+1 END;ii:=ii+1 INVARIANT ii: 1..21 VARIANT 21-ii END;racha_sem_finalizar_v:=TRUE;posicao_atual_v:=qtd;div_base:=qtd-1;div_base:=2*div_base;IF div_base>0 THEN prize_calc:=premiacao_total_atual_v/div_base;premiacao_vagas_v:=prize_calc END END);
  List_Substitution(Implementation(Controle_Torneio_i),rachar_premio)==(VAR ii,qtd,st,vq,prize_per_senha,cur_prize IN qtd:=0;ii:=1;WHILE ii<=20 DO st <-- get_estado_senha(ii);IF st = classificada THEN qtd:=qtd+1 END;ii:=ii+1 INVARIANT ii: 1..21 VARIANT 21-ii END;IF qtd>0 THEN prize_per_senha:=premiacao_total_atual_v/qtd;ii:=1;WHILE ii<=20 DO st <-- get_estado_senha(ii);IF st = classificada THEN vq <-- get_dono_senha(ii);cur_prize:=premiacao_individual_arr(vq-1);cur_prize:=cur_prize+prize_per_senha;premiacao_individual_arr(vq-1):=cur_prize;colocacao_arr(ii-1):=1 END;ii:=ii+1 INVARIANT ii: 1..21 VARIANT 21-ii END END;fase_atual_v:=encerrado;finalizar_torneio END);
  List_Substitution(Implementation(Controle_Torneio_i),declarar_campeao_unico)==(VAR ii,st,vq,cur_prize IN ii:=1;WHILE ii<=20 DO st <-- get_estado_senha(ii);IF st = classificada THEN vq <-- get_dono_senha(ii);colocacao_arr(ii-1):=1 END;ii:=ii+1 INVARIANT ii: 1..21 VARIANT 21-ii END;cur_prize:=premiacao_individual_arr(vq-1);cur_prize:=cur_prize+premiacao_total_atual_v;premiacao_individual_arr(vq-1):=cur_prize;fase_atual_v:=encerrado;finalizar_torneio END);
  List_Substitution(Implementation(Controle_Torneio_i),observar_torneio_encerrado)==(skip);
  List_Substitution(Implementation(Controle_Torneio_i),consultar_status_senha)==(res <-- get_estado_senha(ss));
  List_Substitution(Implementation(Controle_Torneio_i),consultar_dono)==(res <-- get_dono_senha(ss));
  List_Substitution(Implementation(Controle_Torneio_i),total_senhas_vendidas)==(VAR ii,st,count IN count:=0;ii:=1;WHILE ii<=20 DO st <-- get_estado_senha(ii);IF st = eliminada or st = classificada or st = na_pista or st = campea or st = na_espera THEN count:=count+1 END;ii:=ii+1 INVARIANT ii: 1..21 VARIANT 21-ii END;res:=count END);
  List_Substitution(Implementation(Controle_Torneio_i),consultar_bois_derrubados)==(res <-- get_bois_corridos(ss))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(Controle_Torneio_i))==(?);
  Inherited_List_Constants(Implementation(Controle_Torneio_i))==(?);
  List_Constants(Implementation(Controle_Torneio_i))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Implementation(Controle_Torneio_i),JULGAMENTO)==({valeu_boi,zero_boi,retorno});
  Context_List_Enumerated(Implementation(Controle_Torneio_i))==(FASES,STATUS_SENHA,JULGAMENTO);
  Context_List_Defered(Implementation(Controle_Torneio_i))==(?);
  Context_List_Sets(Implementation(Controle_Torneio_i))==(FASES,STATUS_SENHA,JULGAMENTO);
  List_Own_Enumerated(Implementation(Controle_Torneio_i))==(?);
  List_Valuable_Sets(Implementation(Controle_Torneio_i))==(?);
  Inherited_List_Enumerated(Implementation(Controle_Torneio_i))==(?);
  Inherited_List_Defered(Implementation(Controle_Torneio_i))==(?);
  Inherited_List_Sets(Implementation(Controle_Torneio_i))==(?);
  List_Enumerated(Implementation(Controle_Torneio_i))==(?);
  List_Defered(Implementation(Controle_Torneio_i))==(?);
  List_Sets(Implementation(Controle_Torneio_i))==(?);
  Set_Definition(Implementation(Controle_Torneio_i),STATUS_SENHA)==({na_espera,na_pista,classificada,eliminada,campea});
  Set_Definition(Implementation(Controle_Torneio_i),FASES)==({classificacao,disputa,encerrado})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(Controle_Torneio_i))==(?);
  Expanded_List_HiddenConstants(Implementation(Controle_Torneio_i))==(?);
  List_HiddenConstants(Implementation(Controle_Torneio_i))==(?);
  External_List_HiddenConstants(Implementation(Controle_Torneio_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(Controle_Torneio_i))==(btrue);
  Context_List_Properties(Implementation(Controle_Torneio_i))==(TOTAL_SENHAS: NAT1 & TOTAL_SENHAS = 20 & LIMITE_SENHAS_VAQUEIRO: NAT1 & LIMITE_SENHAS_VAQUEIRO = max({1,TOTAL_SENHAS/5}) & BOIS_PARA_CLASSIFICAR: NAT1 & BOIS_PARA_CLASSIFICAR = 2 & TAMANHO_RODIZIO: NAT1 & TAMANHO_RODIZIO = 4 & VAQUEIROS <: NAT1 & VAQUEIROS = 1..3 & SENHAS <: NAT1 & SENHAS = 1..TOTAL_SENHAS & PREMIO_TOTAL: NAT1 & PREMIO_TOTAL = 10000 & FASES: FIN(INTEGER) & not(FASES = {}) & STATUS_SENHA: FIN(INTEGER) & not(STATUS_SENHA = {}) & JULGAMENTO: FIN(INTEGER) & not(JULGAMENTO = {}));
  Inherited_List_Properties(Implementation(Controle_Torneio_i))==(btrue);
  List_Properties(Implementation(Controle_Torneio_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(Controle_Torneio_i))==(aa: aa);
  List_Values(Implementation(Controle_Torneio_i))==(?)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Implementation(Controle_Torneio_i),Machine(Contexto_Vaquejada))==(?);
  Seen_Context_List_Enumerated(Implementation(Controle_Torneio_i))==(?);
  Seen_Context_List_Invariant(Implementation(Controle_Torneio_i))==(btrue);
  Seen_Context_List_Assertions(Implementation(Controle_Torneio_i))==(btrue);
  Seen_Context_List_Properties(Implementation(Controle_Torneio_i))==(btrue);
  Seen_List_Constraints(Implementation(Controle_Torneio_i))==(btrue);
  Seen_List_Operations(Implementation(Controle_Torneio_i),Machine(Contexto_Vaquejada))==(?);
  Seen_Expanded_List_Invariant(Implementation(Controle_Torneio_i),Machine(Contexto_Vaquejada))==(btrue)
END
&
THEORY ListIncludedOperationsX IS
  List_Included_Operations(Implementation(Controle_Torneio_i),Machine(Gerenciador_Senhas))==(cadastrar_senha,atualizar_status,cancelar_registro_senha,atualizar_dono,extrair_lote_rodizio,registrar_julgamento_classificacao,processar_resultado_disputa,avancar_rodada_disputa,finalizar_torneio,consultar_lote_saida,consultar_tamanho_lote_saida,get_estado_senha,get_dono_senha,get_bois_corridos,get_primeiro_fila_disputa)
END
&
THEORY InheritedEnvX IS
  VisibleVariables(Implementation(Controle_Torneio_i))==(Type(fase_atual_v) == Mvv(etype(FASES,?,?));Type(rodizio_arr) == Mvv(SetOf(btype(INTEGER,0,3)*btype(INTEGER,0,MAXINT)));Type(rodizio_size) == Mvv(btype(INTEGER,?,?));Type(idx_correndo_v) == Mvv(btype(INTEGER,?,?));Type(torneio_iniciado_v) == Mvv(btype(BOOL,?,?));Type(ultimo_rodizio_iniciado_v) == Mvv(btype(BOOL,?,?));Type(racha_sem_finalizar_v) == Mvv(btype(BOOL,?,?));Type(premiacao_individual_arr) == Mvv(SetOf(btype(INTEGER,0,2)*btype(INTEGER,0,MAXINT)));Type(premiacao_vagas_v) == Mvv(btype(INTEGER,?,?));Type(premiacao_total_atual_v) == Mvv(btype(INTEGER,?,?));Type(colocacao_arr) == Mvv(SetOf(btype(INTEGER,0,19)*btype(INTEGER,0,MAXINT)));Type(posicao_atual_v) == Mvv(btype(INTEGER,?,?)));
  Operations(Implementation(Controle_Torneio_i))==(Type(consultar_bois_derrubados) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(total_senhas_vendidas) == Cst(btype(INTEGER,?,?),No_type);Type(consultar_dono) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(consultar_status_senha) == Cst(etype(STATUS_SENHA,?,?),btype(INTEGER,?,?));Type(observar_torneio_encerrado) == Cst(No_type,No_type);Type(declarar_campeao_unico) == Cst(No_type,No_type);Type(rachar_premio) == Cst(No_type,No_type);Type(rachar_sem_finalizar) == Cst(No_type,No_type);Type(finalizar_sem_vencedor) == Cst(No_type,No_type);Type(iniciar_nova_rodada_disputa) == Cst(No_type,No_type);Type(correr_boi_disputa) == Cst(No_type,etype(JULGAMENTO,?,?));Type(iniciar_fase_disputa) == Cst(No_type,No_type);Type(correr_boi_classificacao) == Cst(No_type,btype(INTEGER,?,?)*etype(JULGAMENTO,?,?));Type(chamar_para_pista) == Cst(No_type,btype(INTEGER,?,?));Type(iniciar_ultimo_rodizio) == Cst(No_type,No_type);Type(iniciar_rodizio) == Cst(No_type,No_type);Type(transferir_senha) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(desistir_senha) == Cst(No_type,btype(INTEGER,?,?));Type(comprar_senha) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX IS
  List_Constants(Implementation(Controle_Torneio_i),Machine(Contexto_Vaquejada))==(TOTAL_SENHAS,LIMITE_SENHAS_VAQUEIRO,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS,TAMANHO_RODIZIO,PREMIO_TOTAL);
  List_Constants_Env(Implementation(Controle_Torneio_i),Machine(Contexto_Vaquejada))==(Type(classificacao) == Cst(etype(FASES,0,2));Type(disputa) == Cst(etype(FASES,0,2));Type(encerrado) == Cst(etype(FASES,0,2));Type(na_espera) == Cst(etype(STATUS_SENHA,0,4));Type(na_pista) == Cst(etype(STATUS_SENHA,0,4));Type(classificada) == Cst(etype(STATUS_SENHA,0,4));Type(eliminada) == Cst(etype(STATUS_SENHA,0,4));Type(campea) == Cst(etype(STATUS_SENHA,0,4));Type(valeu_boi) == Cst(etype(JULGAMENTO,0,2));Type(zero_boi) == Cst(etype(JULGAMENTO,0,2));Type(retorno) == Cst(etype(JULGAMENTO,0,2));Type(TOTAL_SENHAS) == Cst(btype(INTEGER,?,?));Type(LIMITE_SENHAS_VAQUEIRO) == Cst(btype(INTEGER,?,?));Type(BOIS_PARA_CLASSIFICAR) == Cst(btype(INTEGER,?,?));Type(VAQUEIROS) == Cst(SetOf(btype(INTEGER,"[VAQUEIROS","]VAQUEIROS")));Type(SENHAS) == Cst(SetOf(btype(INTEGER,"[SENHAS","]SENHAS")));Type(TAMANHO_RODIZIO) == Cst(btype(INTEGER,?,?));Type(PREMIO_TOTAL) == Cst(btype(INTEGER,?,?)));
  Enumerate_Definition(Implementation(Controle_Torneio_i),Machine(Contexto_Vaquejada),JULGAMENTO)==({valeu_boi,zero_boi,retorno});
  Enumerate_Definition(Implementation(Controle_Torneio_i),Machine(Contexto_Vaquejada),STATUS_SENHA)==({na_espera,na_pista,classificada,eliminada,campea});
  Enumerate_Definition(Implementation(Controle_Torneio_i),Machine(Contexto_Vaquejada),FASES)==({classificacao,disputa,encerrado})
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(Controle_Torneio_i)) == (? | ? | ? | tamanho_buffer_saida,buffer_saida,eliminados_nesta_rodada,fila_disputa_proxima,fila_disputa_atual,fila_geral,bois_corridos,estado_senha,dono_senha | comprar_senha,desistir_senha,transferir_senha,iniciar_rodizio,iniciar_ultimo_rodizio,chamar_para_pista,correr_boi_classificacao,iniciar_fase_disputa,correr_boi_disputa,iniciar_nova_rodada_disputa,finalizar_sem_vencedor,rachar_sem_finalizar,rachar_premio,declarar_campeao_unico,observar_torneio_encerrado,consultar_status_senha,consultar_dono,total_senhas_vendidas,consultar_bois_derrubados | ? | seen(Machine(Contexto_Vaquejada)),imported(Machine(Gerenciador_Senhas)) | ? | Controle_Torneio_i);
  List_Of_HiddenCst_Ids(Implementation(Controle_Torneio_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(Controle_Torneio_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(Controle_Torneio_i)) == (posicao_atual_v,colocacao_arr,premiacao_total_atual_v,premiacao_vagas_v,premiacao_individual_arr,racha_sem_finalizar_v,ultimo_rodizio_iniciado_v,torneio_iniciado_v,idx_correndo_v,rodizio_size,rodizio_arr,fase_atual_v | ?);
  List_Of_Ids_SeenBNU(Implementation(Controle_Torneio_i)) == (seen(Machine(Contexto_Vaquejada)): (TOTAL_SENHAS,LIMITE_SENHAS_VAQUEIRO,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS,TAMANHO_RODIZIO,PREMIO_TOTAL,FASES,STATUS_SENHA,JULGAMENTO,classificacao,disputa,encerrado,na_espera,na_pista,classificada,eliminada,campea,valeu_boi,zero_boi,retorno | ? | ? | ? | ? | ? | ? | ? | ?));
  List_Of_Ids(Machine(Gerenciador_Senhas)) == (? | ? | tamanho_buffer_saida,buffer_saida,eliminados_nesta_rodada,fila_disputa_proxima,fila_disputa_atual,fila_geral,bois_corridos,estado_senha,dono_senha | ? | cadastrar_senha,atualizar_status,cancelar_registro_senha,atualizar_dono,extrair_lote_rodizio,registrar_julgamento_classificacao,processar_resultado_disputa,avancar_rodada_disputa,finalizar_torneio,consultar_lote_saida,consultar_tamanho_lote_saida,get_estado_senha,get_dono_senha,get_bois_corridos,get_primeiro_fila_disputa | ? | seen(Machine(Contexto_Vaquejada)) | ? | Gerenciador_Senhas);
  List_Of_HiddenCst_Ids(Machine(Gerenciador_Senhas)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Gerenciador_Senhas)) == (?);
  List_Of_VisibleVar_Ids(Machine(Gerenciador_Senhas)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Gerenciador_Senhas)) == (?: ?);
  List_Of_Ids(Machine(Contexto_Vaquejada)) == (TOTAL_SENHAS,LIMITE_SENHAS_VAQUEIRO,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS,TAMANHO_RODIZIO,PREMIO_TOTAL,FASES,STATUS_SENHA,JULGAMENTO,classificacao,disputa,encerrado,na_espera,na_pista,classificada,eliminada,campea,valeu_boi,zero_boi,retorno | ? | ? | ? | ? | ? | ? | ? | Contexto_Vaquejada);
  List_Of_HiddenCst_Ids(Machine(Contexto_Vaquejada)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Contexto_Vaquejada)) == (TOTAL_SENHAS,LIMITE_SENHAS_VAQUEIRO,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS,TAMANHO_RODIZIO,PREMIO_TOTAL);
  List_Of_VisibleVar_Ids(Machine(Contexto_Vaquejada)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Contexto_Vaquejada)) == (?: ?)
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Implementation(Controle_Torneio_i)) == (Type(posicao_atual_v) == Mvv(btype(INTEGER,?,?));Type(colocacao_arr) == Mvv(SetOf(btype(INTEGER,0,19)*btype(INTEGER,0,MAXINT)));Type(premiacao_total_atual_v) == Mvv(btype(INTEGER,?,?));Type(premiacao_vagas_v) == Mvv(btype(INTEGER,?,?));Type(premiacao_individual_arr) == Mvv(SetOf(btype(INTEGER,0,2)*btype(INTEGER,0,MAXINT)));Type(racha_sem_finalizar_v) == Mvv(btype(BOOL,?,?));Type(ultimo_rodizio_iniciado_v) == Mvv(btype(BOOL,?,?));Type(torneio_iniciado_v) == Mvv(btype(BOOL,?,?));Type(idx_correndo_v) == Mvv(btype(INTEGER,?,?));Type(rodizio_size) == Mvv(btype(INTEGER,?,?));Type(rodizio_arr) == Mvv(SetOf(btype(INTEGER,0,3)*btype(INTEGER,0,MAXINT)));Type(fase_atual_v) == Mvv(etype(FASES,?,?)))
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(Controle_Torneio_i),?, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Controle_Torneio_i),?, 2) == (Type(ii) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Controle_Torneio_i),?, 3) == (Type(ii) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Controle_Torneio_i),comprar_senha, 1) == (Type(last_val) == Lvl(btype(INTEGER,?,?));Type(idx) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Controle_Torneio_i),iniciar_rodizio, 1) == (Type(tam) == Lvl(btype(INTEGER,?,?));Type(ii) == Lvl(btype(INTEGER,?,?));Type(tmp_val) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Controle_Torneio_i),iniciar_ultimo_rodizio, 1) == (Type(tam) == Lvl(btype(INTEGER,?,?));Type(ii) == Lvl(btype(INTEGER,?,?));Type(tmp_val) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Controle_Torneio_i),correr_boi_classificacao, 1) == (Type(bc) == Lvl(btype(INTEGER,?,?));Type(lim) == Lvl(btype(INTEGER,?,?));Type(ii) == Lvl(btype(INTEGER,?,?));Type(prox) == Lvl(btype(INTEGER,?,?));Type(tmp_val) == Lvl(btype(INTEGER,?,?));Type(nbc) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Controle_Torneio_i),correr_boi_disputa, 1) == (Type(ss_val) == Lvl(btype(INTEGER,?,?));Type(vaqueiro_eliminado) == Lvl(btype(INTEGER,?,?));Type(calc_premio) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Controle_Torneio_i),rachar_sem_finalizar, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(qtd) == Lvl(btype(INTEGER,?,?));Type(st) == Lvl(etype(STATUS_SENHA,?,?));Type(div_base) == Lvl(btype(INTEGER,?,?));Type(prize_calc) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Controle_Torneio_i),rachar_premio, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(qtd) == Lvl(btype(INTEGER,?,?));Type(st) == Lvl(etype(STATUS_SENHA,?,?));Type(vq) == Lvl(btype(INTEGER,?,?));Type(prize_per_senha) == Lvl(btype(INTEGER,?,?));Type(cur_prize) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Controle_Torneio_i),declarar_campeao_unico, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(st) == Lvl(etype(STATUS_SENHA,?,?));Type(vq) == Lvl(btype(INTEGER,?,?));Type(cur_prize) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Controle_Torneio_i),total_senhas_vendidas, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(st) == Lvl(etype(STATUS_SENHA,?,?));Type(count) == Lvl(btype(INTEGER,?,?)))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
&
THEORY ListLocalOperationsX IS
  List_Local_Operations(Implementation(Controle_Torneio_i))==(?)
END
&
THEORY ListLocalInputX END
&
THEORY ListLocalOutputX END
&
THEORY ListLocalHeaderX END
&
THEORY ListLocalPreconditionX END
&
THEORY ListLocalSubstitutionX END
&
THEORY TypingPredicateX IS
  TypingPredicate(Implementation(Controle_Torneio_i))==(fase_atual_v: FASES & rodizio_arr: POW(INTEGER*INTEGER) & rodizio_size: INTEGER & idx_correndo_v: INTEGER & torneio_iniciado_v: BOOL & ultimo_rodizio_iniciado_v: BOOL & racha_sem_finalizar_v: BOOL & premiacao_individual_arr: POW(INTEGER*INTEGER) & premiacao_vagas_v: INTEGER & premiacao_total_atual_v: INTEGER & colocacao_arr: POW(INTEGER*INTEGER) & posicao_atual_v: INTEGER)
END
&
THEORY ImportedVariablesListX IS
  ImportedVariablesList(Implementation(Controle_Torneio_i),Machine(Gerenciador_Senhas))==(tamanho_buffer_saida,buffer_saida,eliminados_nesta_rodada,fila_disputa_proxima,fila_disputa_atual,fila_geral,bois_corridos,estado_senha,dono_senha);
  ImportedVisVariablesList(Implementation(Controle_Torneio_i),Machine(Gerenciador_Senhas))==(?)
END
&
THEORY ListLocalOpInvariantX END
)
