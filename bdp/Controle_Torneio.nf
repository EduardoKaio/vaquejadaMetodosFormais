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
  Local_List_Variables(Machine(Controle_Torneio))==(fase_atual);
  List_Variables(Machine(Controle_Torneio))==(fase_atual,categoria_vaqueiro,bois_corridos,estado_senha,dono_senha);
  External_List_Variables(Machine(Controle_Torneio))==(fase_atual,categoria_vaqueiro,bois_corridos,estado_senha,dono_senha)
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
  Expanded_List_Invariant(Machine(Controle_Torneio))==(dono_senha: SENHAS +-> VAQUEIROS & estado_senha: SENHAS +-> STATUS_SENHA & bois_corridos: SENHAS +-> NAT & categoria_vaqueiro: VAQUEIROS +-> CATEGORIAS & dom(estado_senha) = dom(dono_senha) & dom(bois_corridos) = dom(dono_senha) & ran(dono_senha) <: dom(categoria_vaqueiro) & card(dom(dono_senha))<=LIMITE_SENHAS & !ss.(ss: dom(estado_senha) & estado_senha(ss) = classificada => bois_corridos(ss) = BOIS_PARA_CLASSIFICAR));
  Context_List_Invariant(Machine(Controle_Torneio))==(btrue);
  List_Invariant(Machine(Controle_Torneio))==(fase_atual: FASES & card(estado_senha|>{na_pista})<=1 & (campea: ran(estado_senha) => fase_atual = encerrado))
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
  Expanded_List_Initialisation(Machine(Controle_Torneio))==(dono_senha,estado_senha,bois_corridos,categoria_vaqueiro:={},{},{},{};fase_atual:=classificacao);
  Context_List_Initialisation(Machine(Controle_Torneio))==(skip);
  List_Initialisation(Machine(Controle_Torneio))==(fase_atual:=classificacao)
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
  Internal_List_Operations(Machine(Controle_Torneio))==(comprar_senha,desistir_senha,transferir_senha,chamar_para_pista,correr_boi_classificacao,iniciar_disputa,correr_boi_disputa,rachar_premio,declarar_campeao_unico,consultar_status_senha,consultar_dono,consultar_categoria_vaqueiro,total_senhas_vendidas,consultar_bois_corridos);
  List_Operations(Machine(Controle_Torneio))==(comprar_senha,desistir_senha,transferir_senha,chamar_para_pista,correr_boi_classificacao,iniciar_disputa,correr_boi_disputa,rachar_premio,declarar_campeao_unico,consultar_status_senha,consultar_dono,consultar_categoria_vaqueiro,total_senhas_vendidas,consultar_bois_corridos)
END
&
THEORY ListInputX IS
  List_Input(Machine(Controle_Torneio),comprar_senha)==(vv,ss,cat);
  List_Input(Machine(Controle_Torneio),desistir_senha)==(ss);
  List_Input(Machine(Controle_Torneio),transferir_senha)==(ss,novo_vaqueiro);
  List_Input(Machine(Controle_Torneio),chamar_para_pista)==(ss);
  List_Input(Machine(Controle_Torneio),correr_boi_classificacao)==(ss,julgamento);
  List_Input(Machine(Controle_Torneio),iniciar_disputa)==(?);
  List_Input(Machine(Controle_Torneio),correr_boi_disputa)==(ss,julgamento);
  List_Input(Machine(Controle_Torneio),rachar_premio)==(?);
  List_Input(Machine(Controle_Torneio),declarar_campeao_unico)==(?);
  List_Input(Machine(Controle_Torneio),consultar_status_senha)==(ss);
  List_Input(Machine(Controle_Torneio),consultar_dono)==(ss);
  List_Input(Machine(Controle_Torneio),consultar_categoria_vaqueiro)==(vv);
  List_Input(Machine(Controle_Torneio),total_senhas_vendidas)==(?);
  List_Input(Machine(Controle_Torneio),consultar_bois_corridos)==(ss)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Controle_Torneio),comprar_senha)==(?);
  List_Output(Machine(Controle_Torneio),desistir_senha)==(?);
  List_Output(Machine(Controle_Torneio),transferir_senha)==(?);
  List_Output(Machine(Controle_Torneio),chamar_para_pista)==(?);
  List_Output(Machine(Controle_Torneio),correr_boi_classificacao)==(?);
  List_Output(Machine(Controle_Torneio),iniciar_disputa)==(?);
  List_Output(Machine(Controle_Torneio),correr_boi_disputa)==(?);
  List_Output(Machine(Controle_Torneio),rachar_premio)==(?);
  List_Output(Machine(Controle_Torneio),declarar_campeao_unico)==(?);
  List_Output(Machine(Controle_Torneio),consultar_status_senha)==(res);
  List_Output(Machine(Controle_Torneio),consultar_dono)==(res);
  List_Output(Machine(Controle_Torneio),consultar_categoria_vaqueiro)==(res);
  List_Output(Machine(Controle_Torneio),total_senhas_vendidas)==(res);
  List_Output(Machine(Controle_Torneio),consultar_bois_corridos)==(res)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Controle_Torneio),comprar_senha)==(comprar_senha(vv,ss,cat));
  List_Header(Machine(Controle_Torneio),desistir_senha)==(desistir_senha(ss));
  List_Header(Machine(Controle_Torneio),transferir_senha)==(transferir_senha(ss,novo_vaqueiro));
  List_Header(Machine(Controle_Torneio),chamar_para_pista)==(chamar_para_pista(ss));
  List_Header(Machine(Controle_Torneio),correr_boi_classificacao)==(correr_boi_classificacao(ss,julgamento));
  List_Header(Machine(Controle_Torneio),iniciar_disputa)==(iniciar_disputa);
  List_Header(Machine(Controle_Torneio),correr_boi_disputa)==(correr_boi_disputa(ss,julgamento));
  List_Header(Machine(Controle_Torneio),rachar_premio)==(rachar_premio);
  List_Header(Machine(Controle_Torneio),declarar_campeao_unico)==(declarar_campeao_unico);
  List_Header(Machine(Controle_Torneio),consultar_status_senha)==(res <-- consultar_status_senha(ss));
  List_Header(Machine(Controle_Torneio),consultar_dono)==(res <-- consultar_dono(ss));
  List_Header(Machine(Controle_Torneio),consultar_categoria_vaqueiro)==(res <-- consultar_categoria_vaqueiro(vv));
  List_Header(Machine(Controle_Torneio),total_senhas_vendidas)==(res <-- total_senhas_vendidas);
  List_Header(Machine(Controle_Torneio),consultar_bois_corridos)==(res <-- consultar_bois_corridos(ss))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Controle_Torneio),comprar_senha)==(vv: NAT1 & ss: NAT1 & cat: CATEGORIAS & ss/:dom(dono_senha) & card(dom(dono_senha))<LIMITE_SENHAS & fase_atual = classificacao & (vv: dom(categoria_vaqueiro) => categoria_vaqueiro(vv) = cat));
  List_Precondition(Machine(Controle_Torneio),desistir_senha)==(ss: NAT1 & ss: dom(estado_senha) & estado_senha(ss) = na_espera & fase_atual/=encerrado);
  List_Precondition(Machine(Controle_Torneio),transferir_senha)==(ss: NAT1 & novo_vaqueiro: NAT1 & ss: dom(estado_senha) & estado_senha(ss) = na_espera & fase_atual/=encerrado & (novo_vaqueiro: dom(categoria_vaqueiro) => categoria_vaqueiro(novo_vaqueiro) = categoria_vaqueiro(dono_senha(ss))));
  List_Precondition(Machine(Controle_Torneio),chamar_para_pista)==(ss: NAT1 & ss: dom(estado_senha) & estado_senha(ss) = na_espera & card(estado_senha|>{na_pista}) = 0);
  List_Precondition(Machine(Controle_Torneio),correr_boi_classificacao)==(ss: NAT1 & fase_atual = classificacao & ss: dom(estado_senha) & estado_senha(ss) = na_pista & julgamento: JULGAMENTO);
  List_Precondition(Machine(Controle_Torneio),iniciar_disputa)==(fase_atual = classificacao & card(estado_senha|>{na_pista}) = 0 & card(estado_senha|>{na_espera}) = 0);
  List_Precondition(Machine(Controle_Torneio),correr_boi_disputa)==(ss: NAT1 & fase_atual = disputa & ss: dom(estado_senha) & estado_senha(ss) = na_pista & julgamento: JULGAMENTO);
  List_Precondition(Machine(Controle_Torneio),rachar_premio)==(fase_atual = disputa & card(estado_senha|>{na_pista}) = 0 & card(estado_senha|>{na_espera})>=2);
  List_Precondition(Machine(Controle_Torneio),declarar_campeao_unico)==(fase_atual = disputa & card(estado_senha|>{na_pista}) = 0 & card(estado_senha|>{na_espera}) = 1);
  List_Precondition(Machine(Controle_Torneio),consultar_status_senha)==(ss: NAT1 & ss: dom(estado_senha));
  List_Precondition(Machine(Controle_Torneio),consultar_dono)==(ss: NAT1 & ss: dom(dono_senha));
  List_Precondition(Machine(Controle_Torneio),consultar_categoria_vaqueiro)==(vv: NAT1 & vv: dom(categoria_vaqueiro));
  List_Precondition(Machine(Controle_Torneio),total_senhas_vendidas)==(btrue);
  List_Precondition(Machine(Controle_Torneio),consultar_bois_corridos)==(ss: NAT1 & ss: dom(bois_corridos))
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Controle_Torneio),consultar_bois_corridos)==(ss: NAT1 & ss: dom(bois_corridos) | res:=bois_corridos(ss));
  Expanded_List_Substitution(Machine(Controle_Torneio),total_senhas_vendidas)==(btrue | res:=card(dom(dono_senha)));
  Expanded_List_Substitution(Machine(Controle_Torneio),consultar_categoria_vaqueiro)==(vv: NAT1 & vv: dom(categoria_vaqueiro) | res:=categoria_vaqueiro(vv));
  Expanded_List_Substitution(Machine(Controle_Torneio),consultar_dono)==(ss: NAT1 & ss: dom(dono_senha) | res:=dono_senha(ss));
  Expanded_List_Substitution(Machine(Controle_Torneio),consultar_status_senha)==(ss: NAT1 & ss: dom(estado_senha) | res:=estado_senha(ss));
  Expanded_List_Substitution(Machine(Controle_Torneio),declarar_campeao_unico)==(fase_atual = disputa & card(estado_senha|>{na_pista}) = 0 & card(estado_senha|>{na_espera}) = 1 & btrue | fase_atual:=encerrado || estado_senha:=estado_senha<+dom(estado_senha|>{na_espera})*{campea});
  Expanded_List_Substitution(Machine(Controle_Torneio),rachar_premio)==(fase_atual = disputa & card(estado_senha|>{na_pista}) = 0 & card(estado_senha|>{na_espera})>=2 & btrue | fase_atual:=encerrado || estado_senha:=estado_senha<+dom(estado_senha|>{na_espera})*{campea});
  Expanded_List_Substitution(Machine(Controle_Torneio),correr_boi_disputa)==(ss: NAT1 & fase_atual = disputa & ss: dom(estado_senha) & estado_senha(ss) = na_pista & julgamento: JULGAMENTO | julgamento = zero_boi ==> (ss: NAT1 & ss: dom(estado_senha) & eliminada: STATUS_SENHA | estado_senha:=estado_senha<+{ss|->eliminada}) [] not(julgamento = zero_boi) ==> (julgamento = retorno ==> (ss: NAT1 & ss: dom(estado_senha) & na_espera: STATUS_SENHA | estado_senha:=estado_senha<+{ss|->na_espera}) [] not(julgamento = retorno) ==> (ss: NAT1 & ss: dom(estado_senha) & na_espera: STATUS_SENHA | estado_senha:=estado_senha<+{ss|->na_espera})));
  Expanded_List_Substitution(Machine(Controle_Torneio),iniciar_disputa)==(fase_atual = classificacao & card(estado_senha|>{na_pista}) = 0 & card(estado_senha|>{na_espera}) = 0 & btrue | fase_atual:=disputa || estado_senha:=estado_senha<+dom(estado_senha|>{classificada})*{na_espera});
  Expanded_List_Substitution(Machine(Controle_Torneio),correr_boi_classificacao)==(ss: NAT1 & fase_atual = classificacao & ss: dom(estado_senha) & estado_senha(ss) = na_pista & julgamento: JULGAMENTO | julgamento = zero_boi ==> (ss: NAT1 & ss: dom(estado_senha) & eliminada: STATUS_SENHA | estado_senha:=estado_senha<+{ss|->eliminada}) [] not(julgamento = zero_boi) ==> (julgamento = retorno ==> (ss: NAT1 & ss: dom(estado_senha) & na_espera: STATUS_SENHA | estado_senha:=estado_senha<+{ss|->na_espera}) [] not(julgamento = retorno) ==> (bois_corridos(ss)+1 = BOIS_PARA_CLASSIFICAR ==> (ss: NAT1 & ss: dom(estado_senha) & ss: dom(bois_corridos) & bois_corridos(ss)<BOIS_PARA_CLASSIFICAR & classificada: STATUS_SENHA | bois_corridos,estado_senha:=bois_corridos<+{ss|->bois_corridos(ss)+1},estado_senha<+{ss|->classificada}) [] not(bois_corridos(ss)+1 = BOIS_PARA_CLASSIFICAR) ==> (ss: NAT1 & ss: dom(estado_senha) & ss: dom(bois_corridos) & bois_corridos(ss)<BOIS_PARA_CLASSIFICAR & na_espera: STATUS_SENHA | bois_corridos,estado_senha:=bois_corridos<+{ss|->bois_corridos(ss)+1},estado_senha<+{ss|->na_espera}))));
  Expanded_List_Substitution(Machine(Controle_Torneio),chamar_para_pista)==(ss: NAT1 & ss: dom(estado_senha) & estado_senha(ss) = na_espera & card(estado_senha|>{na_pista}) = 0 & ss: NAT1 & ss: dom(estado_senha) & na_pista: STATUS_SENHA | estado_senha:=estado_senha<+{ss|->na_pista});
  Expanded_List_Substitution(Machine(Controle_Torneio),transferir_senha)==(ss: NAT1 & novo_vaqueiro: NAT1 & ss: dom(estado_senha) & estado_senha(ss) = na_espera & fase_atual/=encerrado & (novo_vaqueiro: dom(categoria_vaqueiro) => categoria_vaqueiro(novo_vaqueiro) = categoria_vaqueiro(dono_senha(ss))) & ss: NAT1 & novo_vaqueiro: NAT1 & categoria_vaqueiro(dono_senha(ss)): CATEGORIAS & ss: dom(dono_senha) & categoria_vaqueiro(dono_senha(ss)) = categoria_vaqueiro(dono_senha(ss)) & (novo_vaqueiro: dom(categoria_vaqueiro) => categoria_vaqueiro(novo_vaqueiro) = categoria_vaqueiro(dono_senha(ss))) | dono_senha,categoria_vaqueiro:=dono_senha<+{ss|->novo_vaqueiro},categoria_vaqueiro<+{novo_vaqueiro|->categoria_vaqueiro(dono_senha(ss))});
  Expanded_List_Substitution(Machine(Controle_Torneio),desistir_senha)==(ss: NAT1 & ss: dom(estado_senha) & estado_senha(ss) = na_espera & fase_atual/=encerrado & ss: NAT1 & ss: dom(estado_senha) & eliminada: STATUS_SENHA | estado_senha:=estado_senha<+{ss|->eliminada});
  Expanded_List_Substitution(Machine(Controle_Torneio),comprar_senha)==(vv: NAT1 & ss: NAT1 & cat: CATEGORIAS & ss/:dom(dono_senha) & card(dom(dono_senha))<LIMITE_SENHAS & fase_atual = classificacao & (vv: dom(categoria_vaqueiro) => categoria_vaqueiro(vv) = cat) & vv: NAT1 & ss: NAT1 & cat: CATEGORIAS & ss/:dom(dono_senha) & card(dom(dono_senha))<LIMITE_SENHAS & (vv: dom(categoria_vaqueiro) => categoria_vaqueiro(vv) = cat) | dono_senha,estado_senha,bois_corridos,categoria_vaqueiro:=dono_senha<+{ss|->vv},estado_senha<+{ss|->na_espera},bois_corridos<+{ss|->0},categoria_vaqueiro<+{vv|->cat});
  List_Substitution(Machine(Controle_Torneio),comprar_senha)==(cadastrar_senha(vv,ss,cat));
  List_Substitution(Machine(Controle_Torneio),desistir_senha)==(atualizar_status(ss,eliminada));
  List_Substitution(Machine(Controle_Torneio),transferir_senha)==(atualizar_dono(ss,novo_vaqueiro,categoria_vaqueiro(dono_senha(ss))));
  List_Substitution(Machine(Controle_Torneio),chamar_para_pista)==(atualizar_status(ss,na_pista));
  List_Substitution(Machine(Controle_Torneio),correr_boi_classificacao)==(IF julgamento = zero_boi THEN atualizar_status(ss,eliminada) ELSE IF julgamento = retorno THEN atualizar_status(ss,na_espera) ELSE IF bois_corridos(ss)+1 = BOIS_PARA_CLASSIFICAR THEN registrar_valeu_boi(ss,classificada) ELSE registrar_valeu_boi(ss,na_espera) END END END);
  List_Substitution(Machine(Controle_Torneio),iniciar_disputa)==(fase_atual:=disputa || preparar_disputa);
  List_Substitution(Machine(Controle_Torneio),correr_boi_disputa)==(IF julgamento = zero_boi THEN atualizar_status(ss,eliminada) ELSE IF julgamento = retorno THEN atualizar_status(ss,na_espera) ELSE atualizar_status(ss,na_espera) END END);
  List_Substitution(Machine(Controle_Torneio),rachar_premio)==(fase_atual:=encerrado || finalizar_torneio);
  List_Substitution(Machine(Controle_Torneio),declarar_campeao_unico)==(fase_atual:=encerrado || finalizar_torneio);
  List_Substitution(Machine(Controle_Torneio),consultar_status_senha)==(res:=estado_senha(ss));
  List_Substitution(Machine(Controle_Torneio),consultar_dono)==(res:=dono_senha(ss));
  List_Substitution(Machine(Controle_Torneio),consultar_categoria_vaqueiro)==(res:=categoria_vaqueiro(vv));
  List_Substitution(Machine(Controle_Torneio),total_senhas_vendidas)==(res:=card(dom(dono_senha)));
  List_Substitution(Machine(Controle_Torneio),consultar_bois_corridos)==(res:=bois_corridos(ss))
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Controle_Torneio))==(?);
  Inherited_List_Constants(Machine(Controle_Torneio))==(?);
  List_Constants(Machine(Controle_Torneio))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Controle_Torneio),CATEGORIAS)==({profissional,amador});
  Context_List_Enumerated(Machine(Controle_Torneio))==(FASES,STATUS_SENHA,JULGAMENTO,CATEGORIAS);
  Context_List_Defered(Machine(Controle_Torneio))==(?);
  Context_List_Sets(Machine(Controle_Torneio))==(FASES,STATUS_SENHA,JULGAMENTO,CATEGORIAS);
  List_Valuable_Sets(Machine(Controle_Torneio))==(?);
  Inherited_List_Enumerated(Machine(Controle_Torneio))==(?);
  Inherited_List_Defered(Machine(Controle_Torneio))==(?);
  Inherited_List_Sets(Machine(Controle_Torneio))==(?);
  List_Enumerated(Machine(Controle_Torneio))==(?);
  List_Defered(Machine(Controle_Torneio))==(?);
  List_Sets(Machine(Controle_Torneio))==(?);
  Set_Definition(Machine(Controle_Torneio),JULGAMENTO)==({valeu_boi,zero_boi,retorno});
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
  Context_List_Properties(Machine(Controle_Torneio))==(LIMITE_SENHAS: NAT1 & LIMITE_SENHAS = 100 & BOIS_PARA_CLASSIFICAR: NAT1 & BOIS_PARA_CLASSIFICAR = 3 & VAQUEIROS = NAT1 & SENHAS = NAT1 & FASES: FIN(INTEGER) & not(FASES = {}) & STATUS_SENHA: FIN(INTEGER) & not(STATUS_SENHA = {}) & JULGAMENTO: FIN(INTEGER) & not(JULGAMENTO = {}) & CATEGORIAS: FIN(INTEGER) & not(CATEGORIAS = {}));
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
  List_ANY_Var(Machine(Controle_Torneio),chamar_para_pista)==(?);
  List_ANY_Var(Machine(Controle_Torneio),correr_boi_classificacao)==(?);
  List_ANY_Var(Machine(Controle_Torneio),iniciar_disputa)==(?);
  List_ANY_Var(Machine(Controle_Torneio),correr_boi_disputa)==(?);
  List_ANY_Var(Machine(Controle_Torneio),rachar_premio)==(?);
  List_ANY_Var(Machine(Controle_Torneio),declarar_campeao_unico)==(?);
  List_ANY_Var(Machine(Controle_Torneio),consultar_status_senha)==(?);
  List_ANY_Var(Machine(Controle_Torneio),consultar_dono)==(?);
  List_ANY_Var(Machine(Controle_Torneio),consultar_categoria_vaqueiro)==(?);
  List_ANY_Var(Machine(Controle_Torneio),total_senhas_vendidas)==(?);
  List_ANY_Var(Machine(Controle_Torneio),consultar_bois_corridos)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Controle_Torneio)) == (? | ? | fase_atual | categoria_vaqueiro,bois_corridos,estado_senha,dono_senha | comprar_senha,desistir_senha,transferir_senha,chamar_para_pista,correr_boi_classificacao,iniciar_disputa,correr_boi_disputa,rachar_premio,declarar_campeao_unico,consultar_status_senha,consultar_dono,consultar_categoria_vaqueiro,total_senhas_vendidas,consultar_bois_corridos | ? | seen(Machine(Contexto_Vaquejada)),included(Machine(Gerenciador_Senhas)) | ? | Controle_Torneio);
  List_Of_HiddenCst_Ids(Machine(Controle_Torneio)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Controle_Torneio)) == (?);
  List_Of_VisibleVar_Ids(Machine(Controle_Torneio)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Controle_Torneio)) == (seen(Machine(Contexto_Vaquejada)): (LIMITE_SENHAS,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS,FASES,STATUS_SENHA,JULGAMENTO,CATEGORIAS,classificacao,disputa,encerrado,na_espera,na_pista,classificada,eliminada,campea,valeu_boi,zero_boi,retorno,profissional,amador | ? | ? | ? | ? | ? | ? | ? | ?));
  List_Of_Ids(Machine(Gerenciador_Senhas)) == (? | ? | categoria_vaqueiro,bois_corridos,estado_senha,dono_senha | ? | cadastrar_senha,atualizar_status,atualizar_dono,registrar_valeu_boi,incrementar_boi,preparar_disputa,finalizar_torneio | ? | seen(Machine(Contexto_Vaquejada)) | ? | Gerenciador_Senhas);
  List_Of_HiddenCst_Ids(Machine(Gerenciador_Senhas)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Gerenciador_Senhas)) == (?);
  List_Of_VisibleVar_Ids(Machine(Gerenciador_Senhas)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Gerenciador_Senhas)) == (?: ?);
  List_Of_Ids(Machine(Contexto_Vaquejada)) == (LIMITE_SENHAS,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS,FASES,STATUS_SENHA,JULGAMENTO,CATEGORIAS,classificacao,disputa,encerrado,na_espera,na_pista,classificada,eliminada,campea,valeu_boi,zero_boi,retorno,profissional,amador | ? | ? | ? | ? | ? | ? | ? | Contexto_Vaquejada);
  List_Of_HiddenCst_Ids(Machine(Contexto_Vaquejada)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Contexto_Vaquejada)) == (LIMITE_SENHAS,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS);
  List_Of_VisibleVar_Ids(Machine(Contexto_Vaquejada)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Contexto_Vaquejada)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Controle_Torneio)) == (Type(dono_senha) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(estado_senha) == Mvl(SetOf(btype(INTEGER,?,?)*etype(STATUS_SENHA,?,?)));Type(bois_corridos) == Mvl(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)));Type(categoria_vaqueiro) == Mvl(SetOf(btype(INTEGER,?,?)*etype(CATEGORIAS,?,?)));Type(fase_atual) == Mvl(etype(FASES,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Controle_Torneio)) == (Type(consultar_bois_corridos) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(total_senhas_vendidas) == Cst(btype(INTEGER,?,?),No_type);Type(consultar_categoria_vaqueiro) == Cst(etype(CATEGORIAS,?,?),btype(INTEGER,?,?));Type(consultar_dono) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(consultar_status_senha) == Cst(etype(STATUS_SENHA,?,?),btype(INTEGER,?,?));Type(declarar_campeao_unico) == Cst(No_type,No_type);Type(rachar_premio) == Cst(No_type,No_type);Type(correr_boi_disputa) == Cst(No_type,btype(INTEGER,?,?)*etype(JULGAMENTO,?,?));Type(iniciar_disputa) == Cst(No_type,No_type);Type(correr_boi_classificacao) == Cst(No_type,btype(INTEGER,?,?)*etype(JULGAMENTO,?,?));Type(chamar_para_pista) == Cst(No_type,btype(INTEGER,?,?));Type(transferir_senha) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(desistir_senha) == Cst(No_type,btype(INTEGER,?,?));Type(comprar_senha) == Cst(No_type,btype(INTEGER,?,?)*btype(INTEGER,?,?)*etype(CATEGORIAS,?,?)));
  Observers(Machine(Controle_Torneio)) == (Type(consultar_bois_corridos) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(total_senhas_vendidas) == Cst(btype(INTEGER,?,?),No_type);Type(consultar_categoria_vaqueiro) == Cst(etype(CATEGORIAS,?,?),btype(INTEGER,?,?));Type(consultar_dono) == Cst(btype(INTEGER,?,?),btype(INTEGER,?,?));Type(consultar_status_senha) == Cst(etype(STATUS_SENHA,?,?),btype(INTEGER,?,?)))
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
