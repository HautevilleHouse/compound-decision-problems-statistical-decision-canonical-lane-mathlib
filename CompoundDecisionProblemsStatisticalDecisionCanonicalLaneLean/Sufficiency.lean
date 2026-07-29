import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean.CompoundDecisionModel

namespace HautevilleHouse
namespace CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean

structure SufficiencyStructure where
  sufficientStatistic : Type u
  statisticFunction : samplespace → sufficientStatistic
  conditionalDistributionKnown : Prop

def SufficiencyClosed (S : SufficiencyStructure) : Prop :=
  S.statisticFunctionMeasurable ∧ S.conditionalDistributionKnown

theorem sufficiency_closed (S : SufficiencyStructure) : SufficiencyClosed S := by
  exact And.intro S.statisticFunctionMeasurable S.conditionalDistributionKnown

end CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean
end HautevilleHouse
