import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean

structure SufficiencyPackage where
  sufficientStatistic : Type u
  conditionalDistribution : Type v
  factorizationCriterionSatisfied : Prop
  minimalSufficiency : Prop
  completeness : Prop

structure SufficiencyEvidence (S : SufficiencyPackage) where
  factorizationCriterionSatisfiedClosed : S.factorizationCriterionSatisfied
  minimalSufficiencyClosed : S.minimalSufficiency
  completenessClosed : S.completeness

def SufficiencyClosed (S : SufficiencyPackage) : Prop :=
  S.factorizationCriterionSatisfied ∧
  S.minimalSufficiency ∧
  S.completeness

theorem sufficiency_closed_from_evidence (S : SufficiencyPackage) (E : SufficiencyEvidence S) :
    SufficiencyClosed S := by
  exact And.intro E.factorizationCriterionSatisfiedClosed
    (And.intro E.minimalSufficiencyClosed E.completenessClosed)

end CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean
end HautevilleHouse