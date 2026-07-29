import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean

structure DecisionRuleSpace where
  actionSet : Type u
  parameterSet : Type v
  sampleSpace : Type w
  lossFunction : actionSet → parameterSet → ℝ
  decisionRule : sampleSpace → actionSet
  riskFunction : parameterSet → ℝ

structure DecisionRuleSpaceEvidence (D : DecisionRuleSpace) where
  lossMeasurable : Prop
  decisionMeasurable : Prop
  riskDefined : Prop
  lossMeasurableClosed : D.lossMeasurable
  decisionMeasurableClosed : D.decisionMeasurable
  riskDefinedClosed : D.riskDefined

def DecisionRuleSpaceClosed (D : DecisionRuleSpace) : Prop :=
  D.lossMeasurable ∧ D.decisionMeasurable ∧ D.riskDefined

theorem decision_rule_space_closed_from_evidence
    (D : DecisionRuleSpace) (E : DecisionRuleSpaceEvidence D) :
    DecisionRuleSpaceClosed D := by
  exact And.intro E.lossMeasurableClosed
    (And.intro E.decisionMeasurableClosed E.riskDefinedClosed)

end CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean
end HautevilleHouse