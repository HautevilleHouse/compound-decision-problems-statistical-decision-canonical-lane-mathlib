import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean

structure NeymanPearsonPackage where
  hypothesisPair : Type u
  simpleHypotheses : Prop
  mostPowerfulTestExists : Prop
  likelihoodRatioStatistic : Type v
  thresholdDefined : Prop
  neymanPearsonLemma : Prop

structure NeymanPearsonEvidence (N : NeymanPearsonPackage) where
  simpleHypothesesClosed : N.simpleHypotheses
  mostPowerfulTestExistsClosed : N.mostPowerfulTestExists
  thresholdDefinedClosed : N.thresholdDefined
  neymanPearsonLemmaClosed : N.neymanPearsonLemma

def NeymanPearsonClosed (N : NeymanPearsonPackage) : Prop :=
  N.simpleHypotheses ∧ N.mostPowerfulTestExists ∧ N.thresholdDefined ∧ N.neymanPearsonLemma

theorem neyman_pearson_closed_from_evidence (N : NeymanPearsonPackage) (E : NeymanPearsonEvidence N) :
    NeymanPearsonClosed N := by
  exact And.intro E.simpleHypothesesClosed
    (And.intro E.mostPowerfulTestExistsClosed
      (And.intro E.thresholdDefinedClosed E.neymanPearsonLemmaClosed))

structure MLEPackage {S : SufficiencyPackage} {E : ExponentialFamilyPackage S} where
  likelihoodFunction : Type u
  maximumExists : Prop
  consistencyAsymptotic : Prop
  asymptoticNormality : Prop
  efficiencyAchieved : Prop

structure MLEEvidence {S : SufficiencyPackage} {E : ExponentialFamilyPackage S} (M : MLEPackage E) where
  maximumExistsClosed : M.maximumExists
  consistencyAsymptoticClosed : M.consistencyAsymptotic
  asymptoticNormalityClosed : M.asymptoticNormality
  efficiencyAchievedClosed : M.efficiencyAchieved

def MLEClosed {S : SufficiencyPackage} {E : ExponentialFamilyPackage S} (M : MLEPackage E) : Prop :=
  M.maximumExists ∧ M.consistencyAsymptotic ∧ M.asymptoticNormality ∧ M.efficiencyAchieved

theorem mle_closed_from_evidence {S : SufficiencyPackage} {E : ExponentialFamilyPackage S}
    (M : MLEPackage E) (Ev : MLEvidence M) : MLEClosed M := by
  exact And.intro Ev.maximumExistsClosed
    (And.intro Ev.consistencyAsymptoticClosed
      (And.intro Ev.asymptoticNormalityClosed Ev.efficiencyAchievedClosed))

end CompoundDecisionProblemsStatisticalDecisionCanonicalLaneLean
end HautevilleHouse
