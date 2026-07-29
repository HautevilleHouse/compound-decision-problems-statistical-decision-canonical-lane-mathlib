import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean

structure DecisionTheoryPackage where
  decisionSpace : Type u
  lossFunction : Type v
  riskFunction : Prop
  admissibility : Prop
  minimax : Prop
  bayesRule : Prop

structure DecisionTheoryEvidence (D : DecisionTheoryPackage) where
  lossFunctionClosed : D.lossFunction
  riskFunctionClosed : D.riskFunction
  admissibilityClosed : D.admissibility
  minimaxClosed : D.minimax
  bayesRuleClosed : D.bayesRule

def DecisionTheoryClosed (D : DecisionTheoryPackage) : Prop :=
  D.lossFunction ∧ D.riskFunction ∧ D.admissibility ∧
  D.minimax ∧ D.bayesRule

theorem decision_theory_closed_from_evidence (D : DecisionTheoryPackage)
    (E : DecisionTheoryEvidence D) : DecisionTheoryClosed D :=
  And.intro E.lossFunctionClosed
    (And.intro E.riskFunctionClosed
      (And.intro E.admissibilityClosed
        (And.intro E.minimaxClosed E.bayesRuleClosed)))

end CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean
end HautevilleHouse
