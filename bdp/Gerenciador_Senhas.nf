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
  Local_List_Variables(Machine(Gerenciador_Senhas))==(bois_corridos,estado_senha,dono_senha);
  List_Variables(Machine(Gerenciador_Senhas))==(bois_corridos,estado_senha,dono_senha);
  External_List_Variables(Machine(Gerenciador_Senhas))==(bois_corridos,estado_senha,dono_senha)
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
  List_Invariant(Machine(Gerenciador_Senhas))==(dono_senha: SENHAS +-> VAQUEIROS & estado_senha: SENHAS +-> STATUS_SENHA & bois_corridos: SENHAS +-> NAT & dom(estado_senha) = dom(dono_senha) & dom(bois_corridos) = dom(dono_senha) & card(dom(dono_senha))<=LIMITE_SENHAS & !ss.(ss: dom(estado_senha) & estado_senha(ss) = classificada => bois_corridos(ss) = BOIS_PARA_CLASSIFICAR))
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
  Expanded_List_Initialisation(Machine(Gerenciador_Senhas))==(dono_senha,estado_senha,bois_corridos:={},{},{});
  Context_List_Initialisation(Machine(Gerenciador_Senhas))==(skip);
  List_Initialisation(Machine(Gerenciador_Senhas))==(dono_senha:={} || estado_senha:={} || bois_corridos:={})
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
  Internal_List_Operations(Machine(Gerenciador_Senhas))==(cadastrar_senha,atualizar_status,atualizar_dono,registrar_valeu_boi,incrementar_boi,preparar_disputa,finalizar_torneio);
  List_Operations(Machine(Gerenciador_Senhas))==(cadastrar_senha,atualizar_status,atualizar_dono,registrar_valeu_boi,incrementar_boi,preparar_disputa,finalizar_torneio)
END
&
THEORY ListInputX IS
  List_Input(Machine(Gerenciador_Senhas),cadastrar_senha)==(vv,ss);
  List_Input(Machine(Gerenciador_Senhas),atualizar_status)==(ss,novo_status);
  List_Input(Machine(Gerenciador_Senhas),atualizar_dono)==(ss,novo_vaqueiro);
  List_Input(Machine(Gerenciador_Senhas),registrar_valeu_boi)==(ss,novo_status);
  List_Input(Machine(Gerenciador_Senhas),incrementar_boi)==(ss);
  List_Input(Machine(Gerenciador_Senhas),preparar_disputa)==(?);
  List_Input(Machine(Gerenciador_Senhas),finalizar_torneio)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Gerenciador_Senhas),cadastrar_senha)==(?);
  List_Output(Machine(Gerenciador_Senhas),atualizar_status)==(?);
  List_Output(Machine(Gerenciador_Senhas),atualizar_dono)==(?);
  List_Output(Machine(Gerenciador_Senhas),registrar_valeu_boi)==(?);
  List_Output(Machine(Gerenciador_Senhas),incrementar_boi)==(?);
  List_Output(Machine(Gerenciador_Senhas),preparar_disputa)==(?);
  List_Output(Machine(Gerenciador_Senhas),finalizar_torneio)==(?)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Gerenciador_Senhas),cadastrar_senha)==(cadastrar_senha(vv,ss));
  List_Header(Machine(Gerenciador_Senhas),atualizar_status)==(atualizar_status(ss,novo_status));
  List_Header(Machine(Gerenciador_Senhas),atualizar_dono)==(atualizar_dono(ss,novo_vaqueiro));
  List_Header(Machine(Gerenciador_Senhas),registrar_valeu_boi)==(registrar_valeu_boi(ss,novo_status));
  List_Header(Machine(Gerenciador_Senhas),incrementar_boi)==(incrementar_boi(ss));
  List_Header(Machine(Gerenciador_Senhas),preparar_disputa)==(preparar_disputa);
  List_Header(Machine(Gerenciador_Senhas),finalizar_torneio)==(finalizar_torneio)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Gerenciador_Senhas),cadastrar_senha)==(vv: VAQUEIROS & ss: SENHAS & ss/:dom(dono_senha) & card(dom(dono_senha))<LIMITE_SENHAS);
  List_Precondition(Machine(Gerenciador_Senhas),atualizar_status)==(ss: dom(estado_senha) & novo_status: STATUS_SENHA);
  List_Precondition(Machine(Gerenciador_Senhas),atualizar_dono)==(ss: dom(dono_senha) & novo_vaqueiro: VAQUEIROS);
  List_Precondition(Machine(Gerenciador_Senhas),registrar_valeu_boi)==(ss: dom(estado_senha) & ss: dom(bois_corridos) & bois_corridos(ss)<BOIS_PARA_CLASSIFICAR & novo_status: STATUS_SENHA);
  List_Precondition(Machine(Gerenciador_Senhas),incrementar_boi)==(ss: dom(bois_corridos) & bois_corridos(ss)<BOIS_PARA_CLASSIFICAR);
  List_Precondition(Machine(Gerenciador_Senhas),preparar_disputa)==(btrue);
  List_Precondition(Machine(Gerenciador_Senhas),finalizar_torneio)==(btrue)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Gerenciador_Senhas),finalizar_torneio)==(btrue | estado_senha:=estado_senha<+dom(estado_senha|>{na_espera})*{campea});
  Expanded_List_Substitution(Machine(Gerenciador_Senhas),preparar_disputa)==(btrue | estado_senha:=estado_senha<+dom(estado_senha|>{classificada})*{na_espera});
  Expanded_List_Substitution(Machine(Gerenciador_Senhas),incrementar_boi)==(ss: dom(bois_corridos) & bois_corridos(ss)<BOIS_PARA_CLASSIFICAR | bois_corridos:=bois_corridos<+{ss|->bois_corridos(ss)+1});
  Expanded_List_Substitution(Machine(Gerenciador_Senhas),registrar_valeu_boi)==(ss: dom(estado_senha) & ss: dom(bois_corridos) & bois_corridos(ss)<BOIS_PARA_CLASSIFICAR & novo_status: STATUS_SENHA | bois_corridos,estado_senha:=bois_corridos<+{ss|->bois_corridos(ss)+1},estado_senha<+{ss|->novo_status});
  Expanded_List_Substitution(Machine(Gerenciador_Senhas),atualizar_dono)==(ss: dom(dono_senha) & novo_vaqueiro: VAQUEIROS | dono_senha:=dono_senha<+{ss|->novo_vaqueiro});
  Expanded_List_Substitution(Machine(Gerenciador_Senhas),atualizar_status)==(ss: dom(estado_senha) & novo_status: STATUS_SENHA | estado_senha:=estado_senha<+{ss|->novo_status});
  Expanded_List_Substitution(Machine(Gerenciador_Senhas),cadastrar_senha)==(vv: VAQUEIROS & ss: SENHAS & ss/:dom(dono_senha) & card(dom(dono_senha))<LIMITE_SENHAS | dono_senha,estado_senha,bois_corridos:=dono_senha<+{ss|->vv},estado_senha<+{ss|->na_espera},bois_corridos<+{ss|->0});
  List_Substitution(Machine(Gerenciador_Senhas),cadastrar_senha)==(dono_senha(ss):=vv || estado_senha(ss):=na_espera || bois_corridos(ss):=0);
  List_Substitution(Machine(Gerenciador_Senhas),atualizar_status)==(estado_senha(ss):=novo_status);
  List_Substitution(Machine(Gerenciador_Senhas),atualizar_dono)==(dono_senha(ss):=novo_vaqueiro);
  List_Substitution(Machine(Gerenciador_Senhas),registrar_valeu_boi)==(bois_corridos(ss):=bois_corridos(ss)+1 || estado_senha(ss):=novo_status);
  List_Substitution(Machine(Gerenciador_Senhas),incrementar_boi)==(bois_corridos(ss):=bois_corridos(ss)+1);
  List_Substitution(Machine(Gerenciador_Senhas),preparar_disputa)==(estado_senha:=estado_senha<+dom(estado_senha|>{classificada})*{na_espera});
  List_Substitution(Machine(Gerenciador_Senhas),finalizar_torneio)==(estado_senha:=estado_senha<+dom(estado_senha|>{na_espera})*{campea})
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Gerenciador_Senhas))==(?);
  Inherited_List_Constants(Machine(Gerenciador_Senhas))==(?);
  List_Constants(Machine(Gerenciador_Senhas))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Gerenciador_Senhas),JULGAMENTO)==({valeu_boi,zero_boi});
  Context_List_Enumerated(Machine(Gerenciador_Senhas))==(FASES,STATUS_SENHA,JULGAMENTO);
  Context_List_Defered(Machine(Gerenciador_Senhas))==(VAQUEIROS,SENHAS);
  Context_List_Sets(Machine(Gerenciador_Senhas))==(VAQUEIROS,SENHAS,FASES,STATUS_SENHA,JULGAMENTO);
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
  Context_List_Properties(Machine(Gerenciador_Senhas))==(LIMITE_SENHAS: NAT1 & LIMITE_SENHAS = 100 & BOIS_PARA_CLASSIFICAR: NAT1 & BOIS_PARA_CLASSIFICAR = 3 & VAQUEIROS: FIN(INTEGER) & not(VAQUEIROS = {}) & SENHAS: FIN(INTEGER) & not(SENHAS = {}) & FASES: FIN(INTEGER) & not(FASES = {}) & STATUS_SENHA: FIN(INTEGER) & not(STATUS_SENHA = {}) & JULGAMENTO: FIN(INTEGER) & not(JULGAMENTO = {}));
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
  List_ANY_Var(Machine(Gerenciador_Senhas),cadastrar_senha)==(?);
  List_ANY_Var(Machine(Gerenciador_Senhas),atualizar_status)==(?);
  List_ANY_Var(Machine(Gerenciador_Senhas),atualizar_dono)==(?);
  List_ANY_Var(Machine(Gerenciador_Senhas),registrar_valeu_boi)==(?);
  List_ANY_Var(Machine(Gerenciador_Senhas),incrementar_boi)==(?);
  List_ANY_Var(Machine(Gerenciador_Senhas),preparar_disputa)==(?);
  List_ANY_Var(Machine(Gerenciador_Senhas),finalizar_torneio)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Gerenciador_Senhas)) == (? | ? | bois_corridos,estado_senha,dono_senha | ? | cadastrar_senha,atualizar_status,atualizar_dono,registrar_valeu_boi,incrementar_boi,preparar_disputa,finalizar_torneio | ? | seen(Machine(Contexto_Vaquejada)) | ? | Gerenciador_Senhas);
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
  Variables(Machine(Gerenciador_Senhas)) == (Type(bois_corridos) == Mvl(SetOf(atype(SENHAS,?,?)*btype(INTEGER,?,?)));Type(estado_senha) == Mvl(SetOf(atype(SENHAS,?,?)*etype(STATUS_SENHA,?,?)));Type(dono_senha) == Mvl(SetOf(atype(SENHAS,?,?)*atype(VAQUEIROS,?,?))))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Gerenciador_Senhas)) == (Type(finalizar_torneio) == Cst(No_type,No_type);Type(preparar_disputa) == Cst(No_type,No_type);Type(incrementar_boi) == Cst(No_type,atype(SENHAS,?,?));Type(registrar_valeu_boi) == Cst(No_type,atype(SENHAS,?,?)*etype(STATUS_SENHA,?,?));Type(atualizar_dono) == Cst(No_type,atype(SENHAS,?,?)*atype(VAQUEIROS,?,?));Type(atualizar_status) == Cst(No_type,atype(SENHAS,?,?)*etype(STATUS_SENHA,?,?));Type(cadastrar_senha) == Cst(No_type,atype(VAQUEIROS,?,?)*atype(SENHAS,?,?)))
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
