import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean

structure CompoundDecisionModel where
  parameterSpace : Type u
  decisionSpace : Type v
  lossFunction : parameterSpace → decisionSpace → ℝ
  samplespace : Type w
  sampleDistribution : samplespace → parameterSpace → ℝ

structure CompoundDecisionModelEvidence (M : CompoundDecisionModel) where
  lossFunctionMeasurable : Prop
  sampleDistributionProper : Prop
  modelIdentified : Prop

def CompoundDecisionModelClosed (M : CompoundDecisionModel) : Prop :=
  M.lossFunctionMeasurable ∧ M.sampleDistributionProper ∧ M.modelIdentified

theorem compound_decision_model_closed_from_evidence
    (M : CompoundDecisionModel) (E : CompoundDecisionModelEvidence M) :
    CompoundDecisionModelClosed M := by
  exact And.intro E.lossFunctionMeasurable (And.intro E.sampleDistributionProper E.modelIdentified)

end CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean
end HautevilleHouse
