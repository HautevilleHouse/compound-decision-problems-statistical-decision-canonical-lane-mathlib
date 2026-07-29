import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean

structure SufficiencyPackage where
  statistic : Type u
  conditionalDistributionFactorizes : Prop
  sufficientStatisticExists : Prop
  minimalSufficientExists : Prop
  ancillaryComplement : Prop

structure SufficiencyEvidence (S : SufficiencyPackage) where
  conditionalDistributionFactorizesClosed : S.conditionalDistributionFactorizes
  sufficientStatisticExistsClosed : S.sufficientStatisticExists
  minimalSufficientExistsClosed : S.minimalSufficientExists
  ancillaryComplementClosed : S.ancillaryComplement

def SufficiencyClosed (S : SufficiencyPackage) : Prop :=
  S.conditionalDistributionFactorizes ∧ S.sufficientStatisticExists ∧
  S.minimalSufficientExists ∧ S.ancillaryComplement

theorem sufficiency_closed_from_evidence (S : SufficiencyPackage) (E : SufficiencyEvidence S) :
    SufficiencyClosed S := by
  exact And.intro E.conditionalDistributionFactorizesClosed
    (And.intro E.sufficientStatisticExistsClosed
      (And.intro E.minimalSufficientExistsClosed E.ancillaryComplementClosed))

structure ExponentialFamilyPackage (S : SufficiencyPackage) where
  naturalParameterSpace : Type u
  sufficientStatistic : Type v
  logPartitionFunction : Type w
  densityExponentialForm : Prop
  naturalParameterSpaceConvex : Prop
  logPartitionFunctionConvex : Prop
  meanValueParameterization : Prop

structure ExponentialFamilyEvidence {S : SufficiencyPackage} (E : ExponentialFamilyPackage S) where
  densityExponentialFormClosed : E.densityExponentialForm
  naturalParameterSpaceConvexClosed : E.naturalParameterSpaceConvex
  logPartitionFunctionConvexClosed : E.logPartitionFunctionConvex
  meanValueParameterizationClosed : E.meanValueParameterization

def ExponentialFamilyClosed {S : SufficiencyPackage} (E : ExponentialFamilyPackage S) : Prop :=
  E.densityExponentialForm ∧ E.naturalParameterSpaceConvex ∧
  E.logPartitionFunctionConvex ∧ E.meanValueParameterization

theorem exponential_family_closed_from_evidence {S : SufficiencyPackage}
    (E : ExponentialFamilyPackage S) (Ev : ExponentialFamilyEvidence E) : ExponentialFamilyClosed E := by
  exact And.intro Ev.densityExponentialFormClosed
    (And.intro Ev.naturalParameterSpaceConvexClosed
      (And.intro Ev.logPartitionFunctionConvexClosed Ev.meanValueParameterizationClosed))

end CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean
end HautevilleHouse
