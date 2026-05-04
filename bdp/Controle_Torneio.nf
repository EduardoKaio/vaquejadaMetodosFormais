Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Controle_Torneio))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Controle_Torneio))==(Machine(Controle_Torneio));
  Level(Machine(Controle_Torneio))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Controle_Torneio)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Controle_Torneio))==(Contexto_Vaquejada)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Controle_Torneio))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Controle_Torneio))==(Gerenciador_Senhas);
  List_Includes(Machine(Controle_Torneio))==(Gerenciador_Senhas)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Controle_Torneio))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Controle_Torneio))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Controle_Torneio))==(?);
  Context_List_Variables(Machine(Controle_Torneio))==(?);
  Abstract_List_Variables(Machine(Controle_Torneio))==(?);
  Local_List_Variables(Machine(Controle_Torneio))==(ultimo_rodizio_iniciado,torneio_iniciado,idx_correndo,rodizio_atual,fase_atual);
  List_Variables(Machine(Controle_Torneio))==(ultimo_rodizio_iniciado,torneio_iniciado,idx_correndo,rodizio_atual,fase_atual,eliminados_nesta_rodada,fila_disputa_proxima,fila_disputa_atual,fila_geral,bois_corridos,estado_senha,dono_senha);
  External_List_Variables(Machine(Controle_Torneio))==(ultimo_rodizio_iniciado,torneio_iniciado,idx_correndo,rodizio_atual,fase_atual,eliminados_nesta_rodada,fila_disputa_proxima,fila_disputa_atual,fila_geral,bois_corridos,estado_senha,dono_senha)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Controle_Torneio))==(?);
  Abstract_List_VisibleVariables(Machine(Controle_Torneio))==(?);
  External_List_VisibleVariables(Machine(Controle_Torneio))==(?);
  Expanded_List_VisibleVariables(Machine(Controle_Torneio))==(?);
  List_VisibleVariables(Machine(Controle_Torneio))==(?);
  Internal_List_VisibleVariables(Machine(Controle_Torneio))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Controle_Torneio))==(btrue);
  Gluing_List_Invariant(Machine(Controle_Torneio))==(btrue);
  Abstract_List_Invariant(Machine(Controle_Torneio))==(btrue);
  Expanded_List_Invariant(Machine(Controle_Torneio))==(dono_senha: SENHAS +-> VAQUEIROS & estado_senha: SENHAS +-> STATUS_SENHA & bois_corridos: SENHAS +-> NAT & fila_geral: iseq(NAT1) & fila_disputa_atual: iseq(NAT1) & fila_disputa_proxima: iseq(NAT1) & eliminados_nesta_rodada: iseq(NAT1) & !ss.(ss: dom(estado_senha) & estado_senha(ss) = classificada => ss: dom(bois_corridos) & bois_corridos(ss) = BOIS_PARA_CLASSIFICAR));
  Context_List_Invariant(Machine(Controle_Torneio))==(btrue);
  List_Invariant(Machine(Controle_Torneio))==(fase_atual: FASES & rodizio_atual: iseq(NAT1) & size(rodizio_atual)<=TAMANHO_RODIZIO & idx_correndo: 1..TAMANHO_RODIZIO & torneio_iniciado: BOOL & ultimo_rodizio_iniciado: BOOL & !ss.(ss: dom(estado_senha) & estado_senha(ss) = campea => fase_atual = encerrado & ss: dom(bois_corridos) & bois_corridos(ss)>=BOIS_PARA_CLASSIFICAR))
END
&
THEORY ListAssertionsX IS
  Abstract_List_Assertions(Machine(Controle_Torneio))==(btrue);
  Expanded_List_Assertions(Machine(Controle_Torneio))==(btrue);
  Context_List_Assertions(Machine(Controle_Torneio))==(btrue);
  List_Assertions(Machine(Controle_Torneio))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Controle_Torneio))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Controle_Torneio))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Controle_Torneio))==(dono_senha,estado_senha,bois_corridos,fila_geral,fila_disputa_atual,fila_disputa_proxima,eliminados_nesta_rodada:={},{},{},<>,<>,<>,<>;fase_atual,rodizio_atual,idx_correndo,torneio_iniciado,ultimo_rodizio_iniciado:=classificacao,<>,1,FALSE,FALSE);
  Context_List_Initialisation(Machine(Controle_Torneio))==(skip);
  List_Initialisation(Machine(Controle_Torneio))==(fase_atual:=classificacao || rodizio_atual:=<> || idx_correndo:=1 || torneio_iniciado:=FALSE || ultimo_rodizio_iniciado:=FALSE)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Controle_Torneio))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Controle_Torneio),Machine(Gerenciador_Senhas))==(?);
  List_Instanciated_Parameters(Machine(Controle_Torneio),Machine(Contexto_Vaquejada))==(?)
END
&
THEORY ListConstraintsX IS
  List_Constraints(Machine(Controle_Torneio),Machine(Gerenciador_Senhas))==(btrue);
  List_Context_Constraints(Machine(Controle_Torneio))==(btrue);
  List_Constraints(Machine(Controle_Torneio))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Controle_Torneio))==(comprar_senha,desistir_senha,transferir_senha,iniciar_rodizio,iniciar_ultimo_rodizio,chamar_para_pista,correr_boi_classificacao,iniciar_fase_disputa,correr_boi_disputa,iniciar_nova_rodada_disputa,finalizar_sem_vencedor,rachar_premio,declarar_campeao_unico,observar_torneio_encerrado,consultar_status_senha,consultar_dono,total_senhas_vendidas,consultar_bois_derrubados);
  List_Operations(Machine(Controle_Torneio))==(comprar_senha,desistir_senha,transferir_senha,iniciar_rodizio,iniciar_ultimo_rodizio,chamar_para_pista,correr_boi_classificacao,iniciar_fase_disputa,correr_boi_disputa,iniciar_nova_rodada_disputa,finalizar_sem_vencedor,rachar_premio,declarar_campeao_unico,observar_torneio_encerrado,consultar_status_senha,consultar_dono,total_senhas_vendidas,consultar_bois_derrubados)
END
&
THEORY ListInputX IS
  List_Input(Machine(Controle_Torneio),comprar_senha)==(vv,ss);
  List_Input(Machine(Controle_Torneio),desistir_senha)==(ss);
  List_Input(Machine(Controle_Torneio),transferir_senha)==(ss,novo_vaqueiro);
  List_Input(Machine(Controle_Torneio),iniciar_rodizio)==(?);
  List_Input(Machine(Controle_Torneio),iniciar_ultimo_rodizio)==(?);
  List_Input(Machine(Controle_Torneio),chamar_para_pista)==(ss);
  List_Input(Machine(Controle_Torneio),correr_boi_classificacao)==(ss,jj);
  List_Input(Machine(Controle_Torneio),iniciar_fase_disputa)==(?);
  List_Input(Machine(Controle_Torneio),correr_boi_disputa)==(jj);
  List_Input(Machine(Controle_Torneio),iniciar_nova_rodada_disputa)==(?);
  List_Input(Machine(Controle_Torneio),finalizar_sem_vencedor)==(?);
  List_Input(Machine(Controle_Torneio),rachar_premio)==(?);
  List_Input(Machine(Controle_Torneio),declarar_campeao_unico)==(?);
  List_Input(Machine(Controle_Torneio),observar_torneio_encerrado)==(?);
  List_Input(Machine(Controle_Torneio),consultar_status_senha)==(ss);
  List_Input(Machine(Controle_Torneio),consultar_dono)==(ss);
  List_Input(Machine(Controle_Torneio),total_senhas_vendidas)==(?);
  List_Input(Machine(Controle_Torneio),consultar_bois_derrubados)==(ss)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Controle_Torneio),comprar_senha)==(?);
  List_Output(Machine(Controle_Torneio),desistir_senha)==(?);
  List_Output(Machine(Controle_Torneio),transferir_senha)==(?);
  List_Output(Machine(Controle_Torneio),iniciar_rodizio)==(?);
  List_Output(Machine(Controle_Torneio),iniciar_ultimo_rodizio)==(?);
  List_Output(Machine(Controle_Torneio),chamar_para_pista)==(?);
  List_Output(Machine(Controle_Torneio),correr_boi_classificacao)==(?);
  List_Output(Machine(Controle_Torneio),iniciar_fase_disputa)==(?);
  List_Output(Machine(Controle_Torneio),correr_boi_disputa)==(?);
  List_Output(Machine(Controle_Torneio),iniciar_nova_rodada_disputa)==(?);
  List_Output(Machine(Controle_Torneio),finalizar_sem_vencedor)==(?);
  List_Output(Machine(Controle_Torneio),rachar_premio)==(?);
  List_Output(Machine(Controle_Torneio),declarar_campeao_unico)==(?);
  List_Output(Machine(Controle_Torneio),observar_torneio_encerrado)==(?);
  List_Output(Machine(Controle_Torneio),consultar_status_senha)==(res);
  List_Output(Machine(Controle_Torneio),consultar_dono)==(res);
  List_Output(Machine(Controle_Torneio),total_senhas_vendidas)==(res);
  List_Output(Machine(Controle_Torneio),consultar_bois_derrubados)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Controle_Torneio),comprar_senha)==(comprar_senha(vv,ss));
  List_Header(Machine(Controle_Torneio),desistir_senha)==(desistir_senha(ss));
  List_Header(Machine(Controle_Torneio),transferir_senha)==(transferir_senha(ss,novo_vaqueiro));
  List_Header(Machine(Controle_Torneio),iniciar_rodizio)==(iniciar_rodizio);
  List_Header(Machine(Controle_Torneio),iniciar_ultimo_rodizio)==(iniciar_ultimo_rodizio);
  List_Header(Machine(Controle_Torneio),chamar_para_pista)==(chamar_para_pista(ss));
  List_Header(Machine(Controle_Torneio),correr_boi_classificacao)==(correr_boi_classificacao(ss,jj));
  List_Header(Machine(Controle_Torneio),iniciar_fase_disputa)==(iniciar_fase_disputa);
  List_Header(Machine(Controle_Torneio),correr_boi_disputa)==(correr_boi_disputa(jj));
  List_Header(Machine(Controle_Torneio),iniciar_nova_rodada_disputa)==(iniciar_nova_rodada_disputa);
  List_Header(Machine(Controle_Torneio),finalizar_sem_vencedor)==(finalizar_sem_vencedor);
  List_Header(Machine(Controle_Torneio),rachar_premio)==(rachar_premio);
  List_Header(Machine(Controle_Torneio),declarar_campeao_unico)==(declarar_campeao_unico);
  List_Header(Machine(Controle_Torneio),observar_torneio_encerrado)==(observar_torneio_encerrado);
  List_Header(Machine(Controle_Torneio),consultar_status_senha)==(res <-- consultar_status_senha(ss));
  List_Header(Machine(Controle_Torneio),consultar_dono)==(res <-- consultar_dono(ss));
  List_Header(Machine(Controle_Torneio),total_senhas_vendidas)==(res <-- total_senhas_vendidas);
  List_Header(Machine(Controle_Torneio),consultar_bois_derrubados)==(res <-- consultar_bois_derrubados(ss))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Controle_Torneio),comprar_senha)==(vv: VAQUEIROS & vv: NAT1 & ss: SENHAS & ss: NAT1 & ss/:dom(dono_senha) & card(dom(dono_senha))<TOTAL_SENHAS & fase_atual = classificacao & card(dom(dono_senha|>{vv}))<LIMITE_SENHAS_VAQUEIRO & ultimo_rodizio_iniciado = FALSE);
  List_Precondition(Machine(Controle_Torneio),desistir_senha)==(ss: SENHAS & ss: NAT1 & ss: dom(estado_senha) & estado_senha(ss) = na_espera & fase_atual/=encerrado & ss: ran(fila_geral));
  List_Precondition(Machine(Controle_Torneio),transferir_senha)==(novo_vaqueiro: VAQUEIROS & novo_vaqueiro: NAT1 & ss: SENHAS & ss: NAT1 & ss: dom(estado_senha) & estado_senha(ss) = na_espera & fase_atual = classificacao & card(dom(dono_senha|>{novo_vaqueiro}))<LIMITE_SENHAS_VAQUEIRO & ss: dom(bois_corridos) & bois_corridos(ss) = 0);
  List_Precondition(Machine(Controle_Torneio),iniciar_rodizio)==(fase_atual = classificacao & rodizio_atual = <> & size(fila_geral)>0 & size(fila_geral)>TAMANHO_RODIZIO & ultimo_rodizio_iniciado = FALSE);
  List_Precondition(Machine(Controle_Torneio),iniciar_ultimo_rodizio)==(fase_atual = classificacao & rodizio_atual = <> & size(fila_geral)>0 & ultimo_rodizio_iniciado = FALSE & size(fila_geral)<=TAMANHO_RODIZIO);
  List_Precondition(Machine(Controle_Torneio),chamar_para_pista)==(ss: SENHAS & ss: NAT1 & ss: dom(estado_senha) & (estado_senha(ss) = na_espera or estado_senha(ss) = classificada) & na_pista/:ran(estado_senha) & (fase_atual = classificacao & rodizio_atual/=<> & idx_correndo<=size(rodizio_atual) & ss = rodizio_atual(idx_correndo) or (fase_atual = disputa & size(fila_disputa_atual)>0 & ss = fila_disputa_atual(1))));
  List_Precondition(Machine(Controle_Torneio),correr_boi_classificacao)==(fase_atual = classificacao & rodizio_atual/=<> & idx_correndo<=size(rodizio_atual) & ss: SENHAS & ss: NAT1 & ss = rodizio_atual(idx_correndo) & jj: JULGAMENTO & estado_senha(rodizio_atual(idx_correndo)) = na_pista & rodizio_atual(idx_correndo): dom(bois_corridos));
  List_Precondition(Machine(Controle_Torneio),iniciar_fase_disputa)==(fase_atual = classificacao & rodizio_atual = <> & size(fila_geral) = 0 & size(fila_disputa_atual)>0);
  List_Precondition(Machine(Controle_Torneio),correr_boi_disputa)==(fase_atual = disputa & size(fila_disputa_atual)>0 & jj: JULGAMENTO & estado_senha(fila_disputa_atual(1)) = na_pista);
  List_Precondition(Machine(Controle_Torneio),iniciar_nova_rodada_disputa)==(fase_atual = disputa & size(fila_disputa_atual) = 0 & (size(fila_disputa_proxima)>0 or size(eliminados_nesta_rodada)>0) & size(fila_disputa_proxima)/=1 & (size(fila_disputa_proxima)>0 & #(xx,yy).(xx: dom(estado_senha) & yy: dom(estado_senha) & xx/=yy & estado_senha(xx) = classificada & estado_senha(yy) = classificada & xx: dom(dono_senha) & yy: dom(dono_senha) & dono_senha(xx)/=dono_senha(yy)) or (size(fila_disputa_proxima) = 0 & size(eliminados_nesta_rodada)>1)));
  List_Precondition(Machine(Controle_Torneio),finalizar_sem_vencedor)==(fase_atual = classificacao & rodizio_atual = <> & size(fila_geral) = 0 & ultimo_rodizio_iniciado = TRUE & size(fila_disputa_atual) = 0);
  List_Precondition(Machine(Controle_Torneio),rachar_premio)==(fase_atual = disputa & na_pista/:ran(estado_senha) & size(fila_disputa_atual) = 0 & #(xx,yy).(xx: dom(estado_senha) & yy: dom(estado_senha) & xx/=yy & estado_senha(xx) = classificada & estado_senha(yy) = classificada & xx: dom(dono_senha) & yy: dom(dono_senha) & dono_senha(xx)/=dono_senha(yy)));
  List_Precondition(Machine(Controle_Torneio),declarar_campeao_unico)==(fase_atual = disputa & na_pista/:ran(estado_senha) & size(fila_disputa_atual) = 0 & #vv.(vv: VAQUEIROS & #xx.(xx: dom(estado_senha) & estado_senha(xx) = classificada) & !yy.(yy: dom(estado_senha) & yy: dom(dono_senha) & estado_senha(yy) = classificada => dono_senha(yy) = vv)));
  List_Precondition(Machine(Controle_Torneio),observar_torneio_encerrado)==(fase_atual = encerrado);
  List_Precondition(Machine(Controle_Torneio),consultar_status_senha)==(ss: NAT1 & ss: dom(estado_senha));
  List_Precondition(Machine(Controle_Torneio),consultar_dono)==(ss: NAT1 & ss: dom(dono_senha));
  List_Precondition(Machine(Controle_Torneio),total_senhas_vendidas)==(btrue);
  List_Precondition(Machine(Controle_Torneio),consultar_bois_derrubados)==(ss: NAT1 & ss: dom(bois_corridos))
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Controle_Torneio),consultar_bois_derrubados)==(ss: NAT1 & ss: dom(bois_corridos) | res:=bois_corridos(ss));
  Expanded_List_Substitution(Machine(Controle_Torneio),total_senhas_vendidas)==(btrue | res:=card(dom(dono_senha)));
  Expanded_List_Substitution(Machine(Controle_Torneio),consultar_dono)==(ss: NAT1 & ss: dom(dono_senha) | res:=dono_senha(ss));
  Expanded_List_Substitution(Machine(Controle_Torneio),consultar_status_senha)==(ss: NAT1 & ss: dom(estado_senha) | res:=estado_senha(ss));
  Expanded_List_Substitution(Machine(Controle_Torneio),observar_torneio_encerrado)==(fase_atual = encerrado | skip);
  Expanded_List_Substitution(Machine(Controle_Torneio),declarar_campeao_unico)==(fase_atual = disputa & na_pista/:ran(estado_senha) & size(fila_disputa_atual) = 0 & #vv.(vv: VAQUEIROS & #xx.(xx: dom(estado_senha) & estado_senha(xx) = classificada) & !yy.(yy: dom(estado_senha) & yy: dom(dono_senha) & estado_senha(yy) = classificada => dono_senha(yy) = vv)) & btrue | fase_atual:=encerrado || estado_senha:=estado_senha<+dom(estado_senha|>{classificada})*{campea});
  Expanded_List_Substitution(Machine(Controle_Torneio),rachar_premio)==(fase_atual = disputa & na_pista/:ran(estado_senha) & size(fila_disputa_atual) = 0 & #(xx,yy).(xx: dom(estado_senha) & yy: dom(estado_senha) & xx/=yy & estado_senha(xx) = classificada & estado_senha(yy) = classificada & xx: dom(dono_senha) & yy: dom(dono_senha) & dono_senha(xx)/=dono_senha(yy)) & btrue | fase_atual:=encerrado || estado_senha:=estado_senha<+dom(estado_senha|>{classificada})*{campea});
  Expanded_List_Substitution(Machine(Controle_Torneio),finalizar_sem_vencedor)==(fase_atual = classificacao & rodizio_atual = <> & size(fila_geral) = 0 & ultimo_rodizio_iniciado = TRUE & size(fila_disputa_atual) = 0 | fase_atual:=encerrado);
  Expanded_List_Substitution(Machine(Controle_Torneio),iniciar_nova_rodada_disputa)==(fase_atual = disputa & size(fila_disputa_atual) = 0 & (size(fila_disputa_proxima)>0 or size(eliminados_nesta_rodada)>0) & size(fila_disputa_proxima)/=1 & (size(fila_disputa_proxima)>0 & #(xx,yy).(xx: dom(estado_senha) & yy: dom(estado_senha) & xx/=yy & estado_senha(xx) = classificada & estado_senha(yy) = classificada & xx: dom(dono_senha) & yy: dom(dono_senha) & dono_senha(xx)/=dono_senha(yy)) or (size(fila_disputa_proxima) = 0 & size(eliminados_nesta_rodada)>1)) & size(fila_disputa_atual) = 0 & (size(fila_disputa_proxima)>0 or size(eliminados_nesta_rodada)>0) | size(fila_disputa_proxima)>0 ==> fila_disputa_atual,fila_disputa_proxima,eliminados_nesta_rodada:=fila_disputa_proxima,<>,<> [] not(size(fila_disputa_proxima)>0) ==> fila_disputa_atual,estado_senha,eliminados_nesta_rodada:=eliminados_nesta_rodada,estado_senha<+ran(eliminados_nesta_rodada)*{classificada},<>);
  Expanded_List_Substitution(Machine(Controle_Torneio),correr_boi_disputa)==(fase_atual = disputa & size(fila_disputa_atual)>0 & jj: JULGAMENTO & estado_senha(fila_disputa_atual(1)) = na_pista & size(fila_disputa_atual)>0 & jj: JULGAMENTO | @ss.(ss = fila_disputa_atual(1) ==> (jj = zero_boi ==> estado_senha,fila_disputa_atual,eliminados_nesta_rodada:=estado_senha<+{ss|->eliminada},fila_disputa_atual\|/1,eliminados_nesta_rodada<-ss [] not(jj = zero_boi) ==> (jj = valeu_boi ==> estado_senha,fila_disputa_atual,fila_disputa_proxima:=estado_senha<+{ss|->classificada},fila_disputa_atual\|/1,fila_disputa_proxima<-ss [] not(jj = valeu_boi) ==> estado_senha,fila_disputa_atual:=estado_senha<+{ss|->classificada},fila_disputa_atual\|/1<-ss))));
  Expanded_List_Substitution(Machine(Controle_Torneio),iniciar_fase_disputa)==(fase_atual = classificacao & rodizio_atual = <> & size(fila_geral) = 0 & size(fila_disputa_atual)>0 | fase_atual:=disputa);
  Expanded_List_Substitution(Machine(Controle_Torneio),correr_boi_classificacao)==(fase_atual = classificacao & rodizio_atual/=<> & idx_correndo<=size(rodizio_atual) & ss: SENHAS & ss: NAT1 & ss = rodizio_atual(idx_correndo) & jj: JULGAMENTO & estado_senha(rodizio_atual(idx_correndo)) = na_pista & rodizio_atual(idx_correndo): dom(bois_corridos) & ss: NAT1 & ss: dom(estado_senha) & jj: JULGAMENTO | jj = zero_boi ==> estado_senha:=estado_senha<+{ss|->eliminada} [] not(jj = zero_boi) ==> (jj = valeu_boi ==> (bois_corridos:=bois_corridos<+{ss|->bois_corridos(ss)+1} || (bois_corridos(ss)+1 = BOIS_PARA_CLASSIFICAR ==> (estado_senha:=estado_senha<+{ss|->classificada} || @(f1,f2).(f1: iseq(NAT1) & f2: iseq(NAT1) & fila_disputa_atual = f1^f2 & !xx.(xx: ran(f1) => xx<ss) & !yy.(yy: ran(f2) => yy>ss) ==> fila_disputa_atual:=f1^[ss]^f2)) [] not(bois_corridos(ss)+1 = BOIS_PARA_CLASSIFICAR) ==> estado_senha:=estado_senha<+{ss|->na_espera})) [] not(jj = valeu_boi) ==> estado_senha:=estado_senha<+{ss|->na_espera}) || (jj = zero_boi or (jj = valeu_boi & bois_corridos(ss)+1 = BOIS_PARA_CLASSIFICAR) ==> @novo_rodizio.(novo_rodizio = rodizio_atual/|\idx_correndo-1^(rodizio_atual\|/idx_correndo) ==> (novo_rodizio = <> ==> rodizio_atual,idx_correndo:=<>,1 [] not(novo_rodizio = <>) ==> (idx_correndo>size(novo_rodizio) ==> idx_correndo,rodizio_atual:=1,novo_rodizio [] not(idx_correndo>size(novo_rodizio)) ==> rodizio_atual:=novo_rodizio))) [] not(jj = zero_boi or (jj = valeu_boi & bois_corridos(ss)+1 = BOIS_PARA_CLASSIFICAR)) ==> (idx_correndo<size(rodizio_atual) ==> idx_correndo:=idx_correndo+1 [] not(idx_correndo<size(rodizio_atual)) ==> idx_correndo:=1)));
  Expanded_List_Substitution(Machine(Controle_Torneio),chamar_para_pista)==(ss: SENHAS & ss: NAT1 & ss: dom(estado_senha) & (estado_senha(ss) = na_espera or estado_senha(ss) = classificada) & na_pista/:ran(estado_senha) & (fase_atual = classificacao & rodizio_atual/=<> & idx_correndo<=size(rodizio_atual) & ss = rodizio_atual(idx_correndo) or (fase_atual = disputa & size(fila_disputa_atual)>0 & ss = fila_disputa_atual(1))) & ss: SENHAS & ss: NAT1 & ss: dom(estado_senha) & na_pista: STATUS_SENHA | estado_senha:=estado_senha<+{ss|->na_pista});
  Expanded_List_Substitution(Machine(Controle_Torneio),iniciar_ultimo_rodizio)==(fase_atual = classificacao & rodizio_atual = <> & size(fila_geral)>0 & ultimo_rodizio_iniciado = FALSE & size(fila_geral)<=TAMANHO_RODIZIO & size(fila_geral)>0 | size(fila_geral)>TAMANHO_RODIZIO ==> rodizio_atual,fila_geral:=fila_geral/|\TAMANHO_RODIZIO,fila_geral\|/TAMANHO_RODIZIO [] not(size(fila_geral)>TAMANHO_RODIZIO) ==> rodizio_atual,fila_geral:=fila_geral,<> || idx_correndo:=1 || ultimo_rodizio_iniciado:=TRUE);
  Expanded_List_Substitution(Machine(Controle_Torneio),iniciar_rodizio)==(fase_atual = classificacao & rodizio_atual = <> & size(fila_geral)>0 & size(fila_geral)>TAMANHO_RODIZIO & ultimo_rodizio_iniciado = FALSE & size(fila_geral)>0 | size(fila_geral)>TAMANHO_RODIZIO ==> rodizio_atual,fila_geral:=fila_geral/|\TAMANHO_RODIZIO,fila_geral\|/TAMANHO_RODIZIO [] not(size(fila_geral)>TAMANHO_RODIZIO) ==> rodizio_atual,fila_geral:=fila_geral,<> || idx_correndo:=1 || torneio_iniciado:=TRUE);
  Expanded_List_Substitution(Machine(Controle_Torneio),transferir_senha)==(novo_vaqueiro: VAQUEIROS & novo_vaqueiro: NAT1 & ss: SENHAS & ss: NAT1 & ss: dom(estado_senha) & estado_senha(ss) = na_espera & fase_atual = classificacao & card(dom(dono_senha|>{novo_vaqueiro}))<LIMITE_SENHAS_VAQUEIRO & ss: dom(bois_corridos) & bois_corridos(ss) = 0 & novo_vaqueiro: VAQUEIROS & novo_vaqueiro: NAT1 & ss: SENHAS & ss: NAT1 & ss: dom(dono_senha) & card(dom(dono_senha|>{novo_vaqueiro}))<LIMITE_SENHAS_VAQUEIRO & ss: dom(bois_corridos) & bois_corridos(ss) = 0 | dono_senha:=dono_senha<+{ss|->novo_vaqueiro});
  Expanded_List_Substitution(Machine(Controle_Torneio),desistir_senha)==(ss: SENHAS & ss: NAT1 & ss: dom(estado_senha) & estado_senha(ss) = na_espera & fase_atual/=encerrado & ss: ran(fila_geral) & ss: SENHAS & ss: NAT1 & ss: dom(dono_senha) & ss: ran(fila_geral) | dono_senha,estado_senha,bois_corridos:={ss}<<|dono_senha,{ss}<<|estado_senha,{ss}<<|bois_corridos || @(f1,f2).(f1: iseq(NAT1) & f2: iseq(NAT1) & fila_geral = f1^[ss]^f2 ==> fila_geral:=f1^f2));
  Expanded_List_Substitution(Machine(Controle_Torneio),comprar_senha)==(vv: VAQUEIROS & vv: NAT1 & ss: SENHAS & ss: NAT1 & ss/:dom(dono_senha) & card(dom(dono_senha))<TOTAL_SENHAS & fase_atual = classificacao & card(dom(dono_senha|>{vv}))<LIMITE_SENHAS_VAQUEIRO & ultimo_rodizio_iniciado = FALSE | rodizio_atual/=<> ==> (vv: VAQUEIROS & vv: NAT1 & ss: SENHAS & ss: NAT1 & torneio_iniciado: BOOL & last(rodizio_atual): NAT & ss/:dom(dono_senha) & card(dom(dono_senha))<TOTAL_SENHAS & card(dom(dono_senha|>{vv}))<LIMITE_SENHAS_VAQUEIRO | dono_senha,estado_senha,bois_corridos:=dono_senha<+{ss|->vv},estado_senha<+{ss|->na_espera},bois_corridos<+{ss|->0} || (torneio_iniciado = FALSE ==> @(f1,f2).(f1: iseq(NAT1) & f2: iseq(NAT1) & fila_geral = f1^f2 & !xx.(xx: ran(f1) => xx<ss) & !yy.(yy: ran(f2) => yy>ss) ==> fila_geral:=f1^[ss]^f2) [] not(torneio_iniciado = FALSE) ==> (ss<last(rodizio_atual) ==> fila_geral:=fila_geral<-ss [] not(ss<last(rodizio_atual)) ==> @(f1,f2).(f1: iseq(NAT1) & f2: iseq(NAT1) & fila_geral = f1^f2 & !xx.(xx: ran(f1) => xx<ss & xx>last(rodizio_atual)) & (f2/=<> => first(f2)>ss or first(f2)<=last(rodizio_atual)) ==> fila_geral:=f1^[ss]^f2)))) [] not(rodizio_atual/=<>) ==> (vv: VAQUEIROS & vv: NAT1 & ss: SENHAS & ss: NAT1 & torneio_iniciado: BOOL & 0: NAT & ss/:dom(dono_senha) & card(dom(dono_senha))<TOTAL_SENHAS & card(dom(dono_senha|>{vv}))<LIMITE_SENHAS_VAQUEIRO | dono_senha,estado_senha,bois_corridos:=dono_senha<+{ss|->vv},estado_senha<+{ss|->na_espera},bois_corridos<+{ss|->0} || (torneio_iniciado = FALSE ==> @(f1,f2).(f1: iseq(NAT1) & f2: iseq(NAT1) & fila_geral = f1^f2 & !xx.(xx: ran(f1) => xx<ss) & !yy.(yy: ran(f2) => yy>ss) ==> fila_geral:=f1^[ss]^f2) [] not(torneio_iniciado = FALSE) ==> (ss<0 ==> fila_geral:=fila_geral<-ss [] not(ss<0) ==> @(f1,f2).(f1: iseq(NAT1) & f2: iseq(NAT1) & fila_geral = f1^f2 & !xx.(xx: ran(f1) => xx<ss & xx>0) & (f2/=<> => first(f2)>ss or first(f2)<=0) ==> fila_geral:=f1^[ss]^f2)))));
  List_Substitution(Machine(Controle_Torneio),comprar_senha)==(IF rodizio_atual/=<> THEN cadastrar_senha(vv,ss,torneio_iniciado,last(rodizio_atual)) ELSE cadastrar_senha(vv,ss,torneio_iniciado,0) END);
  List_Substitution(Machine(Controle_Torneio),desistir_senha)==(cancelar_registro_senha(ss));
  List_Substitution(Machine(Controle_Torneio),transferir_senha)==(atualizar_dono(ss,novo_vaqueiro));
  List_Substitution(Machine(Controle_Torneio),iniciar_rodizio)==(rodizio_atual <-- extrair_lote_rodizio || idx_correndo:=1 || torneio_iniciado:=TRUE);
  List_Substitution(Machine(Controle_Torneio),iniciar_ultimo_rodizio)==(rodizio_atual <-- extrair_lote_rodizio || idx_correndo:=1 || ultimo_rodizio_iniciado:=TRUE);
  List_Substitution(Machine(Controle_Torneio),chamar_para_pista)==(atualizar_status(ss,na_pista));
  List_Substitution(Machine(Controle_Torneio),correr_boi_classificacao)==(registrar_julgamento_classificacao(ss,jj) || IF jj = zero_boi or (jj = valeu_boi & bois_corridos(ss)+1 = BOIS_PARA_CLASSIFICAR) THEN ANY novo_rodizio WHERE novo_rodizio = rodizio_atual/|\idx_correndo-1^(rodizio_atual\|/idx_correndo) THEN IF novo_rodizio = <> THEN rodizio_atual:=<> || idx_correndo:=1 ELSIF idx_correndo>size(novo_rodizio) THEN idx_correndo:=1 || rodizio_atual:=novo_rodizio ELSE rodizio_atual:=novo_rodizio END END ELSE IF idx_correndo<size(rodizio_atual) THEN idx_correndo:=idx_correndo+1 ELSE idx_correndo:=1 END END);
  List_Substitution(Machine(Controle_Torneio),iniciar_fase_disputa)==(fase_atual:=disputa);
  List_Substitution(Machine(Controle_Torneio),correr_boi_disputa)==(processar_resultado_disputa(jj));
  List_Substitution(Machine(Controle_Torneio),iniciar_nova_rodada_disputa)==(avancar_rodada_disputa);
  List_Substitution(Machine(Controle_Torneio),finalizar_sem_vencedor)==(fase_atual:=encerrado);
  List_Substitution(Machine(Controle_Torneio),rachar_premio)==(fase_atual:=encerrado || finalizar_torneio);
  List_Substitution(Machine(Controle_Torneio),declarar_campeao_unico)==(fase_atual:=encerrado || finalizar_torneio);
  List_Substitution(Machine(Controle_Torneio),observar_torneio_encerrado)==(skip);
  List_Substitution(Machine(Controle_Torneio),consultar_status_senha)==(res:=estado_senha(ss));
  List_Substitution(Machine(Controle_Torneio),consultar_dono)==(res:=dono_senha(ss));
  List_Substitution(Machine(Controle_Torneio),total_senhas_vendidas)==(res:=card(dom(dono_senha)));
  List_Substitution(Machine(Controle_Torneio),consultar_bois_derrubados)==(res:=bois_corridos(ss))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Controle_Torneio))==(?);
  Inherited_List_Constants(Machine(Controle_Torneio))==(?);
  List_Constants(Machine(Controle_Torneio))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Controle_Torneio),JULGAMENTO)==({valeu_boi,zero_boi,retorno});
  Context_List_Enumerated(Machine(Controle_Torneio))==(FASES,STATUS_SENHA,JULGAMENTO);
  Context_List_Defered(Machine(Controle_Torneio))==(?);
  Context_List_Sets(Machine(Controle_Torneio))==(FASES,STATUS_SENHA,JULGAMENTO);
  List_Valuable_Sets(Machine(Controle_Torneio))==(?);
  Inherited_List_Enumerated(Machine(Controle_Torneio))==(?);
  Inherited_List_Defered(Machine(Controle_Torneio))==(?);
  Inherited_List_Sets(Machine(Controle_Torneio))==(?);
  List_Enumerated(Machine(Controle_Torneio))==(?);
  List_Defered(Machine(Controle_Torneio))==(?);
  List_Sets(Machine(Controle_Torneio))==(?);
  Set_Definition(Machine(Controle_Torneio),STATUS_SENHA)==({na_espera,na_pista,classificada,eliminada,campea});
  Set_Definition(Machine(Controle_Torneio),FASES)==({classificacao,disputa,encerrado})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Controle_Torneio))==(?);
  Expanded_List_HiddenConstants(Machine(Controle_Torneio))==(?);
  List_HiddenConstants(Machine(Controle_Torneio))==(?);
  External_List_HiddenConstants(Machine(Controle_Torneio))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Controle_Torneio))==(btrue);
  Context_List_Properties(Machine(Controle_Torneio))==(TOTAL_SENHAS: NAT1 & TOTAL_SENHAS = 20 & LIMITE_SENHAS_VAQUEIRO: NAT1 & LIMITE_SENHAS_VAQUEIRO = max({1,TOTAL_SENHAS/5}) & BOIS_PARA_CLASSIFICAR: NAT1 & BOIS_PARA_CLASSIFICAR = 2 & TAMANHO_RODIZIO: NAT1 & TAMANHO_RODIZIO = 4 & VAQUEIROS <: NAT1 & VAQUEIROS = 1..3 & SENHAS <: NAT1 & SENHAS = 1..TOTAL_SENHAS & FASES: FIN(INTEGER) & not(FASES = {}) & STATUS_SENHA: FIN(INTEGER) & not(STATUS_SENHA = {}) & JULGAMENTO: FIN(INTEGER) & not(JULGAMENTO = {}));
  Inherited_List_Properties(Machine(Controle_Torneio))==(btrue);
  List_Properties(Machine(Controle_Torneio))==(btrue)
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Controle_Torneio),Machine(Contexto_Vaquejada))==(?);
  Seen_Context_List_Enumerated(Machine(Controle_Torneio))==(?);
  Seen_Context_List_Invariant(Machine(Controle_Torneio))==(btrue);
  Seen_Context_List_Assertions(Machine(Controle_Torneio))==(btrue);
  Seen_Context_List_Properties(Machine(Controle_Torneio))==(btrue);
  Seen_List_Constraints(Machine(Controle_Torneio))==(btrue);
  Seen_List_Operations(Machine(Controle_Torneio),Machine(Contexto_Vaquejada))==(?);
  Seen_Expanded_List_Invariant(Machine(Controle_Torneio),Machine(Contexto_Vaquejada))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Controle_Torneio),comprar_senha)==(?);
  List_ANY_Var(Machine(Controle_Torneio),desistir_senha)==(?);
  List_ANY_Var(Machine(Controle_Torneio),transferir_senha)==(?);
  List_ANY_Var(Machine(Controle_Torneio),iniciar_rodizio)==(?);
  List_ANY_Var(Machine(Controle_Torneio),iniciar_ultimo_rodizio)==(?);
  List_ANY_Var(Machine(Controle_Torneio),chamar_para_pista)==(?);
  List_ANY_Var(Machine(Controle_Torneio),correr_boi_classificacao)==(Var(novo_rodizio) == SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));
  List_ANY_Var(Machine(Controle_Torneio),iniciar_fase_disputa)==(?);
  List_ANY_Var(Machine(Controle_Torneio),correr_boi_disputa)==(?);
  List_ANY_Var(Machine(Controle_Torneio),iniciar_nova_rodada_disputa)==(?);
  List_ANY_Var(Machine(Controle_Torneio),finalizar_sem_vencedor)==(?);
  List_ANY_Var(Machine(Controle_Torneio),rachar_premio)==(?);
  List_ANY_Var(Machine(Controle_Torneio),declarar_campeao_unico)==(?);
  List_ANY_Var(Machine(Controle_Torneio),observar_torneio_encerrado)==(?);
  List_ANY_Var(Machine(Controle_Torneio),consultar_status_senha)==(?);
  List_ANY_Var(Machine(Controle_Torneio),consultar_dono)==(?);
  List_ANY_Var(Machine(Controle_Torneio),total_senhas_vendidas)==(?);
  List_ANY_Var(Machine(Controle_Torneio),consultar_bois_derrubados)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Controle_Torneio)) == (? | ? | ultimo_rodizio_iniciado,torneio_iniciado,idx_correndo,rodizio_atual,fase_atual | eliminados_nesta_rodada,fila_disputa_proxima,fila_disputa_atual,fila_geral,bois_corridos,estado_senha,dono_senha | comprar_senha,desistir_senha,transferir_senha,iniciar_rodizio,iniciar_ultimo_rodizio,chamar_para_pista,correr_boi_classificacao,iniciar_fase_disputa,correr_boi_disputa,iniciar_nova_rodada_disputa,finalizar_sem_vencedor,rachar_premio,declarar_campeao_unico,observar_torneio_encerrado,consultar_status_senha,consultar_dono,total_senhas_vendidas,consultar_bois_derrubados | ? | seen(Machine(Contexto_Vaquejada)),included(Machine(Gerenciador_Senhas)) | ? | Controle_Torneio);
  List_Of_HiddenCst_Ids(Machine(Controle_Torneio)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Controle_Torneio)) == (?);
  List_Of_VisibleVar_Ids(Machine(Controle_Torneio)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Controle_Torneio)) == (seen(Machine(Contexto_Vaquejada)): (TOTAL_SENHAS,LIMITE_SENHAS_VAQUEIRO,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS,TAMANHO_RODIZIO,FASES,STATUS_SENHA,JULGAMENTO,classificacao,disputa,encerrado,na_espera,na_pista,classificada,eliminada,campea,valeu_boi,zero_boi,retorno | ? | ? | ? | ? | ? | ? | ? | ?));
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
  Variables(Machine(Controle_Torneio)) == (Type(dono_senha) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(estado_senha) == Mvl(SetOf(btype(INTEGER,?,?)*etype(STATUS_SENHA,?,?)));Type(bois_corridos) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(fila_geral) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(fila_disputa_atual) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(fila_disputa_proxima) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(eliminados_nesta_rodada) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(ultimo_rodizio_iniciado) == Mvl(btype(BOOL,?,?));Type(torneio_iniciado) == Mvl(btype(BOOL,?,?));Type(idx_correndo) == Mvl(btype(INTEGER,?,?));Type(rodizio_atual) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(fase_atual) == Mvl(etype(FASES,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Controle_Torneio)) == (Type(consultar_bois_derrubados) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(total_senhas_vendidas) == Cst(btype(INTEGER,?,?),No_type);Type(consultar_dono) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(consultar_status_senha) == Cst(etype(STATUS_SENHA,?,?),btype(INTEGER,?,?));Type(observar_torneio_encerrado) == Cst(No_type,No_type);Type(declarar_campeao_unico) == Cst(No_type,No_type);Type(rachar_premio) == Cst(No_type,No_type);Type(finalizar_sem_vencedor) == Cst(No_type,No_type);Type(iniciar_nova_rodada_disputa) == Cst(No_type,No_type);Type(correr_boi_disputa) == Cst(No_type,etype(JULGAMENTO,?,?));Type(iniciar_fase_disputa) == Cst(No_type,No_type);Type(correr_boi_classificacao) == Cst(No_type,btype(INTEGER,?,?)*etype(JULGAMENTO,?,?));Type(chamar_para_pista) == Cst(No_type,btype(INTEGER,?,?));Type(iniciar_ultimo_rodizio) == Cst(No_type,No_type);Type(iniciar_rodizio) == Cst(No_type,No_type);Type(transferir_senha) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(desistir_senha) == Cst(No_type,btype(INTEGER,?,?));Type(comprar_senha) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?)));
  Observers(Machine(Controle_Torneio)) == (Type(consultar_bois_derrubados) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(total_senhas_vendidas) == Cst(btype(INTEGER,?,?),No_type);Type(consultar_dono) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(consultar_status_senha) == Cst(etype(STATUS_SENHA,?,?),btype(INTEGER,?,?));Type(observar_torneio_encerrado) == Cst(No_type,No_type))
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
