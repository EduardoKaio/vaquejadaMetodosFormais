Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Contexto_Vaquejada))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Contexto_Vaquejada))==(Machine(Contexto_Vaquejada));
  Level(Machine(Contexto_Vaquejada))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Contexto_Vaquejada)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Contexto_Vaquejada))==(?)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Contexto_Vaquejada))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Contexto_Vaquejada))==(?);
  List_Includes(Machine(Contexto_Vaquejada))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Contexto_Vaquejada))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Contexto_Vaquejada))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Contexto_Vaquejada))==(?);
  Context_List_Variables(Machine(Contexto_Vaquejada))==(?);
  Abstract_List_Variables(Machine(Contexto_Vaquejada))==(?);
  Local_List_Variables(Machine(Contexto_Vaquejada))==(?);
  List_Variables(Machine(Contexto_Vaquejada))==(?);
  External_List_Variables(Machine(Contexto_Vaquejada))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Contexto_Vaquejada))==(?);
  Abstract_List_VisibleVariables(Machine(Contexto_Vaquejada))==(?);
  External_List_VisibleVariables(Machine(Contexto_Vaquejada))==(?);
  Expanded_List_VisibleVariables(Machine(Contexto_Vaquejada))==(?);
  List_VisibleVariables(Machine(Contexto_Vaquejada))==(?);
  Internal_List_VisibleVariables(Machine(Contexto_Vaquejada))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Contexto_Vaquejada))==(btrue);
  Gluing_List_Invariant(Machine(Contexto_Vaquejada))==(btrue);
  Expanded_List_Invariant(Machine(Contexto_Vaquejada))==(btrue);
  Abstract_List_Invariant(Machine(Contexto_Vaquejada))==(btrue);
  Context_List_Invariant(Machine(Contexto_Vaquejada))==(btrue);
  List_Invariant(Machine(Contexto_Vaquejada))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Contexto_Vaquejada))==(btrue);
  Abstract_List_Assertions(Machine(Contexto_Vaquejada))==(btrue);
  Context_List_Assertions(Machine(Contexto_Vaquejada))==(btrue);
  List_Assertions(Machine(Contexto_Vaquejada))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Contexto_Vaquejada))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Contexto_Vaquejada))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Contexto_Vaquejada))==(skip);
  Context_List_Initialisation(Machine(Contexto_Vaquejada))==(skip);
  List_Initialisation(Machine(Contexto_Vaquejada))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Contexto_Vaquejada))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Contexto_Vaquejada))==(btrue);
  List_Constraints(Machine(Contexto_Vaquejada))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Contexto_Vaquejada))==(?);
  List_Operations(Machine(Contexto_Vaquejada))==(?)
END
&
THEORY ListInputX END
&
THEORY ListOutputX END
&
THEORY ListHeaderX END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX END
&
THEORY ListSubstitutionX END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Contexto_Vaquejada))==(TOTAL_SENHAS,LIMITE_SENHAS_VAQUEIRO,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS,TAMANHO_RODIZIO);
  Inherited_List_Constants(Machine(Contexto_Vaquejada))==(?);
  List_Constants(Machine(Contexto_Vaquejada))==(TOTAL_SENHAS,LIMITE_SENHAS_VAQUEIRO,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS,TAMANHO_RODIZIO)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Contexto_Vaquejada),FASES)==({classificacao,disputa,encerrado});
  Context_List_Enumerated(Machine(Contexto_Vaquejada))==(?);
  Context_List_Defered(Machine(Contexto_Vaquejada))==(?);
  Context_List_Sets(Machine(Contexto_Vaquejada))==(?);
  List_Valuable_Sets(Machine(Contexto_Vaquejada))==(?);
  Inherited_List_Enumerated(Machine(Contexto_Vaquejada))==(?);
  Inherited_List_Defered(Machine(Contexto_Vaquejada))==(?);
  Inherited_List_Sets(Machine(Contexto_Vaquejada))==(?);
  List_Enumerated(Machine(Contexto_Vaquejada))==(FASES,STATUS_SENHA,JULGAMENTO);
  List_Defered(Machine(Contexto_Vaquejada))==(?);
  List_Sets(Machine(Contexto_Vaquejada))==(FASES,STATUS_SENHA,JULGAMENTO);
  Set_Definition(Machine(Contexto_Vaquejada),STATUS_SENHA)==({na_espera,na_pista,classificada,eliminada,campea});
  Set_Definition(Machine(Contexto_Vaquejada),JULGAMENTO)==({valeu_boi,zero_boi,retorno})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Contexto_Vaquejada))==(?);
  Expanded_List_HiddenConstants(Machine(Contexto_Vaquejada))==(?);
  List_HiddenConstants(Machine(Contexto_Vaquejada))==(?);
  External_List_HiddenConstants(Machine(Contexto_Vaquejada))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Contexto_Vaquejada))==(btrue);
  Context_List_Properties(Machine(Contexto_Vaquejada))==(btrue);
  Inherited_List_Properties(Machine(Contexto_Vaquejada))==(btrue);
  List_Properties(Machine(Contexto_Vaquejada))==(TOTAL_SENHAS: NAT1 & TOTAL_SENHAS = 20 & LIMITE_SENHAS_VAQUEIRO: NAT1 & LIMITE_SENHAS_VAQUEIRO = max({1,TOTAL_SENHAS/5}) & BOIS_PARA_CLASSIFICAR: NAT1 & BOIS_PARA_CLASSIFICAR = 2 & TAMANHO_RODIZIO: NAT1 & TAMANHO_RODIZIO = 4 & VAQUEIROS <: NAT1 & VAQUEIROS = 1..3 & SENHAS <: NAT1 & SENHAS = 1..TOTAL_SENHAS & FASES: FIN(INTEGER) & not(FASES = {}) & STATUS_SENHA: FIN(INTEGER) & not(STATUS_SENHA = {}) & JULGAMENTO: FIN(INTEGER) & not(JULGAMENTO = {}))
END
&
THEORY ListSeenInfoX END
&
THEORY ListANYVarX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Contexto_Vaquejada)) == (TOTAL_SENHAS,LIMITE_SENHAS_VAQUEIRO,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS,TAMANHO_RODIZIO,FASES,STATUS_SENHA,JULGAMENTO,classificacao,disputa,encerrado,na_espera,na_pista,classificada,eliminada,campea,valeu_boi,zero_boi,retorno | ? | ? | ? | ? | ? | ? | ? | Contexto_Vaquejada);
  List_Of_HiddenCst_Ids(Machine(Contexto_Vaquejada)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Contexto_Vaquejada)) == (TOTAL_SENHAS,LIMITE_SENHAS_VAQUEIRO,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS,TAMANHO_RODIZIO);
  List_Of_VisibleVar_Ids(Machine(Contexto_Vaquejada)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Contexto_Vaquejada)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Contexto_Vaquejada)) == (Type(FASES) == Cst(SetOf(etype(FASES,0,2)));Type(STATUS_SENHA) == Cst(SetOf(etype(STATUS_SENHA,0,4)));Type(JULGAMENTO) == Cst(SetOf(etype(JULGAMENTO,0,2))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Contexto_Vaquejada)) == (Type(classificacao) == Cst(etype(FASES,0,2));Type(disputa) == Cst(etype(FASES,0,2));Type(encerrado) == Cst(etype(FASES,0,2));Type(na_espera) == Cst(etype(STATUS_SENHA,0,4));Type(na_pista) == Cst(etype(STATUS_SENHA,0,4));Type(classificada) == Cst(etype(STATUS_SENHA,0,4));Type(eliminada) == Cst(etype(STATUS_SENHA,0,4));Type(campea) == Cst(etype(STATUS_SENHA,0,4));Type(valeu_boi) == Cst(etype(JULGAMENTO,0,2));Type(zero_boi) == Cst(etype(JULGAMENTO,0,2));Type(retorno) == Cst(etype(JULGAMENTO,0,2));Type(TOTAL_SENHAS) == Cst(btype(INTEGER,?,?));Type(LIMITE_SENHAS_VAQUEIRO) == Cst(btype(INTEGER,?,?));Type(BOIS_PARA_CLASSIFICAR) == Cst(btype(INTEGER,?,?));Type(VAQUEIROS) == Cst(SetOf(btype(INTEGER,"[VAQUEIROS","]VAQUEIROS")));Type(SENHAS) == Cst(SetOf(btype(INTEGER,"[SENHAS","]SENHAS")));Type(TAMANHO_RODIZIO) == Cst(btype(INTEGER,?,?)))
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
