import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean

structure SufficiencyPackage where
  family : Type u
  sufficientStatistic : Type v
  factorizationCriterion : Prop
  minimalSufficiency : Prop

structure SufficiencyEvidence (S : SufficiencyPackage) where
  factorizationCriterionClosed : S.factorizationCriterion
  minimalSufficiencyClosed : S.minimalSufficiency

def SufficiencyClosed (S : SufficiencyPackage) : Prop :=
  S.factorizationCriterion ∧ S.minimalSufficiency

theorem sufficiency_closed_from_evidence (S : SufficiencyPackage) (E : SufficiencyEvidence S) : SufficiencyClosed S := by
  exact And.intro E.factorizationCriterionClosed E.minimalSufficiencyClosed

structure ExponentialFamilyPackage (S : SufficiencyPackage) where
  canonicalForm : Prop
  naturalParameter : Prop
  logPartition : Prop
  cumulantGenerating : Prop
  steepness : Prop

structure ExponentialFamilyEvidence {S : SufficiencyPackage} (E : ExponentialFamilyPackage S) where
  canonicalFormClosed : E.canonicalForm
  naturalParameterClosed : E.naturalParameter
  logPartitionClosed : E.logPartition
  cumulantGeneratingClosed : E.cumulantGenerating
  steepnessClosed : E.steepness

def ExponentialFamilyClosed {S : SufficiencyPackage} (E : ExponentialFamilyPackage S) : Prop :=
  E.canonicalForm ∧ E.naturalParameter ∧ E.logPartition ∧ E.cumulantGenerating ∧ E.steepness

theorem exponential_family_closed_from_evidence {S : SufficiencyPackage} (E : ExponentialFamilyPackage S) (Ev : ExponentialFamilyEvidence E) : ExponentialFamilyClosed E := by
  exact And.intro Ev.canonicalFormClosed
    (And.intro Ev.naturalParameterClosed
      (And.intro Ev.logPartitionClosed
        (And.intro Ev.cumulantGeneratingClosed Ev.steepnessClosed)))

end CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean
end HautevilleHouse