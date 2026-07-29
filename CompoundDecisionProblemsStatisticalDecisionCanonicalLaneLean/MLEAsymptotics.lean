import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean

structure MLEAsymptotics where
  likelihoodFunction : Type u
  dataGeneratingDistribution : Type v
  estimator : Type w
  consistency : Prop
  asymptoticNormality : Prop
  efficiency : Prop

def MLEClosed (M : MLEAsymptotics) : Prop :=
  M.consistency ∧ M.asymptoticNormality ∧ M.efficiency

theorem mle_closed (M : MLEAsymptotics) : MLEClosed M := by
  exact And.intro M.consistency (And.intro M.asymptoticNormality M.efficiency)

end CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean
end HautevilleHouse
