import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean

structure CompoundDecisionProblem where
  componentProblems : Type u
  lossAggregation : Prop
  globalRisk : Prop

structure CompoundDecisionRule (C : CompoundDecisionProblem) where
  componentRules : Prop
  combinedLoss : Prop
  averageRisk : Prop
  oracleInequality : Prop

structure CompoundDecisionRuleEvidence {C : CompoundDecisionProblem} (R : CompoundDecisionRule C) where
  componentRulesClosed : R.componentRules
  combinedLossClosed : R.combinedLoss
  averageRiskClosed : R.averageRisk
  oracleInequalityClosed : R.oracleInequality

def CompoundDecisionRuleClosed {C : CompoundDecisionProblem} (R : CompoundDecisionRule C) : Prop :=
  R.componentRules ∧ R.combinedLoss ∧ R.averageRisk ∧ R.oracleInequality

theorem compound_decision_rule_closed_from_evidence {C : CompoundDecisionProblem} (R : CompoundDecisionRule C) (E : CompoundDecisionRuleEvidence R) : CompoundDecisionRuleClosed R := by
  exact And.intro E.componentRulesClosed
    (And.intro E.combinedLossClosed
      (And.intro E.averageRiskClosed E.oracleInequalityClosed))

end CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean
end HautevilleHouse