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
  Abstract_List_Variables(Implementation(Gerenciador_Senhas_i))==(eliminados_nesta_rodada,fila_disputa_proxima,fila_disputa_atual,fila_geral,bois_corridos,estado_senha,dono_senha);
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
  List_VisibleVariables(Implementation(Gerenciador_Senhas_i))==(eliminados_fim,eliminados_ini,eliminados_arr,fila_disputa_proxima_fim,fila_disputa_proxima_ini,fila_disputa_proxima_arr,fila_disputa_atual_fim,fila_disputa_atual_ini,fila_disputa_atual_arr,fila_geral_fim,fila_geral_ini,fila_geral_arr,bois_corridos_arr,estado_senha_arr,dono_senha_arr);
  Internal_List_VisibleVariables(Implementation(Gerenciador_Senhas_i))==(eliminados_fim,eliminados_ini,eliminados_arr,fila_disputa_proxima_fim,fila_disputa_proxima_ini,fila_disputa_proxima_arr,fila_disputa_atual_fim,fila_disputa_atual_ini,fila_disputa_atual_arr,fila_geral_fim,fila_geral_ini,fila_geral_arr,bois_corridos_arr,estado_senha_arr,dono_senha_arr)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(Gerenciador_Senhas_i))==(btrue);
  Expanded_List_Invariant(Implementation(Gerenciador_Senhas_i))==(btrue);
  Abstract_List_Invariant(Implementation(Gerenciador_Senhas_i))==(dono_senha: SENHAS +-> VAQUEIROS & estado_senha: SENHAS +-> STATUS_SENHA & bois_corridos: SENHAS +-> NAT & fila_geral: iseq(NAT1) & fila_disputa_atual: iseq(NAT1) & fila_disputa_proxima: iseq(NAT1) & eliminados_nesta_rodada: iseq(NAT1) & !ss.(ss: dom(estado_senha) & estado_senha(ss) = classificada => ss: dom(bois_corridos) & bois_corridos(ss) = BOIS_PARA_CLASSIFICAR));
  Context_List_Invariant(Implementation(Gerenciador_Senhas_i))==(btrue);
  List_Invariant(Implementation(Gerenciador_Senhas_i))==(dono_senha_arr: 1..20 --> NAT & estado_senha_arr: 1..20 --> STATUS_SENHA & bois_corridos_arr: 1..20 --> NAT & fila_geral_arr: 1..20 --> NAT & fila_geral_ini: 0..20 & fila_geral_fim: 0..20 & fila_disputa_atual_arr: 1..20 --> NAT & fila_disputa_atual_ini: 0..20 & fila_disputa_atual_fim: 0..20 & fila_disputa_proxima_arr: 1..20 --> NAT & fila_disputa_proxima_ini: 0..20 & fila_disputa_proxima_fim: 0..20 & eliminados_arr: 1..20 --> NAT & eliminados_ini: 0..20 & eliminados_fim: 0..20 & dono_senha = %ss.(ss: 1..20 & dono_senha_arr(ss)/=0 | dono_senha_arr(ss)) & estado_senha = %ss.(ss: 1..20 & dono_senha_arr(ss)/=0 | estado_senha_arr(ss)) & bois_corridos = %ss.(ss: 1..20 & dono_senha_arr(ss)/=0 | bois_corridos_arr(ss)) & fila_geral = %ii.(ii: 1..fila_geral_fim-fila_geral_ini | fila_geral_arr(fila_geral_ini+ii)) & fila_disputa_atual = %ii.(ii: 1..fila_disputa_atual_fim-fila_disputa_atual_ini | fila_disputa_atual_arr(fila_disputa_atual_ini+ii)) & fila_disputa_proxima = %ii.(ii: 1..fila_disputa_proxima_fim-fila_disputa_proxima_ini | fila_disputa_proxima_arr(fila_disputa_proxima_ini+ii)) & eliminados_nesta_rodada = %ii.(ii: 1..eliminados_fim-eliminados_ini | eliminados_arr(eliminados_ini+ii)))
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
  Expanded_List_Initialisation(Implementation(Gerenciador_Senhas_i))==(@ii.((1: INT | ii:=1);WHILE ii<=20 DO (ii: dom(dono_senha_arr) & 0: INT | dono_senha_arr:=dono_senha_arr<+{ii|->0});(ii: dom(estado_senha_arr) | estado_senha_arr:=estado_senha_arr<+{ii|->na_espera});(ii: dom(bois_corridos_arr) & 0: INT | bois_corridos_arr:=bois_corridos_arr<+{ii|->0});(ii: dom(fila_geral_arr) & 0: INT | fila_geral_arr:=fila_geral_arr<+{ii|->0});(ii: dom(fila_disputa_atual_arr) & 0: INT | fila_disputa_atual_arr:=fila_disputa_atual_arr<+{ii|->0});(ii: dom(fila_disputa_proxima_arr) & 0: INT | fila_disputa_proxima_arr:=fila_disputa_proxima_arr<+{ii|->0});(ii: dom(eliminados_arr) & 0: INT | eliminados_arr:=eliminados_arr<+{ii|->0});(ii+1: INT & ii: INT & 1: INT | ii:=ii+1) INVARIANT ii: 1..21 VARIANT 21-ii END);(0: INT | fila_geral_ini:=0);(0: INT | fila_geral_fim:=0);(0: INT | fila_disputa_atual_ini:=0);(0: INT | fila_disputa_atual_fim:=0);(0: INT | fila_disputa_proxima_ini:=0);(0: INT | fila_disputa_proxima_fim:=0);(0: INT | eliminados_ini:=0);(0: INT | eliminados_fim:=0));
  Context_List_Initialisation(Implementation(Gerenciador_Senhas_i))==(skip);
  List_Initialisation(Implementation(Gerenciador_Senhas_i))==(VAR ii IN ii:=1;WHILE ii<=20 DO dono_senha_arr(ii):=0;estado_senha_arr(ii):=na_espera;bois_corridos_arr(ii):=0;fila_geral_arr(ii):=0;fila_disputa_atual_arr(ii):=0;fila_disputa_proxima_arr(ii):=0;eliminados_arr(ii):=0;ii:=ii+1 INVARIANT ii: 1..21 VARIANT 21-ii END END;fila_geral_ini:=0;fila_geral_fim:=0;fila_disputa_atual_ini:=0;fila_disputa_atual_fim:=0;fila_disputa_proxima_ini:=0;fila_disputa_proxima_fim:=0;eliminados_ini:=0;eliminados_fim:=0)
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
  Internal_List_Operations(Implementation(Gerenciador_Senhas_i))==(cadastrar_senha,atualizar_status,cancelar_registro_senha,atualizar_dono,extrair_lote_rodizio,registrar_julgamento_classificacao,processar_resultado_disputa,avancar_rodada_disputa,finalizar_torneio);
  List_Operations(Implementation(Gerenciador_Senhas_i))==(cadastrar_senha,atualizar_status,cancelar_registro_senha,atualizar_dono,extrair_lote_rodizio,registrar_julgamento_classificacao,processar_resultado_disputa,avancar_rodada_disputa,finalizar_torneio)
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
  List_Input(Implementation(Gerenciador_Senhas_i),finalizar_torneio)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Implementation(Gerenciador_Senhas_i),cadastrar_senha)==(?);
  List_Output(Implementation(Gerenciador_Senhas_i),atualizar_status)==(?);
  List_Output(Implementation(Gerenciador_Senhas_i),cancelar_registro_senha)==(?);
  List_Output(Implementation(Gerenciador_Senhas_i),atualizar_dono)==(?);
  List_Output(Implementation(Gerenciador_Senhas_i),extrair_lote_rodizio)==(lote);
  List_Output(Implementation(Gerenciador_Senhas_i),registrar_julgamento_classificacao)==(?);
  List_Output(Implementation(Gerenciador_Senhas_i),processar_resultado_disputa)==(?);
  List_Output(Implementation(Gerenciador_Senhas_i),avancar_rodada_disputa)==(?);
  List_Output(Implementation(Gerenciador_Senhas_i),finalizar_torneio)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Implementation(Gerenciador_Senhas_i),cadastrar_senha)==(cadastrar_senha(vv,ss,torneio_comecou,ultima_senha));
  List_Header(Implementation(Gerenciador_Senhas_i),atualizar_status)==(atualizar_status(ss,novo_status));
  List_Header(Implementation(Gerenciador_Senhas_i),cancelar_registro_senha)==(cancelar_registro_senha(ss));
  List_Header(Implementation(Gerenciador_Senhas_i),atualizar_dono)==(atualizar_dono(ss,novo_vaqueiro));
  List_Header(Implementation(Gerenciador_Senhas_i),extrair_lote_rodizio)==(lote <-- extrair_lote_rodizio);
  List_Header(Implementation(Gerenciador_Senhas_i),registrar_julgamento_classificacao)==(registrar_julgamento_classificacao(ss,jj));
  List_Header(Implementation(Gerenciador_Senhas_i),processar_resultado_disputa)==(processar_resultado_disputa(jj));
  List_Header(Implementation(Gerenciador_Senhas_i),avancar_rodada_disputa)==(avancar_rodada_disputa);
  List_Header(Implementation(Gerenciador_Senhas_i),finalizar_torneio)==(finalizar_torneio)
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
  List_Precondition(Implementation(Gerenciador_Senhas_i),finalizar_torneio)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),finalizar_torneio)==(btrue | skip);
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),avancar_rodada_disputa)==(size(fila_disputa_atual) = 0 & (size(fila_disputa_proxima)>0 or size(eliminados_nesta_rodada)>0) | skip);
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),processar_resultado_disputa)==(size(fila_disputa_atual)>0 & jj: JULGAMENTO | skip);
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),registrar_julgamento_classificacao)==(ss: NAT1 & ss: dom(estado_senha) & jj: JULGAMENTO | skip);
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),extrair_lote_rodizio)==(size(fila_geral)>0 | skip);
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),atualizar_dono)==(novo_vaqueiro: VAQUEIROS & novo_vaqueiro: NAT1 & ss: SENHAS & ss: NAT1 & ss: dom(dono_senha) & card(dom(dono_senha|>{novo_vaqueiro}))<LIMITE_SENHAS_VAQUEIRO & ss: dom(bois_corridos) & bois_corridos(ss) = 0 | skip);
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),cancelar_registro_senha)==(ss: SENHAS & ss: NAT1 & ss: dom(dono_senha) & ss: ran(fila_geral) | skip);
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),atualizar_status)==(ss: SENHAS & ss: NAT1 & ss: dom(estado_senha) & novo_status: STATUS_SENHA | skip);
  Expanded_List_Substitution(Implementation(Gerenciador_Senhas_i),cadastrar_senha)==(vv: VAQUEIROS & vv: NAT1 & ss: SENHAS & ss: NAT1 & torneio_comecou: BOOL & ultima_senha: NAT & ss/:dom(dono_senha) & card(dom(dono_senha))<TOTAL_SENHAS & card(dom(dono_senha|>{vv}))<LIMITE_SENHAS_VAQUEIRO | skip);
  List_Substitution(Implementation(Gerenciador_Senhas_i),cadastrar_senha)==(skip);
  List_Substitution(Implementation(Gerenciador_Senhas_i),atualizar_status)==(skip);
  List_Substitution(Implementation(Gerenciador_Senhas_i),cancelar_registro_senha)==(skip);
  List_Substitution(Implementation(Gerenciador_Senhas_i),atualizar_dono)==(skip);
  List_Substitution(Implementation(Gerenciador_Senhas_i),extrair_lote_rodizio)==(skip);
  List_Substitution(Implementation(Gerenciador_Senhas_i),registrar_julgamento_classificacao)==(skip);
  List_Substitution(Implementation(Gerenciador_Senhas_i),processar_resultado_disputa)==(skip);
  List_Substitution(Implementation(Gerenciador_Senhas_i),avancar_rodada_disputa)==(skip);
  List_Substitution(Implementation(Gerenciador_Senhas_i),finalizar_torneio)==(skip)
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
  VisibleVariables(Implementation(Gerenciador_Senhas_i))==(Type(dono_senha_arr) == Mvv(SetOf(btype(INTEGER,1,20)*btype(INTEGER,0,MAXINT)));Type(estado_senha_arr) == Mvv(SetOf(btype(INTEGER,1,20)*etype(STATUS_SENHA,0,4)));Type(bois_corridos_arr) == Mvv(SetOf(btype(INTEGER,1,20)*btype(INTEGER,0,MAXINT)));Type(fila_geral_arr) == Mvv(SetOf(btype(INTEGER,1,20)*btype(INTEGER,0,MAXINT)));Type(fila_geral_ini) == Mvv(btype(INTEGER,?,?));Type(fila_geral_fim) == Mvv(btype(INTEGER,?,?));Type(fila_disputa_atual_arr) == Mvv(SetOf(btype(INTEGER,1,20)*btype(INTEGER,0,MAXINT)));Type(fila_disputa_atual_ini) == Mvv(btype(INTEGER,?,?));Type(fila_disputa_atual_fim) == Mvv(btype(INTEGER,?,?));Type(fila_disputa_proxima_arr) == Mvv(SetOf(btype(INTEGER,1,20)*btype(INTEGER,0,MAXINT)));Type(fila_disputa_proxima_ini) == Mvv(btype(INTEGER,?,?));Type(fila_disputa_proxima_fim) == Mvv(btype(INTEGER,?,?));Type(eliminados_arr) == Mvv(SetOf(btype(INTEGER,1,20)*btype(INTEGER,0,MAXINT)));Type(eliminados_ini) == Mvv(btype(INTEGER,?,?));Type(eliminados_fim) == Mvv(btype(INTEGER,?,?)));
  Operations(Implementation(Gerenciador_Senhas_i))==(Type(finalizar_torneio) == Cst(No_type,No_type);Type(avancar_rodada_disputa) == Cst(No_type,No_type);Type(processar_resultado_disputa) == Cst(No_type,etype(JULGAMENTO,?,?));Type(registrar_julgamento_classificacao) == Cst(No_type,btype(INTEGER,?,?)*etype(JULGAMENTO,?,?));Type(extrair_lote_rodizio) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)),No_type);Type(atualizar_dono) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(cancelar_registro_senha) == Cst(No_type,btype(INTEGER,?,?));Type(atualizar_status) == Cst(No_type,btype(INTEGER,?,?)*etype(STATUS_SENHA,?,?));Type(cadastrar_senha) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(BOOL,?,?)*btype(INTEGER,?,?)))
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
  List_Of_Ids(Implementation(Gerenciador_Senhas_i)) == (? | ? | ? | ? | cadastrar_senha,atualizar_status,cancelar_registro_senha,atualizar_dono,extrair_lote_rodizio,registrar_julgamento_classificacao,processar_resultado_disputa,avancar_rodada_disputa,finalizar_torneio | ? | seen(Machine(Contexto_Vaquejada)) | ? | Gerenciador_Senhas_i);
  List_Of_HiddenCst_Ids(Implementation(Gerenciador_Senhas_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(Gerenciador_Senhas_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(Gerenciador_Senhas_i)) == (eliminados_fim,eliminados_ini,eliminados_arr,fila_disputa_proxima_fim,fila_disputa_proxima_ini,fila_disputa_proxima_arr,fila_disputa_atual_fim,fila_disputa_atual_ini,fila_disputa_atual_arr,fila_geral_fim,fila_geral_ini,fila_geral_arr,bois_corridos_arr,estado_senha_arr,dono_senha_arr | ?);
  List_Of_Ids_SeenBNU(Implementation(Gerenciador_Senhas_i)) == (?: ?);
  List_Of_Ids(Machine(Contexto_Vaquejada)) == (TOTAL_SENHAS,LIMITE_SENHAS_VAQUEIRO,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS,TAMANHO_RODIZIO,PREMIO_TOTAL,FASES,STATUS_SENHA,JULGAMENTO,classificacao,disputa,encerrado,na_espera,na_pista,classificada,eliminada,campea,valeu_boi,zero_boi,retorno | ? | ? | ? | ? | ? | ? | ? | Contexto_Vaquejada);
  List_Of_HiddenCst_Ids(Machine(Contexto_Vaquejada)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Contexto_Vaquejada)) == (TOTAL_SENHAS,LIMITE_SENHAS_VAQUEIRO,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS,TAMANHO_RODIZIO,PREMIO_TOTAL);
  List_Of_VisibleVar_Ids(Machine(Contexto_Vaquejada)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Contexto_Vaquejada)) == (?: ?)
END
&
THEORY VisibleVariablesEnvX IS
  VisibleVariables(Implementation(Gerenciador_Senhas_i)) == (Type(eliminados_fim) == Mvv(btype(INTEGER,?,?));Type(eliminados_ini) == Mvv(btype(INTEGER,?,?));Type(eliminados_arr) == Mvv(SetOf(btype(INTEGER,1,20)*btype(INTEGER,0,MAXINT)));Type(fila_disputa_proxima_fim) == Mvv(btype(INTEGER,?,?));Type(fila_disputa_proxima_ini) == Mvv(btype(INTEGER,?,?));Type(fila_disputa_proxima_arr) == Mvv(SetOf(btype(INTEGER,1,20)*btype(INTEGER,0,MAXINT)));Type(fila_disputa_atual_fim) == Mvv(btype(INTEGER,?,?));Type(fila_disputa_atual_ini) == Mvv(btype(INTEGER,?,?));Type(fila_disputa_atual_arr) == Mvv(SetOf(btype(INTEGER,1,20)*btype(INTEGER,0,MAXINT)));Type(fila_geral_fim) == Mvv(btype(INTEGER,?,?));Type(fila_geral_ini) == Mvv(btype(INTEGER,?,?));Type(fila_geral_arr) == Mvv(SetOf(btype(INTEGER,1,20)*btype(INTEGER,0,MAXINT)));Type(bois_corridos_arr) == Mvv(SetOf(btype(INTEGER,1,20)*btype(INTEGER,0,MAXINT)));Type(estado_senha_arr) == Mvv(SetOf(btype(INTEGER,1,20)*etype(STATUS_SENHA,0,4)));Type(dono_senha_arr) == Mvv(SetOf(btype(INTEGER,1,20)*btype(INTEGER,0,MAXINT))))
END
&
THEORY VariablesLocEnvX IS
  Variables_Loc(Implementation(Gerenciador_Senhas_i),?, 1) == (Type(ii) == Lvl(btype(INTEGER,?,?)))
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
  TypingPredicate(Implementation(Gerenciador_Senhas_i))==(dono_senha_arr: POW(INTEGER*INTEGER) & estado_senha_arr: POW(INTEGER*STATUS_SENHA) & bois_corridos_arr: POW(INTEGER*INTEGER) & fila_geral_arr: POW(INTEGER*INTEGER) & fila_geral_ini: INTEGER & fila_geral_fim: INTEGER & fila_disputa_atual_arr: POW(INTEGER*INTEGER) & fila_disputa_atual_ini: INTEGER & fila_disputa_atual_fim: INTEGER & fila_disputa_proxima_arr: POW(INTEGER*INTEGER) & fila_disputa_proxima_ini: INTEGER & fila_disputa_proxima_fim: INTEGER & eliminados_arr: POW(INTEGER*INTEGER) & eliminados_ini: INTEGER & eliminados_fim: INTEGER)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
