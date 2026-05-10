Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Gerenciador_Senhas))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Gerenciador_Senhas))==(Machine(Gerenciador_Senhas));
  Level(Machine(Gerenciador_Senhas))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Gerenciador_Senhas)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Gerenciador_Senhas))==(Contexto_Vaquejada)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Gerenciador_Senhas))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Gerenciador_Senhas))==(?);
  List_Includes(Machine(Gerenciador_Senhas))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Gerenciador_Senhas))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Gerenciador_Senhas))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Gerenciador_Senhas))==(?);
  Context_List_Variables(Machine(Gerenciador_Senhas))==(?);
  Abstract_List_Variables(Machine(Gerenciador_Senhas))==(?);
  Local_List_Variables(Machine(Gerenciador_Senhas))==(eliminados_nesta_rodada,fila_disputa_proxima,fila_disputa_atual,fila_geral,bois_corridos,estado_senha,dono_senha);
  List_Variables(Machine(Gerenciador_Senhas))==(eliminados_nesta_rodada,fila_disputa_proxima,fila_disputa_atual,fila_geral,bois_corridos,estado_senha,dono_senha);
  External_List_Variables(Machine(Gerenciador_Senhas))==(eliminados_nesta_rodada,fila_disputa_proxima,fila_disputa_atual,fila_geral,bois_corridos,estado_senha,dono_senha)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Gerenciador_Senhas))==(?);
  Abstract_List_VisibleVariables(Machine(Gerenciador_Senhas))==(?);
  External_List_VisibleVariables(Machine(Gerenciador_Senhas))==(?);
  Expanded_List_VisibleVariables(Machine(Gerenciador_Senhas))==(?);
  List_VisibleVariables(Machine(Gerenciador_Senhas))==(?);
  Internal_List_VisibleVariables(Machine(Gerenciador_Senhas))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Gerenciador_Senhas))==(btrue);
  Gluing_List_Invariant(Machine(Gerenciador_Senhas))==(btrue);
  Expanded_List_Invariant(Machine(Gerenciador_Senhas))==(btrue);
  Abstract_List_Invariant(Machine(Gerenciador_Senhas))==(btrue);
  Context_List_Invariant(Machine(Gerenciador_Senhas))==(btrue);
  List_Invariant(Machine(Gerenciador_Senhas))==(dono_senha: SENHAS +-> VAQUEIROS & estado_senha: SENHAS +-> STATUS_SENHA & bois_corridos: SENHAS +-> NAT & fila_geral: iseq(NAT1) & fila_disputa_atual: iseq(NAT1) & fila_disputa_proxima: iseq(NAT1) & eliminados_nesta_rodada: iseq(NAT1) & !ss.(ss: dom(estado_senha) & estado_senha(ss) = classificada => ss: dom(bois_corridos) & bois_corridos(ss) = BOIS_PARA_CLASSIFICAR))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Gerenciador_Senhas))==(btrue);
  Abstract_List_Assertions(Machine(Gerenciador_Senhas))==(btrue);
  Context_List_Assertions(Machine(Gerenciador_Senhas))==(btrue);
  List_Assertions(Machine(Gerenciador_Senhas))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Gerenciador_Senhas))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Gerenciador_Senhas))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Gerenciador_Senhas))==(dono_senha,estado_senha,bois_corridos,fila_geral,fila_disputa_atual,fila_disputa_proxima,eliminados_nesta_rodada:={},{},{},<>,<>,<>,<>);
  Context_List_Initialisation(Machine(Gerenciador_Senhas))==(skip);
  List_Initialisation(Machine(Gerenciador_Senhas))==(dono_senha:={} || estado_senha:={} || bois_corridos:={} || fila_geral:=<> || fila_disputa_atual:=<> || fila_disputa_proxima:=<> || eliminados_nesta_rodada:=<>)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Gerenciador_Senhas))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Gerenciador_Senhas),Machine(Contexto_Vaquejada))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Gerenciador_Senhas))==(btrue);
  List_Constraints(Machine(Gerenciador_Senhas))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Gerenciador_Senhas))==(cadastrar_senha,atualizar_status,cancelar_registro_senha,atualizar_dono,extrair_lote_rodizio,registrar_julgamento_classificacao,processar_resultado_disputa,avancar_rodada_disputa,finalizar_torneio);
  List_Operations(Machine(Gerenciador_Senhas))==(cadastrar_senha,atualizar_status,cancelar_registro_senha,atualizar_dono,extrair_lote_rodizio,registrar_julgamento_classificacao,processar_resultado_disputa,avancar_rodada_disputa,finalizar_torneio)
END
&
THEORY ListInputX IS
  List_Input(Machine(Gerenciador_Senhas),cadastrar_senha)==(vv,ss,torneio_comecou,ultima_senha);
  List_Input(Machine(Gerenciador_Senhas),atualizar_status)==(ss,novo_status);
  List_Input(Machine(Gerenciador_Senhas),cancelar_registro_senha)==(ss);
  List_Input(Machine(Gerenciador_Senhas),atualizar_dono)==(ss,novo_vaqueiro);
  List_Input(Machine(Gerenciador_Senhas),extrair_lote_rodizio)==(?);
  List_Input(Machine(Gerenciador_Senhas),registrar_julgamento_classificacao)==(ss,jj);
  List_Input(Machine(Gerenciador_Senhas),processar_resultado_disputa)==(jj);
  List_Input(Machine(Gerenciador_Senhas),avancar_rodada_disputa)==(?);
  List_Input(Machine(Gerenciador_Senhas),finalizar_torneio)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Gerenciador_Senhas),cadastrar_senha)==(?);
  List_Output(Machine(Gerenciador_Senhas),atualizar_status)==(?);
  List_Output(Machine(Gerenciador_Senhas),cancelar_registro_senha)==(?);
  List_Output(Machine(Gerenciador_Senhas),atualizar_dono)==(?);
  List_Output(Machine(Gerenciador_Senhas),extrair_lote_rodizio)==(lote);
  List_Output(Machine(Gerenciador_Senhas),registrar_julgamento_classificacao)==(?);
  List_Output(Machine(Gerenciador_Senhas),processar_resultado_disputa)==(?);
  List_Output(Machine(Gerenciador_Senhas),avancar_rodada_disputa)==(?);
  List_Output(Machine(Gerenciador_Senhas),finalizar_torneio)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Gerenciador_Senhas),cadastrar_senha)==(cadastrar_senha(vv,ss,torneio_comecou,ultima_senha));
  List_Header(Machine(Gerenciador_Senhas),atualizar_status)==(atualizar_status(ss,novo_status));
  List_Header(Machine(Gerenciador_Senhas),cancelar_registro_senha)==(cancelar_registro_senha(ss));
  List_Header(Machine(Gerenciador_Senhas),atualizar_dono)==(atualizar_dono(ss,novo_vaqueiro));
  List_Header(Machine(Gerenciador_Senhas),extrair_lote_rodizio)==(lote <-- extrair_lote_rodizio);
  List_Header(Machine(Gerenciador_Senhas),registrar_julgamento_classificacao)==(registrar_julgamento_classificacao(ss,jj));
  List_Header(Machine(Gerenciador_Senhas),processar_resultado_disputa)==(processar_resultado_disputa(jj));
  List_Header(Machine(Gerenciador_Senhas),avancar_rodada_disputa)==(avancar_rodada_disputa);
  List_Header(Machine(Gerenciador_Senhas),finalizar_torneio)==(finalizar_torneio)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Gerenciador_Senhas),cadastrar_senha)==(vv: VAQUEIROS & vv: NAT1 & ss: SENHAS & ss: NAT1 & torneio_comecou: BOOL & ultima_senha: NAT & ss/:dom(dono_senha) & card(dom(dono_senha))<TOTAL_SENHAS & card(dom(dono_senha|>{vv}))<LIMITE_SENHAS_VAQUEIRO);
  List_Precondition(Machine(Gerenciador_Senhas),atualizar_status)==(ss: SENHAS & ss: NAT1 & ss: dom(estado_senha) & novo_status: STATUS_SENHA);
  List_Precondition(Machine(Gerenciador_Senhas),cancelar_registro_senha)==(ss: SENHAS & ss: NAT1 & ss: dom(dono_senha) & ss: ran(fila_geral));
  List_Precondition(Machine(Gerenciador_Senhas),atualizar_dono)==(novo_vaqueiro: VAQUEIROS & novo_vaqueiro: NAT1 & ss: SENHAS & ss: NAT1 & ss: dom(dono_senha) & card(dom(dono_senha|>{novo_vaqueiro}))<LIMITE_SENHAS_VAQUEIRO & ss: dom(bois_corridos) & bois_corridos(ss) = 0);
  List_Precondition(Machine(Gerenciador_Senhas),extrair_lote_rodizio)==(size(fila_geral)>0);
  List_Precondition(Machine(Gerenciador_Senhas),registrar_julgamento_classificacao)==(ss: NAT1 & ss: dom(estado_senha) & jj: JULGAMENTO);
  List_Precondition(Machine(Gerenciador_Senhas),processar_resultado_disputa)==(size(fila_disputa_atual)>0 & jj: JULGAMENTO);
  List_Precondition(Machine(Gerenciador_Senhas),avancar_rodada_disputa)==(size(fila_disputa_atual) = 0 & (size(fila_disputa_proxima)>0 or size(eliminados_nesta_rodada)>0));
  List_Precondition(Machine(Gerenciador_Senhas),finalizar_torneio)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Gerenciador_Senhas),finalizar_torneio)==(btrue | estado_senha:=estado_senha<+dom(estado_senha|>{classificada})*{campea});
  Expanded_List_Substitution(Machine(Gerenciador_Senhas),avancar_rodada_disputa)==(size(fila_disputa_atual) = 0 & (size(fila_disputa_proxima)>0 or size(eliminados_nesta_rodada)>0) | size(fila_disputa_proxima)>0 ==> fila_disputa_atual,fila_disputa_proxima,eliminados_nesta_rodada:=fila_disputa_proxima,<>,<> [] not(size(fila_disputa_proxima)>0) ==> fila_disputa_atual,estado_senha,eliminados_nesta_rodada:=eliminados_nesta_rodada,estado_senha<+ran(eliminados_nesta_rodada)*{classificada},<>);
  Expanded_List_Substitution(Machine(Gerenciador_Senhas),processar_resultado_disputa)==(size(fila_disputa_atual)>0 & jj: JULGAMENTO | @ss.(ss = fila_disputa_atual(1) ==> (jj = zero_boi ==> estado_senha,fila_disputa_atual,eliminados_nesta_rodada:=estado_senha<+{ss|->eliminada},fila_disputa_atual\|/1,eliminados_nesta_rodada<-ss [] not(jj = zero_boi) ==> (jj = valeu_boi ==> (estado_senha,fila_disputa_atual:=estado_senha<+{ss|->classificada},fila_disputa_atual\|/1 || @(f1,f2).(f1: iseq(NAT1) & f2: iseq(NAT1) & fila_disputa_proxima = f1^f2 & !xx.(xx: ran(f1) => xx<ss) & !yy.(yy: ran(f2) => yy>ss) ==> fila_disputa_proxima:=f1^[ss]^f2)) [] not(jj = valeu_boi) ==> estado_senha,fila_disputa_atual:=estado_senha<+{ss|->classificada},fila_disputa_atual\|/1<-ss))));
  Expanded_List_Substitution(Machine(Gerenciador_Senhas),registrar_julgamento_classificacao)==(ss: NAT1 & ss: dom(estado_senha) & jj: JULGAMENTO | jj = zero_boi ==> estado_senha:=estado_senha<+{ss|->eliminada} [] not(jj = zero_boi) ==> (jj = valeu_boi ==> (bois_corridos:=bois_corridos<+{ss|->bois_corridos(ss)+1} || (bois_corridos(ss)+1 = BOIS_PARA_CLASSIFICAR ==> (estado_senha:=estado_senha<+{ss|->classificada} || @(f1,f2).(f1: iseq(NAT1) & f2: iseq(NAT1) & fila_disputa_proxima = f1^f2 & !xx.(xx: ran(f1) => xx<ss) & !yy.(yy: ran(f2) => yy>ss) ==> fila_disputa_proxima:=f1^[ss]^f2)) [] not(bois_corridos(ss)+1 = BOIS_PARA_CLASSIFICAR) ==> estado_senha:=estado_senha<+{ss|->na_espera})) [] not(jj = valeu_boi) ==> estado_senha:=estado_senha<+{ss|->na_espera}));
  Expanded_List_Substitution(Machine(Gerenciador_Senhas),extrair_lote_rodizio)==(size(fila_geral)>0 | size(fila_geral)>TAMANHO_RODIZIO ==> lote,fila_geral:=fila_geral/|\TAMANHO_RODIZIO,fila_geral\|/TAMANHO_RODIZIO [] not(size(fila_geral)>TAMANHO_RODIZIO) ==> lote,fila_geral:=fila_geral,<>);
  Expanded_List_Substitution(Machine(Gerenciador_Senhas),atualizar_dono)==(novo_vaqueiro: VAQUEIROS & novo_vaqueiro: NAT1 & ss: SENHAS & ss: NAT1 & ss: dom(dono_senha) & card(dom(dono_senha|>{novo_vaqueiro}))<LIMITE_SENHAS_VAQUEIRO & ss: dom(bois_corridos) & bois_corridos(ss) = 0 | dono_senha:=dono_senha<+{ss|->novo_vaqueiro});
  Expanded_List_Substitution(Machine(Gerenciador_Senhas),cancelar_registro_senha)==(ss: SENHAS & ss: NAT1 & ss: dom(dono_senha) & ss: ran(fila_geral) | dono_senha,estado_senha,bois_corridos:={ss}<<|dono_senha,{ss}<<|estado_senha,{ss}<<|bois_corridos || @(f1,f2).(f1: iseq(NAT1) & f2: iseq(NAT1) & fila_geral = f1^[ss]^f2 ==> fila_geral:=f1^f2));
  Expanded_List_Substitution(Machine(Gerenciador_Senhas),atualizar_status)==(ss: SENHAS & ss: NAT1 & ss: dom(estado_senha) & novo_status: STATUS_SENHA | estado_senha:=estado_senha<+{ss|->novo_status});
  Expanded_List_Substitution(Machine(Gerenciador_Senhas),cadastrar_senha)==(vv: VAQUEIROS & vv: NAT1 & ss: SENHAS & ss: NAT1 & torneio_comecou: BOOL & ultima_senha: NAT & ss/:dom(dono_senha) & card(dom(dono_senha))<TOTAL_SENHAS & card(dom(dono_senha|>{vv}))<LIMITE_SENHAS_VAQUEIRO | dono_senha,estado_senha,bois_corridos:=dono_senha<+{ss|->vv},estado_senha<+{ss|->na_espera},bois_corridos<+{ss|->0} || (torneio_comecou = FALSE ==> @(f1,f2).(f1: iseq(NAT1) & f2: iseq(NAT1) & fila_geral = f1^f2 & !xx.(xx: ran(f1) => xx<ss) & !yy.(yy: ran(f2) => yy>ss) ==> fila_geral:=f1^[ss]^f2) [] not(torneio_comecou = FALSE) ==> (ss<ultima_senha ==> fila_geral:=fila_geral<-ss [] not(ss<ultima_senha) ==> @(f1,f2).(f1: iseq(NAT1) & f2: iseq(NAT1) & fila_geral = f1^f2 & !xx.(xx: ran(f1) => xx<ss & xx>ultima_senha) & (f2/=<> => first(f2)>ss or first(f2)<=ultima_senha) ==> fila_geral:=f1^[ss]^f2))));
  List_Substitution(Machine(Gerenciador_Senhas),cadastrar_senha)==(dono_senha(ss):=vv || estado_senha(ss):=na_espera || bois_corridos(ss):=0 || IF torneio_comecou = FALSE THEN ANY f1,f2 WHERE f1: iseq(NAT1) & f2: iseq(NAT1) & fila_geral = f1^f2 & !xx.(xx: ran(f1) => xx<ss) & !yy.(yy: ran(f2) => yy>ss) THEN fila_geral:=f1^[ss]^f2 END ELSE IF ss<ultima_senha THEN fila_geral:=fila_geral<-ss ELSE ANY f1,f2 WHERE f1: iseq(NAT1) & f2: iseq(NAT1) & fila_geral = f1^f2 & !xx.(xx: ran(f1) => xx<ss & xx>ultima_senha) & (f2/=<> => first(f2)>ss or first(f2)<=ultima_senha) THEN fila_geral:=f1^[ss]^f2 END END END);
  List_Substitution(Machine(Gerenciador_Senhas),atualizar_status)==(estado_senha(ss):=novo_status);
  List_Substitution(Machine(Gerenciador_Senhas),cancelar_registro_senha)==(dono_senha:={ss}<<|dono_senha || estado_senha:={ss}<<|estado_senha || bois_corridos:={ss}<<|bois_corridos || ANY f1,f2 WHERE f1: iseq(NAT1) & f2: iseq(NAT1) & fila_geral = f1^[ss]^f2 THEN fila_geral:=f1^f2 END);
  List_Substitution(Machine(Gerenciador_Senhas),atualizar_dono)==(dono_senha(ss):=novo_vaqueiro);
  List_Substitution(Machine(Gerenciador_Senhas),extrair_lote_rodizio)==(IF size(fila_geral)>TAMANHO_RODIZIO THEN lote:=fila_geral/|\TAMANHO_RODIZIO || fila_geral:=fila_geral\|/TAMANHO_RODIZIO ELSE lote:=fila_geral || fila_geral:=<> END);
  List_Substitution(Machine(Gerenciador_Senhas),registrar_julgamento_classificacao)==(IF jj = zero_boi THEN estado_senha(ss):=eliminada ELSIF jj = valeu_boi THEN bois_corridos(ss):=bois_corridos(ss)+1 || IF bois_corridos(ss)+1 = BOIS_PARA_CLASSIFICAR THEN estado_senha(ss):=classificada || ANY f1,f2 WHERE f1: iseq(NAT1) & f2: iseq(NAT1) & fila_disputa_proxima = f1^f2 & !xx.(xx: ran(f1) => xx<ss) & !yy.(yy: ran(f2) => yy>ss) THEN fila_disputa_proxima:=f1^[ss]^f2 END ELSE estado_senha(ss):=na_espera END ELSE estado_senha(ss):=na_espera END);
  List_Substitution(Machine(Gerenciador_Senhas),processar_resultado_disputa)==(ANY ss WHERE ss = fila_disputa_atual(1) THEN IF jj = zero_boi THEN estado_senha(ss):=eliminada || fila_disputa_atual:=fila_disputa_atual\|/1 || eliminados_nesta_rodada:=eliminados_nesta_rodada<-ss ELSIF jj = valeu_boi THEN estado_senha(ss):=classificada || fila_disputa_atual:=fila_disputa_atual\|/1 || ANY f1,f2 WHERE f1: iseq(NAT1) & f2: iseq(NAT1) & fila_disputa_proxima = f1^f2 & !xx.(xx: ran(f1) => xx<ss) & !yy.(yy: ran(f2) => yy>ss) THEN fila_disputa_proxima:=f1^[ss]^f2 END ELSE estado_senha(ss):=classificada || fila_disputa_atual:=fila_disputa_atual\|/1<-ss END END);
  List_Substitution(Machine(Gerenciador_Senhas),avancar_rodada_disputa)==(IF size(fila_disputa_proxima)>0 THEN fila_disputa_atual:=fila_disputa_proxima || fila_disputa_proxima:=<> || eliminados_nesta_rodada:=<> ELSE fila_disputa_atual:=eliminados_nesta_rodada || estado_senha:=estado_senha<+ran(eliminados_nesta_rodada)*{classificada} || eliminados_nesta_rodada:=<> END);
  List_Substitution(Machine(Gerenciador_Senhas),finalizar_torneio)==(estado_senha:=estado_senha<+dom(estado_senha|>{classificada})*{campea})
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Gerenciador_Senhas))==(?);
  Inherited_List_Constants(Machine(Gerenciador_Senhas))==(?);
  List_Constants(Machine(Gerenciador_Senhas))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Gerenciador_Senhas),JULGAMENTO)==({valeu_boi,zero_boi,retorno});
  Context_List_Enumerated(Machine(Gerenciador_Senhas))==(FASES,STATUS_SENHA,JULGAMENTO);
  Context_List_Defered(Machine(Gerenciador_Senhas))==(?);
  Context_List_Sets(Machine(Gerenciador_Senhas))==(FASES,STATUS_SENHA,JULGAMENTO);
  List_Valuable_Sets(Machine(Gerenciador_Senhas))==(?);
  Inherited_List_Enumerated(Machine(Gerenciador_Senhas))==(?);
  Inherited_List_Defered(Machine(Gerenciador_Senhas))==(?);
  Inherited_List_Sets(Machine(Gerenciador_Senhas))==(?);
  List_Enumerated(Machine(Gerenciador_Senhas))==(?);
  List_Defered(Machine(Gerenciador_Senhas))==(?);
  List_Sets(Machine(Gerenciador_Senhas))==(?);
  Set_Definition(Machine(Gerenciador_Senhas),STATUS_SENHA)==({na_espera,na_pista,classificada,eliminada,campea});
  Set_Definition(Machine(Gerenciador_Senhas),FASES)==({classificacao,disputa,encerrado})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Gerenciador_Senhas))==(?);
  Expanded_List_HiddenConstants(Machine(Gerenciador_Senhas))==(?);
  List_HiddenConstants(Machine(Gerenciador_Senhas))==(?);
  External_List_HiddenConstants(Machine(Gerenciador_Senhas))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Gerenciador_Senhas))==(btrue);
  Context_List_Properties(Machine(Gerenciador_Senhas))==(TOTAL_SENHAS: NAT1 & TOTAL_SENHAS = 20 & LIMITE_SENHAS_VAQUEIRO: NAT1 & LIMITE_SENHAS_VAQUEIRO = max({1,TOTAL_SENHAS/5}) & BOIS_PARA_CLASSIFICAR: NAT1 & BOIS_PARA_CLASSIFICAR = 2 & TAMANHO_RODIZIO: NAT1 & TAMANHO_RODIZIO = 4 & VAQUEIROS <: NAT1 & VAQUEIROS = 1..3 & SENHAS <: NAT1 & SENHAS = 1..TOTAL_SENHAS & FASES: FIN(INTEGER) & not(FASES = {}) & STATUS_SENHA: FIN(INTEGER) & not(STATUS_SENHA = {}) & JULGAMENTO: FIN(INTEGER) & not(JULGAMENTO = {}));
  Inherited_List_Properties(Machine(Gerenciador_Senhas))==(btrue);
  List_Properties(Machine(Gerenciador_Senhas))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Gerenciador_Senhas),Machine(Contexto_Vaquejada))==(?);
  Seen_Context_List_Enumerated(Machine(Gerenciador_Senhas))==(?);
  Seen_Context_List_Invariant(Machine(Gerenciador_Senhas))==(btrue);
  Seen_Context_List_Assertions(Machine(Gerenciador_Senhas))==(btrue);
  Seen_Context_List_Properties(Machine(Gerenciador_Senhas))==(btrue);
  Seen_List_Constraints(Machine(Gerenciador_Senhas))==(btrue);
  Seen_List_Operations(Machine(Gerenciador_Senhas),Machine(Contexto_Vaquejada))==(?);
  Seen_Expanded_List_Invariant(Machine(Gerenciador_Senhas),Machine(Contexto_Vaquejada))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Gerenciador_Senhas),cadastrar_senha)==((Var(f1) == SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))),(Var(f2) == SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))));
  List_ANY_Var(Machine(Gerenciador_Senhas),atualizar_status)==(?);
  List_ANY_Var(Machine(Gerenciador_Senhas),cancelar_registro_senha)==((Var(f1) == SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))),(Var(f2) == SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))));
  List_ANY_Var(Machine(Gerenciador_Senhas),atualizar_dono)==(?);
  List_ANY_Var(Machine(Gerenciador_Senhas),extrair_lote_rodizio)==(?);
  List_ANY_Var(Machine(Gerenciador_Senhas),registrar_julgamento_classificacao)==((Var(f1) == SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))),(Var(f2) == SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))));
  List_ANY_Var(Machine(Gerenciador_Senhas),processar_resultado_disputa)==((Var(ss) == btype(INTEGER,?,?)),(Var(f1) == SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))),(Var(f2) == SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))));
  List_ANY_Var(Machine(Gerenciador_Senhas),avancar_rodada_disputa)==(?);
  List_ANY_Var(Machine(Gerenciador_Senhas),finalizar_torneio)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Gerenciador_Senhas)) == (? | ? | eliminados_nesta_rodada,fila_disputa_proxima,fila_disputa_atual,fila_geral,bois_corridos,estado_senha,dono_senha | ? | cadastrar_senha,atualizar_status,cancelar_registro_senha,atualizar_dono,extrair_lote_rodizio,registrar_julgamento_classificacao,processar_resultado_disputa,avancar_rodada_disputa,finalizar_torneio | ? | seen(Machine(Contexto_Vaquejada)) | ? | Gerenciador_Senhas);
  List_Of_HiddenCst_Ids(Machine(Gerenciador_Senhas)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Gerenciador_Senhas)) == (?);
  List_Of_VisibleVar_Ids(Machine(Gerenciador_Senhas)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Gerenciador_Senhas)) == (?: ?);
  List_Of_Ids(Machine(Contexto_Vaquejada)) == (TOTAL_SENHAS,LIMITE_SENHAS_VAQUEIRO,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS,TAMANHO_RODIZIO,FASES,STATUS_SENHA,JULGAMENTO,classificacao,disputa,encerrado,na_espera,na_pista,classificada,eliminada,campea,valeu_boi,zero_boi,retorno | ? | ? | ? | ? | ? | ? | ? | Contexto_Vaquejada);
  List_Of_HiddenCst_Ids(Machine(Contexto_Vaquejada)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Contexto_Vaquejada)) == (TOTAL_SENHAS,LIMITE_SENHAS_VAQUEIRO,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS,TAMANHO_RODIZIO);
  List_Of_VisibleVar_Ids(Machine(Contexto_Vaquejada)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Contexto_Vaquejada)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Gerenciador_Senhas)) == (Type(eliminados_nesta_rodada) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(fila_disputa_proxima) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(fila_disputa_atual) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(fila_geral) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(bois_corridos) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(estado_senha) == Mvl(SetOf(btype(INTEGER,?,?)*etype(STATUS_SENHA,?,?)));Type(dono_senha) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Gerenciador_Senhas)) == (Type(finalizar_torneio) == Cst(No_type,No_type);Type(avancar_rodada_disputa) == Cst(No_type,No_type);Type(processar_resultado_disputa) == Cst(No_type,etype(JULGAMENTO,?,?));Type(registrar_julgamento_classificacao) == Cst(No_type,btype(INTEGER,?,?)*etype(JULGAMENTO,?,?));Type(extrair_lote_rodizio) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)),No_type);Type(atualizar_dono) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(cancelar_registro_senha) == Cst(No_type,btype(INTEGER,?,?));Type(atualizar_status) == Cst(No_type,btype(INTEGER,?,?)*etype(STATUS_SENHA,?,?));Type(cadastrar_senha) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?)*btype(BOOL,?,?)*btype(INTEGER,?,?)))
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
)
