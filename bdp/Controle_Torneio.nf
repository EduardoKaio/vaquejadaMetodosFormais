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
  List_Variables(Machine(Controle_Torneio))==(fase_atual,bois_corridos,estado_senha,dono_senha);
  External_List_Variables(Machine(Controle_Torneio))==(fase_atual,bois_corridos,estado_senha,dono_senha)
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
  Expanded_List_Invariant(Machine(Controle_Torneio))==(dono_senha: SENHAS +-> VAQUEIROS & estado_senha: SENHAS +-> STATUS_SENHA & bois_corridos: SENHAS +-> NAT & dom(estado_senha) = dom(dono_senha) & dom(bois_corridos) = dom(dono_senha) & card(dom(dono_senha))<=LIMITE_SENHAS & !ss.(ss: dom(estado_senha) & estado_senha(ss) = classificada => bois_corridos(ss) = BOIS_PARA_CLASSIFICAR));
  Context_List_Invariant(Machine(Controle_Torneio))==(btrue);
  List_Invariant(Machine(Controle_Torneio))==(fase_atual: FASES & card(estado_senha|>{na_pista})<=1)
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
  Expanded_List_Initialisation(Machine(Controle_Torneio))==(dono_senha,estado_senha,bois_corridos:={},{},{};fase_atual:=classificacao);
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
  Internal_List_Operations(Machine(Controle_Torneio))==(comprar_senha,chamar_para_pista,correr_boi_classificacao);
  List_Operations(Machine(Controle_Torneio))==(comprar_senha,chamar_para_pista,correr_boi_classificacao)
END
&
THEORY ListInputX IS
  List_Input(Machine(Controle_Torneio),comprar_senha)==(vv,ss);
  List_Input(Machine(Controle_Torneio),chamar_para_pista)==(ss);
  List_Input(Machine(Controle_Torneio),correr_boi_classificacao)==(ss,julgamento)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Controle_Torneio),comprar_senha)==(?);
  List_Output(Machine(Controle_Torneio),chamar_para_pista)==(?);
  List_Output(Machine(Controle_Torneio),correr_boi_classificacao)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Controle_Torneio),comprar_senha)==(comprar_senha(vv,ss));
  List_Header(Machine(Controle_Torneio),chamar_para_pista)==(chamar_para_pista(ss));
  List_Header(Machine(Controle_Torneio),correr_boi_classificacao)==(correr_boi_classificacao(ss,julgamento))
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Controle_Torneio),comprar_senha)==(vv: VAQUEIROS & ss: SENHAS & ss/:dom(dono_senha) & card(dom(dono_senha))<LIMITE_SENHAS & fase_atual = classificacao);
  List_Precondition(Machine(Controle_Torneio),chamar_para_pista)==(ss: dom(estado_senha) & estado_senha(ss) = na_espera & card(estado_senha|>{na_pista}) = 0);
  List_Precondition(Machine(Controle_Torneio),correr_boi_classificacao)==(fase_atual = classificacao & ss: dom(estado_senha) & estado_senha(ss) = na_pista & julgamento: JULGAMENTO)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Controle_Torneio),correr_boi_classificacao)==(fase_atual = classificacao & ss: dom(estado_senha) & estado_senha(ss) = na_pista & julgamento: JULGAMENTO | julgamento = zero_boi ==> (ss: dom(estado_senha) & eliminada: STATUS_SENHA | estado_senha:=estado_senha<+{ss|->eliminada}) [] not(julgamento = zero_boi) ==> (bois_corridos(ss)+1 = BOIS_PARA_CLASSIFICAR ==> (ss: dom(estado_senha) & ss: dom(bois_corridos) & bois_corridos(ss)<BOIS_PARA_CLASSIFICAR & classificada: STATUS_SENHA | bois_corridos,estado_senha:=bois_corridos<+{ss|->bois_corridos(ss)+1},estado_senha<+{ss|->classificada}) [] not(bois_corridos(ss)+1 = BOIS_PARA_CLASSIFICAR) ==> (ss: dom(estado_senha) & ss: dom(bois_corridos) & bois_corridos(ss)<BOIS_PARA_CLASSIFICAR & na_espera: STATUS_SENHA | bois_corridos,estado_senha:=bois_corridos<+{ss|->bois_corridos(ss)+1},estado_senha<+{ss|->na_espera})));
  Expanded_List_Substitution(Machine(Controle_Torneio),chamar_para_pista)==(ss: dom(estado_senha) & estado_senha(ss) = na_espera & card(estado_senha|>{na_pista}) = 0 & ss: dom(estado_senha) & na_pista: STATUS_SENHA | estado_senha:=estado_senha<+{ss|->na_pista});
  Expanded_List_Substitution(Machine(Controle_Torneio),comprar_senha)==(vv: VAQUEIROS & ss: SENHAS & ss/:dom(dono_senha) & card(dom(dono_senha))<LIMITE_SENHAS & fase_atual = classificacao & vv: VAQUEIROS & ss: SENHAS & ss/:dom(dono_senha) & card(dom(dono_senha))<LIMITE_SENHAS | dono_senha,estado_senha,bois_corridos:=dono_senha<+{ss|->vv},estado_senha<+{ss|->na_espera},bois_corridos<+{ss|->0});
  List_Substitution(Machine(Controle_Torneio),comprar_senha)==(cadastrar_senha(vv,ss));
  List_Substitution(Machine(Controle_Torneio),chamar_para_pista)==(atualizar_status(ss,na_pista));
  List_Substitution(Machine(Controle_Torneio),correr_boi_classificacao)==(IF julgamento = zero_boi THEN atualizar_status(ss,eliminada) ELSE IF bois_corridos(ss)+1 = BOIS_PARA_CLASSIFICAR THEN registrar_valeu_boi(ss,classificada) ELSE registrar_valeu_boi(ss,na_espera) END END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Controle_Torneio))==(?);
  Inherited_List_Constants(Machine(Controle_Torneio))==(?);
  List_Constants(Machine(Controle_Torneio))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Controle_Torneio),JULGAMENTO)==({valeu_boi,zero_boi});
  Context_List_Enumerated(Machine(Controle_Torneio))==(FASES,STATUS_SENHA,JULGAMENTO);
  Context_List_Defered(Machine(Controle_Torneio))==(VAQUEIROS,SENHAS);
  Context_List_Sets(Machine(Controle_Torneio))==(VAQUEIROS,SENHAS,FASES,STATUS_SENHA,JULGAMENTO);
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
  Context_List_Properties(Machine(Controle_Torneio))==(LIMITE_SENHAS: NAT1 & LIMITE_SENHAS = 100 & BOIS_PARA_CLASSIFICAR: NAT1 & BOIS_PARA_CLASSIFICAR = 3 & VAQUEIROS: FIN(INTEGER) & not(VAQUEIROS = {}) & SENHAS: FIN(INTEGER) & not(SENHAS = {}) & FASES: FIN(INTEGER) & not(FASES = {}) & STATUS_SENHA: FIN(INTEGER) & not(STATUS_SENHA = {}) & JULGAMENTO: FIN(INTEGER) & not(JULGAMENTO = {}));
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
  List_ANY_Var(Machine(Controle_Torneio),chamar_para_pista)==(?);
  List_ANY_Var(Machine(Controle_Torneio),correr_boi_classificacao)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Controle_Torneio)) == (? | ? | fase_atual | bois_corridos,estado_senha,dono_senha | comprar_senha,chamar_para_pista,correr_boi_classificacao | ? | seen(Machine(Contexto_Vaquejada)),included(Machine(Gerenciador_Senhas)) | ? | Controle_Torneio);
  List_Of_HiddenCst_Ids(Machine(Controle_Torneio)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Controle_Torneio)) == (?);
  List_Of_VisibleVar_Ids(Machine(Controle_Torneio)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Controle_Torneio)) == (seen(Machine(Contexto_Vaquejada)): (LIMITE_SENHAS,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS,FASES,STATUS_SENHA,JULGAMENTO,classificacao,disputa,encerrado,na_espera,na_pista,classificada,eliminada,campea,valeu_boi,zero_boi | ? | ? | ? | ? | ? | ? | ? | ?));
  List_Of_Ids(Machine(Gerenciador_Senhas)) == (? | ? | bois_corridos,estado_senha,dono_senha | ? | cadastrar_senha,atualizar_status,registrar_valeu_boi,incrementar_boi | ? | seen(Machine(Contexto_Vaquejada)) | ? | Gerenciador_Senhas);
  List_Of_HiddenCst_Ids(Machine(Gerenciador_Senhas)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Gerenciador_Senhas)) == (?);
  List_Of_VisibleVar_Ids(Machine(Gerenciador_Senhas)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Gerenciador_Senhas)) == (?: ?);
  List_Of_Ids(Machine(Contexto_Vaquejada)) == (LIMITE_SENHAS,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS,FASES,STATUS_SENHA,JULGAMENTO,classificacao,disputa,encerrado,na_espera,na_pista,classificada,eliminada,campea,valeu_boi,zero_boi | ? | ? | ? | ? | ? | ? | ? | Contexto_Vaquejada);
  List_Of_HiddenCst_Ids(Machine(Contexto_Vaquejada)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Contexto_Vaquejada)) == (LIMITE_SENHAS,BOIS_PARA_CLASSIFICAR);
  List_Of_VisibleVar_Ids(Machine(Contexto_Vaquejada)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Contexto_Vaquejada)) == (?: ?)
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Controle_Torneio)) == (Type(dono_senha) == Mvl(SetOf(atype(SENHAS,?,?)*atype(VAQUEIROS,?,?)));Type(estado_senha) == Mvl(SetOf(atype(SENHAS,?,?)*etype(STATUS_SENHA,?,?)));Type(bois_corridos) == Mvl(SetOf(atype(SENHAS,?,?)*btype(INTEGER,?,?)));Type(fase_atual) == Mvl(etype(FASES,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Controle_Torneio)) == (Type(correr_boi_classificacao) == Cst(No_type,atype(SENHAS,?,?)*etype(JULGAMENTO,?,?));Type(chamar_para_pista) == Cst(No_type,atype(SENHAS,?,?));Type(comprar_senha) == Cst(No_type,atype(VAQUEIROS,?,?)*atype(SENHAS,?,?)))
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
