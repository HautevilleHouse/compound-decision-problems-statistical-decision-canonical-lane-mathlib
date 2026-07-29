import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean

structure SufficiencyFamily where
  sampleSpace : Type u
  parameterSet : Type v
  sufficientStatistic : sampleSpace → Type w
  factorizationCriterion : Prop
  exponentialForm : Prop
  canonicalParameter : Prop
  naturalSufficient : Prop

structure ExponentialFamilyEvidence (S : SufficiencyFamily) where
  factorizationCriterionClosed : S.factorizationCriterion
  exponentialFormClosed : S.exponentialForm
  canonicalParameterClosed : S.canonicalParameter
  naturalSufficientClosed : S.naturalSufficient

def SufficiencyExponentialFamilyClosed (S : SufficiencyFamily) : Prop :=
  S.factorizationCriterion ∧ S.exponentialForm ∧
  S.canonicalParameter ∧ S.naturalSufficient

theorem sufficiency_exponential_family_closed_from_evidence
    (S : SufficiencyFamily) (E : ExponentialFamilyEvidence S) :
    SufficiencyExponentialFamilyClosed S := by
  exact And.intro E.factorizationCriterionClosed
    (And.intro E.exponentialFormClosed
      (And.intro E.canonicalParameterClosed E.naturalSufficientClosed))

end CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean
end HautevilleHouse