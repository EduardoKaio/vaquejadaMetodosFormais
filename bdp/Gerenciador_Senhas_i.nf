Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(Gerenciador_Senhas_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(Gerenciador_Senhas_i))==(Machine(Gerenciador_Senhas));
  Level(Implementation(Gerenciador_Senhas_i))==(1);
  Upper_Level(Implementation(Gerenciador_Senhas_i))==(Machine(Gerenciador_Senhas))
END
&
THEORY LoadedStructureX IS
  Implementation(Gerenciador_Senhas_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(Gerenciador_Senhas_i))==(Contexto_Vaquejada)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(Gerenciador_Senhas_i))==(?);
  Inherited_List_Includes(Implementation(Gerenciador_Senhas_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(Gerenciador_Senhas_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(Gerenciador_Senhas_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(Gerenciador_Senhas_i))==(?);
  Context_List_Variables(Implementation(Gerenciador_Senhas_i))==(?);
  Abstract_List_Variables(Implementation(Gerenciador_Senhas_i))==(tamanho_buffer_saida,buffer_saida,eliminados_nesta_rodada,fila_disputa_proxima,fila_disputa_atual,fila_geral,bois_corridos,estado_senha,dono_senha);
  Local_List_Variables(Implementation(Gerenciador_Senhas_i))==(?);
  List_Variables(Implementation(Gerenciador_Senhas_i))==(?);
  External_List_Variables(Implementation(Gerenciador_Senhas_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(Gerenciador_Senhas_i))==(?);
  Abstract_List_VisibleVariables(Implementation(Gerenciador_Senhas_i))==(?);
  External_List_VisibleVariables(Implementation(Gerenciador_Senhas_i))==(?);
  Expanded_List_VisibleVariables(Implementation(Gerenciador_Senhas_i))==(?);
  List_VisibleVariables(Implementation(Gerenciador_Senhas_i))==(lote_saida_size,lote_saida_arr,eliminados_fim,eliminados_arr,fila_disputa_proxima_fim,fila_disputa_proxima_arr,fila_disputa_atual_fim,fila_disputa_atual_arr,fila_geral_fim,fila_geral_arr,bois_corridos_arr,estado_senha_arr,dono_senha_arr);
  Internal_List_VisibleVariables(Implementation(Gerenciador_Senhas_i))==(lote_saida_size,lote_saida_arr,eliminados_fim,eliminados_arr,fila_disputa_proxima_fim,fila_disputa_proxima_arr,fila_disputa_atual_fim,fila_disputa_atual_arr,fila_geral_fim,fila_geral_arr,bois_corridos_arr,estado_senha_arr,dono_senha_arr)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(Gerenciador_Senhas_i))==(btrue);
  Expanded_List_Invariant(Implementation(Gerenciador_Senhas_i))==(btrue);
  Abstract_List_Invariant(Implementation(Gerenciador_Senhas_i))==(dono_senha: SENHAS +-> VAQUEIROS & estado_senha: SENHAS +-> STATUS_SENHA & bois_corridos: SENHAS +-> NAT & fila_geral: iseq(NAT1) & fila_disputa_atual: iseq(NAT1) & fila_disputa_proxima: iseq(NAT1) & eliminados_nesta_rodada: iseq(NAT1) & !ss.(ss: dom(estado_senha) & estado_senha(ss) = classificada => ss: dom(bois_corridos) & bois_corridos(ss) = BOIS_PARA_CLASSIFICAR) & buffer_saida: iseq(NAT1) & tamanho_buffer_saida: NAT);
  Context_List_Invariant(Implementation(Gerenciador_Senhas_i))==(btrue);
  List_Invariant(Implementation(Gerenciador_Senhas_i))==(dono_senha_arr: 0..19 --> NAT & estado_senha_arr: 0..19 --> STATUS_SENHA & bois_corridos_arr: 0..19 --> NAT & fila_geral_arr: 0..19 --> NAT & fila_geral_fim: 0..20 & fila_disputa_atual_arr: 0..19 --> NAT & fila_disputa_atual_fim: 0..20 & fila_disputa_proxima_arr: 0..19 --> NAT & fila_disputa_proxima_fim: 0..20 & eliminados_arr: 0..19 --> NAT & eliminados_fim: 0..20 & lote_saida_arr: 0..3 --> NAT & lote_saida_size: 0..4 & dono_senha = %ss.(ss: 1..20 & dono_senha_arr(ss-1)/=0 | dono_senha_arr(ss-1)) & estado_senha = %ss.(ss: 1..20 & dono_senha_arr(ss-1)/=0 | estado_senha_arr(ss-1)) & bois_corridos = %ss.(ss: 1..20 & dono_senha_arr(ss-1)/=0 | bois_corridos_arr(ss-1)) & fila_geral = %ii.(ii: 0..fila_geral_fim-1 | fila_geral_arr(ii)) & fila_disputa_atual = %ii.(ii: 0..fila_disputa_atual_fim-1 | fila_disputa_atual_arr(ii)) & fila_disputa_proxima = %ii.(ii: 0..fila_disputa_proxima_fim-1 | fila_disputa_proxima_arr(ii)) & eliminados_nesta_rodada = %ii.(ii: 0..eliminados_fim-1 | eliminados_arr(ii)) & buffer_saida = %ii.(ii: 1..lote_saida_size | lote_saida_arr(ii-1)) & tamanho_buffer_saida = lote_saida_size)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(Gerenciador_Senhas_i))==(btrue);
  Abstract_List_Assertions(Implementation(Gerenciador_Senhas_i))==(btrue);
  Context_List_Assertions(Implementation(Gerenciador_Senhas_i))==(btrue);
  List_Assertions(Implementation(Gerenciador_Senhas_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(Gerenciador_Senhas_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(Gerenciador_Senhas_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(Gerenciador_Senhas_i))==(@ii.((0: INT | ii:=0);WHILE ii<=19 DO (ii: dom(dono_senha_arr) & 0: INT | dono_senha_arr:=dono_senha_arr<+{ii|->0});(ii: dom(estado_senha_arr) | estado_senha_arr:=estado_senha_arr<+{ii|->na_espera});(ii: dom(bois_corridos_arr) & 0: INT | bois_corridos_arr:=bois_corridos_arr<+{ii|->0});(ii: dom(fila_geral_arr) & 0: INT | fila_geral_arr:=fila_geral_arr<+{ii|->0});(ii: dom(fila_disputa_atual_arr) & 0: INT | fila_disputa_atual_arr:=fila_disputa_atual_arr<+{ii|->0});(ii: dom(fila_disputa_proxima_arr) & 0: INT | fila_disputa_proxima_arr:=fila_disputa_proxima_arr<+{ii|->0});(ii: dom(eliminados_arr) & 0: INT | eliminados_arr:=eliminados_arr<+{ii|->0});(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 0..20 VARIANT 20-ii END);@ii.((0: INT | ii:=0);WHILE ii<=3 DO (ii: dom(lote_saida_arr) & 0: INT | lote_saida_arr:=lote_saida_arr<+{ii|->0});(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 0..4 VARIANT 4-ii END);(0: INT | lote_saida_size:=0);(0: INT | fila_geral_fim:=0);(0: INT | fila_disputa_atual_fim:=0);(0: INT | fila_disputa_proxima_fim:=0);(0: INT | eliminados_fim:=0));
  Context_List_Initialisation(Implementation(Gerenciador_Senhas_i))==(skip);
  List_Initialisation(Implementation(Gerenciador_Senhas_i))==(VAR ii IN ii:=0;WHILE ii<=19 DO dono_senha_arr(ii):=0;estado_senha_arr(ii):=na_espera;bois_corridos_arr(ii):=0;fila_geral_arr(ii):=0;fila_disputa_atual_arr(ii):=0;fila_disputa_proxima_arr(ii):=0;eliminados_arr(ii):=0;ii:=ii+1 INVARIANT ii: 0..20 VARIANT 20-ii END END;VAR ii IN ii:=0;WHILE ii<=3 DO lote_saida_arr(ii):=0;ii:=ii+1 INVARIANT ii: 0..4 VARIANT 4-ii END END;lote_saida_size:=0;fila_geral_fim:=0;fila_disputa_atual_fim:=0;fila_disputa_proxima_fim:=0;eliminados_fim:=0)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(Gerenciador_Senhas_i))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Implementation(Gerenciador_Senhas_i),Machine(Contexto_Vaquejada))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(Gerenciador_Senhas_i))==(btrue);
  List_Context_Constraints(Implementation(Gerenciador_Senhas_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(Gerenciador_Senhas_i))==(cadastrar_senha,atualizar_status,cancelar_registro_senha,atualizar_dono,extrair_lote_rodizio,registrar_julgamento_classificacao,processar_resultado_disputa,avancar_rodada_disputa,finalizar_torneio,consultar_lote_saida,consultar_tamanho_lote_saida,get_estado_senha,get_dono_senha,get_bois_corridos,get_primeiro_fila_disputa);
  List_Operations(Implementation(Gerenciador_Senhas_i))==(cadastrar_senha,atualizar_status,cancelar_registro_senha,atualizar_dono,extrair_lote_rodizio,registrar_julgamento_classificacao,processar_resultado_disputa,avancar_rodada_disputa,finalizar_torneio,consultar_lote_saida,consultar_tamanho_lote_saida,get_estado_senha,get_dono_senha,get_bois_corridos,get_primeiro_fila_disputa)
END
&
THEORY ListInputX IS
  List_Input(Implementation(Gerenciador_Senhas_i),cadastrar_senha)==(vv,ss,torneio_comecou,ultima_senha);
  List_Input(Implementation(Gerenciador_Senhas_i),atualizar_status)==(ss,novo_status);
  List_Input(Implementation(Gerenciador_Senhas_i),cancelar_registro_senha)==(ss);
  List_Input(Implementation(Gerenciador_Senhas_i),atualizar_dono)==(ss,novo_vaqueiro);
  List_Input(Implementation(Gerenciador_Senhas_i),extrair_lote_rodizio)==(?);
  List_Input(Implementation(Gerenciador_Senhas_i),registrar_julgamento_classificacao)==(ss,jj);
  List_Input(Implementation(Gerenciador_Senhas_i),processar_resultado_disputa)==(jj);
  List_Input(Implementation(Gerenciador_Senhas_i),avancar_rodada_disputa)==(?);
  List_Input(Implementation(Gerenciador_Senhas_i),finalizar_torneio)==(?);
  List_Input(Implementation(Gerenciador_Senhas_i),consultar_lote_saida)==(ii);
  List_Input(Implementation(Gerenciador_Senhas_i),consultar_tamanho_lote_saida)==(?);
  List_Input(Implementation(Gerenciador_Senhas_i),get_estado_senha)==(ss);
  List_Input(Implementation(Gerenciador_Senhas_i),get_dono_senha)==(ss);
  List_Input(Implementation(Gerenciador_Senhas_i),get_bois_corridos)==(ss);
  List_Input(Implementation(Gerenciador_Senhas_i),get_primeiro_fila_disputa)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(Gerenciador_Senhas_i),cadastrar_senha)==(?);
  List_Output(Implementation(Gerenciador_Senhas_i),atualizar_status)==(?);
  List_Output(Implementation(Gerenciador_Senhas_i),cancelar_registro_senha)==(?);
  List_Output(Implementation(Gerenciador_Senhas_i),atualizar_dono)==(?);
  List_Output(Implementation(Gerenciador_Senhas_i),extrair_lote_rodizio)==(?);
  List_Output(Implementation(Gerenciador_Senhas_i),registrar_julgamento_classificacao)==(?);
  List_Output(Implementation(Gerenciador_Senhas_i),processar_resultado_disputa)==(?);
  List_Output(Implementation(Gerenciador_Senhas_i),avancar_rodada_disputa)==(?);
  List_Output(Implementation(Gerenciador_Senhas_i),finalizar_torneio)==(?);
  List_Output(Implementation(Gerenciador_Senhas_i),consultar_lote_saida)==(val);
  List_Output(Implementation(Gerenciador_Senhas_i),consultar_tamanho_lote_saida)==(tam);
  List_Output(Implementation(Gerenciador_Senhas_i),get_estado_senha)==(st);
  List_Output(Implementation(Gerenciador_Senhas_i),get_dono_senha)==(vq);
  List_Output(Implementation(Gerenciador_Senhas_i),get_bois_corridos)==(bc);
  List_Output(Implementation(Gerenciador_Senhas_i),get_primeiro_fila_disputa)==(ss)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(Gerenciador_Senhas_i),cadastrar_senha)==(cadastrar_senha(vv,ss,torneio_comecou,ultima_senha));
  List_Header(Implementation(Gerenciador_Senhas_i),atualizar_status)==(atualizar_status(ss,novo_status));
  List_Header(Implementation(Gerenciador_Senhas_i),cancelar_registro_senha)==(cancelar_registro_senha(ss));
  List_Header(Implementation(Gerenciador_Senhas_i),atualizar_dono)==(atualizar_dono(ss,novo_vaqueiro));
  List_Header(Implementation(Gerenciador_Senhas_i),extrair_lote_rodizio)==(extrair_lote_rodizio);
  List_Header(Implementation(Gerenciador_Senhas_i),registrar_julgamento_classificacao)==(registrar_julgamento_classificacao(ss,jj));
  List_Header(Implementation(Gerenciador_Senhas_i),processar_resultado_disputa)==(processar_resultado_disputa(jj));
  List_Header(Implementation(Gerenciador_Senhas_i),avancar_rodada_disputa)==(avancar_rodada_disputa);
  List_Header(Implementation(Gerenciador_Senhas_i),finalizar_torneio)==(finalizar_torneio);
  List_Header(Implementation(Gerenciador_Senhas_i),consultar_lote_saida)==(val <-- consultar_lote_saida(ii));
  List_Header(Implementation(Gerenciador_Senhas_i),consultar_tamanho_lote_saida)==(tam <-- consultar_tamanho_lote_saida);
  List_Header(Implementation(Gerenciador_Senhas_i),get_estado_senha)==(st <-- get_estado_senha(ss));
  List_Header(Implementation(Gerenciador_Senhas_i),get_dono_senha)==(vq <-- get_dono_senha(ss));
  List_Header(Implementation(Gerenciador_Senhas_i),get_bois_corridos)==(bc <-- get_bois_corridos(ss));
  List_Header(Implementation(Gerenciador_Senhas_i),get_primeiro_fila_disputa)==(ss <-- get_primeiro_fila_disputa)
END
&
THEORY ListPreconditionX IS
  Own_Precondition(Implementation(Gerenciador_Senhas_i),cadastrar_senha)==(btrue);
  List_Precondition(Implementation(Gerenciador_Senhas_i),cadastrar_senha)==(vv: VAQUEIROS & vv: NAT1 & ss: SENHAS & ss: NAT1 & torneio_comecou: BOOL & ultima_senha: NAT & ss/:dom(dono_senha) & card(dom(dono_senha))<TOTAL_SENHAS & card(dom(dono_senha|>{vv}))<LIMITE_SENHAS_VAQUEIRO);
  Own_Precondition(Implementation(Gerenciador_Senhas_i),atualizar_status)==(btrue);
  List_Precondition(Implementation(Gerenciador_Senhas_i),atualizar_status)==(ss: SENHAS & ss: NAT1 & ss: dom(estado_senha) & novo_status: STATUS_SENHA);
  Own_Precondition(Implementation(Gerenciador_Senhas_i),cancelar_registro_senha)==(btrue);
  List_Precondition(Implementation(Gerenciador_Senhas_i),cancelar_registro_senha)==(ss: SENHAS & ss: NAT1 & ss: dom(dono_senha) & ss: ran(fila_geral));
  Own_Precondition(Implementation(Gerenciador_Senhas_i),atualizar_dono)==(btrue);
  List_Precondition(Implementation(Gerenciador_Senhas_i),atualizar_dono)==(novo_vaqueiro: VAQUEIROS & novo_vaqueiro: NAT1 & ss: SENHAS & ss: NAT1 & ss: dom(dono_senha) & card(dom(dono_senha|>{novo_vaqueiro}))<LIMITE_SENHAS_VAQUEIRO & ss: dom(bois_corridos) & bois_corridos(ss) = 0);
  Own_Precondition(Implementation(Gerenciador_Senhas_i),extrair_lote_rodizio)==(btrue);
  List_Precondition(Implementation(Gerenciador_Senhas_i),extrair_lote_rodizio)==(size(fila_geral)>0);
  Own_Precondition(Implementation(Gerenciador_Senhas_i),registrar_julgamento_classificacao)==(btrue);
  List_Precondition(Implementation(Gerenciador_Senhas_i),registrar_julgamento_classificacao)==(ss: NAT1 & ss: dom(estado_senha) & jj: JULGAMENTO);
  Own_Precondition(Implementation(Gerenciador_Senhas_i),processar_resultado_disputa)==(btrue);
  List_Precondition(Implementation(Gerenciador_Senhas_i),processar_resultado_disputa)==(size(fila_disputa_atual)>0 & jj: JULGAMENTO);
  Own_Precondition(Implementation(Gerenciador_Senhas_i),avancar_rodada_disputa)==(btrue);
  List_Precondition(Implementation(Gerenciador_Senhas_i),avancar_rodada_disputa)==(size(fila_disputa_atual) = 0 & (size(fila_disputa_proxima)>0 or size(eliminados_nesta_rodada)>0));
  Own_Precondition(Implementation(Gerenciador_Senhas_i),finalizar_torneio)==(btrue);
  List_Precondition(Implementation(Gerenciador_Senhas_i),finalizar_torneio)==(btrue);
  Own_Precondition(Implementation(Gerenciador_Senhas_i),consultar_lote_saida)==(btrue);
  List_Precondition(Implementation(Gerenciador_Senhas_i),consultar_lote_saida)==(ii: NAT1 & ii<=tamanho_buffer_saida);
  Own_Precondition(Implementation(Gerenciador_Senhas_i),consultar_tamanho_lote_saida)==(btrue);
  List_Precondition(Implementation(Gerenciador_Senhas_i),consultar_tamanho_lote_saida)==(btrue);
  Own_Precondition(Implementation(Gerenciador_Senhas_i),get_estado_senha)==(btrue);
  List_Precondition(Implementation(Gerenciador_Senhas_i),get_estado_senha)==(ss: NAT1 & ss: dom(estado_senha));
  Own_Precondition(Implementation(Gerenciador_Senhas_i),get_dono_senha)==(btrue);
  List_Precondition(Implementation(Gerenciador_Senhas_i),get_dono_senha)==(ss: NAT1 & ss: dom(dono_senha));
  Own_Precondition(Implementation(Gerenciador_Senhas_i),get_bois_corridos)==(btrue);
  List_Precondition(Implementation(Gerenciador_Senhas_i),get_bois_corridos)==(ss: NAT1 & ss: dom(bois_corridos));
  Own_Precondition(Implementation(Gerenciador_Senhas_i),get_primeiro_fila_disputa)==(btrue);
  List_Precondition(Implementation(Gerenciador_Senhas_i),get_primeiro_fila_disputa)==(size(fila_disputa_atual)>0)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),get_primeiro_fila_disputa)==(size(fila_disputa_atual)>0 & fila_disputa_atual_arr(0): INT & 0: dom(fila_disputa_atual_arr) | ss:=fila_disputa_atual_arr(0));
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),get_bois_corridos)==(ss: NAT1 & ss: dom(bois_corridos) | @idx.((ss-1: INT & ss: INT & 1: INT | idx:=ss-1);(bois_corridos_arr(idx): INT & idx: dom(bois_corridos_arr) | bc:=bois_corridos_arr(idx))));
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),get_dono_senha)==(ss: NAT1 & ss: dom(dono_senha) | @idx.((ss-1: INT & ss: INT & 1: INT | idx:=ss-1);(dono_senha_arr(idx): INT & idx: dom(dono_senha_arr) | vq:=dono_senha_arr(idx))));
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),get_estado_senha)==(ss: NAT1 & ss: dom(estado_senha) | @idx.((ss-1: INT & ss: INT & 1: INT | idx:=ss-1);(idx: dom(estado_senha_arr) | st:=estado_senha_arr(idx))));
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),consultar_tamanho_lote_saida)==(btrue & lote_saida_size: INT | tam:=lote_saida_size);
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),consultar_lote_saida)==(ii: NAT1 & ii<=tamanho_buffer_saida | @idx.((ii-1: INT & ii: INT & 1: INT | idx:=ii-1);(lote_saida_arr(idx): INT & idx: dom(lote_saida_arr) | val:=lote_saida_arr(idx))));
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),finalizar_torneio)==(btrue | @(ii,st).((0: INT | ii:=0);WHILE ii<=19 DO (ii: dom(estado_senha_arr) | st:=estado_senha_arr(ii));(st = classificada ==> (ii: dom(estado_senha_arr) | estado_senha_arr:=estado_senha_arr<+{ii|->campea}) [] not(st = classificada) ==> skip);(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 0..20 VARIANT 20-ii END));
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),avancar_rodada_disputa)==(size(fila_disputa_atual) = 0 & (size(fila_disputa_proxima)>0 or size(eliminados_nesta_rodada)>0) | fila_disputa_proxima_fim>0 ==> (@(ii,tmp_val).((0: INT | ii:=0);WHILE ii<fila_disputa_proxima_fim DO (ii: dom(fila_disputa_proxima_arr) | tmp_val:=fila_disputa_proxima_arr(ii));(ii: dom(fila_disputa_atual_arr) & tmp_val: INT | fila_disputa_atual_arr:=fila_disputa_atual_arr<+{ii|->tmp_val});(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 0..fila_disputa_proxima_fim VARIANT fila_disputa_proxima_fim-ii END);(fila_disputa_proxima_fim: INT | fila_disputa_atual_fim:=fila_disputa_proxima_fim);(0: INT | fila_disputa_proxima_fim:=0);(0: INT | eliminados_fim:=0)) [] not(fila_disputa_proxima_fim>0) ==> (@(ii,ss_val,idx).((0: INT | ii:=0);WHILE ii<eliminados_fim DO (ii: dom(eliminados_arr) | ss_val:=eliminados_arr(ii));(ii: dom(fila_disputa_atual_arr) & ss_val: INT | fila_disputa_atual_arr:=fila_disputa_atual_arr<+{ii|->ss_val});(ss_val-1: INT & ss_val: INT & 1: INT | idx:=ss_val-1);(idx: dom(estado_senha_arr) | estado_senha_arr:=estado_senha_arr<+{idx|->classificada});(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 0..eliminados_fim VARIANT eliminados_fim-ii END);(eliminados_fim: INT | fila_disputa_atual_fim:=eliminados_fim);(0: INT | eliminados_fim:=0)));
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),processar_resultado_disputa)==(size(fila_disputa_atual)>0 & jj: JULGAMENTO | @(ss_val,idx,pos,ii,prev,prox,tmp_val,lim).((0: dom(fila_disputa_atual_arr) | ss_val:=fila_disputa_atual_arr(0));(ss_val-1: INT & ss_val: INT & 1: INT | idx:=ss_val-1);(fila_disputa_atual_fim-1: INT & fila_disputa_atual_fim: INT & 1: INT | lim:=fila_disputa_atual_fim-1);(0: INT | ii:=0);WHILE ii<lim DO (ii+1: INT & ii: INT & 1: INT | prox:=ii+1);(prox: dom(fila_disputa_atual_arr) | tmp_val:=fila_disputa_atual_arr(prox));(ii: dom(fila_disputa_atual_arr) & tmp_val: INT | fila_disputa_atual_arr:=fila_disputa_atual_arr<+{ii|->tmp_val});(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 0..fila_disputa_atual_fim-1 VARIANT fila_disputa_atual_fim-1-ii END;(fila_disputa_atual_fim-1: INT & fila_disputa_atual_fim: INT & 1: INT | fila_disputa_atual_fim:=fila_disputa_atual_fim-1);(jj = zero_boi ==> ((idx: dom(estado_senha_arr) | estado_senha_arr:=estado_senha_arr<+{idx|->eliminada});(eliminados_fim: dom(eliminados_arr) & ss_val: INT | eliminados_arr:=eliminados_arr<+{eliminados_fim|->ss_val});(eliminados_fim+1: INT & eliminados_fim: INT & 1: INT | eliminados_fim:=eliminados_fim+1)) [] not(jj = zero_boi) ==> (jj = valeu_boi ==> ((idx: dom(estado_senha_arr) | estado_senha_arr:=estado_senha_arr<+{idx|->classificada});(0: INT | pos:=0);(pos<fila_disputa_proxima_fim ==> ((fila_disputa_proxima_arr(pos): INT & pos: dom(fila_disputa_proxima_arr) | tmp_val:=fila_disputa_proxima_arr(pos));WHILE pos<fila_disputa_proxima_fim & tmp_val<ss_val DO (pos+1: INT & pos: INT & 1: INT | pos:=pos+1);(pos<fila_disputa_proxima_fim ==> (fila_disputa_proxima_arr(pos): INT & pos: dom(fila_disputa_proxima_arr) | tmp_val:=fila_disputa_proxima_arr(pos)) [] not(pos<fila_disputa_proxima_fim) ==> skip) INVARIANT pos: 0..fila_disputa_proxima_fim VARIANT fila_disputa_proxima_fim-pos END) [] not(pos<fila_disputa_proxima_fim) ==> skip);(fila_disputa_proxima_fim: INT | ii:=fila_disputa_proxima_fim);WHILE ii>pos DO (ii-1: INT & ii: INT & 1: INT | prev:=ii-1);(fila_disputa_proxima_arr(prev): INT & prev: dom(fila_disputa_proxima_arr) | tmp_val:=fila_disputa_proxima_arr(prev));(ii: dom(fila_disputa_proxima_arr) & tmp_val: INT | fila_disputa_proxima_arr:=fila_disputa_proxima_arr<+{ii|->tmp_val});(ii-1: INT & ii: INT & 1: INT | ii:=ii-1) INVARIANT ii: pos..fila_disputa_proxima_fim VARIANT ii-pos END;(pos: dom(fila_disputa_proxima_arr) & ss_val: INT | fila_disputa_proxima_arr:=fila_disputa_proxima_arr<+{pos|->ss_val});(fila_disputa_proxima_fim+1: INT & fila_disputa_proxima_fim: INT & 1: INT | fila_disputa_proxima_fim:=fila_disputa_proxima_fim+1)) [] not(jj = valeu_boi) ==> ((idx: dom(estado_senha_arr) | estado_senha_arr:=estado_senha_arr<+{idx|->classificada});(fila_disputa_atual_fim: dom(fila_disputa_atual_arr) & ss_val: INT | fila_disputa_atual_arr:=fila_disputa_atual_arr<+{fila_disputa_atual_fim|->ss_val});(fila_disputa_atual_fim+1: INT & fila_disputa_atual_fim: INT & 1: INT | fila_disputa_atual_fim:=fila_disputa_atual_fim+1))))));
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),registrar_julgamento_classificacao)==(ss: NAT1 & ss: dom(estado_senha) & jj: JULGAMENTO | @(idx,bc,pos,ii,prev,tmp_val,nbc).((ss-1: INT & ss: INT & 1: INT | idx:=ss-1);(jj = zero_boi ==> (idx: dom(estado_senha_arr) | estado_senha_arr:=estado_senha_arr<+{idx|->eliminada}) [] not(jj = zero_boi) ==> (jj = valeu_boi ==> ((idx: dom(bois_corridos_arr) | bc:=bois_corridos_arr(idx));(bc+1: INT & bc: INT & 1: INT | nbc:=bc+1);(idx: dom(bois_corridos_arr) & nbc: INT | bois_corridos_arr:=bois_corridos_arr<+{idx|->nbc});(nbc = BOIS_PARA_CLASSIFICAR ==> ((idx: dom(estado_senha_arr) | estado_senha_arr:=estado_senha_arr<+{idx|->classificada});(0: INT | pos:=0);(pos<fila_disputa_proxima_fim ==> ((pos: dom(fila_disputa_proxima_arr) | tmp_val:=fila_disputa_proxima_arr(pos));WHILE pos<fila_disputa_proxima_fim & tmp_val<ss DO (pos+1: INT & pos: INT & 1: INT | pos:=pos+1);(pos<fila_disputa_proxima_fim ==> (fila_disputa_proxima_arr(pos): INT & pos: dom(fila_disputa_proxima_arr) | tmp_val:=fila_disputa_proxima_arr(pos)) [] not(pos<fila_disputa_proxima_fim) ==> skip) INVARIANT pos: 0..fila_disputa_proxima_fim VARIANT fila_disputa_proxima_fim-pos END) [] not(pos<fila_disputa_proxima_fim) ==> skip);ii:=fila_disputa_proxima_fim;WHILE ii>pos DO (ii-1: INT & ii: INT & 1: INT | prev:=ii-1);(fila_disputa_proxima_arr(prev): INT & prev: dom(fila_disputa_proxima_arr) | tmp_val:=fila_disputa_proxima_arr(prev));(ii: dom(fila_disputa_proxima_arr) & tmp_val: INT | fila_disputa_proxima_arr:=fila_disputa_proxima_arr<+{ii|->tmp_val});(ii-1: INT & ii: INT & 1: INT | ii:=ii-1) INVARIANT ii: pos..fila_disputa_proxima_fim VARIANT ii-pos END;(pos: dom(fila_disputa_proxima_arr) & ss: INT | fila_disputa_proxima_arr:=fila_disputa_proxima_arr<+{pos|->ss});(fila_disputa_proxima_fim+1: INT & fila_disputa_proxima_fim: INT & 1: INT | fila_disputa_proxima_fim:=fila_disputa_proxima_fim+1)) [] not(nbc = BOIS_PARA_CLASSIFICAR) ==> (idx: dom(estado_senha_arr) | estado_senha_arr:=estado_senha_arr<+{idx|->na_espera}))) [] not(jj = valeu_boi) ==> (idx: dom(estado_senha_arr) | estado_senha_arr:=estado_senha_arr<+{idx|->na_espera})))));
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),extrair_lote_rodizio)==(size(fila_geral)>0 | @(qtd,ii,offset,tmp_val,lim).(fila_geral_fim>TAMANHO_RODIZIO ==> qtd:=TAMANHO_RODIZIO [] not(fila_geral_fim>TAMANHO_RODIZIO) ==> (fila_geral_fim: INT | qtd:=fila_geral_fim);(0: INT | ii:=0);WHILE ii<qtd DO (ii: dom(fila_geral_arr) | tmp_val:=fila_geral_arr(ii));(ii: dom(lote_saida_arr) & tmp_val: INT | lote_saida_arr:=lote_saida_arr<+{ii|->tmp_val});(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 0..qtd VARIANT qtd-ii END;(qtd: INT | lote_saida_size:=qtd);(fila_geral_fim-qtd: INT & fila_geral_fim: INT & qtd: INT | lim:=fila_geral_fim-qtd);(0: INT | ii:=0);WHILE ii<lim DO (ii+qtd: INT & ii: INT & qtd: INT | offset:=ii+qtd);(fila_geral_arr(offset): INT & offset: dom(fila_geral_arr) | tmp_val:=fila_geral_arr(offset));(ii: dom(fila_geral_arr) & tmp_val: INT | fila_geral_arr:=fila_geral_arr<+{ii|->tmp_val});(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 0..fila_geral_fim-qtd VARIANT fila_geral_fim-qtd-ii END;(fila_geral_fim-qtd: INT & fila_geral_fim: INT & qtd: INT | fila_geral_fim:=fila_geral_fim-qtd)));
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),atualizar_dono)==(novo_vaqueiro: VAQUEIROS & novo_vaqueiro: NAT1 & ss: SENHAS & ss: NAT1 & ss: dom(dono_senha) & card(dom(dono_senha|>{novo_vaqueiro}))<LIMITE_SENHAS_VAQUEIRO & ss: dom(bois_corridos) & bois_corridos(ss) = 0 | @idx.((ss-1: INT & ss: INT & 1: INT | idx:=ss-1);(idx: dom(dono_senha_arr) & novo_vaqueiro: INT | dono_senha_arr:=dono_senha_arr<+{idx|->novo_vaqueiro})));
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),cancelar_registro_senha)==(ss: SENHAS & ss: NAT1 & ss: dom(dono_senha) & ss: ran(fila_geral) | @(pos,ii,idx,prox,tmp_val,lim).((ss-1: INT & ss: INT & 1: INT | idx:=ss-1);(idx: dom(dono_senha_arr) & 0: INT | dono_senha_arr:=dono_senha_arr<+{idx|->0});(idx: dom(estado_senha_arr) | estado_senha_arr:=estado_senha_arr<+{idx|->na_espera});(idx: dom(bois_corridos_arr) & 0: INT | bois_corridos_arr:=bois_corridos_arr<+{idx|->0});(0: INT | pos:=0);(pos<fila_geral_fim ==> ((pos: dom(fila_geral_arr) | tmp_val:=fila_geral_arr(pos));WHILE pos<fila_geral_fim & tmp_val/=ss DO (pos+1: INT & pos: INT & 1: INT | pos:=pos+1);(pos<fila_geral_fim ==> (fila_geral_arr(pos): INT & pos: dom(fila_geral_arr) | tmp_val:=fila_geral_arr(pos)) [] not(pos<fila_geral_fim) ==> skip) INVARIANT pos: 0..fila_geral_fim VARIANT fila_geral_fim-pos END) [] not(pos<fila_geral_fim) ==> skip);(fila_geral_fim-1: INT & fila_geral_fim: INT & 1: INT | lim:=fila_geral_fim-1);ii:=pos;WHILE ii<lim DO (ii+1: INT & ii: INT & 1: INT | prox:=ii+1);(fila_geral_arr(prox): INT & prox: dom(fila_geral_arr) | tmp_val:=fila_geral_arr(prox));(ii: dom(fila_geral_arr) & tmp_val: INT | fila_geral_arr:=fila_geral_arr<+{ii|->tmp_val});(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: pos..fila_geral_fim-1 VARIANT fila_geral_fim-1-ii END;(fila_geral_fim-1: INT & fila_geral_fim: INT & 1: INT | fila_geral_fim:=fila_geral_fim-1)));
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),atualizar_status)==(ss: SENHAS & ss: NAT1 & ss: dom(estado_senha) & novo_status: STATUS_SENHA | @idx.((ss-1: INT & ss: INT & 1: INT | idx:=ss-1);(idx: dom(estado_senha_arr) | estado_senha_arr:=estado_senha_arr<+{idx|->novo_status})));
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),cadastrar_senha)==(vv: VAQUEIROS & vv: NAT1 & ss: SENHAS & ss: NAT1 & torneio_comecou: BOOL & ultima_senha: NAT & ss/:dom(dono_senha) & card(dom(dono_senha))<TOTAL_SENHAS & card(dom(dono_senha|>{vv}))<LIMITE_SENHAS_VAQUEIRO | @(pos,ii,idx,prev,tmp_val).((ss-1: INT & ss: INT & 1: INT | idx:=ss-1);(idx: dom(dono_senha_arr) & vv: INT | dono_senha_arr:=dono_senha_arr<+{idx|->vv});(idx: dom(estado_senha_arr) | estado_senha_arr:=estado_senha_arr<+{idx|->na_espera});(idx: dom(bois_corridos_arr) & 0: INT | bois_corridos_arr:=bois_corridos_arr<+{idx|->0});(torneio_comecou = FALSE ==> ((0: INT | pos:=0);(pos<fila_geral_fim ==> ((pos: dom(fila_geral_arr) | tmp_val:=fila_geral_arr(pos));WHILE pos<fila_geral_fim & tmp_val<ss DO (pos+1: INT & pos: INT & 1: INT | pos:=pos+1);(pos<fila_geral_fim ==> (fila_geral_arr(pos): INT & pos: dom(fila_geral_arr) | tmp_val:=fila_geral_arr(pos)) [] not(pos<fila_geral_fim) ==> skip) INVARIANT pos: 0..fila_geral_fim VARIANT fila_geral_fim-pos END) [] not(pos<fila_geral_fim) ==> skip);ii:=fila_geral_fim;WHILE ii>pos DO (ii-1: INT & ii: INT & 1: INT | prev:=ii-1);(fila_geral_arr(prev): INT & prev: dom(fila_geral_arr) | tmp_val:=fila_geral_arr(prev));(ii: dom(fila_geral_arr) & tmp_val: INT | fila_geral_arr:=fila_geral_arr<+{ii|->tmp_val});(ii-1: INT & ii: INT & 1: INT | ii:=ii-1) INVARIANT ii: pos..fila_geral_fim VARIANT ii-pos END;(pos: dom(fila_geral_arr) & ss: INT | fila_geral_arr:=fila_geral_arr<+{pos|->ss});(fila_geral_fim+1: INT & fila_geral_fim: INT & 1: INT | fila_geral_fim:=fila_geral_fim+1)) [] not(torneio_comecou = FALSE) ==> (ss<ultima_senha ==> ((fila_geral_fim: dom(fila_geral_arr) & ss: INT | fila_geral_arr:=fila_geral_arr<+{fila_geral_fim|->ss});(fila_geral_fim+1: INT & fila_geral_fim: INT & 1: INT | fila_geral_fim:=fila_geral_fim+1)) [] not(ss<ultima_senha) ==> ((0: INT | pos:=0);(pos<fila_geral_fim ==> ((fila_geral_arr(pos): INT & pos: dom(fila_geral_arr) | tmp_val:=fila_geral_arr(pos));WHILE pos<fila_geral_fim & tmp_val<ss & tmp_val>ultima_senha DO (pos+1: INT & pos: INT & 1: INT | pos:=pos+1);(pos<fila_geral_fim ==> (fila_geral_arr(pos): INT & pos: dom(fila_geral_arr) | tmp_val:=fila_geral_arr(pos)) [] not(pos<fila_geral_fim) ==> skip) INVARIANT pos: 0..fila_geral_fim VARIANT fila_geral_fim-pos END) [] not(pos<fila_geral_fim) ==> skip);(fila_geral_fim: INT | ii:=fila_geral_fim);WHILE ii>pos DO (ii-1: INT & ii: INT & 1: INT | prev:=ii-1);(fila_geral_arr(prev): INT & prev: dom(fila_geral_arr) | tmp_val:=fila_geral_arr(prev));(ii: dom(fila_geral_arr) & tmp_val: INT | fila_geral_arr:=fila_geral_arr<+{ii|->tmp_val});(ii-1: INT & ii: INT & 1: INT | ii:=ii-1) INVARIANT ii: pos..fila_geral_fim VARIANT ii-pos END;(pos: dom(fila_geral_arr) & ss: INT | fila_geral_arr:=fila_geral_arr<+{pos|->ss});(fila_geral_fim+1: INT & fila_geral_fim: INT & 1: INT | fila_geral_fim:=fila_geral_fim+1))))));
  List_Substitution(Implementation(Gerenciador_Senhas_i),cadastrar_senha)==(VAR pos,ii,idx,prev,tmp_val IN idx:=ss-1;dono_senha_arr(idx):=vv;estado_senha_arr(idx):=na_espera;bois_corridos_arr(idx):=0;IF torneio_comecou = FALSE THEN pos:=0;IF pos<fila_geral_fim THEN tmp_val:=fila_geral_arr(pos);WHILE pos<fila_geral_fim & tmp_val<ss DO pos:=pos+1;IF pos<fila_geral_fim THEN tmp_val:=fila_geral_arr(pos) END INVARIANT pos: 0..fila_geral_fim VARIANT fila_geral_fim-pos END END;ii:=fila_geral_fim;WHILE ii>pos DO prev:=ii-1;tmp_val:=fila_geral_arr(prev);fila_geral_arr(ii):=tmp_val;ii:=ii-1 INVARIANT ii: pos..fila_geral_fim VARIANT ii-pos END;fila_geral_arr(pos):=ss;fila_geral_fim:=fila_geral_fim+1 ELSE IF ss<ultima_senha THEN fila_geral_arr(fila_geral_fim):=ss;fila_geral_fim:=fila_geral_fim+1 ELSE pos:=0;IF pos<fila_geral_fim THEN tmp_val:=fila_geral_arr(pos);WHILE pos<fila_geral_fim & tmp_val<ss & tmp_val>ultima_senha DO pos:=pos+1;IF pos<fila_geral_fim THEN tmp_val:=fila_geral_arr(pos) END INVARIANT pos: 0..fila_geral_fim VARIANT fila_geral_fim-pos END END;ii:=fila_geral_fim;WHILE ii>pos DO prev:=ii-1;tmp_val:=fila_geral_arr(prev);fila_geral_arr(ii):=tmp_val;ii:=ii-1 INVARIANT ii: pos..fila_geral_fim VARIANT ii-pos END;fila_geral_arr(pos):=ss;fila_geral_fim:=fila_geral_fim+1 END END END);
  List_Substitution(Implementation(Gerenciador_Senhas_i),atualizar_status)==(VAR idx IN idx:=ss-1;estado_senha_arr(idx):=novo_status END);
  List_Substitution(Implementation(Gerenciador_Senhas_i),cancelar_registro_senha)==(VAR pos,ii,idx,prox,tmp_val,lim IN idx:=ss-1;dono_senha_arr(idx):=0;estado_senha_arr(idx):=na_espera;bois_corridos_arr(idx):=0;pos:=0;IF pos<fila_geral_fim THEN tmp_val:=fila_geral_arr(pos);WHILE pos<fila_geral_fim & tmp_val/=ss DO pos:=pos+1;IF pos<fila_geral_fim THEN tmp_val:=fila_geral_arr(pos) END INVARIANT pos: 0..fila_geral_fim VARIANT fila_geral_fim-pos END END;lim:=fila_geral_fim-1;ii:=pos;WHILE ii<lim DO prox:=ii+1;tmp_val:=fila_geral_arr(prox);fila_geral_arr(ii):=tmp_val;ii:=ii+1 INVARIANT ii: pos..fila_geral_fim-1 VARIANT fila_geral_fim-1-ii END;fila_geral_fim:=fila_geral_fim-1 END);
  List_Substitution(Implementation(Gerenciador_Senhas_i),atualizar_dono)==(VAR idx IN idx:=ss-1;dono_senha_arr(idx):=novo_vaqueiro END);
  List_Substitution(Implementation(Gerenciador_Senhas_i),extrair_lote_rodizio)==(VAR qtd,ii,offset,tmp_val,lim IN IF fila_geral_fim>TAMANHO_RODIZIO THEN qtd:=TAMANHO_RODIZIO ELSE qtd:=fila_geral_fim END;ii:=0;WHILE ii<qtd DO tmp_val:=fila_geral_arr(ii);lote_saida_arr(ii):=tmp_val;ii:=ii+1 INVARIANT ii: 0..qtd VARIANT qtd-ii END;lote_saida_size:=qtd;lim:=fila_geral_fim-qtd;ii:=0;WHILE ii<lim DO offset:=ii+qtd;tmp_val:=fila_geral_arr(offset);fila_geral_arr(ii):=tmp_val;ii:=ii+1 INVARIANT ii: 0..fila_geral_fim-qtd VARIANT fila_geral_fim-qtd-ii END;fila_geral_fim:=fila_geral_fim-qtd END);
  List_Substitution(Implementation(Gerenciador_Senhas_i),registrar_julgamento_classificacao)==(VAR idx,bc,pos,ii,prev,tmp_val,nbc IN idx:=ss-1;IF jj = zero_boi THEN estado_senha_arr(idx):=eliminada ELSIF jj = valeu_boi THEN bc:=bois_corridos_arr(idx);nbc:=bc+1;bois_corridos_arr(idx):=nbc;IF nbc = BOIS_PARA_CLASSIFICAR THEN estado_senha_arr(idx):=classificada;pos:=0;IF pos<fila_disputa_proxima_fim THEN tmp_val:=fila_disputa_proxima_arr(pos);WHILE pos<fila_disputa_proxima_fim & tmp_val<ss DO pos:=pos+1;IF pos<fila_disputa_proxima_fim THEN tmp_val:=fila_disputa_proxima_arr(pos) END INVARIANT pos: 0..fila_disputa_proxima_fim VARIANT fila_disputa_proxima_fim-pos END END;ii:=fila_disputa_proxima_fim;WHILE ii>pos DO prev:=ii-1;tmp_val:=fila_disputa_proxima_arr(prev);fila_disputa_proxima_arr(ii):=tmp_val;ii:=ii-1 INVARIANT ii: pos..fila_disputa_proxima_fim VARIANT ii-pos END;fila_disputa_proxima_arr(pos):=ss;fila_disputa_proxima_fim:=fila_disputa_proxima_fim+1 ELSE estado_senha_arr(idx):=na_espera END ELSE estado_senha_arr(idx):=na_espera END END);
  List_Substitution(Implementation(Gerenciador_Senhas_i),processar_resultado_disputa)==(VAR ss_val,idx,pos,ii,prev,prox,tmp_val,lim IN ss_val:=fila_disputa_atual_arr(0);idx:=ss_val-1;lim:=fila_disputa_atual_fim-1;ii:=0;WHILE ii<lim DO prox:=ii+1;tmp_val:=fila_disputa_atual_arr(prox);fila_disputa_atual_arr(ii):=tmp_val;ii:=ii+1 INVARIANT ii: 0..fila_disputa_atual_fim-1 VARIANT fila_disputa_atual_fim-1-ii END;fila_disputa_atual_fim:=fila_disputa_atual_fim-1;IF jj = zero_boi THEN estado_senha_arr(idx):=eliminada;eliminados_arr(eliminados_fim):=ss_val;eliminados_fim:=eliminados_fim+1 ELSIF jj = valeu_boi THEN estado_senha_arr(idx):=classificada;pos:=0;IF pos<fila_disputa_proxima_fim THEN tmp_val:=fila_disputa_proxima_arr(pos);WHILE pos<fila_disputa_proxima_fim & tmp_val<ss_val DO pos:=pos+1;IF pos<fila_disputa_proxima_fim THEN tmp_val:=fila_disputa_proxima_arr(pos) END INVARIANT pos: 0..fila_disputa_proxima_fim VARIANT fila_disputa_proxima_fim-pos END END;ii:=fila_disputa_proxima_fim;WHILE ii>pos DO prev:=ii-1;tmp_val:=fila_disputa_proxima_arr(prev);fila_disputa_proxima_arr(ii):=tmp_val;ii:=ii-1 INVARIANT ii: pos..fila_disputa_proxima_fim VARIANT ii-pos END;fila_disputa_proxima_arr(pos):=ss_val;fila_disputa_proxima_fim:=fila_disputa_proxima_fim+1 ELSE estado_senha_arr(idx):=classificada;fila_disputa_atual_arr(fila_disputa_atual_fim):=ss_val;fila_disputa_atual_fim:=fila_disputa_atual_fim+1 END END);
  List_Substitution(Implementation(Gerenciador_Senhas_i),avancar_rodada_disputa)==(IF fila_disputa_proxima_fim>0 THEN VAR ii,tmp_val IN ii:=0;WHILE ii<fila_disputa_proxima_fim DO tmp_val:=fila_disputa_proxima_arr(ii);fila_disputa_atual_arr(ii):=tmp_val;ii:=ii+1 INVARIANT ii: 0..fila_disputa_proxima_fim VARIANT fila_disputa_proxima_fim-ii END END;fila_disputa_atual_fim:=fila_disputa_proxima_fim;fila_disputa_proxima_fim:=0;eliminados_fim:=0 ELSE VAR ii,ss_val,idx IN ii:=0;WHILE ii<eliminados_fim DO ss_val:=eliminados_arr(ii);fila_disputa_atual_arr(ii):=ss_val;idx:=ss_val-1;estado_senha_arr(idx):=classificada;ii:=ii+1 INVARIANT ii: 0..eliminados_fim VARIANT eliminados_fim-ii END END;fila_disputa_atual_fim:=eliminados_fim;eliminados_fim:=0 END);
  List_Substitution(Implementation(Gerenciador_Senhas_i),finalizar_torneio)==(VAR ii,st IN ii:=0;WHILE ii<=19 DO st:=estado_senha_arr(ii);IF st = classificada THEN estado_senha_arr(ii):=campea END;ii:=ii+1 INVARIANT ii: 0..20 VARIANT 20-ii END END);
  List_Substitution(Implementation(Gerenciador_Senhas_i),consultar_lote_saida)==(VAR idx IN idx:=ii-1;val:=lote_saida_arr(idx) END);
  List_Substitution(Implementation(Gerenciador_Senhas_i),consultar_tamanho_lote_saida)==(tam:=lote_saida_size);
  List_Substitution(Implementation(Gerenciador_Senhas_i),get_estado_senha)==(VAR idx IN idx:=ss-1;st:=estado_senha_arr(idx) END);
  List_Substitution(Implementation(Gerenciador_Senhas_i),get_dono_senha)==(VAR idx IN idx:=ss-1;vq:=dono_senha_arr(idx) END);
  List_Substitution(Implementation(Gerenciador_Senhas_i),get_bois_corridos)==(VAR idx IN idx:=ss-1;bc:=bois_corridos_arr(idx) END);
  List_Substitution(Implementation(Gerenciador_Senhas_i),get_primeiro_fila_disputa)==(ss:=fila_disputa_atual_arr(0))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(Gerenciador_Senhas_i))==(?);
  Inherited_List_Constants(Implementation(Gerenciador_Senhas_i))==(?);
  List_Constants(Implementation(Gerenciador_Senhas_i))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Implementation(Gerenciador_Senhas_i),JULGAMENTO)==({valeu_boi,zero_boi,retorno});
  Context_List_Enumerated(Implementation(Gerenciador_Senhas_i))==(FASES,STATUS_SENHA,JULGAMENTO);
  Context_List_Defered(Implementation(Gerenciador_Senhas_i))==(?);
  Context_List_Sets(Implementation(Gerenciador_Senhas_i))==(FASES,STATUS_SENHA,JULGAMENTO);
  List_Own_Enumerated(Implementation(Gerenciador_Senhas_i))==(?);
  List_Valuable_Sets(Implementation(Gerenciador_Senhas_i))==(?);
  Inherited_List_Enumerated(Implementation(Gerenciador_Senhas_i))==(?);
  Inherited_List_Defered(Implementation(Gerenciador_Senhas_i))==(?);
  Inherited_List_Sets(Implementation(Gerenciador_Senhas_i))==(?);
  List_Enumerated(Implementation(Gerenciador_Senhas_i))==(?);
  List_Defered(Implementation(Gerenciador_Senhas_i))==(?);
  List_Sets(Implementation(Gerenciador_Senhas_i))==(?);
  Set_Definition(Implementation(Gerenciador_Senhas_i),STATUS_SENHA)==({na_espera,na_pista,classificada,eliminada,campea});
  Set_Definition(Implementation(Gerenciador_Senhas_i),FASES)==({classificacao,disputa,encerrado})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(Gerenciador_Senhas_i))==(?);
  Expanded_List_HiddenConstants(Implementation(Gerenciador_Senhas_i))==(?);
  List_HiddenConstants(Implementation(Gerenciador_Senhas_i))==(?);
  External_List_HiddenConstants(Implementation(Gerenciador_Senhas_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(Gerenciador_Senhas_i))==(btrue);
  Context_List_Properties(Implementation(Gerenciador_Senhas_i))==(TOTAL_SENHAS: NAT1 & TOTAL_SENHAS = 20 & LIMITE_SENHAS_VAQUEIRO: NAT1 & LIMITE_SENHAS_VAQUEIRO = max({1,TOTAL_SENHAS/5}) & BOIS_PARA_CLASSIFICAR: NAT1 & BOIS_PARA_CLASSIFICAR = 2 & TAMANHO_RODIZIO: NAT1 & TAMANHO_RODIZIO = 4 & VAQUEIROS <: NAT1 & VAQUEIROS = 1..3 & SENHAS <: NAT1 & SENHAS = 1..TOTAL_SENHAS & PREMIO_TOTAL: NAT1 & PREMIO_TOTAL = 10000 & FASES: FIN(INTEGER) & not(FASES = {}) & STATUS_SENHA: FIN(INTEGER) & not(STATUS_SENHA = {}) & JULGAMENTO: FIN(INTEGER) & not(JULGAMENTO = {}));
  Inherited_List_Properties(Implementation(Gerenciador_Senhas_i))==(btrue);
  List_Properties(Implementation(Gerenciador_Senhas_i))==(btrue)
END
&
THEORY ListValuesX IS
  Values_Subs(Implementation(Gerenciador_Senhas_i))==(aa: aa);
  List_Values(Implementation(Gerenciador_Senhas_i))==(?)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Implementation(Gerenciador_Senhas_i),Machine(Contexto_Vaquejada))==(?);
  Seen_Context_List_Enumerated(Implementation(Gerenciador_Senhas_i))==(?);
  Seen_Context_List_Invariant(Implementation(Gerenciador_Senhas_i))==(btrue);
  Seen_Context_List_Assertions(Implementation(Gerenciador_Senhas_i))==(btrue);
  Seen_Context_List_Properties(Implementation(Gerenciador_Senhas_i))==(btrue);
  Seen_List_Constraints(Implementation(Gerenciador_Senhas_i))==(btrue);
  Seen_List_Operations(Implementation(Gerenciador_Senhas_i),Machine(Contexto_Vaquejada))==(?);
  Seen_Expanded_List_Invariant(Implementation(Gerenciador_Senhas_i),Machine(Contexto_Vaquejada))==(btrue)
END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  VisibleVariables(Implementation(Gerenciador_Senhas_i))==(Type(dono_senha_arr) == Mvv(SetOf(btype(INTEGER,0,19)*btype(INTEGER,0,MAXINT)));Type(estado_senha_arr) == Mvv(SetOf(btype(INTEGER,0,19)*etype(STATUS_SENHA,0,4)));Type(bois_corridos_arr) == Mvv(SetOf(btype(INTEGER,0,19)*btype(INTEGER,0,MAXINT)));Type(fila_geral_arr) == Mvv(SetOf(btype(INTEGER,0,19)*btype(INTEGER,0,MAXINT)));Type(fila_geral_fim) == Mvv(btype(INTEGER,?,?));Type(fila_disputa_atual_arr) == Mvv(SetOf(btype(INTEGER,0,19)*btype(INTEGER,0,MAXINT)));Type(fila_disputa_atual_fim) == Mvv(btype(INTEGER,?,?));Type(fila_disputa_proxima_arr) == Mvv(SetOf(btype(INTEGER,0,19)*btype(INTEGER,0,MAXINT)));Type(fila_disputa_proxima_fim) == Mvv(btype(INTEGER,?,?));Type(eliminados_arr) == Mvv(SetOf(btype(INTEGER,0,19)*btype(INTEGER,0,MAXINT)));Type(eliminados_fim) == Mvv(btype(INTEGER,?,?));Type(lote_saida_arr) == Mvv(SetOf(btype(INTEGER,0,3)*btype(INTEGER,0,MAXINT)));Type(lote_saida_size) == Mvv(btype(INTEGER,?,?)));
  Operations(Implementation(Gerenciador_Senhas_i))==(Type(get_primeiro_fila_disputa) == Cst(btype(INTEGER,?,?),No_type);Type(get_bois_corridos) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(get_dono_senha) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(get_estado_senha) == Cst(etype(STATUS_SENHA,?,?),btype(INTEGER,?,?));Type(consultar_tamanho_lote_saida) == Cst(btype(INTEGER,?,?),No_type);Type(consultar_lote_saida) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(finalizar_torneio) == Cst(No_type,No_type);Type(avancar_rodada_disputa) == Cst(No_type,No_type);Type(processar_resultado_disputa) == Cst(No_type,etype(JULGAMENTO,?,?));Type(registrar_julgamento_classificacao) == Cst(No_type,btype(INTEGER,?,?)*etype(JULGAMENTO,?,?));Type(extrair_lote_rodizio) == Cst(No_type,No_type);Type(atualizar_dono) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(cancelar_registro_senha) == Cst(No_type,btype(INTEGER,?,?));Type(atualizar_status) == Cst(No_type,btype(INTEGER,?,?)*etype(STATUS_SENHA,?,?));Type(cadastrar_senha) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(BOOL,?,?)*btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX IS
  List_Constants(Implementation(Gerenciador_Senhas_i),Machine(Contexto_Vaquejada))==(TOTAL_SENHAS,LIMITE_SENHAS_VAQUEIRO,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS,TAMANHO_RODIZIO,PREMIO_TOTAL);
  List_Constants_Env(Implementation(Gerenciador_Senhas_i),Machine(Contexto_Vaquejada))==(Type(classificacao) == Cst(etype(FASES,0,2));Type(disputa) == Cst(etype(FASES,0,2));Type(encerrado) == Cst(etype(FASES,0,2));Type(na_espera) == Cst(etype(STATUS_SENHA,0,4));Type(na_pista) == Cst(etype(STATUS_SENHA,0,4));Type(classificada) == Cst(etype(STATUS_SENHA,0,4));Type(eliminada) == Cst(etype(STATUS_SENHA,0,4));Type(campea) == Cst(etype(STATUS_SENHA,0,4));Type(valeu_boi) == Cst(etype(JULGAMENTO,0,2));Type(zero_boi) == Cst(etype(JULGAMENTO,0,2));Type(retorno) == Cst(etype(JULGAMENTO,0,2));Type(TOTAL_SENHAS) == Cst(btype(INTEGER,?,?));Type(LIMITE_SENHAS_VAQUEIRO) == Cst(btype(INTEGER,?,?));Type(BOIS_PARA_CLASSIFICAR) == Cst(btype(INTEGER,?,?));Type(VAQUEIROS) == Cst(SetOf(btype(INTEGER,"[VAQUEIROS","]VAQUEIROS")));Type(SENHAS) == Cst(SetOf(btype(INTEGER,"[SENHAS","]SENHAS")));Type(TAMANHO_RODIZIO) == Cst(btype(INTEGER,?,?));Type(PREMIO_TOTAL) == Cst(btype(INTEGER,?,?)));
  Enumerate_Definition(Implementation(Gerenciador_Senhas_i),Machine(Contexto_Vaquejada),JULGAMENTO)==({valeu_boi,zero_boi,retorno});
  Enumerate_Definition(Implementation(Gerenciador_Senhas_i),Machine(Contexto_Vaquejada),STATUS_SENHA)==({na_espera,na_pista,classificada,eliminada,campea});
  Enumerate_Definition(Implementation(Gerenciador_Senhas_i),Machine(Contexto_Vaquejada),FASES)==({classificacao,disputa,encerrado})
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(Gerenciador_Senhas_i)) == (? | ? | ? | ? | cadastrar_senha,atualizar_status,cancelar_registro_senha,atualizar_dono,extrair_lote_rodizio,registrar_julgamento_classificacao,processar_resultado_disputa,avancar_rodada_disputa,finalizar_torneio,consultar_lote_saida,consultar_tamanho_lote_saida,get_estado_senha,get_dono_senha,get_bois_corridos,get_primeiro_fila_disputa | ? | seen(Machine(Contexto_Vaquejada)) | ? | Gerenciador_Senhas_i);
  List_Of_HiddenCst_Ids(Implementation(Gerenciador_Senhas_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(Gerenciador_Senhas_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(Gerenciador_Senhas_i)) == (lote_saida_size,lote_saida_arr,eliminados_fim,eliminados_arr,fila_disputa_proxima_fim,fila_disputa_proxima_arr,fila_disputa_atual_fim,fila_disputa_atual_arr,fila_geral_fim,fila_geral_arr,bois_corridos_arr,estado_senha_arr,dono_senha_arr | ?);
  List_Of_Ids_SeenBNU(Implementation(Gerenciador_Senhas_i)) == (?: ?);
  List_Of_Ids(Machine(Contexto_Vaquejada)) == (TOTAL_SENHAS,LIMITE_SENHAS_VAQUEIRO,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS,TAMANHO_RODIZIO,PREMIO_TOTAL,FASES,STATUS_SENHA,JULGAMENTO,classificacao,disputa,encerrado,na_espera,na_pista,classificada,eliminada,campea,valeu_boi,zero_boi,retorno | ? | ? | ? | ? | ? | ? | ? | Contexto_Vaquejada);
  List_Of_HiddenCst_Ids(Machine(Contexto_Vaquejada)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Contexto_Vaquejada)) == (TOTAL_SENHAS,LIMITE_SENHAS_VAQUEIRO,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS,TAMANHO_RODIZIO,PREMIO_TOTAL);
  List_Of_VisibleVar_Ids(Machine(Contexto_Vaquejada)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Contexto_Vaquejada)) == (?: ?)
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Implementation(Gerenciador_Senhas_i)) == (Type(lote_saida_size) == Mvv(btype(INTEGER,?,?));Type(lote_saida_arr) == Mvv(SetOf(btype(INTEGER,0,3)*btype(INTEGER,0,MAXINT)));Type(eliminados_fim) == Mvv(btype(INTEGER,?,?));Type(eliminados_arr) == Mvv(SetOf(btype(INTEGER,0,19)*btype(INTEGER,0,MAXINT)));Type(fila_disputa_proxima_fim) == Mvv(btype(INTEGER,?,?));Type(fila_disputa_proxima_arr) == Mvv(SetOf(btype(INTEGER,0,19)*btype(INTEGER,0,MAXINT)));Type(fila_disputa_atual_fim) == Mvv(btype(INTEGER,?,?));Type(fila_disputa_atual_arr) == Mvv(SetOf(btype(INTEGER,0,19)*btype(INTEGER,0,MAXINT)));Type(fila_geral_fim) == Mvv(btype(INTEGER,?,?));Type(fila_geral_arr) == Mvv(SetOf(btype(INTEGER,0,19)*btype(INTEGER,0,MAXINT)));Type(bois_corridos_arr) == Mvv(SetOf(btype(INTEGER,0,19)*btype(INTEGER,0,MAXINT)));Type(estado_senha_arr) == Mvv(SetOf(btype(INTEGER,0,19)*etype(STATUS_SENHA,0,4)));Type(dono_senha_arr) == Mvv(SetOf(btype(INTEGER,0,19)*btype(INTEGER,0,MAXINT))))
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(Gerenciador_Senhas_i),?, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gerenciador_Senhas_i),?, 2) == (Type(ii) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gerenciador_Senhas_i),cadastrar_senha, 1) == (Type(pos) == Lvl(btype(INTEGER,?,?));Type(ii) == Lvl(btype(INTEGER,?,?));Type(idx) == Lvl(btype(INTEGER,?,?));Type(prev) == Lvl(btype(INTEGER,?,?));Type(tmp_val) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gerenciador_Senhas_i),atualizar_status, 1) == (Type(idx) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gerenciador_Senhas_i),cancelar_registro_senha, 1) == (Type(pos) == Lvl(btype(INTEGER,?,?));Type(ii) == Lvl(btype(INTEGER,?,?));Type(idx) == Lvl(btype(INTEGER,?,?));Type(prox) == Lvl(btype(INTEGER,?,?));Type(tmp_val) == Lvl(btype(INTEGER,?,?));Type(lim) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gerenciador_Senhas_i),atualizar_dono, 1) == (Type(idx) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gerenciador_Senhas_i),extrair_lote_rodizio, 1) == (Type(qtd) == Lvl(btype(INTEGER,?,?));Type(ii) == Lvl(btype(INTEGER,?,?));Type(offset) == Lvl(btype(INTEGER,?,?));Type(tmp_val) == Lvl(btype(INTEGER,?,?));Type(lim) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gerenciador_Senhas_i),registrar_julgamento_classificacao, 1) == (Type(idx) == Lvl(btype(INTEGER,?,?));Type(bc) == Lvl(btype(INTEGER,?,?));Type(pos) == Lvl(btype(INTEGER,?,?));Type(ii) == Lvl(btype(INTEGER,?,?));Type(prev) == Lvl(btype(INTEGER,?,?));Type(tmp_val) == Lvl(btype(INTEGER,?,?));Type(nbc) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gerenciador_Senhas_i),processar_resultado_disputa, 1) == (Type(ss_val) == Lvl(btype(INTEGER,?,?));Type(idx) == Lvl(btype(INTEGER,?,?));Type(pos) == Lvl(btype(INTEGER,?,?));Type(ii) == Lvl(btype(INTEGER,?,?));Type(prev) == Lvl(btype(INTEGER,?,?));Type(prox) == Lvl(btype(INTEGER,?,?));Type(tmp_val) == Lvl(btype(INTEGER,?,?));Type(lim) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gerenciador_Senhas_i),avancar_rodada_disputa, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(tmp_val) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gerenciador_Senhas_i),avancar_rodada_disputa, 2) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(ss_val) == Lvl(btype(INTEGER,?,?));Type(idx) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gerenciador_Senhas_i),finalizar_torneio, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?));Type(st) == Lvl(etype(STATUS_SENHA,?,?)));
  Variables_Loc(Implementation(Gerenciador_Senhas_i),consultar_lote_saida, 1) == (Type(idx) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gerenciador_Senhas_i),get_estado_senha, 1) == (Type(idx) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gerenciador_Senhas_i),get_dono_senha, 1) == (Type(idx) == Lvl(btype(INTEGER,?,?)));
  Variables_Loc(Implementation(Gerenciador_Senhas_i),get_bois_corridos, 1) == (Type(idx) == Lvl(btype(INTEGER,?,?)))
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
  List_Local_Operations(Implementation(Gerenciador_Senhas_i))==(?)
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
  TypingPredicate(Implementation(Gerenciador_Senhas_i))==(dono_senha_arr: POW(INTEGER*INTEGER) & estado_senha_arr: POW(INTEGER*STATUS_SENHA) & bois_corridos_arr: POW(INTEGER*INTEGER) & fila_geral_arr: POW(INTEGER*INTEGER) & fila_geral_fim: INTEGER & fila_disputa_atual_arr: POW(INTEGER*INTEGER) & fila_disputa_atual_fim: INTEGER & fila_disputa_proxima_arr: POW(INTEGER*INTEGER) & fila_disputa_proxima_fim: INTEGER & eliminados_arr: POW(INTEGER*INTEGER) & eliminados_fim: INTEGER & lote_saida_arr: POW(INTEGER*INTEGER) & lote_saida_size: INTEGER)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
