Normalised(
THEORY MagicNumberX IS
  MagicNumber(Implementation(Contexto_Vaquejada_i))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Implementation(Contexto_Vaquejada_i))==(Machine(Contexto_Vaquejada));
  Level(Implementation(Contexto_Vaquejada_i))==(1);
  Upper_Level(Implementation(Contexto_Vaquejada_i))==(Machine(Contexto_Vaquejada))
END
&
THEORY LoadedStructureX IS
  Implementation(Contexto_Vaquejada_i)
END
&
THEORY ListSeesX IS
  List_Sees(Implementation(Contexto_Vaquejada_i))==(?)
END
&
THEORY ListIncludesX IS
  List_Includes(Implementation(Contexto_Vaquejada_i))==(?);
  Inherited_List_Includes(Implementation(Contexto_Vaquejada_i))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Implementation(Contexto_Vaquejada_i))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Implementation(Contexto_Vaquejada_i))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Implementation(Contexto_Vaquejada_i))==(?);
  Context_List_Variables(Implementation(Contexto_Vaquejada_i))==(?);
  Abstract_List_Variables(Implementation(Contexto_Vaquejada_i))==(?);
  Local_List_Variables(Implementation(Contexto_Vaquejada_i))==(?);
  List_Variables(Implementation(Contexto_Vaquejada_i))==(?);
  External_List_Variables(Implementation(Contexto_Vaquejada_i))==(?)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Implementation(Contexto_Vaquejada_i))==(?);
  Abstract_List_VisibleVariables(Implementation(Contexto_Vaquejada_i))==(?);
  External_List_VisibleVariables(Implementation(Contexto_Vaquejada_i))==(?);
  Expanded_List_VisibleVariables(Implementation(Contexto_Vaquejada_i))==(?);
  List_VisibleVariables(Implementation(Contexto_Vaquejada_i))==(?);
  Internal_List_VisibleVariables(Implementation(Contexto_Vaquejada_i))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Implementation(Contexto_Vaquejada_i))==(btrue);
  Expanded_List_Invariant(Implementation(Contexto_Vaquejada_i))==(btrue);
  Abstract_List_Invariant(Implementation(Contexto_Vaquejada_i))==(btrue);
  Context_List_Invariant(Implementation(Contexto_Vaquejada_i))==(btrue);
  List_Invariant(Implementation(Contexto_Vaquejada_i))==(btrue)
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Implementation(Contexto_Vaquejada_i))==(btrue);
  Abstract_List_Assertions(Implementation(Contexto_Vaquejada_i))==(btrue);
  Context_List_Assertions(Implementation(Contexto_Vaquejada_i))==(btrue);
  List_Assertions(Implementation(Contexto_Vaquejada_i))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Implementation(Contexto_Vaquejada_i))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Implementation(Contexto_Vaquejada_i))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Implementation(Contexto_Vaquejada_i))==(skip);
  Context_List_Initialisation(Implementation(Contexto_Vaquejada_i))==(skip);
  List_Initialisation(Implementation(Contexto_Vaquejada_i))==(skip)
END
&
THEORY ListParametersX IS
  List_Parameters(Implementation(Contexto_Vaquejada_i))==(?)
END
&
THEORY ListInstanciatedParametersX END
&
THEORY ListConstraintsX IS
  List_Constraints(Implementation(Contexto_Vaquejada_i))==(btrue);
  List_Context_Constraints(Implementation(Contexto_Vaquejada_i))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Implementation(Contexto_Vaquejada_i))==(?);
  List_Operations(Implementation(Contexto_Vaquejada_i))==(?)
END
&
THEORY ListInputX END
&
THEORY ListOutputX END
&
THEORY ListHeaderX END
&
THEORY ListPreconditionX END
&
THEORY ListSubstitutionX END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Implementation(Contexto_Vaquejada_i))==(TOTAL_SENHAS,LIMITE_SENHAS_VAQUEIRO,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS,TAMANHO_RODIZIO,PREMIO_TOTAL);
  Inherited_List_Constants(Implementation(Contexto_Vaquejada_i))==(TOTAL_SENHAS,LIMITE_SENHAS_VAQUEIRO,BOIS_PARA_CLASSIFICAR,VAQUEIROS,SENHAS,TAMANHO_RODIZIO,PREMIO_TOTAL);
  List_Constants(Implementation(Contexto_Vaquejada_i))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Implementation(Contexto_Vaquejada_i),JULGAMENTO)==({valeu_boi,zero_boi,retorno});
  Context_List_Enumerated(Implementation(Contexto_Vaquejada_i))==(?);
  Context_List_Defered(Implementation(Contexto_Vaquejada_i))==(?);
  Context_List_Sets(Implementation(Contexto_Vaquejada_i))==(?);
  List_Own_Enumerated(Implementation(Contexto_Vaquejada_i))==(FASES,STATUS_SENHA,JULGAMENTO);
  List_Valuable_Sets(Implementation(Contexto_Vaquejada_i))==(?);
  Inherited_List_Enumerated(Implementation(Contexto_Vaquejada_i))==(FASES,STATUS_SENHA,JULGAMENTO);
  Inherited_List_Defered(Implementation(Contexto_Vaquejada_i))==(?);
  Inherited_List_Sets(Implementation(Contexto_Vaquejada_i))==(FASES,STATUS_SENHA,JULGAMENTO);
  List_Enumerated(Implementation(Contexto_Vaquejada_i))==(?);
  List_Defered(Implementation(Contexto_Vaquejada_i))==(?);
  List_Sets(Implementation(Contexto_Vaquejada_i))==(?);
  Set_Definition(Implementation(Contexto_Vaquejada_i),STATUS_SENHA)==({na_espera,na_pista,classificada,eliminada,campea});
  Set_Definition(Implementation(Contexto_Vaquejada_i),FASES)==({classificacao,disputa,encerrado})
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Implementation(Contexto_Vaquejada_i))==(?);
  Expanded_List_HiddenConstants(Implementation(Contexto_Vaquejada_i))==(?);
  List_HiddenConstants(Implementation(Contexto_Vaquejada_i))==(?);
  External_List_HiddenConstants(Implementation(Contexto_Vaquejada_i))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Implementation(Contexto_Vaquejada_i))==(TOTAL_SENHAS: NAT1 & TOTAL_SENHAS = 20 & LIMITE_SENHAS_VAQUEIRO: NAT1 & LIMITE_SENHAS_VAQUEIRO = max({1,TOTAL_SENHAS/5}) & BOIS_PARA_CLASSIFICAR: NAT1 & BOIS_PARA_CLASSIFICAR = 2 & TAMANHO_RODIZIO: NAT1 & TAMANHO_RODIZIO = 4 & VAQUEIROS <: NAT1 & VAQUEIROS = 1..3 & SENHAS <: NAT1 & SENHAS = 1..TOTAL_SENHAS & PREMIO_TOTAL: NAT1 & PREMIO_TOTAL = 10000 & FASES: FIN(INTEGER) & not(FASES = {}) & STATUS_SENHA: FIN(INTEGER) & not(STATUS_SENHA = {}) & JULGAMENTO: FIN(INTEGER) & not(JULGAMENTO = {}));
  Context_List_Properties(Implementation(Contexto_Vaquejada_i))==(btrue);
  Inherited_List_Properties(Implementation(Contexto_Vaquejada_i))==(btrue);
  List_Properties(Implementation(Contexto_Vaquejada_i))==(btrue)
END
&
THEORY ListValuesX IS
  Precond_Valued_Objects(Implementation(Contexto_Vaquejada_i))==(btrue);
  Values_Subs(Implementation(Contexto_Vaquejada_i))==(TOTAL_SENHAS,LIMITE_SENHAS_VAQUEIRO,BOIS_PARA_CLASSIFICAR,TAMANHO_RODIZIO,VAQUEIROS,SENHAS,PREMIO_TOTAL: 20,4,2,4,1..3,1..20,10000);
  List_Values(Implementation(Contexto_Vaquejada_i))==(TOTAL_SENHAS = 20;LIMITE_SENHAS_VAQUEIRO = 4;BOIS_PARA_CLASSIFICAR = 2;TAMANHO_RODIZIO = 4;VAQUEIROS = 1..3;SENHAS = 1..20;PREMIO_TOTAL = 10000)
END
&
THEORY ListSeenInfoX END
&
THEORY ListIncludedOperationsX END
&
THEORY InheritedEnvX IS
  Constants(Implementation(Contexto_Vaquejada_i))==(Type(classificacao) == Cst(etype(FASES,0,2));Type(disputa) == Cst(etype(FASES,0,2));Type(encerrado) == Cst(etype(FASES,0,2));Type(na_espera) == Cst(etype(STATUS_SENHA,0,4));Type(na_pista) == Cst(etype(STATUS_SENHA,0,4));Type(classificada) == Cst(etype(STATUS_SENHA,0,4));Type(eliminada) == Cst(etype(STATUS_SENHA,0,4));Type(campea) == Cst(etype(STATUS_SENHA,0,4));Type(valeu_boi) == Cst(etype(JULGAMENTO,0,2));Type(zero_boi) == Cst(etype(JULGAMENTO,0,2));Type(retorno) == Cst(etype(JULGAMENTO,0,2));Type(TOTAL_SENHAS) == Cst(btype(INTEGER,?,?));Type(LIMITE_SENHAS_VAQUEIRO) == Cst(btype(INTEGER,?,?));Type(BOIS_PARA_CLASSIFICAR) == Cst(btype(INTEGER,?,?));Type(VAQUEIROS) == Cst(SetOf(btype(INTEGER,"[VAQUEIROS","]VAQUEIROS")));Type(SENHAS) == Cst(SetOf(btype(INTEGER,"[SENHAS","]SENHAS")));Type(TAMANHO_RODIZIO) == Cst(btype(INTEGER,?,?));Type(PREMIO_TOTAL) == Cst(btype(INTEGER,?,?)))
END
&
THEORY ListVisibleStaticX END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Implementation(Contexto_Vaquejada_i)) == (? | ? | ? | ? | ? | ? | ? | ? | Contexto_Vaquejada_i);
  List_Of_HiddenCst_Ids(Implementation(Contexto_Vaquejada_i)) == (? | ?);
  List_Of_VisibleCst_Ids(Implementation(Contexto_Vaquejada_i)) == (?);
  List_Of_VisibleVar_Ids(Implementation(Contexto_Vaquejada_i)) == (? | ?);
  List_Of_Ids_SeenBNU(Implementation(Contexto_Vaquejada_i)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Implementation(Contexto_Vaquejada_i)) == (Type(JULGAMENTO) == Cst(SetOf(etype(JULGAMENTO,0,2)));Type(STATUS_SENHA) == Cst(SetOf(etype(STATUS_SENHA,0,4)));Type(FASES) == Cst(SetOf(etype(FASES,0,2))))
END
&
THEORY ConstantsEnvX IS
  Constants(Implementation(Contexto_Vaquejada_i)) == (Type(PREMIO_TOTAL) == Cst(btype(INTEGER,?,?));Type(TAMANHO_RODIZIO) == Cst(btype(INTEGER,?,?));Type(SENHAS) == Cst(SetOf(btype(INTEGER,"[SENHAS","]SENHAS")));Type(VAQUEIROS) == Cst(SetOf(btype(INTEGER,"[VAQUEIROS","]VAQUEIROS")));Type(BOIS_PARA_CLASSIFICAR) == Cst(btype(INTEGER,?,?));Type(LIMITE_SENHAS_VAQUEIRO) == Cst(btype(INTEGER,?,?));Type(TOTAL_SENHAS) == Cst(btype(INTEGER,?,?));Type(retorno) == Cst(etype(JULGAMENTO,0,2));Type(zero_boi) == Cst(etype(JULGAMENTO,0,2));Type(valeu_boi) == Cst(etype(JULGAMENTO,0,2));Type(campea) == Cst(etype(STATUS_SENHA,0,4));Type(eliminada) == Cst(etype(STATUS_SENHA,0,4));Type(classificada) == Cst(etype(STATUS_SENHA,0,4));Type(na_pista) == Cst(etype(STATUS_SENHA,0,4));Type(na_espera) == Cst(etype(STATUS_SENHA,0,4));Type(encerrado) == Cst(etype(FASES,0,2));Type(disputa) == Cst(etype(FASES,0,2));Type(classificacao) == Cst(etype(FASES,0,2)))
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
  List_Local_Operations(Implementation(Contexto_Vaquejada_i))==(?)
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
  TypingPredicate(Implementation(Contexto_Vaquejada_i))==(btrue)
END
&
THEORY ImportedVariablesListX END
&
THEORY ListLocalOpInvariantX END
)
