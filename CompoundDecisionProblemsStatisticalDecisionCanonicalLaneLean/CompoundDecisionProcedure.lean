import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean

structure CompoundDecisionProcedure where
  componentDecisionSpaces : List DecisionRuleSpace
  poolingFunction : Type
  lossAggregation : (List ℝ) → ℝ
  componentOptimality : Prop
  globalOptimality : Prop

structure CompoundProcedureEvidence (C : CompoundDecisionProcedure) where
  componentOptimalityClosed : C.componentOptimality
  globalOptimalityClosed : C.globalOptimality

def CompoundProcedureClosed (C : CompoundDecisionProcedure) : Prop :=
  C.componentOptimality ∧ C.globalOptimality

theorem compound_procedure_closed_from_evidence
    (C : CompoundDecisionProcedure) (E : CompoundProcedureEvidence C) :
    CompoundProcedureClosed C := by
  exact And.intro E.componentOptimalityClosed E.globalOptimalityClosed

end CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean
end HautevilleHouse