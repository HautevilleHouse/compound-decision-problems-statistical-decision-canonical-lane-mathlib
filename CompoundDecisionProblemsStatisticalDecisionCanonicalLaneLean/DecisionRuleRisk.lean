import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean

structure DecisionProblem where
  parameterSet : Type u
  actionSet : Type v
  lossFunction : Prop
  sampleSpace : Type w
  randomVariable : Prop

structure DecisionRule (D : DecisionProblem) where
  decisionFunction : Prop
  riskFunction : Prop

structure Admissibility (D : DecisionProblem) (R : DecisionRule D) where
  inadmissibleAlternative : Prop
  bayesRule : Prop
  minimaxRule : Prop
  admissibleClosed : Prop

structure DecisionRuleEvidence {D : DecisionProblem} (R : DecisionRule D) where
  decisionFunctionClosed : R.decisionFunction
  riskFunctionClosed : R.riskFunction

def DecisionRuleClosed {D : DecisionProblem} (R : DecisionRule D) : Prop :=
  R.decisionFunction ∧ R.riskFunction

theorem decision_rule_closed_from_evidence {D : DecisionProblem} (R : DecisionRule D) (E : DecisionRuleEvidence R) : DecisionRuleClosed R := by
  exact And.intro E.decisionFunctionClosed E.riskFunctionClosed

structure AdmissibilityEvidence {D : DecisionProblem} {R : DecisionRule D} (A : Admissibility D R) where
  inadmissibleAlternativeClosed : A.inadmissibleAlternative
  bayesRuleClosed : A.bayesRule
  minimaxRuleClosed : A.minimaxRule
  admissibleClosed : A.admissibleClosed

def AdmissibilityClosed {D : DecisionProblem} {R : DecisionRule D} (A : Admissibility D R) : Prop :=
  A.inadmissibleAlternative ∧ A.bayesRule ∧ A.minimaxRule ∧ A.admissibleClosed

theorem admissibility_closed_from_evidence {D : DecisionProblem} {R : DecisionRule D} (A : Admissibility D R) (E : AdmissibilityEvidence A) : AdmissibilityClosed A := by
  exact And.intro E.inadmissibleAlternativeClosed
    (And.intro E.bayesRuleClosed
      (And.intro E.minimaxRuleClosed E.admissibleClosed))

end CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean
end HautevilleHouse