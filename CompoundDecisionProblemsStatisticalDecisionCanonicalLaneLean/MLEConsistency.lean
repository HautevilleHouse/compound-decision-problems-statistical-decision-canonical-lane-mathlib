import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean

structure MLEConsistencyPackage where
  likelihoodFunction : Type u
  parameterSpace : Type v
  identifiabilityCondition : Prop
  consistencyProof : Prop
  asymptoticNormality : Prop

structure MLEConsistencyEvidence (M : MLEConsistencyPackage) where
  identifiabilityConditionClosed : M.identifiabilityCondition
  consistencyProofClosed : M.consistencyProof
  asymptoticNormalityClosed : M.asymptoticNormality

def MLEConsistencyClosed (M : MLEConsistencyPackage) : Prop :=
  M.identifiabilityCondition ∧ M.consistencyProof ∧ M.asymptoticNormality

theorem mle_consistency_closed_from_evidence (M : MLEConsistencyPackage) (E : MLEConsistencyEvidence M) :
    MLEConsistencyClosed M := by
  exact And.intro E.identifiabilityConditionClosed
    (And.intro E.consistencyProofClosed E.asymptoticNormalityClosed)

end CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean
end HautevilleHouse